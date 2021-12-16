# frozen_string_literal: true

class SecondFactorVerificationManager
  def initialize(current_user)
    @current_user = current_user
  end

  def handle_success(&block)
    @on_success = block
  end

  def handle_failure(&block)
    @on_failure = block
  end

  def handle_no_2fa(&block)
    @no_2fa = block
  end

  def verify!
    if !@current_user.has_any_second_factor_methods_enabled?
      return @no_2fa.call
    end
  end
end
