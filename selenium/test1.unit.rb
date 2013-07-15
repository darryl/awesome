require "test/unit"
require "rubygems"
gem "selenium-client"
require "selenium/client"

class Test1 < Test::Unit::TestCase

  def setup
    @verification_errors = []
    @selenium = Selenium::Client::Driver.new \
      :host => "localhost",
      :port => 4444,
      :browser => "*chrome",
      :url => "http://localhost:3000/",
      :timeout_in_second => 60

    @selenium.start_new_browser_session
  end

  def teardown
    @selenium.close_current_browser_session
    assert_equal [], @verification_errors
  end

  def test_test1
    @selenium.open "/musicians/sign_in"
    @selenium.click "link=Sign up"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "id=musician_email", "selenium@s.com"
    @selenium.type "id=musician_password", "pass"
    @selenium.type "id=musician_password_confirmation", "pass"
    @selenium.click "name=commit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "id=mix_name", ""
    assert @selenium.is_text_present("selenium@s.com")
    @selenium.click "link=logout"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "id=musician_email", "selenium@s.com"
    @selenium.type "id=musician_password", "pass"
    @selenium.click "name=commit"
    @selenium.wait_for_page_to_load "30000"
    assert @selenium.is_text_present("selenium@s.com")
    @selenium.click "link=upload new"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "id=sample_name", "test sample 1"
    @selenium.type "id=sample_audio", "/home/darryl/proj/awesome4/test-wavs/KDE_Beep_Honk.wav"
    @selenium.click "name=commit"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=New Sample"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "id=sample_name", "test 2"
    @selenium.type "id=sample_audio", "/home/darryl/proj/awesome4/test-wavs/KDE_Beep_Lightning.wav"
    @selenium.click "name=commit"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("test 2")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    assert @selenium.is_text_present("uploaded by selenium")
    assert @selenium.is_text_present("(in library)")
    @selenium.click "link=New Sample"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "id=sample_audio", "/home/darryl/proj/awesome4/test-wavs/KDE_Beep_RingRing.wav"
    @selenium.type "id=sample_name", "test3"
    @selenium.type "id=sample_desc", "asdfasfdsafd"
    @selenium.click "name=commit"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert @selenium.is_text_present("test3")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    begin
        assert @selenium.is_text_present("asdfasfdsafd")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=selenium samples tracks"
    @selenium.wait_for_page_to_load "30000"
    @selenium.type "id=mix_name", "Test Mix"
    assert @selenium.is_text_present("test sample 1")
    @selenium.click "name=commit"
    @selenium.wait_for_page_to_load "30000"
    assert @selenium.is_text_present("Test Mix")
    assert @selenium.is_text_present("test sample 1")
    @selenium.click "link=(use)"
    @selenium.click "link=play>"
    @selenium.click "xpath=(//a[contains(text(),'(use)')])[2]"
    @selenium.click "link=play>"
    @selenium.click "xpath=(//a[contains(text(),'(use)')])[3]"
    @selenium.click "link=play>"
    @selenium.click "link=selenium samples tracks"
    @selenium.wait_for_page_to_load "30000"
    assert @selenium.is_text_present("test sample 1")
    assert @selenium.is_text_present("test 2")
    assert @selenium.is_text_present("test3")
    @selenium.click "link=remove from library"
    sleep 0.3
    assert !@selenium.is_text_present("test sample 1")
    @selenium.click "xpath=(//a[contains(text(),'remove from library')])[3]"
        sleep 0.3
    assert !@selenium.is_text_present("test sample 1")
    @selenium
    assert !@selenium.is_text_present("test3")
    @selenium.click "link=Play - Edit"
    @selenium.wait_for_page_to_load "30000"
    assert @selenium.is_text_present("test 2")
    @selenium.click "link=selenium samples tracks"
    @selenium.wait_for_page_to_load "30000"
    @selenium.click "link=find samples"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert_equal "(in library)", @selenium.get_text("//tr[2]/td[5]")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "id=sample-3"
    assert_equal "uploaded by selenium", @selenium.get_table("css=table.2.3")
    @selenium.click "link=New Sample"
    @selenium.wait_for_page_to_load "30000"
    begin
        assert_equal "New sample", @selenium.get_text("css=h1")
    rescue Test::Unit::AssertionFailedError
        @verification_errors << $!
    end
    @selenium.click "link=logout"
    @selenium.wait_for_page_to_load "30000"
  end
end
