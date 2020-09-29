module EventsHelper
  def image_event(event)
    image_tag event.image.url :medium if event.image.exists?
  end

  def created_by(event)
    @users.find_by_id(event.user_id).name
  end
end
