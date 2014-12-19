get '/' do
  if session[:user_id]
    @surveys = Survey.all
  	erb :index
  else
  	erb :login
  end
end

get '/index/:page' do
  @page = params[:page].to_i
  surveys = Survey.all
  @page_of_surveys = surveys.each_slice(10).to_a[@page-1]
  erb :page, :layout => false
end

post '/signup' do
  user = User.new(username: params[:username], pw_hash: params[:password], email: params[:email])
  session[:user_id]=user.id if user.save
  redirect '/'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  session[:user_id] = @user.id if @user && @user.authenticate(params[:password])
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
