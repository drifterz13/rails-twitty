module ApplicationHelper
  def avatar_url
    if current_user&.avatar&.attached?
      current_user.avatar.variant(:thumb)
    else
      '/images/user.png'
    end
  end
end
