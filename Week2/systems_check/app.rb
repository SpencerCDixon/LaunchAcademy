require 'sinatra'
require 'csv'
require 'pry'

### Methods ###
before do
  @scores = []
  CSV.foreach('teams.csv', headers: true, header_converters: :symbol ) do |row|
    @scores << row.to_hash
  end
end

### Routes ###
get '/' do
  redirect 'leaderboard'
end

get '/leaderboard' do
  erb :leaderboard
end
