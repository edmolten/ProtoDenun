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
  end

  def denun_params
    params.require(:denun).permit(:name,:description)
  end
end

