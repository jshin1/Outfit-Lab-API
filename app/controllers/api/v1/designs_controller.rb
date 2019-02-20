class Api::V1::DesignsController < ApplicationController
  before_action :find_design, only: [:show, :edit, :update, :destroy]

  def index
    @designs = Design.all
    render json: @designs
  end

  def show
    render json: @design
  end

  def create
    @design = Design.create(design_params)
    if @design.save
      render json: @design, status: :accepted
    else
      render json: { errors: @design.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    if @design.update(design_params)
      render json: @design, status: :accepted
    else
      render json: { errors: @design.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @design.destroy
  end

  private

  def design_params
    params.permit(:shirtType, :shirtColor, :pocketColor, :ringer, :user_id)
  end

  def find_design
    @design = Design.find(params[:id])
  end

end
