class UserMailer < ApplicationMailer
  default from: "no-reply@example.com"

  def invite(referrer:, email:)
    @referrer = referrer
    @url = "#{$frontend_base_url}?ref=#{@referrer.referral_code}"

    mail(to: email, subject: "You have been invited to join our platform")
  end
end
