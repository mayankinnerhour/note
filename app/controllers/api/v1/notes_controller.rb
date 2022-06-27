class Api::V1::NotesController < ApplicationController

  include SlackNotification
  
  # before_action :authenticate_user!
  before_action :set_note, except: [  :index, :create ]
  before_action :ensure_params_exist, only: [ :create ]


  def index
    @notes = Note.all
    render json: @notes
  end

  def create
    # @note = current_user.notes.build(note_params)
    @note = Note.new(note_params)

    if @note.save
    	render json: @note
      message = "A new Note has been successfully created."
    else
      render json: { message: "Validation failed", errors: @note.errors }, status: 400
      message = "A Note has been failed to create."
    end
    slack_data = { message: message }
    sendNotification(slack_data)

  end

  def show
    render json: @note
  end

  def update
    if @note.update_attributes(note_params)
       render json: @note
    else
      render json: { error: "Update failed" }, status: 400
    end    
  end

  def destroy
    begin 
      @note.destroy
       render json: "Deleted Successfully"
    rescue ActiveRecord::RecordNotFound   
      render json: { error: "Delete failed" }, status: 404
    end   
  end

  # def mayank_get
  #   render json: @note
  # end

  # def mayank_update
  #   if @note.update_attributes(note_params)
  #      render json: @note
  #   else
  #     render json: { error: "Update failed" }, status: 400
  #   end    
  # end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :description, :user_id)
  end

  def ensure_params_exist
      return if params[:note].present?
      render json: {
          messages: "Missing Params",
          is_success: false,
          data: {}
        }, status: :bad_request
    end
end
