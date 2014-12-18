get '/surveys/new' do
  erb :create_survey
end

post '/surveys' do
  survey = Survey.create(params)
  redirect to '/surveys/#{survey.id}'
end
