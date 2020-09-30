class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.find_user.paginate(page: params[:page], per_page: 5)
  end
end
