<img src="./assets/logo.svg" alt="image" width="256" height="auto" />

# AI-Driven, Multi-Channel Outreach System

**Outline:**

1. [Getting Started](#1-getting-started)
2. [CRM](#2-crm)
3. [Profiles](#3-profiles)
4. [Scraping](#4-scraping)
5. [Enrichment](#5-enrichment)
6. [Outreach](#6-outreach)
7. [Rules](#7-rules)
8. [Imports](#8-imports)
9. [Costs Tracking](#9-costs-tracking)
10. [Timeline](#10-timeline)
11. [Use Cases](#11-install-ruby-gem-of-massprospecting)
12. [Disclaimers](#12-disclaimers)

## 1. Getting Started

Follow the steps below to submit your first lead.

### 1.1. Install Ruby Gem of MassProspecting

```bash
gem install mass
```

### 1.2. Setup Client

```ruby
BlackStack::API.set_client(
    api_key: '4db9d88c-dee9-****-8d36-********',
    api_url: 'http://127.0.0.1',
    api_port: 3000,
    api_version: '1.0'
)
```

### 1.3. Create Tags for Your Leads and Companies

Tags are a key part of **MassProspecting**.

Both, **leads** and **companies** can be tagged for further workflows configuration.

E.g.: You can setup an email campaign to be sent only to leads with a specific tag.

```ruby
Mass::Tag.upsert({ 
    'name' => 'testing', 
    'color_code' => :orange
})
```

### 1.4. Submit a Lead

```ruby
Mass::Lead.upsert({
    'first_name' => 'Leandro',
    'last_name' => 'Sardi',
    'middle_name' => 'Daniel',
    'picture_url' => 'https://media.licdn.com/dms/image/D4D03AQFKseTSZnpIAg/profile-displayphoto-shrink_100_100/0/1697551355295?e=1722470400&v=beta&t=2NZ4wUN2Cd9uzOuY0nrhWZOukpP84s3FPRFHNwOAZOs',
    'job_title' => 'Founder & CEO',
    'country' => 'Argentina',
    'timezone' => 'America/Argentina/Buenos_Aires',
    'email' => 'leandro@foo.com',
    'facebook' => 'https://www.facebook.com/leandro.sardi',
    'linkedin' => 'https://www.linkedin.com/in/leandro-daniel-sardi/',
    'tags' => ['testing'],
})
```

Note:

1. The picture of the lead will be download from the web and stored in a private repository of MassProspecting for furter reference.
If you call the `upsert` with a second time with the same value in `picture_url`, the operation of storing the image will be skipped.

2. If you call the `upsert` with a second time missing some fields (e.g.: `middle_name`), such a value won't be erased.
Only existing fields in the hash descriptions will be updated in the database.

3. The `upsert` operation tries to find an existing lead with the same id, email, linkedin or facebook.
The values of email, linkedin and facebook are normalized prior matching and storing operations.

4. Check the full [list of counties](/docu/countries.md) that you assign to a lead or company.

5. Check the full [list of timezones](/docu/timezones.md) that you can assign to a lead or company.

### 1.5. Channels

A **channel** is a 3th party service that you are using to grab information from, or performing an outreach.

**E.g.:**

- Facebook.
- LinkedIn.
- Apollo.
- Indeed.

**E.g.:** You are using LinkedIn, Facebook, Instagram for scraping leads and sending outreach too. You are using Apollo and FindyLeads for appending the email addresses of the Leads you scraped.

You can create a channel from its hash descriptor:

```ruby
Mass::Channel.upsert({ 
    'name' => 'linkedin', 
    'avatar_url' => 'https://images.rawpixel.com/image_trimmed_png_250/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvdjk4Mi1kNS0xMF8xLnBuZw.png', 
    'color_code' => :light_blue 
})
```

## 2. CRM

Some more feature to manage your leads are described in this chapter.

### 2.1. Submit a Company

```ruby
Mass::Company.upsert({
    'name' => 'VyMECO',
    'domain' => 'http://vymeco.com',
    'picture_url' => 'file://home/leandro/Downloads/logo.png',
    'country' => 'Uruguay',
    'timezone' => 'America/Argentina/Buenos_Aires',
    'tags' => ['testing'],  
    'sic' => ['9995', 100],
    'naics' => [112120, '1111A0'],
})
```

Note:

1. Unlike the previous examnple, this time the picture of the company company is taken from the local disk. 

2. The `upsert` operation tries to find an existing company with the same id, domain, linkedin, or facebook.
The values of domain, linkedin and facebook are normalized prior matching and storing operations.

3. Check the full [list of SIC codes](/docu/sic-codes.md) that you assign to a lead or company.

4. Check the full [list of NAICS codes](/docu/naics-codes.md) that you can assign to a lead or company.

### 2.2. Assign Lead to a Company

You can create/update both the lead and company in one single call, and assign the lead to such a company in the process.

```ruby
Mass::Lead.upsert({
    'first_name' => 'Leandro',
    'email' => 'leandro@foo.com',
    'company' => {
        'name' => 'VyMECO',
        'domain' => 'http://vymeco.com',
        'picture_url' => 'file://home/leandro/code/mass/extensions/mass.subaccount/public/mass.subaccount/images/logo.png',
        'country' => 'Uruguay',
        'timezone' => 'America/Argentina/Buenos_Aires',
        'tags' => ['testing'],  
        'sic' => ['9995', 100],
        'naics' => [112120, '1111A0'],
    }
})
```

### 2.3. Custom Data Fields

You can create **custom data types** and create **custom attributes** for any lead and company.

```ruby
Mass::DataType.upsert({
    'name' => 'alternative_email',
    'type' => :string,
    # validate the format of the values assigned
    'format' => '^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
})
```

You can setup `:integer` types too.

```ruby
Mass::DataType.upsert({
    'name' => 'number_of_locations',
    'type' => :integer,
    # validate the range of the value on each data record.
    'min_integer' => 0,
    'max_integer' => 10000,
})
```

You can setup `:float` types too.

```ruby
Mass::DataType.upsert({
    'name' => 'market_capitalization',
    'type' => :float,
    # validate the range of the value on each data record.
    'min_float' => 0.0,
    'max_float' => (500*1000*1000*1000).to_f,
})
```

Other types you can define are:

- `:boolean`, 
- `:date`, 
- `:time`, 
- `:text`

Assigning custom data to a lead is easy.

```ruby
Mass::Lead.upsert({
    'first_name' => 'Leandro',
    'email' => 'leandro@foo.com',
    'data' => [
        {'type' => 'alternative_email', 'value' => 'leandro@foo2.com'}
    ]
})
```

Assigning custom data to a company is similar.

```ruby
Mass::Company.upsert({
    'name' => 'VyMECO',
    'domain' => 'vymeco.com',
    'data' => [
        {'type' => 'number_of_locations', 'value' => 5},
        {'type' => 'market_capitalization', 'value' => 1000000000.0} # $1B :)
    ]
})
```

### 2.4. Industries

You can assign one or more industries to a company.

You can register an industry as follows:

```ruby
Mass::Industry.upsert({ 
    'name' => 'Financial Services', 
    'channel' => :linkedin,
})
```

Note that any industry is belonging a channel too. 
That makes sense when you scrape information from different sources (e.g.: LinkedIn, Apollo), and each source has its own list of values for such an attribute.

You can assign an industry to a company as follows:

```ruby
Mass::Company.upsert({
    'name' => 'VyMECO',
    'domain' => 'http://vymeco.com',
    'industry' => ['Financial Services'],
})
```

Note that you can assign more than one industry.

```ruby
Mass::Industry.upsert({ 
    'name' => 'Insurance', 
    'channel' => :linkedin,
})
```

```ruby
Mass::Company.upsert({
    'name' => 'VyMECO',
    'domain' => 'http://vymeco.com',
    'industry' => ['Financial Services', 'Insurance'],
})
```

### 2.5. Headcounts

You can register the headcounts managed by each differt channel.

```ruby
Mass::Headcount.upsert({ 
    'name' => '1 to 10 Employees', 
    'channel' => :linkedin,
    'min' => 1,
    'max' => 10
})
```

Then, you can assign a headcount to any company.

```ruby
Mass::Company.upsert({
    'name' => 'VyMECO',
    'domain' => 'http://vymeco.com',
    'headcount' => '1 to 10 Employees',
})
```

### 2.6. Revenues

You can register the headcounts managed by each differt channel.

```ruby
Mass::Revenue.upsert({ 
    'name' => 'From $1M to $10M per Year', 
    'channel' => :linkedin,
    'min' => 1000000,
    'max' => 10000000
})
```

Then, you can assign a headcount to any company.

```ruby
Mass::Company.upsert({
    'name' => 'VyMECO',
    'domain' => 'http://vymeco.com',
    'revenue' => 'From $1M to $10M per Year',
})
```

## 3. Profiles

A **profile** is the account to access **channel** (e.g.: a Facebook account) that you are using for 

- **scrape** leads or companies, 
- look for information to **enrich** existing leads or companies; or
- performing an **outreach** to existing leads or companies.

Profiles may **access** in 3 different ways:

- thru a **REST-API**,
- thru **IMAP/SMTP**; or
- using **RPA** to automatically operate the platform.

These 3 type of access are called `:api`, `:mta` and `:rpa` respectively.

### 3.1. API Profiles

First things first, you have to define a new profile type.

E.g.: We are going to access Apollo thru its API, so we are going to define such a type of profiles.

```ruby
Mass::ProfileType.upsert({
    'name' => 'Apollo',
    'channel' => :apollo,
    'access' => :api, # :rpa or :api or :mta
})
```

Note that you can also setup **default quotas** for all the profiles beloning to this type.

```ruby
Mass::ProfileType.upsert({
    'name' => 'Apollo',
    'channel' => :apollo,
    # :rpa or :api or :mta
    'access' => :api, 

    # default quotas for basic automations
    # Use a negative value to disable the functionality
    'default_check_inbox_interval' => 60,
    'default_check_connections_interval' => 60,
    # default quotas for scraping automations
    # Use a negative value to disable the functionality
    'default_jobs_interval' => 15,
    'default_max_daily_jobs' => 100,
    # default quotas for outreach automations
    # Use a negative value to disable the functionality    
    'default_outreach_interval' => 5,
    'default_max_daily_processed_outreaches' => 20,
    'default_max_daily_aborted_outreaches' => 50,
    # default quotas for enrichment automations
    # Use a negative value to disable the functionality    
    'default_enrichment_interval' => 5,
    'default_max_daily_processed_enrichments' => 20,
    'default_max_daily_aborted_enrichments' => 50,
})
```

Note:
- You have to define a class `Mass::Apollo` that inherits from `Mass::ProfileAPI`.
- You can find an example [here](/models/stub/api/apollo.rb).

After creating a profile type, you can create one **porfile** for each Apollo account you want to access thru its API.

```ruby
Mass::Profile.upsert({
    # Mandatory. A descriptive name of the profile.
    'name' => 'Leandro Sardi',
    'picture_url' => 'https://media.licdn.com/dms/image/D4D03AQFKseTSZnpIAg/profile-displayphoto-shrink_100_100/0/1697551355295?e=1722470400&v=beta&t=2NZ4wUN2Cd9uzOuY0nrhWZOukpP84s3FPRFHNwOAZOs',
    # Mandatory. A type of the profile. 
    'profile_type' => :Apollo,
    # Mandatory if the `:access` attribute of the profile type is `:api`.
    'api_key' => 'xxxx',
    # Optional. Assign the profile to with for a specific `tag`. Default: nil.
    'tag' => :testing,
    # Mandatory.
    'hostname' => 'dev2',
})
```

The new profile will setup its quotas using the default values defined in the profile type.
You can always define custom values for such quotas.

```ruby
Mass::Profile.upsert({
    # Mandatory. A descriptive name of the profile.
    'name' => 'Leandro Sardi',
    'picture_url' => 'https://media.licdn.com/dms/image/D4D03AQFKseTSZnpIAg/profile-displayphoto-shrink_100_100/0/1697551355295?e=1722470400&v=beta&t=2NZ4wUN2Cd9uzOuY0nrhWZOukpP84s3FPRFHNwOAZOs',
    # Mandatory. A type of the profile. 
    'profile_type' => :Apollo,
    # Mandatory if the `:access` attribute of the profile type is `:api`.
    'api_key' => 'xxxx',
    # Optional. Assign the profile to with for a specific `tag`. Default: nil.
    'tag' => :testing,
    # Mandatory.
    'hostname' => 'dev2',

    # Use a negative value to disable the functionality
    'check_inbox_interval' => 10,
    'check_connections_interval' => 20,
    # Use a negative value to disable the functionality
    'jobs_interval' => 15,
    'max_daily_jobs' => 100,
    # Use a negative value to disable the functionality    
    'outreach_interval' => -1,
    'max_daily_processed_outreaches' => 20,
    'max_daily_aborted_outreaches' => 50,
    # Use a negative value to disable the functionality    
    'enrichment_interval' => -1,
    'max_daily_processed_enrichments' => 20,
    'max_daily_aborted_enrichments' => 50,
})
```

### 3.2. MTA Profiles

Note that `channel` is not required for when `access` is `:mta`.

```ruby
Mass::ProfileType.upsert({
    'name' => 'GMail',
    'access' => :mta, # :rpa or :api or :mta
})
```

Note:
- you can define default parameters of IMAP/SMTP for all profiles belonging to this type.
- You have to define a class `Mass::Gmail` that inherits from `Mass::ProfileMTA`.
- You can find an example [here](/models/stub/mta/gmail.rb).

```ruby
Mass::ProfileType.upsert({
    'name' => 'GMail',
    'access' => :mta, # :rpa or :api or :mta

    # define default MTA parameters for the mta profile belonging to this type
    'default_smtp_address' => 'smtp.gmail.com',
    'default_smtp_port' => 25,
    'default_imap_port' => 993,	
    'default_imap_address' => 'imap.googlemail.com',
    'default_authentication' => :plain,
    'default_enable_starttls_auto' => true,
    'default_openssl_verify_mode' => :none,
    'default_inbox_label' => 'Inbox',
    'default_spam_label' => '[Gmail]/Spam',
    'default_search_all_wildcard' => '*', # '*' or 'ALL'
})
```

After creating a profile type, you can create one **porfile** for each Gmail account you want to access thru IMAP/SMTP.

```ruby
Mass::Profile.upsert({
    # Mandatory. A descriptive name of the profile.
    'name' => 'Leandro Sardi',
    'picture_url' => 'https://media.licdn.com/dms/image/D4D03AQFKseTSZnpIAg/profile-displayphoto-shrink_100_100/0/1697551355295?e=1722470400&v=beta&t=2NZ4wUN2Cd9uzOuY0nrhWZOukpP84s3FPRFHNwOAZOs',
    # Mandatory. A type of the profile. 
    'profile_type' => :GMail,
    # Optional. Assign the profile to with for a specific `tag`. Default: nil.
    'tag' => :testing,
    # Mandatory.
    'hostname' => 'dev2',
    # Connection parameters for profiles 
    'smtp_username' => 'blain@********.com',
    'smtp_password' => '**** **** **** ****',
    'imap_allowed' => true,
    'imap_username' => 'blain@********.com',
    'imap_password' => '**** **** **** ****',
})
```

### 3.3. RPA Profiles

Defining a `:rpa` profile type.

```ruby
Mass::ProfileType.upsert({
    'name' => 'LinkedIn',
    'access' => :rpa, # :rpa or :api or :mta
    'channel' => :linkedin,
})
```

After creating a profile type, you can create one **porfile** for each Gmail account you want to access LinkedIn.

```ruby
p = Mass::Profile.upsert({
    # Mandatory. A descriptive name of the profile.
    'name' => 'Taha Pansota',
    'picture_url' => 'https://media.licdn.com/dms/image/D4E03AQFsJoYIRyblHw/profile-displayphoto-shrink_100_100/0/1702804502056?e=1722470400&v=beta&t=rtvX3xpQvm8t6Js8uW1fsE-Vo1q7IOjVp-aWwTcL8nQ',
    # Mandatory. A type of the profile. 
    'profile_type' => :LinkedIn,
    # Optional. Assign the profile to with for a specific `tag`. Default: nil.
    'tag' => :testing,
    # Mandatory.
    'hostname' => 'dev2',
    # Connection parameters for profiles 
    'ads_power_id' => 'jg0pc5c',
    'state' => :idle,
})
```

Note: 

- the `:rpa` profiles have a `state` attribute to flag the profile as `:idle`, `:online`, `:starting`, `:stopping`, `:scraping_inbox`, `:scraping`, `:messaging`, `:scraping_connections`.
- You have to define a class `Mass::LinkedIn` that inherits from `Mass::ProfileRPA`.
- You can find an example [here](/models/stub/rpa/linkedin.rb).

Also, in the code above we are storing the profile in a variable `p` for a further reference.

To start the browser of a profile you have to create a **request**.

```ruby
r = Mass::Request.upsert({
    'id_profile' => p['id'],
    'state' => :online,
    'status' => :pending,
})
```

Notes:

- The browser will start in the **node** you specified in the `hostname` attribute (e.g.: `dev2`).

- In the same computer where the browser started, you can run a script to operate such a browser.
Example:

```ruby
p.driver.get('https://www.google.com')
```

- You can **download images** from the browser and upload them to your Dropbox:

```ruby
img = d.find_element(:xpath, '//img[contains(@class,"lnXdpd")]')
dropbox_folder = 'test'
url = p.driver.download_image(img, dropbox_folder)
```

- You can take **screenshots** and upload them to your dropbox:

```ruby
url = p.driver.screenshot(dropbox_folder)
```

And finally, 

- You can take a **snapshot** of the HTML of the page, and upload it to your Dropbox:

```ruby
url = p.driver.snapshot(dropbox_folder)
```

## 4. Scraping

### 4.1. LinkedInPublicFeed

Define a **scraping type** like this as follows.

```ruby
Mass::SourceType.upsert({
    'name' => 'LinkedInPublicFeed',
    'description' => 'Scraping Posts of People in LinkedIn. Sort the most recent ones. Filter by keywords and industries. More information: https://www.linkedin.com/help/linkedin/answer/a526104',
    'picture_url' => 'file://home/leandro/code/mass/extensions/mass.subaccount/public/mass.subaccount/images/source-type-lpf.png',
    'profile_type' => :LinkedIn,
    'available' => true,
    'paginable' => false,
})
```

Note:
- You have to define a class `Mass::LinkedInPublicFeed` that inherits from `Mass::SourceType`.

Then, create a new **source** of scraping:

```ruby
Mass::Source.upsert({
    'name' => '"new project" keyword - Contrucion industry',
    'source_type' => :LinkedInPublicFeed,
    'tag' => :testing,
    'active' => true,
    'urls' => [
        'https://www.linkedin.com/search/results/content/?authorIndustry=%5B%2248%22%5D&keywords=%22new%20project%22&origin=FACETED_SEARCH&sid=6dv&sortBy=%22date_posted%22',
    ],
    'interval' => 60, # every 60 minutes
})
```

Note:
- you can include one or more search URLs to scrape,
- you have to define how often this should should be scraped, depending on often new posts appear on its URLs. 

### 4.2. Facebook Public Feed

### 4.3. Facebook Groups Posts

### 4.4. Apollo Leads Search

### 4.5. LinkedIn Jobs

### 4.6. Indeed

### 4.7. Further Work

- Local Businesses (Targetron)
- Sales Navigator

- LinkedIn Events
- LinkedIn Event Attendees

- LinkedIn Seminars
- LinkedIn Seminar Reviews

- LinkedIn Groups
- LinkedIn Group Members

- Facebook Groups
- Faebook Group Members

## 5. Enrichment

integrations with reoon

## 5.1. Enrich Leads From LinkedIn Profiles 

## 5.2. Enrich Leads From LinkedIn Company Pages

## 5.3. Append CEOs of a Company with Apollo (API and BOT)

## 5.4. Append Emails from Name and Company Domain with Apollo (API and BOT)

## 5.5. Append Emails from LinkedIn URL with Apollo (API and BOT)

## 5.6. Email Verification

## 6. Outreach

spintax

## 6.1. LinkedIn Connection Requests

## 6.2. Scraping LinkedIn New Connections

## 6.3. Facebook Friend Requests

## 6.4. Scraping Facebook New Friends

## 6.5. LinkedIn Direct Messages

## 6.6. Scraping LinkedIn Inbox

## 6.7. Facebook Direct Messaging

## 6.8. Scraping Facebook Inbox

## 7. Rules

calendars

## 8. Imports

## 9. Costs Tracking

## 10. Timeline

## 11. Use Cases

Some use cases that are covered in this documentation:

- Scrape leads from LinkedIn public freed.
- Scrape companies from LinkedIn jobs board.
- Scrape companies from Indeed using Zyte API.
- Enrich a company by appending its CEO from the company page on LinkedIn.
- Enrich a company by appending its domain and headcount from the company page on LinkedIn too.
- Enrich a lead by looking for his email in Apollo, using the company domain as an input.
- Enrich a company with its customer support email and phone number by visiting its website.
- Send a connection request to a lead.
- Send a direct message to a lead who accepted the connection request 5 days ago.
- Send a second direct message to a lead who did not respond to the first one in the last 2 days.
- Send a cold email to a lead.
- Send a second cold email to a lead who did not respond to the first one in the last 2 days.
- Send a cold email to a company, to its customer support email.
- Send requests to join some Facebook groups (simulating a group as a company).
- Schedule a post in a Facebook group (simulating a group as a company).
- Schedule a post in the public feed of some profiles.

## 12. Disclaimers

The logo of MassProspecting has been taken from [here](https://www.freepik.com/icon/loud-speaker_9013493) and [here](https://www.freepik.com/icon/megaphone_12531829),

Landing pages have been purchased [here](https://elements.envato.com/ainext-ai-artificial-intelligence-react-template-KBMQ66S) and [here](https://demo.angelostudio.net/1e-shop/1.3/) and [here](https://elements.envato.com/braine-ai-artificial-intelligence-startup-html-5R8P5RK)