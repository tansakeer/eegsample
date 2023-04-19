# == Schema Information
#
# Table name: questions
#
#  id               :integer          not null, primary key
#  medical_history  :text
#  patient_age      :string
#  question         :text
#  status           :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  epilepsy_type_id :integer
#  user_id          :integer
#
class Question < ApplicationRecord

belongs_to :questioner, :class_name => "User", :foreign_key => "user_id", :counter_cache => true

has_many  :photos, :dependent => :destroy

has_many  :comments, :dependent => :destroy

belongs_to :epilepsytype, :class_name => "EpilepsyType", :foreign_key => "epilepsy_type_id", :counter_cache => true
end
