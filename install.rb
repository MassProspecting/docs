# This script clone the source code of all the components of massprospecting in the local computer.
#
# For installing the source code you need access to all the repostiories of https://github.com/MassProspecting.
# The required repositories of https://github.com/leandrosardi are alrady public.
#
# The computer where you run this script should be a fresh Ubuntu 20.04 with our [standard environment](https://github.com/leandrosardi/environment) installed.
# 

require 'simple_cloud_logging'
require 'simple_command_line_parser'
#require 'config'

h = {
    :git_username => '***',
    :git_password => '***',
    :components => [
        {
            :name => 'mass.master',
            :repo => 'leandrosardi/my.saas', 
            :branch => 'main',
            :extensions => [
                { :name => 'mass.commons', :repo => 'massprospecting/mass.commons', :branch => 'main' },
                { :name => 'mass.account', :repo => 'massprospecting/mass.account', :branch => 'main' },
                { :name => 'i2p', :repo => 'leandrosardi/i2p', :branch => 'master' },
                { :name => 'content', :repo => 'leandrosardi/content', :branch => 'main' },
                { :name => 'monitoring', :repo => 'leandrosardi/monitoring', :branch => 'main' },
                #{ :name => 'affiliates', :repo => 'leandrosardi/affiliates', :branch => 'main' },
                { :name => 'dropbox-token-helper', :repo => 'leandrosardi/dropbox-token-helper', :branch => 'main' },
            ]    
        }, {
            :name => 'mass.slave',
            :repo => 'leandrosardi/my.saas', 
            :branch => 'main',
            :extensions => [
                { :name => 'mass.commons', :repo => 'massprospecting/mass.commons', :branch => 'main' },
                { :name => 'mass.subaccount', :repo => 'massprospecting/mass.subaccount', :branch => 'main' },
                { :name => 'selectrowsjs', :repo => 'leandrosardi/selectrowsjs', :branch => 'main' },
                { :name => 'filtersjs', :repo => 'leandrosardi/filtersjs', :branch => 'main' },
            ]    
        }, {
            :name => 'mass-sdk',
            :repo => 'massprospecting/mass-sdk', 
            :branch => 'main',
            :extensions => []
        }, {
            :name => 'secret',
            :repo => 'massprospecting/secret', 
            :branch => 'main',
            :extensions => []
        }        
    ]
}

parser = BlackStack::SimpleCommandLineParser.new(
    :description => 'This command will run automation of one specific profile.', 
    :configuration => [{
        :name=>'sandbox', 
        :mandatory=>false, 
        :description=>"Add the .sandbox flag into the root folder of each component, the `/cli` folders and the `/p` folders. Default: no.", 
        :type=>BlackStack::SimpleCommandLineParser::BOOL,
        :default=>false,
    }, {
        :name=>'update', 
        :mandatory=>false, 
        :description=>"Update source code by running `git fetch` and `git update` commands.", 
        :type=>BlackStack::SimpleCommandLineParser::BOOL,
        :default=>false,
    }, {
        :name=>'verbose',
        :mandatory=>false,
        :description=>'Show the output of the commands executed.. Default: no.', 
        :type=>BlackStack::SimpleCommandLineParser::BOOL,
        :default=>false,
    }, {
        :name=>'output',
        :mandatory=>false,
        :description=>'File where redirect the output of all the commands executed. Default: deploy-output.log.', 
        :type=>BlackStack::SimpleCommandLineParser::STRING,
        :default=>'deploy-output.log',
    }]
)

l = BlackStack::LocalLogger.new('install.log')
dirname = File.expand_path(File.dirname(File.dirname(__FILE__)))

gitu = h[:git_username]
gitp = h[:git_password]

update = parser.value('update')
verbose = parser.value('verbose')
output = parser.value('output')

redirect = verbose ? nil : " >> #{output} 2>&1"

## Master
h[:components].each { |c|
    folder = "#{dirname}/#{c[:name]}"
    l.logs "Clonning #{folder.blue}... "
    success = system("git clone https://#{gitu}:#{gitp}@github.com/#{c[:repo]} --single-branch --branch #{c[:branch]} #{folder} #{redirect}")
    success ||= File.exists?(folder)
    l.done if success
    l.error if !success

    l.logs "Updating #{folder.blue}... "
    if !update
        l.skip
    else
        success = system("cd #{folder};git fetch --all #{redirect};git reset --hard origin/#{c[:branch]} #{redirect}")
        l.done if success
        l.error if !success
    end

    c[:extensions].each { |e|
        folder = "#{dirname}/#{c[:name]}/extensions/#{e[:name]}"
        l.logs "Clonning #{folder.blue}... "
        success = system("git clone https://#{gitu}:#{gitp}@github.com/#{e[:repo]} --single-branch --branch #{e[:branch]} #{folder} #{redirect}")
        success ||= File.exists?(folder)
        l.done if success
        l.error if !success
    }

    c[:extensions].each { |e|
        folder = "#{dirname}/#{c[:name]}/extensions/#{e[:name]}"
        l.logs "Updating #{folder.blue}... "
        if !update
            l.skip
        else
            success = system("cd #{folder};git fetch --all #{redirect};git reset --hard origin/#{e[:branch]} #{redirect}")
            l.done if success
            l.error if !success
        end
    }
}
