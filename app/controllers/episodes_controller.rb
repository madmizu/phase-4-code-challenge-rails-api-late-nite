class EpisodesController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_message

    def index
        render json: Episode.all, status: :ok
    end

    def show
        episode = find_episode
        render json: episode.to_json(only: [:id, :date, :number], include: :guests), status: :ok
    end

    def destroy
        episode = find_episode
        episode.destroy
    end

    private

    def find_episode
        Episode.find(params[:id])
    end

    def render_not_found_message
        render json: { error: "Episode not found" }, status: :not_found
    end
end
