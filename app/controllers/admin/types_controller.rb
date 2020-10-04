class Admin::TypesController < Admin::ApplicationController
 before_action :get_type, only: [:edit, :update, :destroy]	

 def new
	@type = Type.new
 end

 def create
	@type = Type.new type_params
	@type.created_at = Time.now
	if @type.save
		flash[:success] = t("create")
		redirect_to new_admin_type_path
	else
		flash[:error] = t("error")
		redirect_to new_admin_type_path
	end
 end

 def edit;end

 def update
	if @type.update_attributes type_params
		flash[:success] = t("updated")
		redirect_to admin_brands_path
	else
		flash[:danger] = t("error")
		render :edit
	end    
 end

 def destroy
	if @type.present?
		@type.destroy
	end
	if @type.destroy
		flash[:success] = t("deleted")
		redirect_to admin_brands_path
	else
		flash[:error] = t("error")
		redirect_to edit_type_path
	end
 end  	

 private
  def get_type
    redirect_to admin_dashboard_path unless @type = Type.find_by(id: params[:id])
  end

  def type_params
    params.require(:type).permit(:name, :brand_id, :group_id)
  end

end
