class UrlsController < ApplicationController
  before_action :get_url, only: [:show, :edit, :update, :destroy, :redi]
  
  def redi
    addy = @url.link
    redirect_to "#{addy}"
  end
  
  def index
    @urls = Url.all
  end
  
  
  def show
  end
  
  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)
    
    if @url.save
      redirect_to @url, notice: 'Success!'
    else
      render :new
    end
  end

  def edit
  end
  
  def update
    if @url.update(url_params)
      redirect_to @url, notice: "Success!"
    else
      render :edit
    end
  end

  def destroy
    @url.destroy
    redirect_to urls_path, notice: "BOOM! Destruction Complete"
  end
  
  
  private
  
  def get_url
    @url = Url.find(params[:id])
  end
  
  def url_params
    params.require(:url).permit(:link)
  end
  
end
