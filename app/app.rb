require 'sinatra/base'
require 'json'
require './app/models/question_list'

class QuizApp < Sinatra::Base

  enable :sessions
  disable :show_exceptions

  get '/questions/:number' do
    @question_list = QuestionList.new
    session[:number] = params[:number].to_i
    @question = @question_list.select_question(session[:number])
    erb :'questions'
  end

  post '/questions' do
    content_type :json
    question_list = QuestionList.new
    question = question_list.select_question(session[:number])
    { :result => question.get_result(params[:answer]) }.to_json
  end

  error Exceptions::NoQuestionError do
    env['sinatra.error'].message
  end

  run! if app_file == $0
end
