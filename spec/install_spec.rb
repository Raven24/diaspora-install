
require 'spec_helper'

describe Install do
  context '#prepare' do
    before :each do
      FakeWeb.register_uri(:get, 'https://raw.githubusercontent.com/diaspora/diaspora/develop/.ruby-version', body: '2.0-test')
      FakeWeb.register_uri(:get, 'https://raw.githubusercontent.com/diaspora/diaspora/develop/.ruby-gemset', body: 'diaspora-test')
    end

    it 'requests the ruby version from the repo' do
      Install.prepare
      expect(DIASPORA[:ruby_version]).to eql('2.0-test')
    end

    it 'requests the gemset from the repo' do
      Install.prepare
      expect(DIASPORA[:gemset]).to eql('diaspora-test')
    end
  end
end
