require 'test_helper'

class WeeklyEventTest < ActionMailer::TestCase
  test "invitation_mail" do
    mail = WeeklyEvent.invitation_mail
    assert_equal "Invitation mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
