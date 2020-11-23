class LinkedProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  # GET /linked_profiles
  def index
    @profiles = Profile.joins(:links)
  end
end
