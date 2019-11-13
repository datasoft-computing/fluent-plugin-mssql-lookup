require "helper"
require "fluent/plugin/filter_mssql_lookup.rb"

class MssqlLookupFilterTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  test "failure" do
    flunk
  end

  private

  def create_driver(conf)
    Fluent::Test::Driver::Filter.new(Fluent::Plugin::MssqlLookupFilter).configure(conf)
  end
end
