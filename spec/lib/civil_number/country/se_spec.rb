require 'spec_helper'

describe CivilNumber::Se do
  subject(:civil_number) { CivilNumber::Se.new(number) }

  describe '#validate' do
    let(:number) {'19391030-4298'}

    context 'when number is valid' do
      it { is_expected.to be_valid }
    end

    context 'when number contains not digits' do
      let(:number) {'19391AA030-4298'}
      it { is_expected.not_to be_valid }
    end
  end


  describe '#error' do
    subject(:error) { civil_number.tap(&:valid?).error }

    context 'when number contains not digits' do
      let(:number) {'19391AA030-4298'}
      it { is_expected.to eq('bad number format') }
    end

    context 'when number contains invalid birth date' do
      let(:number) {'99399999-4298'}
      it { is_expected.to eq('number birth date is invalid') }
    end

    context 'when number has bad control number' do
      let(:number) {'19391030-4296'}
      it { is_expected.to eq('number control sum invalid') }
    end
  end

  describe '#checksum' do
    let(:number) {'19391030-4296'}
    it { expect(civil_number.send(:checksum, :even)).to eq(42)}
  end

  describe '#check_control_digit' do
    context 'when control number coincide with count number' do
      let(:number) {'19391030-4298'}
      it { expect(civil_number.send(:check_control_digit)).to eq(true)}
    end

    context 'when control number not coincide with count number' do
      let(:number) {'19391030-4296'}
      it { expect(civil_number.send(:check_control_digit)).to eq(false)}
    end
  end

  describe '#base_year' do
    let(:number) {'19391030-4296'}
    context 'when receive valid value' do
      it { expect(civil_number.send(:base_year,{year:2})).to eq(2002)}
    end

    context 'when receive invalid value' do
      it { expect(civil_number.send(:base_year,{year:0})).to eq(0)}
    end
  end

  describe '#get_gender' do
    let(:number) {'19391030-4296'}
    context 'when receive odd value' do
      it { expect(civil_number.send(:get_gender,2)).to eq(:male)}
    end
  end

  describe '#number' do
    let(:number) {'19391030-4296'}
    it { expect(civil_number.send(:number)).to eq("193910304296")}
  end

  describe '#formatted' do
    let(:number) {'19391030-4296'}

    context 'when string contains -' do
      it { expect(civil_number.send(:formatted,'19391030-4298')).to eq("391030-4298")}
    end

    context 'when string contais full date' do
      it { expect(civil_number.send(:formatted,'193910304298')).to eq("391030-4298")}
    end

    context 'when string is short' do
      it { expect(civil_number.send(:formatted,'3910304298')).to eq("391030-4298")}
    end
  end
end