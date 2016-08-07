class InterestsController < ApplicationController

  def index
    @interests = current_user.interests
    render json: @interests
  end

  def default_interests
    @default_interests = Interest.all
    render json: @default_interests
  end

  def create
    current_user.interests.create! name: params[:name]
    render json: { status: 'Interest created' }, status: :ok
  end

  def update
    interest = current_user.interests.find_by id: params[:id]
    interest.update approved_params
    render json: { status: 'Interest updated' }, status: :ok
  end

  def destroy
    interest = current_user.interests.find_by id: params[:id]
    interest.destroy
    render json: { status: 'Interest has been deleted' }, status: :ok
  end

  private

    def approved_params
      params.permit :name
    end
end
