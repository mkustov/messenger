module MessagesHelper
  def posted_by(message)
    "<b>#{message.user}</b>&nbsp#{message.created_at.strftime('%H:%M:%S')}: ".html_safe
  end
end
