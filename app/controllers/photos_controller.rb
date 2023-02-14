class PhotosController < ApplicationController
  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render({ :template => "/photo_templates/index.html.erb"})
  end

  def show_photo
    url_photo_id = params.fetch("photo_page")
    matching_photos = Photo.where({ :id => url_photo_id})
    @pic_id = matching_photos.at(0)

    matching_comments = Comment.where({ :photo_id => @pic_id.id})
    @list_of_comments = matching_comments.order({ :created_at => :desc})

    render({ :template => "/photo_templates/photo_page.html.erb"})
  end

  def delete_photo
    url_pic_id = params.fetch("deleted")
    matching_photos = Photo.where({ :id => url_pic_id})
    the_photo = matching_photos.at(0)
    the_photo.destroy

    redirect_to("/photos")
  end

  def create
  input_image = params.fetch("query_image")
  input_caption = params.fetch("query_caption")
  input_owner = params.fetch("query_owner")
  a_new_photo = Photo.new
  a_new_photo.image = input_image
  a_new_photo.caption = input_caption
  a_new_photo.owner_id = input_owner
  a_new_photo.save

  redirect_to("/photos/" + a_new_photo.id.to_s)
  end

  def update
    the_id = params.fetch("updated")
    matching_photos = Photo.where({ :id => the_id })
    the_photo = matching_photos.at(0)

    input_image = params.fetch("input_image_edit", "false")
    input_caption = params.fetch("input_caption_edit", "false")

    the_photo.image = input_image
    the_photo.caption = input_caption

    the_photo.save

    redirect_to("/photos/" + the_photo.id.to_s)

  end

  def new_comment
    this_pic = params.fetch("photo")
    matching_photos = Photo.where({ :id => this_pic})
    the_photo = matching_photos.at(0)

    the_comment = Comment.new
    the_comment.photo_id = params.fetch("photo_for_new_comment")
    the_comment.author_id = params.fetch("author_for_new_comment")
    the_comment.body = params.fetch("new_comment_text")

    the_comment.save

    redirect_to("/photos/" + the_photo.id.to_s)
  end
end
