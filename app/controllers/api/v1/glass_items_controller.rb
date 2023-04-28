class Api::V1::GlassItemsController < ApplicationController
  before_action :set_glass_item, only: [:show, :edit, :update, :destroy]

  def index
    @glass_items = GlassItem.order(created_at: :desc)
  end

  def create
    @glass_item = GlassItem.new glass_item_params
    @glass_item.save!

    render json: @glass_item, status: :created

  rescue StandardError => e
    render json: { message: 'Something went wrong', error: e.message }, status: :unprocessable_entity
  end

  def update
    @glass_item.update! glass_item_params
    render json: @glass_item, status: :ok

  rescue StandardError => e
    render json: { message: 'Something went wrong', error: e.message }, status: :unprocessable_entity
  end

  def destroy
    @glass_item.destroy
    head :no_content
  end

  private
  def set_glass_item
    @glass_item = GlassItem.find params[:id]
  end

  def glass_item_params
    params.require(:glass_item).permit :item_sequential_num, :width, :height, :order_id
  end
end
