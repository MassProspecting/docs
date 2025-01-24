# Mass::Rule

The `Mass::Rule` class represents a set of conditions that apply specific actions when triggers are activated, such as performing an outreach or handling a tag addition in the MassProspecting platform. Rules automate various tasks based on specified criteria, including filtering and timing options.

## Insert
### Required Fields
- `active`: Boolean
- `trigger`: Hash
- `action`: Hash
- `filter_enabled`: Boolean
- `delay_enabled`: Boolean

### Optional Fields
- `name`: String
- `delay_number`: Integer (min: 0)
- `delay_unit`: Symbol (one of `:minutes`, `:hours`, `:days`, `:weeks`, `:months`)
- `apply_to_previous_events`: Boolean
- `filter`: Hash

### Validations
- **String fields**: `name` must be a string and less than 255 characters. 
- **Boolean Fields**: `active`, `apply_to_previous_events`, `filter_enabled`, and `delay_enabled` must be booleans.
- **Delay**: If `delay_enabled` is true, both `delay_number` and `delay_unit` must be provided, and `delay_unit` must be one of the allowed symbols.
- **Trigger**: `trigger` must be a hash.
- **Filter**: If `filter_enabled` is true, `filter` is required.

### Examples
```json
{
  "name": "Sample Rule",
  "active": true,
  "delay_number": 5,
  "delay_unit": "days",
  "trigger": {
    "name": "Event Trigger",
    "type": "event_created"
  },
  "action": {
    "name": "New Outreach",
    "type": "new_outreach"
  },
  "filter_enabled": false,
  "delay_enabled": true,
  "apply_to_previous_events": false
}
```

## Page
### Required Fields
None specified explicitly for pagination, but filter criteria are optional.

### Optional Fields
- `page`: Integer (default is 1)
- `limit`: Integer (default is 25)
- `filters`: Hash
- `order`: String (default is 'id')
- `asc`: Boolean (default is true)

### Validations
- `page` and `limit` should be integers.
- `order` should be a valid column name but generally handled internally.
- `asc` should be a boolean to determine sort order.

### Examples
For fetching paginated rules:
```json
{
  "page": 1,
  "limit": 10,
  "order": "create_time",
  "asc": false,
  "filters": {
    "active": true
  }
}
```

## Update
### Required Fields
- `id`: GUID
- Must adhere to the validations and comply with existing record ownership.

### Optional Fields
All fields applicable in `Insert` can be updated including optional fields.

### Validations
- **Ownership Validation**: Ensure the `id_account` and `id_user` are valid and match the account accessing the API.
- **Consistency**: Ensure update data is consistent with existing validations of data types and mandatory requirements.

### Examples
Updating a rule with new parameters:
```json
{
  "id": "e3b0c442-98fc-1c149afbf4c8996fb92427ae41e4a8f1",
  "name": "Updated Rule Name",
  "active": false,
  "delay_number": 10,
  "delay_unit": "weeks",
  "apply_to_previous_events": true
}
```
# Mass::Rule

The `Mass::Rule` class represents a set of conditions that apply specific actions when triggers are activated, such as performing an outreach or handling a tag addition in the MassProspecting platform. Rules automate various tasks based on specified criteria, including filtering and timing options.

## Insert
### Required Fields
- `active`: Boolean
- `trigger`: Hash
- `action`: Hash
- `filter_enabled`: Boolean
- `delay_enabled`: Boolean

### Optional Fields
- `name`: String
- `delay_number`: Integer (min: 0)
- `delay_unit`: Symbol (one of `:minutes`, `:hours`, `:days`, `:weeks`, `:months`)
- `apply_to_previous_events`: Boolean
- `filter`: Hash

### Validations
- **String fields**: `name` must be a string and less than 255 characters. 
- **Boolean Fields**: `active`, `apply_to_previous_events`, `filter_enabled`, and `delay_enabled` must be booleans.
- **Delay**: If `delay_enabled` is true, both `delay_number` and `delay_unit` must be provided, and `delay_unit` must be one of the allowed symbols.
- **Trigger**: `trigger` must be a hash.
- **Filter**: If `filter_enabled` is true, `filter` is required.

### Examples
```json
{
  "name": "Sample Rule",
  "active": true,
  "delay_number": 5,
  "delay_unit": "days",
  "trigger": {
    "name": "Event Trigger",
    "type": "event_created"
  },
  "action": {
    "name": "New Outreach",
    "type": "new_outreach"
  },
  "filter_enabled": false,
  "delay_enabled": true,
  "apply_to_previous_events": false
}
```

## Page
### Required Fields
None specified explicitly for pagination, but filter criteria are optional.

### Optional Fields
- `page`: Integer (default is 1)
- `limit`: Integer (default is 25)
- `filters`: Hash
- `order`: String (default is 'id')
- `asc`: Boolean (default is true)

### Validations
- `page` and `limit` should be integers.
- `order` should be a valid column name but generally handled internally.
- `asc` should be a boolean to determine sort order.

### Examples
For fetching paginated rules:
```json
{
  "page": 1,
  "limit": 10,
  "order": "create_time",
  "asc": false,
  "filters": {
    "active": true
  }
}
```

## Update
### Required Fields
- `id`: GUID
- Must adhere to the validations and comply with existing record ownership.

### Optional Fields
All fields applicable in `Insert` can be updated including optional fields.

### Validations
- **Ownership Validation**: Ensure the `id_account` and `id_user` are valid and match the account accessing the API.
- **Consistency**: Ensure update data is consistent with existing validations of data types and mandatory requirements.

### Examples
Updating a rule with new parameters:
```json
{
  "id": "e3b0c442-98fc-1c149afbf4c8996fb92427ae41e4a8f1",
  "name": "Updated Rule Name",
  "active": false,
  "delay_number": 10,
  "delay_unit": "weeks",
  "apply_to_previous_events": true
}
```
