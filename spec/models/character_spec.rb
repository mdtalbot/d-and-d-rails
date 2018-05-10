require 'rails_helper'


RSpec.describe Character, type: :model do
  let(:raist_attributes) do {name: 'Raistlin Majere', strength: 10, dexterity: 16, constitution: 8, intelligence: 20, wisdom: 14, charisma: 15, char_class_id: 12, char_race_id: 12, alignment_id: 8, level: 10, experience: 64000}
  end

  let(:missing_con) {raist_attributes.except(:constitution)}
  let(:outside_range) {raist_attributes.merge(intelligence: 30)}

  it "is valid with the correct attributes present" do
    expect(Character.new(raist_attributes)).to be_valid
  end

  it "is not valid without values for all attributes" do
    expect(Character.new(missing_con)).to be_invalid
  end

  it "is not valid with stats outside the accepted 0-20 range" do
    expect(Character.new(outside_range)).to be_invalid
  end

  it "does not allow duplicate characters" do
    Character.create!(raist_attributes)
    expect(Character.new(raist_attributes)).to be_invalid
  end
end
