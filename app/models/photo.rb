# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  image       :string
#  video       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#
class Photo < ApplicationRecord
  
  belongs_to :associated_question, :class_name => "Question", :foreign_key => "question_id"

  has_many :users

  mount_uploader :image, ImageUploader

end
