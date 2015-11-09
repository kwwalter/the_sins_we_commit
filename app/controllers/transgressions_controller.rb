class TransgressionsController < ApplicationController

  before_action :require_current_user

  # DON'T DO THIS!!! Creating a SPA, not an open API
  # skip_before_action :verify_authenticity_token, only: :create

  def index
    @transgressions = current_user.transgressions.includes(:confessions)
  end

  def create
    @transgression = current_user.transgressions.new(transgression_params)

    if @transgression.save
      # will render create.json.jbuilder. For an API, you can't redirect.
    else
      render json: {
        error: {
          message: @transgression.errors.full_messages.to_sentence
        }
      }
    end
  end

  private

  def transgression_params
    return params.require(:transgression).permit(:sin_type, :description)
  end


end
