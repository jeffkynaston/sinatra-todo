require_relative 'config/application'

# puts "Put your application code in #{File.expand_path(__FILE__)}"

get '/' do
  @lists = Lists.all.reverse
  @title = 'All Lists'
  erb :home
end

post '/' do
  n = Lists.new
  n.name = params[:name]
  n.description = params[:description]
  n.created_at = Time.now
  n.updated_at = Time.now
  n.save
  redirect '/'
end