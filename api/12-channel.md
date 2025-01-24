# Mass::Channel

The `Mass::Channel` class manages the channels within MassProspecting. It is responsible for channel creation, retrieval, updating, and validation. Each channel has associated attributes such as name, avatar URLs, and color codes. The class supports features like URL validation and color management based on a defined palette.

## 1. Insert

### Required Fields
- **name**: The name of the channel. It should be a string and must be less than 255 characters.
- **id_user**: The ID of the user creating the channel, must be a valid GUID.
  
### Optional Fields
- **avatar_url**: An optional string field that should be a valid and reachable URL.
- **avatar_url_dropbox**: Although the URL itself is optional, if provided, it must be reachable.
- **color_code**: An optional string or symbol representing the color name. The color must be a valid key from the palette.

### Validations
- All fields except `avatar_url`, `avatar_url_dropbox`, and `color_code` are mandatory.
- `name` should be a string with a maximum of 255 characters.
- `id_user` should be a valid GUID.
- `avatar_url` and `avatar_url_dropbox` should be valid URLs.
- `color_code`, if provided, must match a key within the defined palette in `BlackStack::Palette`.

### Allowed Values for Associated Fields
- **avatar_url, avatar_url_dropbox**: Must be valid URLs.
- **color_code**: Acceptable values include color symbols such as `:red`, `:green`, `:blue`, `:yellow`, `:orange`, `:cyan`, `:magenta`, `:white`, `:gray`, `:maroon`, `:olive`, `:navy`, `:purple`, `:teal`, `:light_blue`, `:light_green`, `:light_red`, and `:black`.

### Example
```json
{
    "name": "LinkedIn",
    "id_user": "e103330e-1637-4ad5-b7b0-5e2fdd4d0bac",
    "avatar_url": "https://example.com/avatar.png",
    "color_code": "blue"
}
```

## 2. Page

### Required Fields
- **page**: The page number (default is 1 if not provided).
- **limit**: Number of results per page (default is 25 if not provided).

### Optional Fields
- **filters**: Filters to apply on the channel list, such as `name`.
- **order**: The field to order by. Default ordering is by `:id`.
- **asc**: Boolean indicating the sort order. Default is true (ascending).

### Validations
- The `page` and `limit` should be integers within reasonable bounds.
- Filters should use keys such as `name`.
  
### Allowed Values for Filters
- **name**: A string to filter channels by name.

### Example
```json
{
    "page": 1,
    "limit": 10,
    "filters": {
        "name": "LinkedIn"
    },
    "order": "create_time",
    "asc": true
}
```

## 3. Update

### Required Fields
- **id**: The GUID of the channel to update. Validation checks that this is a valid GUID.
- **name**: Must be provided in the update request, adhering to string type and character limit as in insertion.

### Optional Fields
- **avatar_url**: If provided, must be a valid and reachable URL.
- **avatar_url_dropbox**: Must be a valid URL if specified.
- **color_code**: Should be a recognized color from the defined palette.

### Validations
- `id` must exist and belong to the current account.
- Updated attributes are subjected to the same validations as in the insert operation.

### Example
```json
{
    "id": "f102a63e-12ab-4f59-b201-33156c9a8eb3",
    "name": "Updated LinkedIn",
    "avatar_url": "https://new.example.com/avatar.png",
    "color_code": "red"
}
```# Mass::Channel

The `Mass::Channel` class manages the channels within MassProspecting. It is responsible for channel creation, retrieval, updating, and validation. Each channel has associated attributes such as name, avatar URLs, and color codes. The class supports features like URL validation and color management based on a defined palette.

## 1. Insert

### Required Fields
- **name**: The name of the channel. It should be a string and must be less than 255 characters.
- **id_user**: The ID of the user creating the channel, must be a valid GUID.
  
### Optional Fields
- **avatar_url**: An optional string field that should be a valid and reachable URL.
- **avatar_url_dropbox**: Although the URL itself is optional, if provided, it must be reachable.
- **color_code**: An optional string or symbol representing the color name. The color must be a valid key from the palette.

### Validations
- All fields except `avatar_url`, `avatar_url_dropbox`, and `color_code` are mandatory.
- `name` should be a string with a maximum of 255 characters.
- `id_user` should be a valid GUID.
- `avatar_url` and `avatar_url_dropbox` should be valid URLs.
- `color_code`, if provided, must match a key within the defined palette in `BlackStack::Palette`.

### Allowed Values for Associated Fields
- **avatar_url, avatar_url_dropbox**: Must be valid URLs.
- **color_code**: Acceptable values include color symbols such as `:red`, `:green`, `:blue`, `:yellow`, `:orange`, `:cyan`, `:magenta`, `:white`, `:gray`, `:maroon`, `:olive`, `:navy`, `:purple`, `:teal`, `:light_blue`, `:light_green`, `:light_red`, and `:black`.

### Example
```json
{
    "name": "LinkedIn",
    "id_user": "e103330e-1637-4ad5-b7b0-5e2fdd4d0bac",
    "avatar_url": "https://example.com/avatar.png",
    "color_code": "blue"
}
```

## 2. Page

### Required Fields
- **page**: The page number (default is 1 if not provided).
- **limit**: Number of results per page (default is 25 if not provided).

### Optional Fields
- **filters**: Filters to apply on the channel list, such as `name`.
- **order**: The field to order by. Default ordering is by `:id`.
- **asc**: Boolean indicating the sort order. Default is true (ascending).

### Validations
- The `page` and `limit` should be integers within reasonable bounds.
- Filters should use keys such as `name`.
  
### Allowed Values for Filters
- **name**: A string to filter channels by name.

### Example
```json
{
    "page": 1,
    "limit": 10,
    "filters": {
        "name": "LinkedIn"
    },
    "order": "create_time",
    "asc": true
}
```

## 3. Update

### Required Fields
- **id**: The GUID of the channel to update. Validation checks that this is a valid GUID.
- **name**: Must be provided in the update request, adhering to string type and character limit as in insertion.

### Optional Fields
- **avatar_url**: If provided, must be a valid and reachable URL.
- **avatar_url_dropbox**: Must be a valid URL if specified.
- **color_code**: Should be a recognized color from the defined palette.

### Validations
- `id` must exist and belong to the current account.
- Updated attributes are subjected to the same validations as in the insert operation.

### Example
```json
{
    "id": "f102a63e-12ab-4f59-b201-33156c9a8eb3",
    "name": "Updated LinkedIn",
    "avatar_url": "https://new.example.com/avatar.png",
    "color_code": "red"
}
```