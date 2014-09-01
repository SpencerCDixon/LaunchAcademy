require 'sinatra'
require 'pg'
require 'pry'

set :port, 5000

def db_connection
  begin
    connection = PG.connect(dbname: 'recipes')
    yield(connection)
  ensure
    connection.close
  end
end

def get_all_recipes
  query = %Q{
    SELECT * FROM recipes
    ORDER BY name
  }
  recipes = db_connection do |conn|
    conn.exec(query)
  end
  recipes.to_a
end

def find_recipe_by_id(id)
  query = %Q{
    SELECT * FROM recipes
    WHERE id = $1
    LIMIT 1
  }
  recipe = db_connection do |conn|
    conn.exec_params(query, [id])
  end
  recipe.to_a.first
end


get '/recipes' do
  @recipes = get_all_recipes
  erb :index
end

get '/recipes/:id' do
  @recipe = find_recipe_by_id(params[:id])
  binding.pry
  erb :show
end
