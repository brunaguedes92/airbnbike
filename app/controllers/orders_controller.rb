require 'date'

class OrdersController < ApplicationController
  before_action :set_bike, :order_params, only: :create

  def create
    @bike = Bike.find(params[:order][:bike_id])
    start_date = Date.strptime(params[:order][:start_date], '%Y-%m-%d')
    end_date = Date.strptime(params[:order][:end_date], '%Y-%m-%d')
    @quantity = (end_date - start_date).to_i
    order = Order.create!(bike: @bike, amount: @bike.price * @quantity, state: 'pending', user: current_user, start_date: params[:order][:start_date], end_date: params[:order][:end_date])

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @bike.title,
        amount: @bike.price_cents * @quantity,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
    authorize order
  end

  def show
    @order = current_user.orders.find(params[:id])
    authorize @order
  end

  private

  def order_params
    params.require(:order).permit(:start_date, :end_date, :bike_id)
    dates = /(?<start_date>\d+-\d+-\d+) to (?<end_date>\d+-\d+-\d+)/.match(params[:order][:start_date])
    params[:order][:start_date] = dates[1]
    params[:order][:end_date] = dates[2]
  end
end
