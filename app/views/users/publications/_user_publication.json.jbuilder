json.extract! user_publication, :id, :user_id, :group_id, :title, :content, :published, :created_at, :updated_at
json.url user_publication_url(user_publication, format: :json)
