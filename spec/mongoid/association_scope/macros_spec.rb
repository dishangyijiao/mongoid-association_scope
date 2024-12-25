# frozen_string_literal: true

RSpec.describe Mongoid::AssociationScope::Macros do
  subject { Class.new { include Mongoid::Document } }
  let(:scope_proc) { -> { all } }

  shared_examples "association macros" do |macros|
    macros.each do |macro|
      it "support scope parameter .#{macro}" do
        expect(subject.method(macro).parameters[1]).to eq %i[opt scope]
        expect(subject.send macro, :association, scope_proc).to include(scope: scope_proc)
      end
    end
  end

  if mongoid7?
    include_examples "association macros", %i[
      embedded_in
      embeds_many
      embeds_one
      belongs_to
      has_many
      has_and_belongs_to_many
      has_one
    ]
  else
    include_examples "association macros", %i[
      embedded_in
      embeds_many
      embeds_one
      belongs_to
      has_many
      has_and_belongs_to_many
      has_one
    ]
  end
end
