module ApplicationHelper
  def twitterized_type(type)
    puts "----- what I see in type: #{type}"
    case type
      when :alert
        "warning"
      when :error
        "error"
      when :info
        "info"
      when :notice
        "success"
      when :success
        "success"
      else
        type.to_s
    end
  end
end
