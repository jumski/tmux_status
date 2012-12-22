require 'spec_helper'

describe TmuxStatus::Wrappers::Gmail do
  let(:username) { 'username' }
  let(:password) { 'password' }
  subject { described_class.new(username, password) }

  describe '#any_unread?' do
    it 'is true if unread count is above 0' do
      subject.stubs(unread_count: 3)

      expect(subject.any_unread?).to be_true
    end

    it 'is false if unread count equals 0' do
      subject.stubs(unread_count: 0)

      expect(subject.any_unread?).to be_false
    end
  end

  describe '#unread_count' do
    let(:gmail) { stub }

    it 'gets count of unread emails from main inbox' do
      Gmail.expects(:connect).with(username, password).
        returns(gmail)
      gmail.stubs(inbox: stub)
      gmail.inbox.expects(:count).with(:unread).returns(7)

      expect(subject.unread_count).to eq(7)
    end
  end
end
