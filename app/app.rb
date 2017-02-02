require 'sinatra/base'
require './app/models/question_list'

class QuizApp < Sinatra::Base

  get '/questions/:number' do
    question_list = QuestionList.new
    question_list.select_question(params[:number].to_i)
    @question = question_list.print_question
    @number = question_list.current_number
    @options = question_list.print_options
    erb :'questions'
  end

  run! if app_file == $0
end
