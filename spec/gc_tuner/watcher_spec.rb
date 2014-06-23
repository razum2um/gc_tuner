require 'spec_helper'
require 'tempfile'

describe 'GcTuner::Watcher' do
  let(:tmp_file) { Tempfile.new('watcher') }
  subject { GcTuner::Watcher.instance }

  it 'dumps method values' do
    expect(subject).to receive(:dump_filename) { tmp_file.path }
    expect {
      subject.dump
    }.to change { tmp_file.rewind; tmp_file.read.size }
  end
end
