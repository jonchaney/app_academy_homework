class CatsController < ApplicationController
  def index
    @cat = Cat.all

    render 'index'
  end

  def show
    @cat = selected_cat

    render 'show'
  end

  def new
    render 'new'
  end

  def create
    @cat = Cat.new(cat_params)
    if @cat.save
      redirect_to cat_url(@cat)
    else
      render 'new'
    end
  end

  def edit
    @cat = selected_cat
    render :edit
  end

  private

  def selected_cat
    Cat.find(params[:id])
  end

  def cat_params
    params.require(:cat).permit(:name, :color, :description,
                                :sex, :birth_date, :image_url)
  end
end
