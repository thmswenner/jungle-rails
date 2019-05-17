class OrderMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def order_email(order)
    @fauxemail = "thmswenner@gmail.com"
    @order = order
    @url = 'http://example.com/login'
    mail(to: @fauxemail, subject:'Thank you for your order')
  end
end
