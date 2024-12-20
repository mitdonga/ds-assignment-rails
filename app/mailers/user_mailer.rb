class UserMailer < ApplicationMailer
  default from: "no-reply@example.com"

  def invite(referrer:, email:)
    @referrer = referrer
    @email = email
    @url = "#{$frontend_base_url}/signup?#{invite_params}"

    mail(to: email, subject: "You have been invited to join our platform")
  end

  private

  def invite_params
    {
      ref: @referrer.referral_code,
      email: @email
    }.to_query
  end
end
