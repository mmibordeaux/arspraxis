json.extract! user_student, :id, :user_id, :program_group_id, :confirmed, :created_at, :updated_at
json.url user_student_url(user_student, format: :json)
