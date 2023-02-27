module ApplicationHelper
  def page_title(page_title = '')
    page_title.empty? ? "一汁" : "#{page_title} | 一汁"
  end
end
