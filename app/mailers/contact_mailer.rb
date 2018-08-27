class ContactMailer < ActionMailer::Base

  def send_contact_form(contact)
    @contact = contact

    mail :subject => contact.subject,
         :from => 'informacion@edicioneskatatay.com.ar',
         :to => 'contacto@edicioneskatatay.com.ar'
  end
end
