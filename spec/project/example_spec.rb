require 'example'

RSpec.describe Project::Example do
  it 'has a version number' do
    expect(Project::Example::VERSION).not_to be nil
  end
end
