require "sinatra"
require "sinatra/reloader"
require "uri"

def page_content(title)
  File.read("pages/words.txt")
rescue Errno::ENOENT
  return nil
end

def save_content(content)
  File.open("pages/words.txt", "w") do |file|
    file.print(content)
  end
end

get "/" do
  erb :welcome
end

get "/display" do
  @title = params[:words]
  @content = page_content(@title)
  @content = @content.downcase
  @list_raw = ["women", "men", "boys", "zulu"] #figure out why this stops working when the full list is here?
  @content = @content.split(/ |, |,/)
  @match = @list_raw & @content
  @match = @match.join(" ")
  erb :display
end

post "/words" do
  save_content(params["content"])
  redirect URI.escape("/display")
end
