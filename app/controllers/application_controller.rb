class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_categories, :set_locale

  def default_url_options (options = {})
    { locale: I18n.locale }.merge options
  end

  private

    def set_categories
      @categories = Category.hash_tree
    end

    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource_or_scope)
      root_path
    end

    # if params[:locale] is nil then I18n.default_locale will be used
    def set_locale
      # I18n.locale = params[:locale] || I18n.default_locale
      if cookies[:kisilov_locale] && I18n.available_locales.include?(cookies[:kisilov_locale].to_sym)
        l = cookies[:kisilov_locale].to_sym
      else
        l = I18n.default_locale
        cookies.permanent[:kisilov_locale] = l
      end
      I18n.locale = l
    end
end