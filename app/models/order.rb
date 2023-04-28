class Order < ApplicationRecord
  belongs_to :customer
  has_many :glass_items

  enum :status, { approved: 'approved', rejected: 'rejected'}
  validates :num_order, presence: true, uniqueness: true
end
