require 'spec_helper'

describe SocialSecurityNumber::Is do
  subject(:civil_number) { SocialSecurityNumber::Is.new(number) }

  describe '#validate' do
    let(:number) { '120174-3399' }

    context 'when number personal is valid' do
      it { is_expected.to be_valid }
    end

    context 'when number organisation is valid' do
      let(:number) { '450401-3150' }
      it { is_expected.to be_valid }
    end

    context 'when format is bad' do
      let(:number) { 'A50401-3150' }
      it { is_expected.not_to be_valid }
    end
  end

  describe '#error' do
    subject(:error) { civil_number.tap(&:valid?).error }

    context 'when number contains not digits' do
      let(:number) { 'A50401-3150' }
      it { is_expected.to eq('bad number format') }
    end

    context 'when number contains invalid birth date' do
      let(:number) { '459901-3150' }
      it { is_expected.to eq('number birth date is invalid') }
    end

    context 'when number has bad control number' do
      let(:number) { '120174-3329' }
      it { is_expected.to eq('number control sum invalid') }
    end
  end

  describe '#count_control_number' do
    let(:number) { '120174-3329' }
    it { expect(civil_number.send(:count_control_number)).to eq(9) }
  end

  describe '#check_control_sum' do
    context 'when control number coincide with count number' do
      let(:number) { '120174-3399' }
      it { expect(civil_number.send(:check_control_sum)).to eq(true) }
    end

    context 'when control number not coincide with count number' do
      let(:number) { '120174-3329' }
      it { expect(civil_number.send(:check_control_sum)).to eq(false) }
    end
  end

  describe '#year' do
    context 'when receive value 2000 +' do
      let(:number) { '120102-3329' }
      it { expect(civil_number.send(:year)).to eq(2002) }
    end

    context 'when receive value 1900 +' do
      let(:number) { '120140-3329' }
      it { expect(civil_number.send(:year)).to eq(1940) }
    end
  end

  describe '#day' do
    context 'when simple value' do
      let(:number) { '120102-3329' }
      it { expect(civil_number.send(:day)).to eq(12) }
    end

    context 'when receive extended value' do
      let(:number) { '520140-3329' }
      it { expect(civil_number.send(:day)).to eq(12) }
    end
  end
end
