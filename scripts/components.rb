@config = {
    :component => [
        {
            :name => 'master',
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
            :name => 'slave',
            :repo => 'leandrosardi/my.saas', 
            :branch => 'main',
            :extensions => [
                { :name => 'mass.commons', :repo => 'massprospecting/mass.commons', :branch => 'main' },
                { :name => 'mass.subaccount', :repo => 'massprospecting/mass.subaccount', :branch => 'main' },
                { :name => 'selectrowsjs', :repo => 'leandrosardi/selectrowsjs', :branch => 'main' },
                { :name => 'filtersjs', :repo => 'leandrosardi/filtersjs', :branch => 'main' },
            ]    
        }, {
            :name => 'sdk',
            :repo => 'massprospecting/mass-sdk', 
            :branch => 'main',
            :extensions => []
        }        
    ]
}
