module Admin
  class PropertyStandardItemsController < BaseController
    before_action :load_property_standard_item, only: [:edit, :update, :destroy]

    def index
      @property_standard_items = PropertyStandardItem.order(:name)
    end

    def new
      @property_standard_item = PropertyStandardItem.new
    end

    def create
      @property_standard_item = PropertyStandardItem.new property_standard_item_params

      if @property_standard_item.save
        redirect_to admin_property_standard_items_path, notice: 'Característica criada com sucesso.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @property_standard_item.update property_standard_item_params
        redirect_to admin_property_standard_items_path, notice: 'Característica atualizada com sucesso.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @property_standard_item.destroy
      redirect_to admin_property_standard_items_path, notice: 'Característica removida com sucesso.'
    end

    private

    def load_property_standard_item
      @property_standard_item = PropertyStandardItem.find params[:id]
    end

    def property_standard_item_params
      params.require(:property_standard_item).permit(:name)
    end
  end
end
