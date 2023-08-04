class ApartmentsController < ApplicationController
  before_action :find_apartment, only: %i[show update destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :render_apartment_not_found
  def index
    apartments = Apartment.all
    render json: apartments, status: :ok
  end

  def show
    render json: @apartment, status: :ok
  end

  def create
    apartment = Apartment.create!(apartment_params)
    render json: apartment, status: :created
  end

  def update
    @apartment.update!(apartment_params)
    render json: @apartment, status: :accepted
  end

  def destroy
    @apartment.destroy
    head :no_content
  end

  private

  def apartment_params
    params.permit(:number)
  end

  def find_apartment
    @apartment = Apartment.find(params[:id])
  end

  def render_apartment_not_found
    render json: { "error": ['apartment not found'] }, status: :not_found
  end
end
