#rspec basic template
require "selenium-webdriver"
require "webdrivers"
require "rspec"

describe "automating registration" do
  it "fills out the form and submits" do
    driver = Selenium::WebDriver.for :chrome
    driver.navigate.to "https://parabank.parasoft.com/parabank/index.htm"

    register = driver.find_element(css: '#loginPanel > p:nth-child(3) > a')
    register.click

    #wait for page load
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { driver.find_element(css:'#rightPanel > h1').displayed? }

    #fill form
    fname = driver.find_element(id:'customer.firstName')
    fname.send_keys('Courtney')

    lname = driver.find_element(id:'customer.lastName')
    lname.send_keys('Yi')

    address = driver.find_element(id:'customer.address.street')
    address.send_keys('3456 Lantern View Lane')

    city = driver.find_element(id:'customer.address.city')
    city.send_keys('Scottdale')

    state = driver.find_element(id:'customer.address.state')
    state.send_keys('GA')

    zipcode = driver.find_element(id:'customer.address.zipCode')
    zipcode.send_keys('30079')

    phone_number = driver.find_element(id:'customer.phoneNumber')
    phone_number.send_keys('4047860508')

    ssn = driver.find_element(id:'customer.ssn')
    ssn.send_keys('123239948')

    username = driver.find_element(id:'customer.username')
    username.send_keys('cyi1990')

    password = driver.find_element(id:'customer.password')
    password.send_keys('password1')

    confirm = driver.find_element(id:'repeatedPassword')
    confirm.send_keys('password1')

    #submit form
    submit = driver.find_element(xpath:'/html/body/div[1]/div[3]/div[2]/form/table/tbody/tr[13]/td[2]/input')
    submit.click


  end
end
