class TopicsController < ApplicationController
  before_action :authenticate_user!

  before_action :set_topic, only: [:edit, :update, :destroy]

  def index
    @topics = Topic.all
    @topic = Topic.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topics_params)
    # user_idを代入する
    @topic.user_id = current_user.id
    # バリデーションが成功したか失敗したかによって、処理を分岐
    if @topic.save
      # 一覧画面へ遷移して"投稿しました"とメッセージを表示
      redirect_to topics_path, notice: "投稿しました"
    else
      # 入力フォームを再描画
      render 'new'
    end
  end

  def edit
  end

  def update
    @topic.update(topics_params)
    # バリデーションが成功したか失敗したかによって、処理を分岐
    if @topic.save
      # 一覧画面へ遷移して"投稿しました"とメッセージを表示
      redirect_to topics_path, notice: "編集しました"
    else
      # 入力フォームを再描画
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_path, notice: "削除しました"
  end


  private
    def topics_params
      params.require(:topic).permit(:content)
    end

    # idをキーとして値を取得するメソッド
    def set_topic
      @topic = Topic.find(params[:id])
    end
end
