class AppearancesController < ApplicationController
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def create
        appearance = Appearance.create!(episode_id:params[:episode_id], guest_id:params[:guest_id], rating:params[:rating])
        episode = Episode.find(params[:episode_id])
        render json: appearance.to_json(include: [:episode, :guest]), status: :created        
    end

    private

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

end
