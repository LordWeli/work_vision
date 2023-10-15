# frozen_string_literal: true

class ContentsController < ApplicationController
  def show
    content = Contents::Show.new(params[:id]).viewer

    serializable_content = ContentSerializer.new(content).serializable_hash

    render json: serializable_content, status: :ok
  end

  def create
    content = Contents::Create.new(contents_params).creator

    serializable_content = ContentSerializer.new(content).serializable_hash

    render json: serializable_content, status: :ok
  rescue StandardError => e
    raise e
  end

  private

  def contents_params
    params.permit(:description, :title, :user_id)
  end
end
