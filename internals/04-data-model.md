# Data Model

Before start learning the internal **data model** of MassProspecting, I recommend you to understand the **use cases** by reading and playing around with the [user documentation](../README.md#user-documentation).

## Getting Started

Run this query in your terminal and understnad it:

```sql
select 
	ot.name as outreach_type_name, 
	pt.name as profile_type_required,
	pt.access, -- How this profile_type operates: API, MTA or RPA (RPA involves Browser Automation)
	-- profile name
	p.name, 
	-- lead name
	l.first_name,
	l.last_name,
	-- if the message has been deliverd or not
	o.status, -- pending, performed, failed, aborted, canceled
	o.done_time, 
	o.error_description,
	
	-- rule delay - wait until this date-time to deliver the message
	i.start_time,
	
	-- rule instance is an internal request to create the outreach by the rule
	i.status, -- the rule_instance must to be processed and it may fail - status: pending, performed, failed, aborted, canceled
	i.done_time, 
	i.error_description,
	
	-- message to deliver
	o.body
from outreach o
join outreach_type ot on ot.id=o.id_outreach_type -- type of outreach - Example: LinkedIn_ConnectionRequest, LinkedIn_DirectMessage
join profile_type pt on pt.id=ot.id_profile_type -- type of profile required for this outreach type - Example: LinkedIn, Facebook, GMail

join "profile" p on p.id=o.id_profile -- profile assinged for executing this outreach - it must be belonging to the same profile_type requred by the outreach
join "lead" l on l.id=o.id_lead -- lead to deliver this outreach

-- rule that generated this outreach
join "rule_instance" i on i.id=o.id_rule_instance
join "action" a on a.id=i.id_action -- a rule is composed by a trigger, filter and action.
join "rule" r on a.id=r.id_action

where o.direction = 0 -- outgoing messages
```
