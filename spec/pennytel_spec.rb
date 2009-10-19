require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require 'pp'

describe PennyTel do
  before do
    @pennytel_api = mock PennyTelAPI
    @pennytel_api.should_receive(:options).with().once.and_return({})
    PennyTelAPI.stub!(:new).and_return @pennytel_api
  end

  describe '#sms' do
    it 'should invoke a web service call to send an sms' do
      @pennytel_api.should_receive :sendSMS
      PennyTel.new('some username', 'some password').sms 'some number', 'some message'
    end
  end
  describe '#call' do
    it 'should invoke a web service call to initiate a call' do
      @pennytel_api.should_receive :triggerCallback
      PennyTel.new('some username', 'some password').call 'some number', 'another number'
    end
  end
end
