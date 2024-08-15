# frozen_string_literal: true

module Admin
  class PropertyCardComponent < ViewComponent::Base
    with_collection_parameter :property

    def initialize(property:)
      @property = property
    end

    attr_reader :property

    def address_with_city
      terms = []
      terms << property.address_line_1.presence
      terms << property.address_neighborhood.presence
      terms << property.address_city.presence
      terms << property.address_state.presence
      terms.compact.join(' - ')
    end
  end
end
