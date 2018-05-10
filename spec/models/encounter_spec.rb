require 'rails_helper'

RSpec.describe Encounter, type: :model do
  let(:encounter_attributes) do {name: "Rumble in the Jungle", content: "Rope-a-dope"}
  end

  it "must have a name" do
    expect(Encounter.new(content: "Rope-a_dope")).to be_invalid
  end

  it "must have content" do
    expect(Encounter.new(name: "Rumble in the Jungle")).to be_invalid
  end

  it "does not allow duplicate encounters" do
    Encounter.create!(encounter_attributes)
    expect(Encounter.new(encounter_attributes)).to be_invalid
  end

end
