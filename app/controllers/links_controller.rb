class LinksController < ApplicationController
  before_action :set_profile
  before_action :set_link, only: [:edit, :update, :destroy]


  # GET /links/new
  def new
    @link = set_profile.links.build
  end

  # GET /links/1/edit
  def edit
  end

  # POST /links
  def create
    @link = set_profile.links.build(link_params)
    if @link.save
      redirect_to profile_links_path(@profile), notice: 'Link was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /links/1
  def update
    if @link.update(link_params)
      redirect_to profile_links_path(@profile), notice: 'Link was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /links/1
  def destroy
    @link.destroy

    redirect_to profile_links_path(@profile), notice: 'Link was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @link ||= Link.find(params[:id])
    end

    def set_profile
      @profile ||= Profile.find(params[:profile_id])
    end

    # Only allow a list of trusted parameters through.
    def link_params
      params.require(:link).permit(:name, :url)
    end
end
