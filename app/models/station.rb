class Station < ApplicationRecord
  has_many :faults, dependent: :destroy
end
