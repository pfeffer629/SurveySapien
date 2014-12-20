get '/surveys/new' do
  if session[:user_id]
    @errors = flash[:errors]
    erb :create_survey
  else
    redirect '/'
  end
end

post '/surveys' do
  survey = Survey.new(title: params[:title], user_id: session[:user_id])

  if survey.save
    params[:questions].each do |question|
      Question.create(query: question, survey_id: survey.id)
    end
    redirect to "/surveys/#{survey.id}"
  else
    flash[:errors] = survey.errors
    redirect to '/surveys/new'
  end
end

delete '/surveys/:id' do
  survey = Survey.find(params[:id])
  survey.destroy
  content_type :json
  {id: params[:id]}.to_json
end
