get '/' do
  if session_logged_in?
    redirect("/options")
  end
  erb :index
end


get '/options' do
  erb :option
end
