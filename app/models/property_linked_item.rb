class PropertyLinkedItem < ApplicationRecord
  belongs_to :property
  belongs_to :property_standard_item
end
