require_relative 'config/application'

# puts "Put your application code in #{File.expand_path(__FILE__)}"


# When a get request is made for the root directory of the site (/),
# we first store an array of all lists in descending order to an
# instance variable @lists. We set the instance variable @title to
# whatever we want the title attribute in the header of the page to be.
# next, we call the page we want to display using erb 'page name', in
# this case, erb :home. This will display that page and pass our instance
# variables through to the .erb files for use. We use @title in the layouts
# page and @lists in the homepage.
get '/' do
  @lists = Lists.all.reverse
  @title = 'All Lists'
  # flash[:blah] = 'No Notes Found. Add one Below!' if !@lists.empty?
  erb :home
end

# when a post request is made to the root directory of the site (/),
# we create a new list object with information that the user typed
# into a form. In the html of the view (.erb file we displayed in the get method)
# we created a form and labeled each field. When a user sends a post request with
# information in one or more of those fields, that information is availbe
# to us through the params hash, by calling params[:formfieldname]. We have
# designed the form for users to give us the name and description of a new list,
# and we can use that params hash as the argument in a Lists.new or Lists.create
# method call. The first way is longer and more readable, first creating a List
# object, then assigning elements from the [params hash directly to] List object attributes
# and finally saving the new object. The second way is shorthand, using the create
# method and inserting parts of the params hash into a new hash, used as an argument
# for create. Finally, without redirect the page would just load blank - we have to
# make the user do a new get request to reload the page.


# post '/' do
#   n = Lists.new
#   n.name = params[:name]
#   n.description = params[:description]
#   n.created_at = Time.now
#   n.updated_at = Time.now
#   n.save
#   redirect '/'
# end

post '/' do
  Lists.create(name: params[:name], description: params[:description])
  redirect '/'
end

get '/:id' do
  @list = Lists.find params[:id]
  @title = "Edit List ##{params[:id]}"
  erb :edit
end

put '/:id' do
  n = Lists.find params[:id]
  n.description = params[:description]
  n.updated_at = Time.now
  n.save
  redirect '/'
end

get '/:id/delete' do
  @list = Lists.find params[:id]
  @title = "Confirm deletion of note ##{params[:id]}"
  erb :delete
end

delete '/:id' do
  n = Lists.find params[:id]
  n.destroy
  redirect '/'
end

get '/:id/complete' do
  n = Lists.find params[:id]
  n.complete = 1 if n.complete == 0
  n.complete = 0 if n.complete == 1
  n.updated_at = Time.now
  n.save
  redirect '/'
end

get '/:id/display' do
  @tasks = Tasks.where(list_id: params[:id])
  @list = Lists.find params[:id]
  @current_list = Lists.find params[:id]
  @title = "Showing All Tasks From #{@current_list.name}"
  erb :display
end

get '/:list_id/display/:task_id' do
  @list = Lists.find params[:list_id]
  @task = Tasks.find params[:task_id]
  @title = "Edit List ##{params[:list_id]}, Task ##{params[:task_id]}"
  erb :edit_task
end
