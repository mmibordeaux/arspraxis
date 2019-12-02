namespace :inclusive do
  task write: :environment do
    Referential::CriticalLearning.find_each do |cl|
      fix! cl, :name
      fix! cl, :description
    end
    Referential::Level.find_each do |l|
      fix! l, :name
      fix! l, :description
    end
  end

  def fix!(object, property)
    value = object.send property
    fixed_value = replace value.to_s
    object.update_column property, fixed_value
  end

  def replacements
    {
      'L’étudiante' => 'L’étudiant·e',
      'Elle' => 'Il·elle'
    }
  end

  def replace(string)
    replacements.each do |key, value|
      string = string.gsub key, value
    end
    string
  end
end
