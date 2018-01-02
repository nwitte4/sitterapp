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
    @gig.description = 'No details' if @gig.description == ""
    @gig.name = 'Babysitting' if @gig.name == ""

    if @gig.save
      redirect_to @gig
    else
      redirect_to new_gig_path, notice: @gig.errors.full_messages.each
    end
  end

  def request_to_gig
    @request = Request.find(params[:id])
    parent = Parent.where(email: @request.parent_email).last
    @gig = Gig.create(
      parent_id: parent.id,
      sitter_id: current_sitter.id,
      name: nil,
      start_time: @request.start_time,
      end_time: @request.end_time,
      cost: @request.cost,
      description: 'No details',
    )
    if @gig.save
      redirect_to '/'
    else
      redirect_to @request, notice: @gig.errors.full_messages.each
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
    @gig = Gig.find(params[:id])
  end

  def update
    @gig = Gig.find(params[:id])
    if @gig.update(gig_params)
      redirect_to @gig
    else
      render 'edit'
    end
  end

  def destroy
    gig = Gig.find(params[:id])
    gig.destroy

    redirect_to '/'
  end

  private

  def gig_params
      params.require(:gig).permit(:name, :start_time, :end_time, :description, :cost, :parents_ids, :sitter_ids)
  end

end
