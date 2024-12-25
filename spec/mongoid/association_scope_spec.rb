# frozen_string_literal: true

RSpec.describe Mongoid::AssociationScope do
  it "has a version number" do
    expect(Mongoid::AssociationScope::VERSION).not_to be nil
  end

  if mongoid7?
    context "with Mongoid 7.0" do
      it "uses correct namespace" do
        expect(Mongoid::Association).to be_const_defined(:Referenced)
        expect(Mongoid::Association::Referenced).to be_const_defined(:BelongsTo)
        expect(Mongoid::Association::Referenced).to be_const_defined(:HasMany)
      end
    end
  end
end
