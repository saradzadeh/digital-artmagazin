require 'bcrypt'
require 'pg'

require_relative 'data_access.rb'

email = 'dt@ga.co'
password_digest = BCrypt::Password.create('pudding')

sql = "INSERT INTO users (email, password_digest) VALUES ($1, $2);"
run_sql(sql, [email, password_digest])