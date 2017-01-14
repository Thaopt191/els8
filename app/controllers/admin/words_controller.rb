class Admin::WordsController < ApplicationController
  before_action :logged_in_user
  before_action :admin_user

  def index
    @words = Word.paginate(page: params[:page], per_page: Settings.per_page_word).order("category_id")
  end

  def new
    @word = Word.new
    Settings.number_of_answer.times do 
      answer = @word.answers.new 
    end
  end

  def create
    @word = Word.create(word_params)
    @last = Word.last
    @word.answers.each do |x|
      x.word_id = @last.id
    end
    if @word.save
      flash[:success] = t("word.create-success")
    else 
      flash[:danger] = t("word.create-fail")
    end
    redirect_to new_admin_word_url
  end

  def edit
    @word = Word.find_by(id: params[:id]) 
  end

  def update
    @word = Word.find_by(id: params[:id])
    if @word.update_attributes(word_params)
      flash[:success] = t("word.update-success")
    else
      flash[:danger] = t("word.update-fail")
    end
    redirect_to admin_words_url
  end

  def destroy
    @word = Word.find_by(id: params[:id])
    if @word.destroy
      flash[:success] = t ("word.deleted")
    else
      flash[:danger] = t("word.delete-fail")
    end
    redirect_to admin_words_url
  end

  private
  def word_params
    params.require(:word).permit :word, :category_id,
      answers_attributes: [:id, :answer, :isRight]
  end
end
