from selenium import webdriver

# Set up the Selenium driver (replace with the appropriate driver for your browser)
driver = webdriver.Chrome()

# Navigate to the website
url = "https://theresanaiforthat.com/"
driver.get(url)

# Find all <li> elements with class "li m new" or "m"
li_elements = driver.find_elements_by_css_selector("li.li.m.new, li.m")

# Iterate over the <li> elements
for li in li_elements:
    # Extract the attributes
    data_name = li.get_attribute("data-name")
    data_task = li.get_attribute("data-task")
    data_url = li.get_attribute("data-url")

    # Print the extracted data
    print("data-name:", data_name)
    print("data-task:", data_task)
    print("data-url:", data_url)
    print("---")

# Quit the driver
driver.quit()