# Use something like this to include the path of your app classes
#$LOAD_PATH << File.join( File.dirname(__FILE__), '../src')

require 'test/unit'


class TestUtil < Test::Unit::TestCase

        def setup
        end

        def test_string_to_boolean
		assert_equal( 2, 1+1 )
        end

end

