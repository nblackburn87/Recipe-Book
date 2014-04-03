class TagsController < ApplicationController

  def index
    @tags = Tag.all
    render('tags/index.html.erb')
  end

  def new
    @tag = Tag.new
    render('tags/new.html.erb')
  end

  def create
    @tag = Tag.new(:name => params[:name])
    if @tag.save
      flash[:notice] = "Your tag has been created."
      redirect_to("/tags")
    else
      flash[:alert] = "Something went wrong. Try again."
      render('tags/new.html.erb')
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    render('tags/edit.html.erb')
  end

  def update
    @tags = Tag.all
    @tag = Tag.find(params[:id])
    @tag.update(:name => params[:name])
    if @tag.save
      flash[:notice] = "Your tag has been saved."
      redirect_to("/tags")
    else
      flash[:alert] = "Something went wrong. Try again."
      render("tags/edit.html.erb")
    end
  end

  def show
    @tag = Tag.find(params[:id])
    render('tags/show.html.erb')
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy

    if @tag.destroy
      flash[:notice] = "Your tag was deleted"
      redirect_to("/tags")
    else
      flash[:alert] = "Your delete failed"
      redirect_to('/tags')
    end
  end
end

