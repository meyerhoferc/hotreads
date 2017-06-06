class Api::V1::LinksController < ApplicationController
  def create
    @link = Link.find_or_initialize_by(link_params)
    if @link.persisted?
      @link.count += 1
      @link.save
      render json: @link
    elsif @link.new_record?
      @link.count = 1
      @link.save
      render json: @link
    else 
      render status: 404
    end
  end

  private

  def link_params
    params.permit(:url)
  end
end
