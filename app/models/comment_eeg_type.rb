# == Schema Information
#
# Table name: comment_eeg_types
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  comment_id       :integer
#  eeg_type_id      :integer
#  epilepsy_type_id :integer
#
class CommentEegType < ApplicationRecord

belongs_to :comment

belongs_to :tag, :class_name => "EegType", :foreign_key => "eeg_type_id"

belongs_to :suggested_epilepsy, :class_name => "EpilepsyType", :foreign_key => "epilepsy_type_id", :counter_cache => :comment_tags_count

end
