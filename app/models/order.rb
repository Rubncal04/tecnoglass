class Order < ApplicationRecord
  belongs_to :customer

  enum :status, { approved: 'approved', rejected: 'rejected'}
  validates :num_order, presence: true, uniqueness: true
end
