# == Schema Information
#
# Table name: eeg_types
#
#  id             :integer          not null, primary key
#  name           :string
#  wave_frequency :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class EegType < ApplicationRecord

  has_many  :comments_tags, :class_name => "CommentEegType", :dependent => :destroy
  
end
