class Property < ApplicationRecord
  enum contract_type: { rent: 'rent', sell: 'sell' }

  belongs_to :property_type
  belongs_to :property_situation
  has_many :property_linked_items
  has_many :property_standard_items, through: :property_linked_items

  validates :address_zip_code, presence: true
  validates :address_zip_code, length: { is: 9, allow_blank: true }
  validates :address_state, presence: true
  validates :address_state, length: { is: 2, allow_blank: true }
  validates :address_city, presence: true
  validates :address_neighborhood, presence: true
  validates :address_line_1, presence: true
  validates :title, presence: true
  validates :size, presence: true
  validates :size, numericality: { minimum: 1, allow_blank: true }
  validates :bedroom_count, numericality: { minimum: 1, allow_blank: true }
  validates :bathroom_count, numericality: { minimum: 1, allow_blank: true }

  has_rich_text :description

  has_many_attached :photos

  monetize :condominium_fee_cents, allow_nil: true
  monetize :price_cents
  monetize :tax_cents, allow_nil: true
end
