require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/content_for'
require 'tilt/erubis'
require 'pry'

configure do
  enable :sessions
  set :session_secret, 'secret'
  set :erb, escape_html: true
end

before do
  new_budget unless session[:bankroll]
  @bankroll = session[:bankroll]
end

def new_budget
  session[:bankroll] = 100
end

def roll_die
  rand(1..3)
end

def betting_error
  return 'You must place a bet.' if params[:bet].empty?
  bet = params[:bet].to_i
  return "Your bet must be between $0 and $#{@bankroll}." if bet <= 0 ||
                                                           bet > @bankroll
end

def evaluate_guess
  guess = params[:guess].to_i
  bet = params[:bet].to_i
  if guess == @roll
    session[:bankroll] += bet
    session[:success] = 'got it!'
  else
    session[:bankroll] -= bet
    session[:success] = "nope! you guessed #{guess} but the number was #{@roll}!"
  end
end

def broke?
  session[:bankroll] <= 0
end

get '/' do
  redirect '/bet'
end

get '/bet' do
  erb :betting
end

post '/bet' do
  # binding.pry
  session[:error] = betting_error
  if session[:error]
    status 422
    erb :betting
  else
    @roll = roll_die
    evaluate_guess
    @bankroll = session[:bankroll]
    redirect :broke if broke?
    erb :betting
  end
end

get '/broke' do
  erb :broke
end

post '/broke' do
  session[:bankroll] = 100
  redirect '/'
end
