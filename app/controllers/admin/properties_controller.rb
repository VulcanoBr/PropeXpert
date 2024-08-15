module Admin
  class PropertiesController < BaseController
    PERMITED_PARAMS = [
      :contract_type, :address_zip_code, :address_state, :address_city,
      :address_neighborhood, :address_line_1, :address_number, :address_line_2,
      :title, :size, :price, :tax, :condominium_fee, :bedroom_count,
      :bathroom_count
    ].freeze

    before_action :load_property, only: [:edit, :update, :destroy]

    def index
      @properties = Property.order(:title)
    end

    def new
      @property = Property.new
    end

    def create
      @property = Property.new property_params

      if @property.save
        redirect_to admin_properties_path, notice: 'Imóvel criado com sucesso.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @property.update property_params
        redirect_to admin_properties_path, notice: 'Imóvel atualizado com sucesso.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @property.destroy
      redirect_to admin_properties_path, notice: 'Imóvel removido com sucesso.'
    end

    private

    def load_property
      @property = Property.find params[:id]
    end

    def property_params
      params.require(:property).permit(*PERMITED_PARAMS)
    end
  end
end
