class NotesController < ApplicationController

  def new
    @note = Note.new
  end

  def create
    @note = Note.create(note_params)
    @note.parent_id = current_parent.id
    if @note.save
      redirect_to sitters_path(@note.sitter_id)
    else
      redirect_to sitters_path(@note.sitter_id)
    end
  end

  def destroy
    note = Note.find(params[:id])
    sitter = Sitter.find(note.sitter_id)
    note.destroy

    redirect_to sitters_path(sitter)
  end

private

def note_params
  params.require(:note).permit(:text, :sitter_id, :parent_id)
end

end
