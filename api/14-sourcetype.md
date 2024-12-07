# Mass::SourceType

The `Mass::SourceType` class is responsible for defining various types of data sources in the MassProspecting system. It includes operations for managing metadata about these sources, such as their profile type, pagination capabilities, and default settings for scrolling and downloading. This class ensures that source types are consistently handled across the application, providing essential functions to validate, insert, update, and manage source types effectively.

## Insert

### Required Fields
- `id_user`: The unique identifier of the user associated with the source type. Must be a valid GUID.
- `name`: Name of the source type. Must be a unique string with a maximum length of 255 characters.
- `profile_type`: The profile type associated with the source type. Allowed values: 
  - "Apollo_API", 
  - "Apollo_RPA", 
  - "Facebook", 
  - "FindyMail", 
  - "GMail", 
  - "Indeed", 
  - "LinkedIn", 
  - "Postmark", 
  - "Reoon", 
  - "Targetron_API", 
  - "Targetron_RPA", 
  - "ZeroBounce".

### Optional Fields
- `description`: A brief description of the source type.
- `picture_url`, `picture_url_dropbox`: URLs to images associated with the source type. Must be valid and reachable URLs.
- `paginable`: Boolean indicating if the source type supports pagination.
- `available`: Boolean indicating if the source type is currently available.
- `default_download_pictures`, `default_scrolling_step`, `default_scrolling_step_random`, `default_max_scrolls`, `default_max_scrolls_random`, `default_event_limit`, `default_delay_base`, `default_delay_random`: Various integer fields specifying default configurations for handling source data.
- `url_pattern`: A URL pattern for RPA profile types. 

### Validations 
- `name` must be unique per account.
- `url_pattern` is only allowed if the `profile_type` access is RPA.
- All integer fields must be between 0 and the maximum integer value.

### Example
```json
{
    "id_user": "123e4567-e89b-12d3-a456-426614174000",
    "name": "LinkedIn Source",
    "profile_type": "LinkedIn",
    "description": "A source type for LinkedIn data.",
    "picture_url": "http://example.com/picture.jpg",
    "paginable": true,
    "available": true,
    "default_download_pictures": true,
    "default_scrolling_step": 10,
    "default_scrolling_step_random": 5,
    "default_max_scrolls": 100,
    "default_max_scrolls_random": 10,
    "default_event_limit": 500,
    "default_delay_base": 1,
    "default_delay_random": 2
}
```

## Page

### Required Fields
- `page`: The page number to retrieve. Default is 1.
- `limit`: The number of records per page. Default is 25.

### Optional Fields
- `filters`: A dictionary for filtering source types. Possible keys include `profile_type`, `name`.
- `order`: The field to order the results by. Default is `id`.
- `asc`: Boolean indicating if the order should be ascending (true) or descending (false).

### Validations
- `profile_type` must match allowed values as mentioned in the Insert section.
- All filters must adhere to the constraints of the fields they represent.

### Example
```json
{
    "page": 1,
    "limit": 25,
    "filters": {
        "profile_type": "LinkedIn"
    },
    "order": "name",
    "asc": true
}
```

## Update

### Required Fields
- `id`: The unique identifier of the source type to update. Must be a valid GUID.

### Optional Fields
- All optional fields from the Insert action can be updated, adhering to the same validations.

### Validations 
- Ensure consistency and validity of updated data with the same rules as the Insert action.

### Example
```json
{
    "id": "123e4567-e89b-12d3-a456-426614174000",
    "name": "Updated LinkedIn Source",
    "available": false
}
```

Please follow the field requirements, allowed values, and validation rules carefully when working with the `Mass::SourceType` class via the API.# Mass::SourceType

The `Mass::SourceType` class is responsible for defining various types of data sources in the MassProspecting system. It includes operations for managing metadata about these sources, such as their profile type, pagination capabilities, and default settings for scrolling and downloading. This class ensures that source types are consistently handled across the application, providing essential functions to validate, insert, update, and manage source types effectively.

## Insert

### Required Fields
- `id_user`: The unique identifier of the user associated with the source type. Must be a valid GUID.
- `name`: Name of the source type. Must be a unique string with a maximum length of 255 characters.
- `profile_type`: The profile type associated with the source type. Allowed values: 
  - "Apollo_API", 
  - "Apollo_RPA", 
  - "Facebook", 
  - "FindyMail", 
  - "GMail", 
  - "Indeed", 
  - "LinkedIn", 
  - "Postmark", 
  - "Reoon", 
  - "Targetron_API", 
  - "Targetron_RPA", 
  - "ZeroBounce".

### Optional Fields
- `description`: A brief description of the source type.
- `picture_url`, `picture_url_dropbox`: URLs to images associated with the source type. Must be valid and reachable URLs.
- `paginable`: Boolean indicating if the source type supports pagination.
- `available`: Boolean indicating if the source type is currently available.
- `default_download_pictures`, `default_scrolling_step`, `default_scrolling_step_random`, `default_max_scrolls`, `default_max_scrolls_random`, `default_event_limit`, `default_delay_base`, `default_delay_random`: Various integer fields specifying default configurations for handling source data.
- `url_pattern`: A URL pattern for RPA profile types. 

### Validations 
- `name` must be unique per account.
- `url_pattern` is only allowed if the `profile_type` access is RPA.
- All integer fields must be between 0 and the maximum integer value.

### Example
```json
{
    "id_user": "123e4567-e89b-12d3-a456-426614174000",
    "name": "LinkedIn Source",
    "profile_type": "LinkedIn",
    "description": "A source type for LinkedIn data.",
    "picture_url": "http://example.com/picture.jpg",
    "paginable": true,
    "available": true,
    "default_download_pictures": true,
    "default_scrolling_step": 10,
    "default_scrolling_step_random": 5,
    "default_max_scrolls": 100,
    "default_max_scrolls_random": 10,
    "default_event_limit": 500,
    "default_delay_base": 1,
    "default_delay_random": 2
}
```

## Page

### Required Fields
- `page`: The page number to retrieve. Default is 1.
- `limit`: The number of records per page. Default is 25.

### Optional Fields
- `filters`: A dictionary for filtering source types. Possible keys include `profile_type`, `name`.
- `order`: The field to order the results by. Default is `id`.
- `asc`: Boolean indicating if the order should be ascending (true) or descending (false).

### Validations
- `profile_type` must match allowed values as mentioned in the Insert section.
- All filters must adhere to the constraints of the fields they represent.

### Example
```json
{
    "page": 1,
    "limit": 25,
    "filters": {
        "profile_type": "LinkedIn"
    },
    "order": "name",
    "asc": true
}
```

## Update

### Required Fields
- `id`: The unique identifier of the source type to update. Must be a valid GUID.

### Optional Fields
- All optional fields from the Insert action can be updated, adhering to the same validations.

### Validations 
- Ensure consistency and validity of updated data with the same rules as the Insert action.

### Example
```json
{
    "id": "123e4567-e89b-12d3-a456-426614174000",
    "name": "Updated LinkedIn Source",
    "available": false
}
```

Please follow the field requirements, allowed values, and validation rules carefully when working with the `Mass::SourceType` class via the API.