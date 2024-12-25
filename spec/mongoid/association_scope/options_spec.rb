# frozen_string_literal: true

RSpec.describe Mongoid::AssociationScope::Options do
  subject do
    if mongoid7?
      Mongoid::Association::Options
    else
      Mongoid::Relations::Options
    end
  end

  describe ".validate!" do
    it "support :scope option" do
      relation = if mongoid7?
                   Mongoid::Association::Referenced::HasOne
                 else
                   Mongoid::Relations::Referenced::One
                 end
      expect(subject.validate!({relation: relation, scope: -> {}})).to be_truthy
    end
  end
end
