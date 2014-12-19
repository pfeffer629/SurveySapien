get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  @question = @survey.questions
  erb :view_survey
end

post '/surveys/:id' do

  params[:answer].each.with_index do |answer, index|
    Answer.create(response: answer, question_id: params[:question_ids][index])
  end
  redirect '/'
end
