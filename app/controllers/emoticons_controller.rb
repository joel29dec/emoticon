class EmoticonsController < ApplicationController
  before_action :set_emoticon, only: [:show, :update, :destroy]

  # GET /emoticons
  def index
    @emoticons = Emoticon.all

    render json: @emoticons
  end

  # GET /emoticons/1
  def show
    render json: @emoticon
  end

  # POST /emoticons
  def create
    @emoticon = Emoticon.new(emoticon_params)

    if @emoticon.save
      render json: @emoticon, status: :created, location: @emoticon
    else
      render json: @emoticon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /emoticons/1
  def update
    if @emoticon.update(emoticon_params)
      render json: @emoticon
    else
      render json: @emoticon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /emoticons/1
  def destroy
    @emoticon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emoticon
      @emoticon = Emoticon.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def emoticon_params
      params.require(:emoticon).permit(:name)
    end
end
