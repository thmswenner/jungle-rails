class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_email(order)
    @fauxemail = "thmswenner@gmail.com"
    @order = order
    @total = order.total
    @id = order.id
    @url = 'http://example.com/login'
    mail(to: @fauxemail, subject: "Receipt Order: #{@id}")
  end
end
