class OrderNotifier < ActionMailer::Base
  def received(order)
    @order = order
    mail(to: order.email, from:'onlinejewellery17@gmail.com', subject: 'Order confirmation')
  end
end
