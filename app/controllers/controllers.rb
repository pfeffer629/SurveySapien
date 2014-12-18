get '/' do
	if session[:user_id]
      @surveys = Survey.all
  		erb :index
  else
  		erb :login
  end
end

post '/signup' do
  user = User.new(username: params[:username], pw_hash: params[:password], email: params[:email])
  if user.save
    session[:user_id]=user.id
  end
  redirect '/'
end

post '/login' do
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  end
end

get '/logout' do
  session[:user_id]=nil
  redirect '/'
end
