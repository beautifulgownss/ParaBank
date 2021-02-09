require "selenium-webdriver"
require "webdrivers"
require "rspec"

describe "automating requesting a loan" do
  it "logins and request loan" do
    #open webdriver and navigate to website
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "https://parabank.parasoft.com/parabank/index.htm"

    #sign in
    username = driver.find_element(css:'#loginPanel > form > div:nth-child(2) > input')
    username.send_keys('cyi1990')

    password = driver.find_element(css:'#loginPanel > form > div:nth-child(4) > input')
    password.send_keys('password1')

    submit = driver.find_element(xpath:'/html/body/div[1]/div[3]/div[1]/div/form/div[3]/input')
    submit.click

    #wait for page load
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { driver.find_element(css:'#rightPanel > div > div > h1').displayed? }

    #click request loan for account activity
    loan = driver.find_element(css:'#leftPanel > ul > li:nth-child(7) > a')
    loan.click

    #wait until loan page is displayed and confirm page title
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { driver.find_element(class:'title').displayed? }

    amount = driver.find_element(id: 'amount')
    amount.send_keys('10000')

    down_payment = driver.find_element(id:'downPayment')
    down_payment.send_keys('2000')

    sumbit_loan = driver.find_element(xpath:'/html/body/div[1]/div[3]/div[2]/div/div/form/table/tbody/tr[4]/td[2]/input')
    sumbit_loan.click 
  end
end
