class ToolsController < ApplicationController
  def index
    @tools = Tool.where(user_id: current_user.id)
  end

  def show
    @tool = Tool.find(params[:id])
  end
end
