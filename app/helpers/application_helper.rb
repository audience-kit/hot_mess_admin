module ApplicationHelper
  def title(title)
    content_for :title, title
  end

  def breadcrumbs
    []
  end
end
