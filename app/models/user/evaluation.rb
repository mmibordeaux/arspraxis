# == Schema Information
#
# Table name: user_evaluations
#
#  id                               :bigint           not null, primary key
#  authenticity_comment             :text
#  authenticity_validated           :boolean
#  completeness_comment             :text
#  completeness_validated           :boolean
#  depth_comment                    :text
#  depth_validated                  :boolean
#  explanation_comment              :text
#  explanation_validated            :boolean
#  extent_comment                   :text
#  extent_validated                 :boolean
#  validity_comment                 :text
#  validity_validated               :boolean
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  program_teacher_id               :bigint
#  publication_id                   :bigint
#  referential_critical_learning_id :bigint
#
# Indexes
#
#  index_user_evaluations_on_program_teacher_id                (program_teacher_id)
#  index_user_evaluations_on_publication_id                    (publication_id)
#  index_user_evaluations_on_referential_critical_learning_id  (referential_critical_learning_id)
#
# Foreign Keys
#
#  fk_rails_...  (program_teacher_id => program_teachers.id)
#  fk_rails_...  (publication_id => user_publications.id)
#  fk_rails_...  (referential_critical_learning_id => referential_critical_learnings.id)
#

class User::Evaluation < ApplicationRecord
  belongs_to :publication
end
