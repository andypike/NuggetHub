class Mail < ActionMailer::Base
  def confirmation(recipient, name, sent_at = Time.now)
      @subject = "Welcome to NuggetHub"
      @recipients = recipient
      @from = 'support@nuggethub.com'
      @sent_on = sent_at
      @body["name"] = name
      @headers = {}
   end
end
