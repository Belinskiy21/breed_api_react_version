# frozen_string_literal: true

# this controller will responds with the dogs breed information
class Api::V1::DogsController < ApplicationController
  # GET /dogs
  def index
    render json: Dog.all
  end

  # GET /fetch
  def fetch
    service = BreedService.new(params.require(:breed))
    if service.call
      render json: { img: service.img, breed: service.breed }
    else
      render json: { error: I18n.t(:no_matches_found) }
    end
  end
end
