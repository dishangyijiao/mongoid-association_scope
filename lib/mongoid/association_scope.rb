# frozen_string_literal: true

require "mongoid"
require_relative "association_scope/version"
require_relative "association_scope/eager"
require_relative "association_scope/macros"
require_relative "association_scope/metadata"
require_relative "association_scope/options"
require_relative "association_scope/referenced"

module Mongoid
  module AssociationScope
    if Mongoid::VERSION >= "7.0.0"
      Mongoid::Association.include Macros
      Mongoid::Association::Referenced::Eager::Base.prepend Eager
      Mongoid::Association::Options.include Options
      [
        Mongoid::Association::Referenced::BelongsTo,
        Mongoid::Association::Referenced::HasMany,
        Mongoid::Association::Referenced::HasAndBelongsToMany,
        Mongoid::Association::Referenced::HasOne
      ].each { |mod| mod.singleton_class.prepend Referenced::Scoped }
    else
      Mongoid::Relations.include Macros
      Mongoid::Relations::Eager::Base.prepend Eager
      Mongoid::Relations::Metadata.prepend Metadata
      Mongoid::Relations::Options.include Options
      [
        Mongoid::Relations::Referenced::In,
        Mongoid::Relations::Referenced::Many,
        Mongoid::Relations::Referenced::ManyToMany,
        Mongoid::Relations::Referenced::One
      ].each { |mod| mod.singleton_class.prepend Referenced::Scoped }
    end
  end
end
