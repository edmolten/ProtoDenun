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
    @comment_all = Comment.all.order('likes DESC, dislikes ASC')
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
    denunid = params[:denun]
    commid = params[:id]
  #  commit = params[:commit]
    if params[:commit] != 'dislike' and params[:commit] != 'like'
      denunid = params[:comment][:denun_id]
    else
      comment = Comment.find commid
    end
    islike = FALSE
    if params[:commit] == 'dislike'
      comment.dislikes += 1
      comment.save
      redirect_to denuns_show_all_path and return
    end
    if params[:commit] == 'like'
      comment.likes += 1
      comment.save
      redirect_to denuns_show_all_path and return
    end
    comment_text = params[:comment][:text]
    if !comment_text.blank?
      comment = Comment.create :denun_id => denunid, :text => comment_text
      comment.save
      redirect_to denuns_show_all_path and return
    else
      redirect_to denuns_show_all_path and return
    end
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

