get '/' do
  if session[:user_id]
    @surveys = Survey.all
  	erb :index
  else
    @errors = flash[:errors] if flash[:errors]
  	erb :login
  end
end

get '/:id/vote' do
  survey = Survey.find(params[:id])
  survey.votes.create(value: 1)

  if request.xhr?
    return survey.points.to_json
    redirect '/'
  else
    redirect "/"
  end
end

post '/signup' do
  user = User.new(username: params[:username], pw_hash: params[:password], email: params[:email])
  if user.save
    session[:user_id] = user.id
  else
    flash[:errors] = user.errors
  end
  redirect '/'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
  else
    flash[:errors] = ["invalid username or password"]
  end
  redirect '/'
end

get '/logout' do
  session[:user_id]=nil
  redirect '/'
end

get '/users/:id' do
  @user = User.find(params[:id])

  erb :user_profile
end
