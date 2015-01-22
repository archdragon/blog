class Admin::ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @images = Image.all
  end

  def show
  
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to [:admin, @image], notice: 'image was successfully created.'
    else
      render :new
    end
  end

  def update
    @image.user = current_user
    if @image.update(image_params)
      redirect_to [:admin, @image], notice: 'image was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @image.destroy
    redirect_to admin_images_url, notice: 'Image was successfully destroyed.'
  end

  private

    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:name, :image_file)
    end
end
