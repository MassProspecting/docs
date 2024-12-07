# Mass::Open

The `Mass::Open` class is responsible for managing interactions with the "open" representation in the MassProspecting system. This includes handling the relation of open events to outreach types, validating inputs, and ensuring correct ownership and foreign key constraints. Additionally, this class facilitates the conversion of its instances to hash representations, supports timeline summarization for reporting, and offers utilities for checking the first occurrence of open events.

## Insert

### Required Fields
- `id_outreach`: The identifier of the outreach related to this open event.

### Optional Fields
- `id_user`: The user ID associated with this operation.
- `create_time`, `update_time`, `delete_time`: Timestamps for record lifecycle management.

### Validations
- `id_outreach` should be associated with a known outreach within the account's scope.

### Allowed Values
No specific list of allowed values since `id_outreach` refers to database entries.

### Example
```json
{
  "id_outreach": "some-guid",
  "id_user": "user-guid"
}
```

## Page

### Required Fields
- None.

### Optional Fields
- `id_lead`: Filter by lead ID.
- `id_company`: Filter by company ID.
- `page`: Page number, defaults to 1.
- `limit`: Number of records per page, defaults to 25.
- `order`: Field to order by, defaults to `id`.
- `asc`: Boolean indicating ascending order, defaults to `true`.

### Validations
- `id_lead` and `id_company` require valid references within the account's data.

### Allowed Values
No specific pre-defined values; filters refer to related database entities.

### Example
```json
{
  "filters": {
    "id_lead": "lead-guid",
    "id_company": "company-guid"
  },
  "page": 1,
  "limit": 25,
  "order": "id",
  "asc": true
}
```

## Update

### Required Fields
- `id_outreach`: The identifier of the outreach related to this open event.

### Optional Fields
- `id_user`: The user ID related to the operation.
- `create_time`, `update_time`, `delete_time`: Timestamps for record lifecycle management.

### Validations
- `id_outreach` must reference a valid outreach, ensuring ownership within the current account.

### Allowed Values
No specific list of allowed values for the update; IDs are database-backed.

### Example
```json
{
  "id_outreach": "some-guid",
  "id_user": "user-guid"
}
``` 

Once you have reviewed the module's source codes, they reveal that validations include key permissions, ownership, and mandatory field checks, which are critical for the `Mass::Open` class operations such as inserting, updating, or paging through open events. The included and extended modules enhance the class with functionalities like error handling, timeline summaries, and serialization, ensuring robust data manipulation and validation across the SaaS platform.# Mass::Open

The `Mass::Open` class is responsible for managing interactions with the "open" representation in the MassProspecting system. This includes handling the relation of open events to outreach types, validating inputs, and ensuring correct ownership and foreign key constraints. Additionally, this class facilitates the conversion of its instances to hash representations, supports timeline summarization for reporting, and offers utilities for checking the first occurrence of open events.

## Insert

### Required Fields
- `id_outreach`: The identifier of the outreach related to this open event.

### Optional Fields
- `id_user`: The user ID associated with this operation.
- `create_time`, `update_time`, `delete_time`: Timestamps for record lifecycle management.

### Validations
- `id_outreach` should be associated with a known outreach within the account's scope.

### Allowed Values
No specific list of allowed values since `id_outreach` refers to database entries.

### Example
```json
{
  "id_outreach": "some-guid",
  "id_user": "user-guid"
}
```

## Page

### Required Fields
- None.

### Optional Fields
- `id_lead`: Filter by lead ID.
- `id_company`: Filter by company ID.
- `page`: Page number, defaults to 1.
- `limit`: Number of records per page, defaults to 25.
- `order`: Field to order by, defaults to `id`.
- `asc`: Boolean indicating ascending order, defaults to `true`.

### Validations
- `id_lead` and `id_company` require valid references within the account's data.

### Allowed Values
No specific pre-defined values; filters refer to related database entities.

### Example
```json
{
  "filters": {
    "id_lead": "lead-guid",
    "id_company": "company-guid"
  },
  "page": 1,
  "limit": 25,
  "order": "id",
  "asc": true
}
```

## Update

### Required Fields
- `id_outreach`: The identifier of the outreach related to this open event.

### Optional Fields
- `id_user`: The user ID related to the operation.
- `create_time`, `update_time`, `delete_time`: Timestamps for record lifecycle management.

### Validations
- `id_outreach` must reference a valid outreach, ensuring ownership within the current account.

### Allowed Values
No specific list of allowed values for the update; IDs are database-backed.

### Example
```json
{
  "id_outreach": "some-guid",
  "id_user": "user-guid"
}
``` 

Once you have reviewed the module's source codes, they reveal that validations include key permissions, ownership, and mandatory field checks, which are critical for the `Mass::Open` class operations such as inserting, updating, or paging through open events. The included and extended modules enhance the class with functionalities like error handling, timeline summaries, and serialization, ensuring robust data manipulation and validation across the SaaS platform.