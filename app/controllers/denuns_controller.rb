class DenunsController < ApplicationController

  MIN_DISLIKES = 10
  DISLIKES_LIKES_PROPORTION = 5/4

  def new
    @denun = Denun.new
    @types = DenunType.all
  end

  def create
    denun = Denun.new denun_params
    denun.save
    redirect_to root_path
  end

  def show_all
    @visible_denuns = Denun.where hidden: FALSE
    @comment = Comment.new #para luego agregar comentario a like o dislike
  end

  def like
    denun = Denun.find params[:id]
    denun.like += 1
    denun.save
    redirect_to denuns_show_all_path
  end

  def dislike
    denun = Denun.find params[:id]
    denun.dislike += 1
    denun = ocultar denun
    denun.save
    redirect_to denuns_show_all_path
  end

  def comment
    denunid = params[:comment][:denun_id]
    denun = Denun.find denunid
    islike = FALSE
    if params[:commit] == '-1'
      is_like = FALSE
      denun.dislike += 1
      denun = ocultar denun
    else
      islike = TRUE
      denun.like += 1
    end
    denun.save
    comment_text = params[:text]
    comment = Comment.create :denuns_id => denunid, :text => comment_text, :is_like => islike
    comment.save
    redirect_to denuns_show_all_path
  end

  def ocultar(denun)
    likes = denun.like
    dislikes = denun.dislike
    if likes == 0 and dislikes == 0
      return denun
    end
    if dislikes > MIN_DISLIKES and dislikes/likes > DISLIKES_LIKES_PROPORTION
      denun.hidden = TRUE
    end
    return denun
  end

  def denun_params
    params.require(:denun).permit :name, :description, :denun_types_id
  end
end

