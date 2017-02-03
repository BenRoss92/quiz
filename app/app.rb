require 'sinatra/base'
require './app/models/question_list'

class QuizApp < Sinatra::Base

  # set :show_exceptions, :after_handler
  disable :show_exceptions

  get '/questions/:number' do
    @question_list = QuestionList.new
    @question_list.select_question(params[:number].to_i)
    erb :'questions'
  end

  error Exceptions::NoQuestionError do
    env['sinatra.error'].message
  end

  run! if app_file == $0
end
