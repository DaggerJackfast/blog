# from selenium import webdriver
# import unittest
# from selenium.webdriver.common.keys import Keys
#
#
# class PythonTest1(unittest.TestCase):
#     def setUp(self):
#         self.driver = webdriver.Firefox()
#
#
#
#
#
#         # driver.get('http://127.0.0.1:8000/')
#     """def quit(self):
#         driver = self.driver
#         topbar = driver.find_element_by_class_name('top-bar-section')
#         section = topbar.find_element_by_class_name('right')
#         click = topbar.find_element_by_tag_name('a').click()
#
# """
#
#
#     def test_python(self):
#         driver = self.driver
#         driver.get('http://127.0.0.1:8000/')
#         driver = self.driver
#         self.assertIn('Django', driver.title)
#         topbar = driver.find_element_by_class_name('top-bar-section')
#         section = topbar.find_element_by_class_name('right')
#         click = topbar.find_element_by_tag_name('a').click()
#         user = 'test7'
#         pswd = 'admin123'
#
#         self.assertIn('Django', self.driver.title)
#         click = self.driver.find_element_by_id('register-link').click()
#         form = self.driver.find_element_by_id('register-form')
#         form.find_element_by_id('id_username').send_keys(user)
#         form.find_element_by_id('id_password1').send_keys(pswd)
#         form.find_element_by_id('id_password2').send_keys(pswd)
#         form.find_element_by_class_name('button').click()
#         for i in range(1):
#             topbar = driver.find_element_by_class_name('top-bar-section')
#             section = topbar.find_element_by_class_name('right')
#             click = topbar.find_element_by_tag_name('a').click()
#
#         self.assertEqual('Django', driver.title)
#         form = driver.find_element_by_id('login-form')
#         form.find_element_by_id('username').send_keys(user)
#         form.find_element_by_id('password').send_keys(pswd)
#         form.find_element_by_class_name('button').click()
#         self.assertEqual('Django', driver.title)
#         content = driver.find_element_by_id('content-page')
#         all_options = content.find_elements_by_class_name('link-p')
#         all_options[2].click()
# """
#         # def tearDown(self):
#         #    self.driver.close()
# """