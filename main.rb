     
require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  erb :index
end

def run_sql
PG.connect(ENV['DATABASE_URL'] || {dbname: 'project2_db'})
result = db.exec(sql)
db.close
end

#it can be in the 

