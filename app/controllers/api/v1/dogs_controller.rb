# frozen_string_literal: true

# this controller will responds with the dogs breed information
class Api::V1::DogsController < ApplicationController
  # GET /dogs
  def index
    render json: Dog.all
  end

  # POST /fetch
  def fetch
    service = BreedService.new(breed_param)
    if service.call
      render json: { img: service.img, breed: service.breed }
    else
      render json: { message: I18n.t(:no_matches_found) }, status: :unprocessable_entity
    end
  end

  private

  def breed_param
    params.require(:breedValue).underscore
  end
end
