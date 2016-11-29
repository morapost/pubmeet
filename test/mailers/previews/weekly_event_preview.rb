# Preview all emails at http://localhost:3000/rails/mailers/weekly_event
class WeeklyEventPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/weekly_event/invitation_mail
  def invitation_mail
    WeeklyEvent.invitation_mail
  end

end
