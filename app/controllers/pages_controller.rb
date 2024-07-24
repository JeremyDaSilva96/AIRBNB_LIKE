class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_after_action :verify_authorized, only: :home
  skip_after_action :verify_policy_scoped, only: :home
  skip_policy_scope ⇒ :home

  def home
    @resource = User.new
    @resource_name = :user
    @devise_mapping = Devise.mappings[:user]
  end
end
