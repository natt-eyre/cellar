require "rails_helper"

describe Product do
  it { should belong_to(:user) }
end
