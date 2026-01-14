module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = nil)
    base_title = "Social Media App"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end
end
