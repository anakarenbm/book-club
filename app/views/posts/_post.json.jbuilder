json.extract! post, :id, :club_id, :user_id, :content, :created_at, :updated_at
json.url post_url(post, format: :json)
