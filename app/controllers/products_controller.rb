class ProductsController < ApplicationController
  before_action :get_product, only: [:show, :sendmail]
  
  def index
  	@products = Product.distinct.paginate(:page => params[:page], :per_page => 10).order(created_at: :desc)
  end

  def show
    @options = Option.all.order(:name)
    if params[:commit] == "Tra Phí Bảo Hiểm" || params[:commit] == "Insurance Fee Checker"
      check_criteria
      get_productDetail      
      calculate_fee
      more_options
    end
  end

  def sendmail
    if params[:commit] == "Đăng ký nhận Tư vấn" || params[:commit] == "Request for Advice"
      if !user_signed_in?
        if params[:user][:name].present? && params[:user][:phone].present?
          SendEmailJob.set(wait: 10.seconds).perform_later(User.find_by(id: 8),
                          params[:user].to_json, session[:product])
          flash[:success] = t("shared.message.successmail")
          redirect_to @product
        else  
          flash[:error] = t("shared.error_messages.send_mail")
          redirect_to @product
        end
      elsif user_signed_in? && !current_user.try(:admin?)
        params[:user][:name] = current_user.name
        params[:user][:phone] = current_user.phone
        SendEmailJob.set(wait: 10.seconds).perform_later(User.find_by(id: 8),
                        params[:user].to_json, session[:product])
        flash[:success] = t("shared.message.successmail")
        redirect_to @product
      else  
        flash[:error] = t("shared.error_messages.send_mail")
        redirect_to @product        
      end
    end
    session[:product] = nil
    #commit bên TNDS gửi mail 
    if params[:commit] == "Đăng ký mua TNDS"
      get_TNDS #lấy params 
    end
  end

  private

  def get_product
  	@product = Product.find_by_id(params[:id])
    if @product != Product.find_by_id(params[:id])
  		redirect_to root_url
    end
    redirect_to root_url if @product.nil?
  end

  def check_criteria
    if params[:product][:price].to_i <= 300000000
      flash[:error] = t("shared.error_messages.price")
      redirect_to @product
    elsif params[:product][:group_id].blank?
      flash[:error] = t("shared.error_messages.criteria")
      redirect_to @product        
    elsif params[:product][:modelyear_id].blank?
      flash[:error] = t("shared.error_messages.criteria")
      redirect_to @product        
    elsif params[:product][:group_id] == "3" || params[:product][:group_id] == "4"
      params[:product][:usage_id] = "1"         
    elsif params[:product][:usage_id].blank?
      flash[:error] = t("shared.error_messages.criteria")
      redirect_to @product        
    elsif params[:product][:group_id].blank? && params[:product][:usage_id].blank?
      flash[:error] = t("shared.error_messages.criteria")
      redirect_to @product        
    elsif params[:product][:group_id].blank? && params[:product][:modelyear_id].blank?
      flash[:error] = t("shared.error_messages.criteria")
      redirect_to @product        
    elsif params[:product][:usage_id].blank? && params[:product][:modelyear_id].blank?
      flash[:error] = t("shared.error_messages.criteria")
      redirect_to @product        
    elsif params[:product][:usage_id].blank? && params[:product][:modelyear_id].blank? && params[:product][:group_id].blank?
      flash[:error] = t("shared.error_messages.criteria")
      redirect_to @product     
    end
  end

  def calculate_fee
    if params[:product][:usage_id] == "1"
      if params[:product][:group_id] == "1"
        if params[:product][:modelyear_id] == "1"
          @product.fee = params[:product][:price].to_i / 100 * 2.56
        elsif params[:product][:modelyear_id] == "2"
          @product.fee = params[:product][:price].to_i / 100 * 2.67
        elsif params[:product][:modelyear_id] == "3"
          @product.fee = params[:product][:price].to_i / 100 * 2.76 
        elsif params[:product][:modelyear_id] == "4"
          @product.fee = params[:product][:price].to_i / 100 * 2.76 
        end
      elsif params[:product][:group_id] == "2"   
        if params[:product][:modelyear_id] == "1"
          @product.fee = params[:product][:price].to_i / 100 * 1.8
        elsif params[:product][:modelyear_id] == "2"
          @product.fee = params[:product][:price].to_i / 100 * 1.9
        elsif params[:product][:modelyear_id] == "3"
          @product.fee = params[:product][:price].to_i / 100 * 2
        elsif params[:product][:modelyear_id] == "4"
          @product.fee = params[:product][:price].to_i / 100 * 2.42
        end               
      end
    elsif params[:product][:usage_id] == "2"  
      if params[:product][:group_id] == "1"
        if params[:product][:modelyear_id] == "1"
          @product.fee = params[:product][:price].to_i * 1.15 / 100
        elsif params[:product][:modelyear_id] == "2"
          @product.fee = params[:product][:price].to_i / 100 * 1.25
        elsif params[:product][:modelyear_id] == "3"
          @product.fee = params[:product][:price].to_i / 100 * 1.35
        elsif params[:product][:modelyear_id] == "4"
          @product.fee = params[:product][:price].to_i / 100 * 1.45
        end
      elsif params[:product][:group_id] == "2"   
        if params[:product][:modelyear_id] == "1"
          @product.fee = params[:product][:price].to_i / 100 * 1.3
        elsif params[:product][:modelyear_id] == "2"
          @product.fee = params[:product][:price].to_i / 100 * 1.4
        elsif params[:product][:modelyear_id] == "3"
          @product.fee = params[:product][:price].to_i / 100 * 1.88
        elsif params[:product][:modelyear_id] == "4"
          @product.fee = params[:product][:price].to_i / 100 * 1.96
        end               
      end
    end
    if params[:product][:group_id] == "3"
      if params[:product][:modelyear_id] == "1"
        @product.fee = params[:product][:price].to_i / 100 * 1.5
      elsif params[:product][:modelyear_id] == "2"
        @product.fee = params[:product][:price].to_i / 100 * 1.6
      elsif params[:product][:modelyear_id] == "3"
        @product.fee = params[:product][:price].to_i / 100 * 2.01
      elsif params[:product][:modelyear_id] == "4"
        @product.fee = params[:product][:price].to_i / 100 * 2.09
      end               
    elsif params[:product][:group_id] == "4"
      if params[:product][:modelyear_id] == "1"
        @product.fee = params[:product][:price].to_i / 100 * 1.4
      elsif params[:product][:modelyear_id] == "2"
        @product.fee = params[:product][:price].to_i / 100 * 1.5
      elsif params[:product][:modelyear_id] == "3"
        @product.fee = params[:product][:price].to_i / 100 * 1.78
      elsif params[:product][:modelyear_id] == "4"
        @product.fee = params[:product][:price].to_i / 100 * 1.89
      end                     
    end 
  end

  def get_TNDS
    #sesion[:tnds] = 
  end

  def more_options
    if params[:option_ids].present?
      params[:option_ids].each do |a|
        if params[:option_ids].include?(a)
          @product.fee = @product.fee.to_i + Option.find_by(id: a).price.to_i
        end
      end
    end
  end

  def get_productDetail
    if params[:product][:group_id].present? && params[:product][:modelyear_id].present? && params[:product][:usage_id].present? && params[:product][:type_id].present?
      @group = Group.find_by_id(params[:product][:group_id])
      @modelyear = Modelyear.find_by_id(params[:product][:modelyear_id])
      @usage = Usage.find_by_id(params[:product][:usage_id])
      @type = Type.find_by_id(params[:product][:type_id])
      @price = params[:product][:price]
      session[:product] = [@group.name, @modelyear.name, @usage.name, @type.name, @type.brand.name, @price]
    end
  end

end
