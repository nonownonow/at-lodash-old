require 'should'

describe 'webdirver.io.page', ->
   it 'sshould have the right title - the fancy generator way', ->
      browser.url('http://webdriver.io')
      title=browser.getTitle()
      title.should.be.eql "WebdriverIO - Selenium 2.0 javascript bindings for nodejs"