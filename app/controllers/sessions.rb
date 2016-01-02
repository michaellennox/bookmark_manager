class BookmarkManager < Sinatra::Base
  get '/sessions/new' do
    erb :'sessions/new'
  end

  post '/sessions' do
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect to('/links')
    else
      flash[:errors] = ['Invalid email or password']
      redirect to('/sessions/new')
    end
  end

  delete '/sessions' do
    session[:user_id] = nil
    flash[:notice] = 'Goodbye!'
    redirect to('/links')
  end
end
