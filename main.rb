     
require 'sinatra'
require 'sinatra/reloader' if development?

also_reload 'db/data_access'

require 'pg'
require 'pry'
require 'bcrypt'

require_relative 'db/data_access'
enable :sessions


#it can be in the access file


#STEP1
#the home page



get '/' do
  images = all_images()
  erb :index, locals: { images: images }
end


def logged_in?
  if session[:user_id]
    true
  else
    false
  end
end



#STEP2
#can only use this if youre logged in
def current_user()
  find_user_by_id(session[:user_id])
end



get '/login' do
  erb :login
end


#the login page
post '/login' do
  # params['email'] = 'dt@ga.co'
  # params['password'] = 'pudding'
  user = find_user_by_email(params['email'])

  if BCrypt::Password.new(user['password_digest']) == params['password']
    session[:user_id] = user['id']

  redirect "/"
  else
    erb :login
  end

end




delete '/session' do
  # destroy the session
  session[:user_id] = nil
  redirect '/login'
end




#STEP3
#upload page

get '/images/new' do
  erb :new
end


#adding the uploaded file to others







#STEP4
#issue details

get '/images/:id' do
  image = find_image_by_id(params['id'])
  user = find_user_by_id(image['user_id'])
  erb :detail, locals: { image: image, user: user }
end


post '/images' do
  # single line if/unless is syntactic sugar
  redirect '/login' unless logged_in?

  create_image(params['name'], params['image_url'], params['description'], current_user['id'])
  redirect "/"
end


delete '/images/:id' do
  delete_image(params['id'])
  redirect "/"
end



get '/images/:id/edit' do
  image = find_image_by_id(params['id'])
  erb :edit, locals: { image: image }
end


patch '/images/:id' do
  update_image(params['name'], params['image_url'], params['description'], params['id'])
  redirect "/images/#{params["id"]}"
  # redirect "/"
end
# binding.pry




#STEP4
#issues page


get '/issue' do
  images = all_images()
  erb :issue, locals: { images: images }
  
end


get '/about' do
  erb :about
end