class FeedsController < ApplicationController
	def show
		@feed_entries = FeedEntry.where(user_id: params[:user_id])
	end
end