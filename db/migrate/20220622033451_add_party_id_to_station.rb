class AddPartyIdToStation < ActiveRecord::Migration[6.1]
    def up
      add_reference :stations, :party, null: false, index:true
    end

    def down
      remove_reference :stations, :party, index:true
    end
    # ここに change メソッドがあると、上の up と down が上書きされてしまう
  end
