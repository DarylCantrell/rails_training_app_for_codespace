require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
#  TEST_BROWSER = ENV['TEST_BROWSER'].presence&.to_sym || (ENV['CODESPACES'] ? :headless_firefox : :chrome)
#  driven_by :selenium, using: TEST_BROWSER, screen_size: [1400, 1400]

  driven_by :selenium, using: :headless_chrome, screen_size: [1400, 1400] do |driver_options|
    driver_options.add_argument('no-sandbox')
  end
end
