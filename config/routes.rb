Recipes::Application.routes.draw do
  match('recipes', {via: :get, to: 'recipes#index'})
end
