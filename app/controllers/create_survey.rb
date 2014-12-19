get '/surveys/new' do
  erb :create_survey
end

post '/surveys' do
  # FIXME: This makes survey w/ placeholder user_id; needs to be update to a real user id
  survey = Survey.new(title: params[:title], user_id: 1)

  p "HERE WE ARE THFDJKSHFJDKSFHDS"
  p params[:questions]

  if survey.save
    params[:questions].each do |question|
      Question.create(query: question, survey_id: survey.id)
    end
  else
    # TODO raise error
    # with flash
  end

  redirect to "/surveys/#{survey.id}"
end
