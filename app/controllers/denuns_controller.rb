class DenunsController < ApplicationController
  def new
    @denun = Denun.new
  end

  def create
    denun = Denun.new(denun_params)
    denun.save
    redirect_to root_path
  end

  def show_all
  @denuncias = Denun.where( hidden: FALSE)
  end

  def like
    denun = Denun.find(params[:id])
    denun.like += 1
    denun.save
    redirect_to denuns_show_all_path
  end

  def dislike
    denun = Denun.find(params[:id])
    denun.dislike += 1
    if denun.dislike == 20
      denun.hidden = TRUE
    end
    denun.save
    redirect_to denuns_show_all_path
  end

  def denun_params
    params.require(:denun).permit(:name,:description)
  end
end

