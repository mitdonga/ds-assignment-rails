Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "*" # React app's URL
    resource "*",
      headers: :any,
      methods: [ :get, :post, :put, :patch, :delete, :options, :head ],
      expose: [ 'Authorization' ],
      credentials: false
  end
end
