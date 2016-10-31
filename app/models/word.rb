class Word < ApplicationRecord
  belongs_to :category
  belongs_to :lesson
  has_many :results
  has_many :answers, dependent: :destroy

  validates :word, presence: true, length: {maximum: 30}
  accepts_nested_attributes_for :answers,
  	reject_if: lambda {|a| a[:answer].blank?}, allow_destroy: true

  scope :learned, ->(current_user_id){
    where("words.id in (select word_id from results where user_id = ?)", current_user_id)}
  scope :notlearned, ->(current_user_id){
    where("words.id not in (select word_id from results where user_id = ?)", current_user_id)}
end
