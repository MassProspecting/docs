# Mass::Request

The `Mass::Request` class is used to manage requests within the MassProspecting system, serving as a mechanism to handle various operational states and statuses. It defines the schema for managing user and profile requests in the system, allowing them to be inserted, queried, updated, and managed programmatically through the API.

## Insert

To insert a new request into MassProspecting, you must provide the required fields, which includes defining the state of the request, and optionally, you can specify its status and error descriptions.

### Required Fields
- `id_profile`: The unique identifier of the profile related to the request. This field is mandatory.
- `state`: Represents the current state of the request. This field is mandatory.

### Optional Fields
- `id_user`: The unique identifier of the user related to the request.
- `status`: The current status of the request.
- `error_description`: A description of any error that has occurred.
- `profile`: Additional profile data if necessary.

### Validations
- `state` must be one of the allowed states: `:idle`, `:online`, `:starting`, `:stopping`, `:scraping_inbox`, `:scraping_connections`, `:scraping`, `:enrichment`, `:outreach`.
- `status` must be one of the allowed statuses: `:pending`, `:running`, `:performed`, `:failed`, `:aborted`, `:canceled`.

### Example
```json
{
  "id_profile": "1234-5678-abcd-efgh",
  "state": "idle",
  "status": "pending",
  "error_description": "No error",
  "profile": { "name": "Example Profile" }
}
```

## Page

To retrieve a paginated list of requests, you can specify filters and ordering options for more granular control over the data retrieval.

### Required Fields
- `page`: The specific page number of results to retrieve. Defaults to 1 if not provided.
- `limit`: The number of records to retrieve per page. Defaults to 25 if not provided.

### Optional Fields
- `filters`: A JSON object containing filter criteria by which to narrow results.
- `order`: The field by which to order results. Defaults to `id`.
- `asc`: A boolean indicating if the order should be ascending. Defaults to `true`.

### Validations
- `filters` can contain: `id_profile`, `state`, or `status`.
- Allowed values for `state` remain: `:idle`, `:online`, `:starting`, `:stopping`, `:scraping_inbox`, `:scraping_connections`, `:scraping`, `:enrichment`, `:outreach`.
- Allowed values for `status` remain: `:pending`, `:running`, `:performed`, `:failed`, `:aborted`, `:canceled`.

### Example
```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "state": "idle",
    "status": "pending"
  },
  "order": "create_time",
  "asc": true
}
```

## Update

To update an existing request, you must specify the unique identifier and the changes you wish to apply. 

### Required Fields
- `id`: The unique identifier of the request to be updated.

### Optional Fields
- `id_profile`: Updated unique identifier of the profile.
- `state`: Updated state of the request.
- `status`: Updated status of the request.
- `error_description`: Updated error description.

### Validations
- Fields and validations are the same as for insertion.
- The `state` must comply with the allowed states, and `status` with the allowed statuses as listed under Insert.

### Example
```json
{
  "id": "1234-5678-abcd-efgh",
  "state": "online",
  "status": "running",
  "error_description": "Process initiated."
}
```# Mass::Request

The `Mass::Request` class is used to manage requests within the MassProspecting system, serving as a mechanism to handle various operational states and statuses. It defines the schema for managing user and profile requests in the system, allowing them to be inserted, queried, updated, and managed programmatically through the API.

## Insert

To insert a new request into MassProspecting, you must provide the required fields, which includes defining the state of the request, and optionally, you can specify its status and error descriptions.

### Required Fields
- `id_profile`: The unique identifier of the profile related to the request. This field is mandatory.
- `state`: Represents the current state of the request. This field is mandatory.

### Optional Fields
- `id_user`: The unique identifier of the user related to the request.
- `status`: The current status of the request.
- `error_description`: A description of any error that has occurred.
- `profile`: Additional profile data if necessary.

### Validations
- `state` must be one of the allowed states: `:idle`, `:online`, `:starting`, `:stopping`, `:scraping_inbox`, `:scraping_connections`, `:scraping`, `:enrichment`, `:outreach`.
- `status` must be one of the allowed statuses: `:pending`, `:running`, `:performed`, `:failed`, `:aborted`, `:canceled`.

### Example
```json
{
  "id_profile": "1234-5678-abcd-efgh",
  "state": "idle",
  "status": "pending",
  "error_description": "No error",
  "profile": { "name": "Example Profile" }
}
```

## Page

To retrieve a paginated list of requests, you can specify filters and ordering options for more granular control over the data retrieval.

### Required Fields
- `page`: The specific page number of results to retrieve. Defaults to 1 if not provided.
- `limit`: The number of records to retrieve per page. Defaults to 25 if not provided.

### Optional Fields
- `filters`: A JSON object containing filter criteria by which to narrow results.
- `order`: The field by which to order results. Defaults to `id`.
- `asc`: A boolean indicating if the order should be ascending. Defaults to `true`.

### Validations
- `filters` can contain: `id_profile`, `state`, or `status`.
- Allowed values for `state` remain: `:idle`, `:online`, `:starting`, `:stopping`, `:scraping_inbox`, `:scraping_connections`, `:scraping`, `:enrichment`, `:outreach`.
- Allowed values for `status` remain: `:pending`, `:running`, `:performed`, `:failed`, `:aborted`, `:canceled`.

### Example
```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "state": "idle",
    "status": "pending"
  },
  "order": "create_time",
  "asc": true
}
```

## Update

To update an existing request, you must specify the unique identifier and the changes you wish to apply. 

### Required Fields
- `id`: The unique identifier of the request to be updated.

### Optional Fields
- `id_profile`: Updated unique identifier of the profile.
- `state`: Updated state of the request.
- `status`: Updated status of the request.
- `error_description`: Updated error description.

### Validations
- Fields and validations are the same as for insertion.
- The `state` must comply with the allowed states, and `status` with the allowed statuses as listed under Insert.

### Example
```json
{
  "id": "1234-5678-abcd-efgh",
  "state": "online",
  "status": "running",
  "error_description": "Process initiated."
}
```