# frozen_string_literal: true

require 'sinatra'
require 'json'
require 'sinatra/json'
require 'sequel'
Sequel::Model.plugin :json_serializer

DB = Sequel.connect('postgres://mad_scientists:1@localhost:5432/mad_scientists')
require_relative '/vagrant/app/byg/models/scientist.rb'
require_relative '/vagrant/app/byg/models/invention.rb'
require_relative '/vagrant/app/byg/actions.rb'

set :bind, '0.0.0.0'
set :show_exceptions, false
