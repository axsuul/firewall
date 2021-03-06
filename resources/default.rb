#
# Author:: Seth Chisamore (<schisamo@opscode.com>)
# Cookbook Name:: firwall
# Resource:: default
#
# Copyright:: 2011, Opscode, Inc.
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
#

actions :enable, :disable

attribute :default, :kind_of => Symbol, :equal_to => [:allow, :deny], :default => :deny
attribute :log_level, :kind_of => Symbol, :equal_to => [:low, :medium, :high, :full], :default => :low

def initialize(name, run_context=nil)
  super
  set_platform_default_providers
  @action = :enable
end

private
def set_platform_default_providers
  Chef::Platform.set(
    :platform => :ubuntu,
    :resource => :firewall,
    :provider => Chef::Provider::FirewallUfw
  )
end
