module EventsHelper
  def image_event(event)
    image_tag event.image.url :medium if event.image.exists?
  end
end
