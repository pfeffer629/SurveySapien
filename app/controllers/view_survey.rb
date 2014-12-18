get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  @question = @survey.questions
  erb :view_survey
end

post '/surveys/:id' do
end
