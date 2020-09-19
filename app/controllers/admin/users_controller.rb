class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.find_user.paginate(page: params[:page], per_page: 5)
    #@q = User.ransack params[:q]
    #@users = @q.result(distinct: true)
    #respond_to do |format|
      #format.html {@users = @users.page(params[:page]).per params[:limit]}
    #end
  end

  def destroy
    @user = User.find_by id: params[:id]
    if @user.destroy
      redirect_to admin_users_path, notice: t("user_deleted")
    else
      redirect_to admin_users_path,
        flash: { error: t("user_could_not_be_deleted") }
    end
  end
end
