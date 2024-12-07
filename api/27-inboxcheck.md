# Mass::InboxCheck

Mass::InboxCheck is a component of the MassProspecting system responsible for managing the status and operational details of inbox checks. This class facilitates the handling, updating, and storage of data related to various inbox verification tasks tied to user profiles. It ensures data integrity through extensive validation checks on provided attributes, supporting various states like pending, running, performed, failed, etc.

## Insert

### Required Fields
- `id_profile`: Must be a GUID representing a valid profile associated with the account. Needs to already exist in the database.
- `status`: Must be a symbol or string. Allowed values are :pending, :running, :performed, :failed, :aborted, :canceled.

### Optional Fields
- `only_unread`: A boolean indicating if only unread messages should be considered.
- `error_description`: A string giving a detailed description of any errors encountered.
- `screenshot_url`: A valid URL pointing to a screenshot location.
- `snapshot_url`: A valid URL pointing to a snapshot location.

### Validations
- `id_profile`: Must be a valid GUID and correspond to an existing profile.
- `status`: Must be a symbol or string with allowed values.
- `only_unread`: Must be a boolean.
- `error_description`: Must be a string if provided.
- `screenshot_url` and `snapshot_url`: Must be valid and reachable URLs if provided.

### Example
```json
{
  "id_profile": "123e4567-e89b-12d3-a456-426614174000",
  "status": "pending",
  "only_unread": true,
  "screenshot_url": "https://example.com/screenshot.png",
  "snapshot_url": "https://example.com/snapshot.png"
}
```

## Page

### Required Fields
- `page`: The page number for pagination. Default is 1.
- `limit`: The number of results per page. Default is 25.

### Optional Fields
- `filters`: A JSON object to apply specific filters like `id_profile` and `status`.
- `order`: The attribute by which the results should be ordered. Defaults to 'id'.
- `asc`: A boolean indicating whether the sorting should be ascending. Defaults to true.

### Validations
- `filters`: Validate `id_profile` as a valid GUID and `status` as per allowed values.
- If a filter by `id_profile` is set, the profile must belong to the account.

### Example
```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "id_profile": "123e4567-e89b-12d3-a456-426614174000",
    "status": "running"
  },
  "order": "create_time",
  "asc": false
}
```

## Update

### Required Fields
- `id`: The GUID of the record to be updated.
- `id_profile`: Must be a valid GUID in the database associated with the account.

### Optional Fields
- `status`: Must be a symbol or string. Allowed values are :pending, :running, :performed, :failed, :aborted, :canceled.
- `only_unread`: A boolean.
- `error_description`: A string.
- `screenshot_url`: A valid URL.
- `snapshot_url`: A valid URL.

### Validations
- `id`: Must be a valid GUID and correspond to an existing record.
- `status`: Must be a symbol or string with allowed values.
- `only_unread`: Must be a boolean.
- `error_description`: Must be a string if provided.
- `screenshot_url` and `snapshot_url`: Must be valid and reachable URLs if provided.

### Example
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "id_profile": "123e4567-e89b-12d3-a456-426614174000",
  "status": "performed",
  "only_unread": false,
  "error_description": "An expected error occurred during processing.",
  "screenshot_url": "https://example.com/new-screenshot.png"
}
```# Mass::InboxCheck

Mass::InboxCheck is a component of the MassProspecting system responsible for managing the status and operational details of inbox checks. This class facilitates the handling, updating, and storage of data related to various inbox verification tasks tied to user profiles. It ensures data integrity through extensive validation checks on provided attributes, supporting various states like pending, running, performed, failed, etc.

## Insert

### Required Fields
- `id_profile`: Must be a GUID representing a valid profile associated with the account. Needs to already exist in the database.
- `status`: Must be a symbol or string. Allowed values are :pending, :running, :performed, :failed, :aborted, :canceled.

### Optional Fields
- `only_unread`: A boolean indicating if only unread messages should be considered.
- `error_description`: A string giving a detailed description of any errors encountered.
- `screenshot_url`: A valid URL pointing to a screenshot location.
- `snapshot_url`: A valid URL pointing to a snapshot location.

### Validations
- `id_profile`: Must be a valid GUID and correspond to an existing profile.
- `status`: Must be a symbol or string with allowed values.
- `only_unread`: Must be a boolean.
- `error_description`: Must be a string if provided.
- `screenshot_url` and `snapshot_url`: Must be valid and reachable URLs if provided.

### Example
```json
{
  "id_profile": "123e4567-e89b-12d3-a456-426614174000",
  "status": "pending",
  "only_unread": true,
  "screenshot_url": "https://example.com/screenshot.png",
  "snapshot_url": "https://example.com/snapshot.png"
}
```

## Page

### Required Fields
- `page`: The page number for pagination. Default is 1.
- `limit`: The number of results per page. Default is 25.

### Optional Fields
- `filters`: A JSON object to apply specific filters like `id_profile` and `status`.
- `order`: The attribute by which the results should be ordered. Defaults to 'id'.
- `asc`: A boolean indicating whether the sorting should be ascending. Defaults to true.

### Validations
- `filters`: Validate `id_profile` as a valid GUID and `status` as per allowed values.
- If a filter by `id_profile` is set, the profile must belong to the account.

### Example
```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "id_profile": "123e4567-e89b-12d3-a456-426614174000",
    "status": "running"
  },
  "order": "create_time",
  "asc": false
}
```

## Update

### Required Fields
- `id`: The GUID of the record to be updated.
- `id_profile`: Must be a valid GUID in the database associated with the account.

### Optional Fields
- `status`: Must be a symbol or string. Allowed values are :pending, :running, :performed, :failed, :aborted, :canceled.
- `only_unread`: A boolean.
- `error_description`: A string.
- `screenshot_url`: A valid URL.
- `snapshot_url`: A valid URL.

### Validations
- `id`: Must be a valid GUID and correspond to an existing record.
- `status`: Must be a symbol or string with allowed values.
- `only_unread`: Must be a boolean.
- `error_description`: Must be a string if provided.
- `screenshot_url` and `snapshot_url`: Must be valid and reachable URLs if provided.

### Example
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "id_profile": "123e4567-e89b-12d3-a456-426614174000",
  "status": "performed",
  "only_unread": false,
  "error_description": "An expected error occurred during processing.",
  "screenshot_url": "https://example.com/new-screenshot.png"
}
```