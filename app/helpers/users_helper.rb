module UsersHelper
  def image_user(user)
    if user.image.exists?
      image_tag user.image.url :medium
    else
      image_tag('user.png', class: 'profile-container')
    end
  end

  def image_user_small(user)
    if user.image.exists?
      image_tag user.image.url :thumb
    else
      image_tag('user.png', class: 'profile-container')
    end
  end

  def uncoming(event)
    if Date.parse(event.time) > Date.today
      content_tag :div, class: 'field', class: 'border col-3 m-3' do
        content_tag(:h5, event.title, class: 'text-center') +
          content_tag(:p, event.description) +
          content_tag(:p, 'Location: ' + event.location) +
          content_tag(:p, 'Date: ' + event.time)
      end
    end
  end

  def previous(event)
    if Date.parse(event.time) <= Date.today
      content_tag :div, class: 'field', class: 'border col-3 m-3' do
        content_tag(:h5, event.title, class: 'text-center') +
          content_tag(:p, event.description) +
          content_tag(:p, 'Location: ' + event.location) +
          content_tag(:p, 'Date: ' + event.time)
      end
    end
  end
end
