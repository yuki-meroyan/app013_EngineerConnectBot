class EngineerConnectBotsController < ApplicationController
  # ここのコントローラーのみresourcesに捉われないアクションを認める

  def top

  end

  def user_menu

  end

  def group_menu
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

  def article_post
    @beginner = Beginner.new
    @intermediate = Intermediate.new
    @senior = Senior.new
  end

  def article_all
    if params[:junre] == "初級者"
      @article_all = Beginner.all
      @article_jenre = "初級者"
    elsif params[:junre] == "中級者"
      @article_all = Intermediate.all
      @article_jenre = "中級者"
    elsif params[:junre] == "上級者"
      @article_all = Senior.all
      @article_jenre = "上級者"
    else
      @article_all = []       # [0]:初級者 / [1]:中級者 / [2]:上級者
      beginner = Beginner.select("id","title","detail","created_at")
      @article_all << beginner
      intermediate = Intermediate.select("id","title","detail","created_at")
      @article_all << intermediate
      senior = Senior.select("id","title","detail","created_at")
      @article_all << senior
      @article_jenre = "全て"
    end
  end

  def article_mine
    @article_all = []       # [0]:初級者 / [1]:中級者 / [2]:上級者
    beginner = Beginner.select("id","title","detail","created_at").where(user_id: current_user.id)
    @article_all << beginner
    intermediate = Intermediate.select("id","title","detail","created_at").where(user_id: current_user.id)
    @article_all << intermediate
    senior = Senior.select("id","title","detail","created_at").where(user_id: current_user.id)
    @article_all << senior
  end

  def have_group

  end


end
