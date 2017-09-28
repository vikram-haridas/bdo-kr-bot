require 'discordrb'
require "sqlite3"
require 'date'
db = SQLite3::Database.new "bot-kr.db"
bot = Discordrb::Bot.new token: 'MzYyOTgxMTEzNjI0Mzk1Nzc2.DK7Ogg.s3uwzp-SSsTe2wuf4GWsSNkaAgQ', client_id: 362981113624395776
bot2 = Discordrb::Bot.new token: 'MzYzMDUyNDAxMzIzODAyNjM0.DK7mkA.BAuJqQjm4O_z90GKjTHdPaCl_W0', client_id: 362981113624395776

bot.run :async
		bot.message(with_text: 'Ping!') do |event|
		event.respond "Are you fucking retarded?"
		end
		bot.message(with_text: 'zaka') do |event|
			db.execute( "update bosses set last_spawn =? where name =?", Time.now.utc.to_s,"Kzaka")
			t=Time.now.utc
			t=t+12*60*60 #change the 12 to whatever is the gap between two zaka windows
			db.execute( "update bosses set window =? where name =?", t.to_s,"Kzaka")
			db.execute( "select * from bosses where name = ?","Kzaka" ) do |namee,window,win_size,next_spawn|
				event.respond namee+" is next due on "+ window.to_s
			end


		end
bot.sync

bot2.run :async

bot2.sync
