module ApplicationHelper

  def bootstrap_class_for flash_type
    case flash_type
      when 'success'
        "alert-success"
      when 'error'
        "alert-danger"
      when 'alert'
        "alert-block"
      when 'notice'
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def change_token
    unless current_user.nil?
      current_user.update_attribute('auth_token', current_user.generate_token)
      cookies.permanent[:auth_token] = current_user.auth_token
    end
  end

end
