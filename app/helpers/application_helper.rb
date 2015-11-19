module ApplicationHelper
  def full_title(page_title)
    return "Tardis" if page_title.empty?
    page_title
  end
  def find_user(user_id)
  	return User.find(user_id + 0)
  end

end
