# == Schema Information
#
# Table name: epilepsy_types
#
#  id                 :integer          not null, primary key
#  comment_tags_count :integer
#  questions_count    :integer
#  seizure_name       :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
class EpilepsyType < ApplicationRecord

has_many  :questions, :dependent => :nullify

has_many  :comment_tags, :class_name => "CommentEegType", :dependent => :nullify

end
