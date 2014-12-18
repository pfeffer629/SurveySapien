get '/' do
  @surveys = Survey.all
  p @surveys
  erb :index
end
