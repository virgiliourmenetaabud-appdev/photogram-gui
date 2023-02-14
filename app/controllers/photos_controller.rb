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
end
