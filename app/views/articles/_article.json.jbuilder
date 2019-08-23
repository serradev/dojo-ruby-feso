json.extract! article, :id, :title, :content, :created_at, :updated_at

json.category do 
  json.extract! @article.category, :id, :name
end

json.url article_url(article, format: :json)
