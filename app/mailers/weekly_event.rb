class WeeklyEvent < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.weekly_event.invitation_mail.subject
  #
  def invitation_mail(invite)
    @user = invite.user
	@pub = invite.event.pub
	mail to: "#{@user.email}", subject: "#{@pub.name} - Invitation"
  end
end
