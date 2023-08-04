class LeasesController < ApplicationController
  def create
    lease = Lease.create!(lease_params)
    render json: lease, status: :created
  end

  def destroy
    tenant = Tenant.find(params[:id])
    tenant.destroy
    head :no_content
  rescue ActiveRecord::RecordNotFound
    render json: { "error": ['Lease not found'] }, status: :not_found
  end

  private

  def lease_params
    params.permit(:rent, :tenant_id, :apartment_id)
  end
end
