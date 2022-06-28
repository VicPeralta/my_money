module FlashHelper
  def css_for_flash(key)
    case key.to_sym
    when :alert
      'alert-bg-color'
    else
      'second-bg-color'
    end
  end
end
