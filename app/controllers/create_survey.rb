get '/surveys/new' do
  erb :create_survey
end

post '/surveys' do
  # makes survey w/ placeholder user_id
  survey = Survey.create(title: params[:title], user_id: 1)

  puts "XXXXXXXXBHXHJFGDSHJFGDSHJFGDSHJKFBDSHJK NFGDHSJK GBFHJSDKGFCHDJKSDFSACDS"
  p params[:questions]
  # For some reason params[:questions] returns a hash.
  # I don't know and it's messy, so
  # FIXME: Why the hell is create_survey.erb returning a hash rather than an array?
  params[:questions].each do |_,question|
    Question.create(query: question, survey_id: survey.id)
  end

  redirect to "/surveys/#{survey.id}"
end
