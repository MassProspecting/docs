# Mass::Job

Mass::Job is a class responsible for managing jobs related to source processing and data enrichment within the MassProspecting SaaS platform. It supports functionality for job assignment, planning, cancellation, reactivation, and unassignment. The class includes mechanisms for error handling, validation, and detailed status management.

## Insert

### Required Fields
- **status**: A symbol or string indicating the job status. Allowed values: `:pending`, `:running`, `:performed`, `:failed`, `:aborted`, `:canceled`.
- **source**: A symbol or string representing the source name. The source must exist.
- **url**: A valid URL string associated with the job.

### Optional Fields
- **screenshots**: An array of valid URL strings representing screenshots.
- **snapshot_url**: A valid URL string of the snapshot.
- **error_description**: A string describing any errors encountered.
- **events**: An array of events linked to the job.
- **paginable**: A boolean indicating if the job is paginable.
- **profile**: A linked profile (not directly inserted, optional reference check).
- **source_desc**: Description of the source (derived during insert).
- **source_type_desc**: Description of the source type (derived during insert).
- **id_job_parent**: Reference ID of the parent job, must exist if provided.

### Validations
- **GUID Validation**: `id` and `id_account` must be valid GUIDs.
- **URL Validation**: Ensures `url`, `screenshot`, and `snapshot_url` are valid URLs.
- **Ownership Validation**: Ensures `id_account` exists and belongs to a user if `id_user` is provided.

### Example
```json
{
  "status": "pending",
  "source": "Apollo",
  "url": "http://example.com/job",
  "screenshots": ["http://example.com/screenshot1.png"],
  "error_description": "Sample error",
  "paginable": true
}
```

## Page

### Required Fields
- **page**: Page number to retrieve (e.g., 1 for the first page).

### Optional Fields
- **limit**: Number of records per page (default: 25).
- **filters**: Criteria including `id_source`, `id_profile`, `status`, or `basic`.
  
### Validations
- **GUID Validation**: Ensure appropriate use of GUIDs in filters.
- **Filter Validation**: Allowed filters must be within the set limits and known set values such as `status`.

### Example
```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "status": "pending"
  },
  "order": "create_time",
  "asc": true
}
```

## Update

### Required Fields
- **id**: The unique identifier of the job to update.

### Optional Fields
- **status**: A symbol or string indicating the updated job status.
- **url**: Updated URL for the job.
- **error_description**: Updated error description.
- **snapshot_url**: Updated snapshot URL.
- **paginable**: Updated boolean for paginable status.
- **screenshots**: Updated array of screenshot URLs.

### Validations
- **GUID Validation**: `id` must be a valid GUID.
- **URL Validation**: Ensures updated URLs are valid.
- **Status Validation**: Status must be one of the predefined allowed values.

### Example
```json
{
  "id": "1d0f9d3e-5362-44d9-9275-2254ebf7405c",
  "status": "running",
  "error_description": "New error update",
  "screenshots": ["http://example.com/new_screenshot1.png"]
}
```# Mass::Job

Mass::Job is a class responsible for managing jobs related to source processing and data enrichment within the MassProspecting SaaS platform. It supports functionality for job assignment, planning, cancellation, reactivation, and unassignment. The class includes mechanisms for error handling, validation, and detailed status management.

## Insert

### Required Fields
- **status**: A symbol or string indicating the job status. Allowed values: `:pending`, `:running`, `:performed`, `:failed`, `:aborted`, `:canceled`.
- **source**: A symbol or string representing the source name. The source must exist.
- **url**: A valid URL string associated with the job.

### Optional Fields
- **screenshots**: An array of valid URL strings representing screenshots.
- **snapshot_url**: A valid URL string of the snapshot.
- **error_description**: A string describing any errors encountered.
- **events**: An array of events linked to the job.
- **paginable**: A boolean indicating if the job is paginable.
- **profile**: A linked profile (not directly inserted, optional reference check).
- **source_desc**: Description of the source (derived during insert).
- **source_type_desc**: Description of the source type (derived during insert).
- **id_job_parent**: Reference ID of the parent job, must exist if provided.

### Validations
- **GUID Validation**: `id` and `id_account` must be valid GUIDs.
- **URL Validation**: Ensures `url`, `screenshot`, and `snapshot_url` are valid URLs.
- **Ownership Validation**: Ensures `id_account` exists and belongs to a user if `id_user` is provided.

### Example
```json
{
  "status": "pending",
  "source": "Apollo",
  "url": "http://example.com/job",
  "screenshots": ["http://example.com/screenshot1.png"],
  "error_description": "Sample error",
  "paginable": true
}
```

## Page

### Required Fields
- **page**: Page number to retrieve (e.g., 1 for the first page).

### Optional Fields
- **limit**: Number of records per page (default: 25).
- **filters**: Criteria including `id_source`, `id_profile`, `status`, or `basic`.
  
### Validations
- **GUID Validation**: Ensure appropriate use of GUIDs in filters.
- **Filter Validation**: Allowed filters must be within the set limits and known set values such as `status`.

### Example
```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "status": "pending"
  },
  "order": "create_time",
  "asc": true
}
```

## Update

### Required Fields
- **id**: The unique identifier of the job to update.

### Optional Fields
- **status**: A symbol or string indicating the updated job status.
- **url**: Updated URL for the job.
- **error_description**: Updated error description.
- **snapshot_url**: Updated snapshot URL.
- **paginable**: Updated boolean for paginable status.
- **screenshots**: Updated array of screenshot URLs.

### Validations
- **GUID Validation**: `id` must be a valid GUID.
- **URL Validation**: Ensures updated URLs are valid.
- **Status Validation**: Status must be one of the predefined allowed values.

### Example
```json
{
  "id": "1d0f9d3e-5362-44d9-9275-2254ebf7405c",
  "status": "running",
  "error_description": "New error update",
  "screenshots": ["http://example.com/new_screenshot1.png"]
}
```