class ConfessionsController < ApplicationController

  def create
    transgression = Transgression.find(params[:transgression_id])

    # this is :transgression_id becuase of the nested URL--transgressions/:transgression_id/confessions

    @confession = transgression.confession.new(confession_params)

    if @confession.save
      # won't do anything. just create a jbuilder file inside of views/confessions
    else
      render json: {
        error: {
          message: @confession.errors.full_messages.to_sentence
        }
      }
    end
  end

  private

  def confession_params
    return params.require(:confession).permit(:description, :occurred_at)
  end
end
