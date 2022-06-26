// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";

Rails.start();
Turbolinks.start();
ActiveStorage.start();

import "bootstrap";
import "../stylesheets/application";

const fetchStationInfo = async (name) => {
  const query = new URLSearchParams({
    name: name,
  });
  const response = await fetch(
    `http://express.heartrails.com/api/json?method=getStations&${query}`
  );
  return await response.json();
};

function log(e) {
  console.log(e);
}
//TODO: 駅名検索系のコードは分割
//TODO; hidden タグに駅情報をセット
window.addEventListener("load", () => {
  const button = document.querySelector("#btn-search");
  const stationName = document.querySelector("#station-name");
  const stationRadioContainer = document.querySelector("#radio-container");
  const stationNameHidden = document.querySelector("#station-name-hidden");
  const stationLatHidden = document.querySelector("#station-lat-hidden");
  const stationLngHidden = document.querySelector("#station-lng-hidden");
  button.addEventListener("click", async (event) => {
    event.preventDefault();
    const data = await fetchStationInfo(stationName.value);
    console.log(data);

    const stations = data.response.station;

    // ラジオボタンがチェックされたときに発火する関数
    const onStationNameChange = (event) => {
      const info = stations[event.target.value];
      console.log(stationNameHidden);
      stationNameHidden.value = info.name;
      stationLngHidden.value = info.x;
      stationLatHidden.value = info.y;
    };

    // ラジオボタンのコンテナ内の要素を削除
    while (stationRadioContainer.firstChild) {
      stationRadioContainer.removeChild(stationRadioContainer.firstChild);
    }

    // ラジオボタンを追加
    stations.map((st, i) => {
      const rbContainer = document.createElement("div");

      const rb = document.createElement("input");
      rb.type = "radio";
      rb.name = "stations";
      rb.value = i;

      const lb = document.createElement("label");
      lb.for = i;
      const lbText = `${st.name}（${st.line}）`;
      lb.appendChild(document.createTextNode(lbText));

      rbContainer.appendChild(rb);
      rbContainer.appendChild(lb);
      stationRadioContainer.appendChild(rbContainer);
    });

    // ラジオボタンの onChange イベントで hidden 要素を変化させる
    const radios = stationRadioContainer.children;
    Array.prototype.forEach.call(radios, (e) => {
      e.addEventListener("change", onStationNameChange);
    });
  });
});
