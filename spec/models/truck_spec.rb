require 'rails_helper'

RSpec.describe Truck do
  describe ".to_json" do
    let(:truck) { build :truck }

    it "serialize state to json" do
      expect(truck.to_json).to match /"#{truck.id}"/
    end
  end
end
