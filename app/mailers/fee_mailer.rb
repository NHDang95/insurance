class FeeMailer < ApplicationMailer
	def fee_email(user, parameters, params)
		@user = user
		@parameters = parameters
		@params = params
		mail to: @user.email, subject: "Request for Insurance Advice"
	end
end
