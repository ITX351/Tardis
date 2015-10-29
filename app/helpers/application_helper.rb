module ApplicationHelper
  def full_title(page_title)
    return "Tardis" if page_title.empty?
    page_title
  end
end
