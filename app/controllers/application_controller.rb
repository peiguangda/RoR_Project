class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include CartsHelper

  before_action :require_signin, :set_categories

  def require_signin
    unless log_in?
      flash[:danger] = "You need to sign in!"
      redirect_to root_path
    end
  end

  def set_categories
    @m_categories = Category.get_categories_by_type 0
    @w_categories = Category.get_categories_by_type 1
    @watches = Category.get_categories_by_type 2
  end
end
