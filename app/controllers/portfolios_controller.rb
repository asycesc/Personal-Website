class PortfoliosController < ApplicationController
	access all: [:show, :index, :angular], user: {except: [:destroy, :new, :create, :update, :edit, :sort]}, website_admin: :all

	before_action :set_portfolio, only: [:show, :edit, :update, :destroy]

	layout "portfolio"

	def index
		@portfolios = Portfolio.by_position
		@page_title = "My Projects"
	end

	def angular
		@portfolio = Portfolio.angular
	end

	def new
		@portfolio = Portfolio.new
	end

	def create
		@portfolio = Portfolio.new(portfolio_params)
		respond_to do |format|
			if @portfolio.save
				format.html { redirect_to portfolio_path(@portfolio.id), notice: 'Portfolio was successfully created.' }
				format.json { render :show, status: :created, location: @portfolio }
			else
				format.html { render :new }
				format.json { render json: @portfolio.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	def update
		respond_to do |format|
			if @portfolio.update(portfolio_params)
				format.html { redirect_to portfolio_path(@portfolio.id), notice: 'Portfolio was successfully updated.' }
				format.json { render :show, status: :created, location: @portfolios }
			else
				format.html { render :new }
				format.json { render json: @portfolios.errors, status: :unprocessable_entity }
			end
		end
	end

	def show
	end

	def destroy
		@portfolio.destroy
		respond_to do |format|
			format.html { redirect_to portfolios_url, notice: 'Portfolio was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	def sort
		params[:order].each do |key, value|
			Portfolio.find(value[:id]).update(position: value[:position])
		end
		render body: nil
	end

	private
		# Use callbacks to share common setup or constraints between actions.
		def set_portfolio
			@portfolio = Portfolio.friendly.find(params[:id])
			@page_title = @portfolio.title
		end

		# Never trust parameters from the scary internet, only allow the white list through.
		def portfolio_params
			params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image, technologies_attributes: [:id, :name, :_destroy])
		end
		
end
