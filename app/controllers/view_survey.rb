get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  @question = @survey.questions
  erb :view_survey
end

post '/surveys/:id' do
  params[:answer].each do |answer|
    Answer.create(response: answer, question_id: (params[:answer].index(answer) + 1))
  end
  redirect '/'
end
