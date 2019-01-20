class Api::V1::DesignsController < ApplicationController
  before_action :find_design, only: [:update]

  def index
    @designs = Design.all
    render json: @designs
  end

  def update
    @design.update(design_params)
    if @design.save
      render json: @design, status: :accepted
    else
      render json: { errors: @design.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def design_params
    params.permit(:shirtType, :shirtColor, :pocketColor, :design_id)
  end

  def find_design
    @design = Design.find(params[:id])
  end
end
