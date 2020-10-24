
def run_sql(sql, params = [])
    db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'project2_db'})
    results = db.exec_params(sql, params)
    db.close
    return results
  end


  
  def find_user_by_email(email)
    results = run_sql("select * from users where email = $1;", [email])
    return results[0]
  end
  
  def find_user_by_id(id)
    results = run_sql("select * from users where id = $1;", [id])
    return results[0]
  end
  
  def find_image_by_id(id)
    results = run_sql("select * from images where id = $1;", [id])
    return results[0]
  end
  
  def all_images()
    run_sql('select * from images;')
  end
  
  # try it in app_console.rb
  def create_image(name, image_url, description, user_id)
    sql = "insert into images (name, image_url, description, user_id) values ($1, $2, $3, $4);"
    run_sql(sql, [name, image_url, description, user_id])
  end 
  
  def delete_image(id)
    sql = "DELETE FROM images WHERE id = $1;"
    run_sql(sql, [id])
  end
  

  def update_image(name, image_url, description, id)
    sql = "update images set name = $1, image_url = $2, description = $3 where id = $4;"
    run_sql(sql, [name, image_url, description, id])
  end