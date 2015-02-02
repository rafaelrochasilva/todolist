require 'rails_helper'

describe FeedEntry do
	it "is valid with user, message" do
		feed_entry = FactoryGirl.create(:feed_entry)
		expect(feed_entry).to be_valid
	end

	it "is invalid without message" do
		feed_entry = FactoryGirl.build(:feed_entry, message: nil)
		feed_entry.valid?
		expect(feed_entry.errors[:message]).to include "can't be blank"
	end

end