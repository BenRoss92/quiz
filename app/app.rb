require 'sinatra/base'
require './app/models/question_list'

class QuizApp < Sinatra::Base

  get '/questions/:number' do
    @question_list = QuestionList.new
    @question_list.select_question(params[:number].to_i)
    erb :'questions'
  end

  run! if app_file == $0
end
