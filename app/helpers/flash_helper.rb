module FlashHelper
  def register_flash_message(key, message)
    flash[key] = message
  end

  def register_flash_now_message(key, message)
    flash.now[key] = message
  end

  def display_flashes
    render 'shared/flash'
  end

  def flash_class(level)
    bootstrap_alert_class = { notice: 'alert-info',
                              success: 'alert-success',
                              error: 'alert-danger',
                              alert: 'alert-danger' }

    bootstrap_alert_class[level.to_sym] || 'alert-error'
  end
end
