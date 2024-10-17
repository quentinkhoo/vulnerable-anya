class Api::GiftcardsController < ApplicationController

  def index
    @giftcards = GiftCard.select(:id, :name, :description, :url).all

    render json: @giftcards, status: :ok
  end
end
