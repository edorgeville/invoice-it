class InvoiceMailer < ApplicationMailer
  default from: ENV["EMAIL_FROM"] || "from@example.com"
  layout 'mailer'

  def reminder_email(invoice)
    @invoice = invoice
    mail(from: @invoice.company.email, to: @invoice.client.email, subject: "Reminder: Invoice due on #{@invoice.due_date}")
  end
end
