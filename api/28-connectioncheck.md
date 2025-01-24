# Mass::ConnectionCheck

The `Mass::ConnectionCheck` class is part of the MassProspecting SaaS application, designed to manage and verify the connectivity status of user profiles. It includes functionalities for performing status checks, detailing any errors during the process, and saving these results with optional screenshot and snapshot evidence. The class supports various operations like insertion, updates, querying, and filtering of connection check records.

## Insert

### Required Fields
- **status**: Must be a symbol or string, representing the status of the connection check. Allowed values are: `:pending`, `:running`, `:performed`, `:failed`, `:aborted`, `:canceled`.
- **id_profile**: Must be a GUID, representing the profile being checked.

### Optional Fields
- **error_description**: A string describing any errors encountered during the connection check.
- **screenshot_url**: A valid URL string pointing to a screenshot image of the check.
- **snapshot_url**: A valid URL string pointing to a snapshot of the profile at the time of the check.

### Validations
- **id_profile** must be a valid GUID and exist within the same account (excluding deleted profiles).
- URLs for **screenshot_url** and **snapshot_url** must be valid and reachable.
- **status** must be one of the allowed values.

### Example
```json
{
  "status": "pending",
  "id_profile": "123e4567-e89b-12d3-a456-426614174000",
  "error_description": "No error",
  "screenshot_url": "http://example.com/screenshot.png",
  "snapshot_url": "http://example.com/snapshot.png"
}
```

## Page

### Required Fields
- **page**: Integer specifying the current page number.
- **limit**: Integer specifying the number of records per page.
- **filters**: A set of filters used to refine the search results.

### Optional Fields
- **order**: String specifying the field to order by. Defaults to `id`.
- **asc**: Boolean indicating whether the sort order should be ascending. Defaults to true.

### Validations
- Filter keys must be within the allowed set: `id_profile` and `status`.
- **id_profile** in filters must be a valid account profile.
- **status** in filters must be one of the allowed status values.

### Example
```json
{
  "page": 1,
  "limit": 25,
  "filters": {
    "status": "running"
  },
  "order": "create_time",
  "asc": true
}
```

## Update

### Required Fields
- **id**: The unique identifier (GUID) of the connection check record to update.
- **status**: Must be a symbol or string. Allowed values are: `:pending`, `:running`, `:performed`, `:failed`, `:aborted`, `:canceled`.

### Optional Fields
- **id_profile**: GUID representing the profile being checked.
- **error_description**: A string describing any errors encountered during the connection check.
- **screenshot_url**: A valid URL string pointing to a screenshot image of the check.
- **snapshot_url**: A valid URL string pointing to a snapshot of the profile at the time of the check.

### Validations
- **id** must be a valid GUID of an existing connection check.
- **id_profile** must be a valid GUID and exist within the same account.
- URLs for **screenshot_url** and **snapshot_url** must be valid and reachable.
- **status** must be one of the allowed values.

### Example
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "status": "performed",
  "error_description": "Completed with minor warnings",
  "screenshot_url": "http://example.com/updated_screenshot.png",
  "snapshot_url": "http://example.com/updated_snapshot.png"
}
```# Mass::ConnectionCheck

The `Mass::ConnectionCheck` class is part of the MassProspecting SaaS application, designed to manage and verify the connectivity status of user profiles. It includes functionalities for performing status checks, detailing any errors during the process, and saving these results with optional screenshot and snapshot evidence. The class supports various operations like insertion, updates, querying, and filtering of connection check records.

## Insert

### Required Fields
- **status**: Must be a symbol or string, representing the status of the connection check. Allowed values are: `:pending`, `:running`, `:performed`, `:failed`, `:aborted`, `:canceled`.
- **id_profile**: Must be a GUID, representing the profile being checked.

### Optional Fields
- **error_description**: A string describing any errors encountered during the connection check.
- **screenshot_url**: A valid URL string pointing to a screenshot image of the check.
- **snapshot_url**: A valid URL string pointing to a snapshot of the profile at the time of the check.

### Validations
- **id_profile** must be a valid GUID and exist within the same account (excluding deleted profiles).
- URLs for **screenshot_url** and **snapshot_url** must be valid and reachable.
- **status** must be one of the allowed values.

### Example
```json
{
  "status": "pending",
  "id_profile": "123e4567-e89b-12d3-a456-426614174000",
  "error_description": "No error",
  "screenshot_url": "http://example.com/screenshot.png",
  "snapshot_url": "http://example.com/snapshot.png"
}
```

## Page

### Required Fields
- **page**: Integer specifying the current page number.
- **limit**: Integer specifying the number of records per page.
- **filters**: A set of filters used to refine the search results.

### Optional Fields
- **order**: String specifying the field to order by. Defaults to `id`.
- **asc**: Boolean indicating whether the sort order should be ascending. Defaults to true.

### Validations
- Filter keys must be within the allowed set: `id_profile` and `status`.
- **id_profile** in filters must be a valid account profile.
- **status** in filters must be one of the allowed status values.

### Example
```json
{
  "page": 1,
  "limit": 25,
  "filters": {
    "status": "running"
  },
  "order": "create_time",
  "asc": true
}
```

## Update

### Required Fields
- **id**: The unique identifier (GUID) of the connection check record to update.
- **status**: Must be a symbol or string. Allowed values are: `:pending`, `:running`, `:performed`, `:failed`, `:aborted`, `:canceled`.

### Optional Fields
- **id_profile**: GUID representing the profile being checked.
- **error_description**: A string describing any errors encountered during the connection check.
- **screenshot_url**: A valid URL string pointing to a screenshot image of the check.
- **snapshot_url**: A valid URL string pointing to a snapshot of the profile at the time of the check.

### Validations
- **id** must be a valid GUID of an existing connection check.
- **id_profile** must be a valid GUID and exist within the same account.
- URLs for **screenshot_url** and **snapshot_url** must be valid and reachable.
- **status** must be one of the allowed values.

### Example
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "status": "performed",
  "error_description": "Completed with minor warnings",
  "screenshot_url": "http://example.com/updated_screenshot.png",
  "snapshot_url": "http://example.com/updated_snapshot.png"
}
```