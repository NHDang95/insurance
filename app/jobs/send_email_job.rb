class SendEmailJob < ApplicationJob
  queue_as :default

  def perform(user, parameters, params)
  	@user = user
  	@parameters = parameters
  	@params = params
  	FeeMailer.fee_email(@user, @parameters, @params).deliver_later
  end
end
