
require 'station'

RSpec.describe Station do

   let(:name) {double ("Aldgate East")}
   let(:zone) {double (1)}
   subject {described_class.new("Aldgate East", 1)}
   
    it 'initialize station name' do
      expect(subject.name).to eq ("Aldgate East")

    end
    it 'initialize station zone' do
        expect(subject.zone).to eq (1)
    end

end


