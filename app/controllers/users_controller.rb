class UsersController < ApplicationController
  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb"})
  end

  def show
    url_username = params.fetch("user_page")
    matching_usernames = User.where({ :username => url_username })
    @the_user = matching_usernames.at(0)

    if @the_user == nil
      redirect_to("/404", status: 404)
    else
    render({ :template => "user_templates/user_page.html.erb"})
    end
  end

  def new_user
    input_username = params.fetch("query_new_user")
    a_new_user = User.new
    a_new_user.username = input_username
    a_new_user.save
    redirect_to("/users/" + input_username)
  end

  def edit_user
    the_imported_user = params.fetch("edited_user")
    matching_users = User.where({ :id => the_imported_user})
    the_user = matching_users.at(0)

    user_input = params.fetch("edit_user_query")

    the_user.username = user_input
    the_user.save

    redirect_to("/users/" + user_input)

  end
end
