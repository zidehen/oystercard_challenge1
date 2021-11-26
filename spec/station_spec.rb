
require 'station'

RSpec.describe Station do
   let(:name) {double ("name")}
   let(:zone) {double (1)}
    it 'initialize station name' do
      subject = Station.new(name, zone)
      expect(subject.name).to eq (name)

    end
    it 'initialize station zone' do
        subject = Station.new(name, zone)
        expect(subject.zone).to eq (zone)
    end

end


