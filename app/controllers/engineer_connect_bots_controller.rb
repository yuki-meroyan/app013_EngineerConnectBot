class EngineerConnectBotsController < ApplicationController
  # ここのコントローラーのみresourcesに捉われないアクションを認める

  def top

  end

  def search
    @beginner = Beginner.ransack(params[:beginner]])
    @intermediate = Beginner.ransack(params[:intermediate]])
    @senior = Beginner.ransack(params[:senior]])
  end

end
