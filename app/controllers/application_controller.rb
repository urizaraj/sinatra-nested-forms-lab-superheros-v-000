require 'sinatra/base'

class App < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    @members = Hero.all
    erb :super_hero
  end

  post '/teams' do
    @team = Team.new(params[:team])

    params[:team][:members].each { |e| Hero.new(e) }

    @members = Hero.all

    erb :team
  end

end
