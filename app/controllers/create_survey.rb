get '/surveys/new' do
  erb :create_survey
end

post '/surveys' do
  survey = Survey.create(params[:survey])
  params[:questions].each
  params[:query]
  redirect to '/surveys/#{survey.id}'
end
