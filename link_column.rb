require "selenium-webdriver"
require "webdrivers"
require "rspec"


describe "automating column links" do
  it "finds and clicks and verifies the landing page" do
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "https://parabank.parasoft.com/parabank/index.htm"

    about_us = driver.find_element(css:'#headerPanel > ul.leftmenu > li:nth-child(2) > a')
    about_us.click
    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until {driver.find_element(css:'#rightPanel > h1').displayed?}

    driver.navigate.back

    services = driver.find_element(css:'#headerPanel > ul.leftmenu > li:nth-child(3) > a')
    services.click
    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until {driver.find_element(css:'#rightPanel > span:nth-child(4)').displayed?}

    driver.navigate.back

    products = driver.find_element(css:'#headerPanel > ul.leftmenu > li:nth-child(4) > a')
    products.click
    wait = Selenium::WebDriver::Wait.new(timeout: 5)
    wait.until {driver.find_element(css:'body > header > div > div > div > div.col-xl-3.col-lg-3.col-md-3.col-9 > div.inner-logo > a > img').displayed?}

    driver.navigate.back

    locations = driver.find_element(css:'#headerPanel > ul.leftmenu > li:nth-child(5) > a')
    locations.click
    wait.until {driver.find_element(css:'body > header > div > div > div > div.col-xl-3.col-lg-3.col-md-3.col-9 > div.inner-logo > a > img').displayed?}


  end
end
