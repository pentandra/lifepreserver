# frozen_string_literal: true

require 'helpers/dates'

RSpec.describe LifePreserver::Helpers::Dates, helper: true do
  describe '#attribute_to_time' do
    subject { helper.attribute_to_time(arg, form: form) }

    let(:form) { :utc }

    let(:noon_s) { 1_446_903_076 }
    let(:beginning_of_day_s) { 1_446_854_400 }

    let(:around_noon_local) { Time.at(noon_s - Time.at(noon_s).utc_offset) }
    let(:around_noon_utc) { Time.at(noon_s, in: 0) }
    let(:beginning_of_day_utc) { Time.at(beginning_of_day_s, in: 0) }

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

    context 'with coordinated universal time string' do
      let(:arg) { '2015-11-07T13:31:16Z' }

      it { is_expected.to eql(around_noon_utc) }
    end

    context 'with unqualified local time string' do
      let(:arg) { '2015-11-7 13:31:16' }
      let(:form) { :local }

      it { is_expected.to eql(around_noon_local) }
    end

    context 'with nil' do
      let(:arg) { nil }

      it { is_expected.to be_nil }
    end
  end

  describe '#date_or_time' do
    subject { helper.date_or_time(arg, form_if_time: form) }

    let(:form) { :utc }

    let(:noon_s) { 1_446_903_076 }

    let(:around_noon_local) { Time.at(noon_s - Time.at(noon_s).utc_offset) }
    let(:around_noon_utc) { Time.at(noon_s, in: 0) }
    let(:day_without_time) { Date.new(2015, 11, 7) }

    context 'with Time instance' do
      let(:arg) { around_noon_utc }

      it { is_expected.to eql(around_noon_utc) }
    end

    context 'with Date instance' do
      let(:arg) { day_without_time }

      it { is_expected.to eql(day_without_time) }
    end

    context 'with unqualified local time string' do
      let(:arg) { '2015-11-7 13:31:16' }
      let(:form) { :local }

      it { is_expected.to eql(around_noon_local) }
    end

    context 'with nil' do
      let(:arg) { nil }

      it { is_expected.to be_nil }
    end
  end
end
