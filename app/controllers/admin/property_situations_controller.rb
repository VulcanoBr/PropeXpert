module Admin
  class PropertySituationsController < BaseController
    before_action :load_property_situation, only: [:edit, :update, :destroy]

    def index
      @property_situations = PropertySituation.order(:name)
    end

    def new
      @property_situation = PropertySituation.new
    end

    def create
      @property_situation = PropertySituation.new property_situation_params

      if @property_situation.save
        redirect_to admin_property_situations_path, notice: 'Característica criada com sucesso.'
      else
        render :new, status: :unprocessable_entity
      end
    end

    def edit
    end

    def update
      if @property_situation.update property_situation_params
        redirect_to admin_property_situations_path, notice: 'Característica atualizada com sucesso.'
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @property_situation.destroy
      redirect_to admin_property_situations_path, notice: 'Característica removida com sucesso.'
    end

    private

    def load_property_situation
      @property_situation = PropertySituation.find params[:id]
    end

    def property_situation_params
      params.require(:property_situation).permit(:name)
    end
  end
end
