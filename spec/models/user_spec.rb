require 'spec_helper'

describe User do
  it { should have_many :contacts}
  it { should have_many :messages}
  it { should have_many :shares}
end

describe Message do
  it { should belong_to :user}
  it { should have_many :shares}
end

describe Contact do
  it { should belong_to :user}
end

describe Share do
  it { should belong_to :user}
  it { should belong_to :message}
end


