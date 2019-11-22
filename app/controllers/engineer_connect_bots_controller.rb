class EngineerConnectBotsController < ApplicationController
  # ここのコントローラーのみresourcesに捉われないアクションを認める

  def top

  end

  def search
    @beginner = Beginner.ransack(params[:q])
    @beginners = @beginner.result(distinct: true)

    @intermediate = Intermediate.ransack(params[:p], search_key: :p)
    @intermediates = @intermediate.result(distinct: true)

    @senior = Senior.ransack(params[:x], search_key: :x)
    @seniors = @senior.result(distinct: true)
  end

  def article

  end

end
