class Notifier < ActionMailer::Base
  default from: "info@collegecity.com"

  def subscription_notification(user)
    mail(:to => user.email, :subject => "Potwierdzenie subskrypcji")
  end  
end
