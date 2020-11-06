class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :area_day

  has_one_attached :image
  belongs_to :user
  has_one :order

  validates :product, :product_copy, :category_id, :item_pas, presence: true
  validates :burden_id, :area_id, :area_day_id, :price, :image, presence: true

  validates :category_id, :burden_id, :area_id, :area_day_id, presence: true, numericality: { other_than: 0 } 
  validates :price, inclusion: { in: 1000..35000 }
end
