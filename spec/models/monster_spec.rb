require 'rails_helper'

RSpec.describe Monster, type: :model do
  let(:couch_attributes) do {name: "Angry Couch", description: "Tired of eating loose change, this couch wants to eat bigger prey.", size: "2-seater", hit_points: 60, challenge_rating: 4, strength: 16, dexterity: 12, constitution: 17, intelligence: 7, wisdom: 7, charisma: 14, armor_class: 5, constitution_save: 10, intelligence_save: 0, wisdom_save: 0, history: 0, perception: 8}
  end

  let(:missing_int) {couch_attributes.except(:intelligence)}
  let(:outside_range) {couch_attributes.merge(hit_points: 600)}

  it "is valid with the correct attributes present" do
    expect(Monster.new(couch_attributes)).to be_valid
  end

  it "is not valid without values for all attributes" do
    expect(Monster.new(missing_int)).to be_invalid
  end

  it "is not valid with values outside accepted ranges" do
    expect(Monster.new(outside_range)).to be_invalid
  end
end
