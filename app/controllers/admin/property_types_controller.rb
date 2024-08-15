module Admin
  class PropertyTypesController < BaseController
    before_action :load_property_type, only: [:edit, :update, :destroy]

    def index
      @property_types = PropertyType.order(:name)
    end

    def new
      @property_type = PropertyType.new
    end

    def create
      @property_type = PropertyType.new property_type_params

      if @property_type.save
        redirect_to admin_property_types_path, notice: 'Tipo de Imóvel criado com sucesso.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @property_type.update property_type_params
        redirect_to admin_property_types_path, notice: 'Tipo de Imóvel atualizado com sucesso.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @property_type.destroy
      redirect_to admin_property_types_path, notice: 'Tipo de Imóvel removido com sucesso.'
    end

    private

    def load_property_type
      @property_type = PropertyType.find params[:id]
    end

    def property_type_params
      params.require(:property_type).permit(:name)
    end
  end
end
