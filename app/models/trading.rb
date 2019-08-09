class Trading < ApplicationRecord
  belongs_to :item
  belongs_to :buyer, class_name: 'User'

  validates :status, presence: true

  enum status: {"出品中": 0, "取引中": 1, "売却済": 2}, _prefix: true

end
