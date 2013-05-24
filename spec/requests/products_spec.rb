require 'spec_helper'

describe "Products" do

	before(:all) do
		Product.create(title: "Orange", price_in_pence: 99)
		Product.create(title: "Apple", price_in_pence: 129)
	end
  
	describe "homepage" do

		it "should return something" do
			visit "/"
			page.should have_content("Fruitly")
		end

		it "should have some fruit to sell" do
			visit root_path
			page.should have_content("Apple")
			page.should have_content("Orange")

		end

		it "should have two product to sell" do
			visit root_path
			page.should have_css(".span4")
			page.all(:css, '.span4').length.should ==2

		end
  end

  describe "product page" do

  		it "should show something" do
  			visit product_path(Product.first)
  			page.should have_content("Orange")
  		end

  		it "should have a button called Add to Basket" do
  			visit product_path(Product.first)

  			page.should have_content("Add to Basket")
  			page.should have_content("Basket (0)")

  			click_link "Add to Basket"

  			page.should have_content("Basket (1)")
  			page.should have_content("Remove from Basket")

  			click_link "Remove from Basket"

  			page.should have_content("Basket (0)")
  			page.should have_content("Add to Basket")

  		end

  		it "should add more than one thing to basket" do
  			visit product_path(Product.first)

  			page.should have_content("Basket (0)")

  			click_link "Add to Basket"

  			page.should have_content("Basket (1)")

  			visit product_path(Product.last)

  			page.should have_content("Basket (1)")

  			click_link "Add to Basket"

  			page.should have_content("Basket (2)")

  		end	

  end




end
