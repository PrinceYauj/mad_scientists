# frozen_string_literal: true

require_relative '/vagrant/app/byg/actions/scientists/index.rb'
require_relative '/vagrant/app/byg/actions/scientists/show.rb'
require_relative '/vagrant/app/byg/actions/scientists/create.rb'
require_relative '/vagrant/app/byg/actions/scientists/destroy.rb'
require_relative '/vagrant/app/byg/actions/scientists/update.rb'

module Byg
  module Rest
    # provides functions to scientists actions
    module Scientists
      def self.index
        Actions::Scientists::Index.new.index
      end

      def self.show(params)
        Actions::Scientists::Show.new.show(params)
      end

      def self.create(params)
        Actions::Scientists::Create.new.create(params)
      end

      def self.destroy(params)
        Actions::Scientists::Destroy.new.destroy(params)
      end

      def self.update(params)
        Actions::Scientists::Update.new(params).update
      end
    end
  end
end
