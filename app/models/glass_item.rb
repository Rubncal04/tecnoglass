class GlassItem < ApplicationRecord
  belongs_to :order

  validates :item_sequential_num, presence: true, uniqueness: true
end
