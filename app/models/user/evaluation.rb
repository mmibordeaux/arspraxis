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
#  validated                        :boolean          default(FALSE)
#  validity_comment                 :text
#  validity_validated               :boolean
#  created_at                       :datetime         not null
#  updated_at                       :datetime         not null
#  publication_id                   :bigint
#  referential_critical_learning_id :bigint
#  user_id                          :bigint
#
# Indexes
#
#  index_user_evaluations_on_publication_id                    (publication_id)
#  index_user_evaluations_on_referential_critical_learning_id  (referential_critical_learning_id)
#  index_user_evaluations_on_user_id                           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (publication_id => user_publications.id)
#  fk_rails_...  (referential_critical_learning_id => referential_critical_learnings.id)
#  fk_rails_...  (user_id => users.id)
#

class User::Evaluation < ApplicationRecord
  belongs_to :publication
  belongs_to :user
  belongs_to  :referential_critical_learning,
              class_name: 'Referential::CriticalLearning'
  alias :critical_learning :referential_critical_learning

  before_validation :check_if_validated

  def to_s
    "Evaluation #{id}"
  end

  protected

  def check_if_validated
    self.validated =  authenticity_validated &&
                      completeness_validated &&
                      depth_validated &&
                      explanation_validated &&
                      extent_validated &&
                      validity_validated
  end
end
