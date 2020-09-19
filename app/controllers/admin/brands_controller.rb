class Admin::BrandsController < Admin::ApplicationController
  before_action :get_brand, only: [:edit, :update, :destroy]
  def index
    @brands = Brand.paginate(page: params[:page], per_page: 5).order(name: :asc)
  end

  def edit
    @types = Type.all.order(name: :asc)
  end

  def update
    if @brand.update_attributes automobile_params
    Type.where(id: params[:type_ids]).update_all(brand_id: @brand.id, updated_at: Time.now)
      flash[:success] = t("updated")
      redirect_to admin_brands_path
    else
      flash[:danger] = t("error")
      render :edit
    end    
  end

  def destroy
    if @brand.present?
      @brand.destroy
    end
    if @brand.destroy
      flash[:success] = t("deleted")
      redirect_to request.referrer || @brands
    else
      flash[:error] = t("error")
      redirect_to @brands
    end
  end

  private
  def get_brand
    redirect_to admin_dashboard_path unless @brand = Brand.find_by(id: params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name)
  end

  def automobile_params
    params.require(:brand).permit(:name, :brand_id)    
  end  
end
