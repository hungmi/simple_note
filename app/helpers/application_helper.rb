module ApplicationHelper
  def meta_title
    @page_title.present? ? '#{@page_title} | 黑白記' : '黑白記'
  end

  def flash_notice_message(opts = {})
    if flash.any?
      flash.map do |type, message|
        content_tag :div, class: "alert alert-#{type}", role:'alert' do
          content_tag :strong, type.capitalize
          message
        end
      end[0]
    end
  end

  def notice_message(content, type, opts = {})
    if content.any?
      content.map do |message|
        content_tag :div, class: "alert alert-#{type}", role:'alert' do
          content_tag :strong, type.capitalize
          message
        end
      end[0]
    end
  end

  def not_desktop?
    browser = Browser.new(request.user_agent)
    browser.mobile? || browser.tablet?
  end
end
