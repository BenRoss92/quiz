ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require 'json'
require './app/models/question_list'

class QuizApp < Sinatra::Base

  enable :sessions
  disable :show_exceptions

  before do
    @question_list = QuestionList.instance
  end

  get '/' do
    erb :'welcome'
  end

  get '/questions/:number' do
    session[:number] = params[:number].to_i
    @question_list.select_question(session[:number])
    question = @question_list.current_question
    @time_limit = question.time_limit
    erb :'questions'
  end

  get '/api/questions/:number' do
    content_type :json
    @question_list.select_question(params[:number].to_i)
    question = @question_list.current_question
    question.as_hash.to_json
  end

  post '/questions/next' do
    @question_list.next_question
    number = @question_list.current_number
    redirect to("/questions/#{number}")
  end

  error Exceptions::NoQuestionError do
    redirect to("/end")
  end

  get '/end' do
    erb :'end'
  end

  run! if app_file == $0
end
