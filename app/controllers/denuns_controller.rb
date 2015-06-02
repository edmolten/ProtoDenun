class DenunsController < ApplicationController

  MIN_DISLIKES = 10
  DISLIKES_LIKES_PROPORTION = 5/4

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
    denun = ocultar denun
    denun.save
    redirect_to denuns_show_all_path
  end


  def ocultar denun
    likes = denun.like
    dislikes = denun.dislike
    if likes == 0 and dislikes == 0
      return denun
    end
    if dislikes > MIN_DISLIKES and dislikes/likes > DISLIKES_LIKES_PROPORTION
      denun.hidden = True
    end
    return denun
  end

  def denun_params
    params.require(:denun).permit(:name,:description)
  end
end

