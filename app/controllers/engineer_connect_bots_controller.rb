class EngineerConnectBotsController < ApplicationController
  # ここのコントローラーのみresourcesに捉われないアクションを認める

  def top

  end

  def search
    @beginner = Beginner.ransack(params[:beginner])
    @beginners = @beginner.result(distinct: true).recent

    @intermediate = Intermediate.ransack(params[:intermediate])
    @intermediates = @intermediate.result(distinct: true).recent

    @senior = Senior.ransack(params[:senior])
    @seniors = @senior.result(distinct: true).recent
  end

end
