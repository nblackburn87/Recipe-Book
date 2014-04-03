class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render('recipes/index.html.erb')
  end

  def new
    @recipe = Recipe.new
    render('recipes/new.html.erb')
  end

  def create
    @recipe = Recipe.new(:title => params[:title],
                         :description => params[:description])
    if @recipe.save
      flash[:notice] = "Your recipe was successfully saved!"
       redirect_to("/recipes")
    else
      flash[:alert] = "Your recipe was not saved! Try again."
        render('recipes/new.html.erb')
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render('recipes/edit.html.erb')
  end

  def update
    @recipes = Recipe.all
    @recipe = Recipe.find(params[:id])
    @recipe.update(:title => params[:title],
                         :description => params[:description])

    @found_tag_1 = Tag.find_by(:name => params[:tag_1][:name])
    @found_tag_2 = Tag.find_by(:name => params[:tag_2][:name])
    @recipe.tags << [@found_tag_1, @found_tag_2]
    if @recipe.save
      flash[:notice] = "Your update was successfully saved!"
       redirect_to("/recipes")
    else
      flash[:alert] = "Your update was not saved! Try again."
        render('recipes/edit.html.erb')
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    render('recipes/show.html.erb')
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    if @recipe.destroy
      flash[:notice] = "Your recipe was deleted"
      redirect_to("/")
    else
      flash[:alert] = "Your delete failed"
      redirect_to('/')
    end
  end
end
