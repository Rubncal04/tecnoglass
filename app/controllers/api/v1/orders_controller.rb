class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :approve, :reject]

  def index
    @orders = Order.order(created_at: :desc)
  end

  def create
    @order = Order.new order_params
    @order.save!
    render json: @order, status: :created

  rescue StandardError => e
    render json: { message: 'Something went wrong', error: e.message }, status: :unprocessable_entity
  end

  def approve
    @order.approved!
    render json: { message: 'Order approved' }, status: :ok
  rescue StandardError => e
    render json: { message: 'Something went wrong', error: e.message }, status: :unprocessable_entity
  end

  def reject
    @order.rejected!
    render json: { message: 'Order rejected' }, status: :ok
  rescue StandardError => e
    render json: { message: 'Something went wrong', error: e.message }, status: :unprocessable_entity
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit :num_order, :order_date, :status, :customer_id
  end
end
