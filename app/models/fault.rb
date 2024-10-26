class Fault < ApplicationRecord
  belongs_to :station
  has_many :solutions, dependent: :destroy
end
