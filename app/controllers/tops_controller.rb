class TopsController < ApplicationController
  
  before_action :move_to_index, except: [:index, :show]
  
  def index
    @yados = Yado.order("created_at DESC").page(params[:page]).per(5)
  end
  
  def new
    @yado = Yado.new
  end

  def edit
    @yado = Yado.find(params[:id])
  end
  
  def update
    yado = Yado.find(params[:id])
    if yado.user_id == current_user.id
      yado.update(yado_params)
    end
  end
  
  def show
    @yado =Yado.find(params[:id])
    @comments = @yado.comments.includes(:user)
  end
  
  
  def destroy
    yado = Yado.find(params[:id])
    if yado.user_id == current_user.id
      yado.destroy
    end
  end
  
  def create
    Yado.create(name: params[:name], image: params[:image], text: params[:text], rate: params[:rate], user_id: current_user.id)
  end
  
  private
  def yado_params
    params.permit(:name, :image, :text, :rate)
  end
  
  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
  
  
end
