require 'spec_helper'

describe 'GcTuner::GcConfig' do
  subject { GcTuner::GcConfig.new }

  it 'dumps method values' do
    expect(subject.dump).to match /export RUBY_GC_INIT_SLOTS=/
  end
end
