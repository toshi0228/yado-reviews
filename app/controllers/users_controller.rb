class UsersController < ApplicationController
  
  def show
    @yados= current_user.yados.page(params[:page]).per(5).order("created_at DESC")
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

  
  def destroy
    yado = Yado.find(params[:id])
    if yado.user_id == current_user.id
      yado.destroy
    end
  end  
  
end
