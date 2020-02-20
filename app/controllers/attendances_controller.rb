class AttendancesController < ApplicationController

  def index
    @event = Event.find(params[:event_id])
    @attendants = @event.users.all
  end

  def new
    @event = Event.find(params[:event_id])
  end

  def create
    @event = Event.find(params[:event_id])
    @amount = @event.price*100 # Amount in cents
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd',
    })
    @attendance = Attendance.new(
      event_id: @event.id,
      user_id: params[:attendant_id], # from the 'new' form_tag
      stripe_customer_id: customer.id
    )
    if @attendance.save
      redirect_to event_path(@event.id)
    else
      ### ERRORS MSG
      redirect_to new_charge_path
    end
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end

end
