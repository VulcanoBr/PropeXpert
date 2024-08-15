module Admin
  class PropertySearchForm < BaseForm
    attribute :bedroom_count_min, :integer
    attribute :bathroom_count_min, :integer
    attribute :size_min, :integer
    attribute :price_min, :float
    attribute :property_type_ids, array: true

    def submit
      return Property.none unless valid?

      @records = Property.order(:title)
      @records = @records.where("bedroom_count >= ?", bedroom_count_min) if bedroom_count_min.present?
      @records = @records.where("bathroom_count >= ?", bathroom_count_min) if bathroom_count_min.present?
      @records = @records.where("size >= ?", size_min) if size_min.present?
      @records = @records.where("price_cents >= ?", price_in_cents) if price_in_cents > 0
      @records = @records.where(property_type_id: property_type_ids) if property_type_ids.present?
      @records
    end

    def price_in_cents
      price_min.to_f * 100
    end

    def property_type_collection
      PropertyType.order(:name)
    end
  end
end
