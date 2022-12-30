module ApplicationHelper
  def flash_class_by(flash_type)
    case flash_type
    when "notice"
      "bg-info"
    when "alert"
      "bg-danger text-white"
    end
  end
end
