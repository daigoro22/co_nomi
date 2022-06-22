class Party < ApplicationRecord
  has_one :station, dependent: :destroy
  accepts_nested_attributes_for :station, allow_destroy: true
end
