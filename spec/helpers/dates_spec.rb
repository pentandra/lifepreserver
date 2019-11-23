# frozen_string_literal: true

require 'helpers/dates'

RSpec.describe LifePreserver::Helpers::Dates, helper: true do
  before do
    allow(ctx.dependency_tracker).to receive(:enter)
    allow(ctx.dependency_tracker).to receive(:exit)
  end

  describe '#attribute_to_time' do
    subject { helper.attribute_to_time(arg) }

    let(:noon_s) { 1_446_903_076 }
    let(:beginning_of_day_s) { 1_446_854_400 }

    let(:around_noon_local) { Time.at(noon_s - Time.at(noon_s).utc_offset) }
    let(:around_noon_utc) { Time.at(noon_s) }
    let(:beginning_of_day_utc) { Time.at(beginning_of_day_s) }

    context 'with Time instance' do
      let(:arg) { around_noon_utc }

      it { is_expected.to eql(around_noon_utc) }
    end

    context 'with Date instance' do
      let(:arg) { Date.new(2015, 11, 7) }

      it { is_expected.to eql(beginning_of_day_utc) }
    end

    context 'with DateTime instance' do
      let(:arg) { DateTime.new(2015, 11, 7, 13, 31, 16) }

      it { is_expected.to eql(around_noon_utc) }
    end

    context 'with string' do
      let(:arg) { '2015-11-7 13:31:16' }

      it { is_expected.to eql(around_noon_local) }
    end
  end
end
