require 'config.rb'
require 'simple_cloud_logging'

l = BlackStack::LocalLogger.new('push.log')

@secrets.each do |secret|
    begin
        l.logs "Copying #{secret[:name].to_s.blue} to local folder... "
        `cp #{secret[:filename]} ./#{secret[:alias]}`
        l.done

        l.logs "Git add... "
        `git add #{secret[:alias]}`
        l.done

    rescue => e
        l.reset
        l.error e
        exit(1)
    end
end

l.logs "Git commit... "
`git commit -m "Update secrets"`
l.done

l.logs "Git push... "
`git push`
l.done