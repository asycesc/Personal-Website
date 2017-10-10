class TopicsController < ApplicationController
	before_action :set_topics
	layout 'blog'
	def index
		@topics = Topic.all
	end

	def show
		@topic = Topic.friendly.find(params[:id])
		if logged_in?(:website_admin)
			@blogs = @topic.blogs.recent.page(params[:page]).per(5)
		else
			@blogs = @topic.blogs.published.recent.page(params[:page]).per(5)
		end
	end

	private
	def set_topics
		@sidebar_topics = Topic.having_blog
	end
end