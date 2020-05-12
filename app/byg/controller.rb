# frozen_string_literal: true

before do
  content_type 'application/json'
end

not_found do
  "Surprise, motherfucker\n!"
end

error Sequel::MassAssignmentRestriction do
  [400, ['mass assignment restriction: ' + env['sinatra.error'].message]
    .to_json]
end

error Sequel::ForeignKeyConstraintViolation do
  [400, ['foreign key constraint failed: ' + env['sinatra.error'].message]
    .to_json]
end

error Sequel::UniqueConstraintViolation do
  [400, [env['sinatra.error'].message].to_json]
end

error Sequel::ValidationFailed do
  [400, [env['sinatra.error'].message].to_json]
end

error Sequel::NoMatchingRow do
  [400, [env['sinatra.error'].message].to_json]
end

error JSON::ParserError do
  [400, ['request body is not a JSON string'.to_json]]
end

# Controller action #index

get '/scientists' do
  Byg::Rest::Scientists.index.to_json
end

get '/inventions' do
  Byg::Rest::Inventions.index.to_json
end

# Controller action #show

get '/scientists/:route_id' do
  Byg::Rest::Scientists.show(params).to_json
end

get '/inventions/:route_id' do
  Byg::Rest::Inventions.show(params).to_json
end

# Controller action #create

post '/scientists' do
  params = JSON.parse(request.body.read, symbolize_names: true)
  response = Byg::Rest::Scientists.create(params).to_json
  [201, [response]]
end

post '/inventions' do
  params = JSON.parse(request.body.read, symbolize_names: true)
  response = Byg::Rest::Inventions.create(params).to_json
  [201, [response]]
end

# Controller action #destroy

delete '/scientists/:route_id' do
  Byg::Rest::Scientists.destroy(params).to_json
end

delete '/inventions/:route_id' do
  Byg::Rest::Inventions.destroy(params).to_json
end

# Controller action #update

put '/scientists/:route_id' do |route_id|
  params = JSON.parse(request.body.read, symbolize_names: true)
  params[:route_id] = route_id
  res = Byg::Rest::Scientists.update(params).to_json
  res ? [200, [res]] : 400
end

put '/inventions/:route_id' do |route_id|
  params = JSON.parse(request.body.read, symbolize_names: true)
  params[:route_id] = route_id
  res = Byg::Rest::Inventions.update(params).to_json
  res ? [200, [res]] : 400
end
