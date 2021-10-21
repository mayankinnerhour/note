class Api::V1::NotesController < ApplicationController

  before_action :authenticate_user!

  def create
    @note = Note.new(note_params)
    authorize @note

    if @note.save
    	render json: @note
    else
    	render error: { error: "Unable to create note." }, status: 400
    end

  end

  private

  def note_params
    params.require(:note).permit(:title, :description, :user_id)
  end
end
