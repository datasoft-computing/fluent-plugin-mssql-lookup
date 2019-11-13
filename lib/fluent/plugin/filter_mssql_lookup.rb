#
# Copyright 2019 Datasoft Computing Ltd
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require "fluent/plugin/filter"
require "tiny_tds"

module Fluent
  module Plugin
    class MssqlLookupFilter < Fluent::Plugin::Filter
      Fluent::Plugin.register_filter("mssql_lookup", self)

      config_param :db_user, :string, :desc => 'User name to use to connect to the database'
      config_param :db_password, :string, :desc => 'Password to use to connect to the database'
      config_param :db_host, :string, :desc => 'Database server host name'
      config_param :db_name, :string, :desc => 'Database name'
      config_param :db_port, :integer, :default => 1433, :desc => 'Database port'
      config_param :lookup_sql, :string, :desc => 'SQL script to execute to refresh the lookup'
      config_param :key, :string, :desc => 'Field in the event that links to the lookup'

      def initialize
        super

        @lookup = Hash.new
      end

      def start
        super

        timer_execute(:refresh_timer, 30) do
          lookup_refresh
        end
      end

      def lookup_refresh
        client = TinyTds::Client.new username: @db_user, password: @db_password, host: @db_host, port: @db_port, database: @db_name
        results = client.execute(@lookup_sql)
        results.each do |row|
          id = row["ID"]
          lookup[id] = row
        end
      end

      def filter(tag, time, record)
        id = record[@key]

        return if id.nil?

        match = @lookup[id]
        return if match.nil?

        pp match
      end
    end
  end
end
