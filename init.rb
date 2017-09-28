require "sqlite3"

# Open a database
db = SQLite3::Database.new "bot-kr.db"

# Create a table
rows = db.execute <<-SQL
  create table bosses (
    name varchar(30),
    window varchar(30),
    window_size real,
    last_spawn varchar(30)
  );
SQL



db.execute("INSERT INTO bosses (name, window, window_size,last_spawn) 
            VALUES (?, ?, ?,?)", ["Kzaka", Time.now.utc.to_s, 3.5,Time.now.utc.to_s])
db.execute("INSERT INTO bosses (name, window, window_size,last_spawn) 
            VALUES (?, ?, ?,?)", ["Karanda", Time.now.utc.to_s, 6.5,Time.now.utc.to_s])