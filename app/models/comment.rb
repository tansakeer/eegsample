# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  question_id :integer
#  user_id     :integer
#
class Comment < ApplicationRecord

belongs_to :user

belongs_to :question

has_many  :comments_tags, :class_name => "CommentEegType", :dependent => :destroy
end
