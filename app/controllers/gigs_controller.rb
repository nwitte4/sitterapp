class GigsController < ApplicationController
  def index
    @gigs = Gig.all
  end

  def show
    @gig = Gig.find(params[:id])
  end

  def new
    @gig = Gig.new
  end

  def create
    @gig = Gig.create(gig_params)
    @gig.parent_id = current_parent.id
    if @gig.save
      redirect_to @gig
    else
      redirect_to new_gig_path, notice: @gig.errors.full_messages.each
    end
  end

  def add_sitter_to_gig
    gig = Gig.find(params[:id])

    if gig.sitter_id.nil?
      gig.sitter_id = current_sitter.id
    else
      gig.sitter_id = nil
    end

    if gig.save
      redirect_to '/'
    else
      redirect_to gig_path(gig)
    end
  end

  def edit
  end

  def update
  end

  def destroy
    gig = Gig.find(params[:id])
    gig.destroy

    redirect_to '/'
  end

  private

  def gig_params
      params.require(:gig).permit(:name, :start_time, :end_time, :cost, :parents_ids, :sitter_ids)
  end

end
