# Mass::Industry

The `Mass::Industry` class is designed to manage industry-related information within the MassProspecting platform. It is primarily geared towards associating industry names with specific channels. The class supports various operations like insertion, updating, pagination, and validation of industry data. It ensures correct data management with different validation checks integrated throughout its operations.

## Insert

**Required Fields:**
- `channel`: The communication channel associated with the industry. This must be a valid channel.

**Optional Fields:**
- `id_user`: The user associated with this industry.
- `name`: The name of the industry.

**Validations:**
- `channel`: Must be specified and should exist within the account. Allowed values include `Apollo`, `Facebook`, `FindyMail`, `GMail`, `Indeed`, `LinkedIn`, `Postmark`, `Reoon`, `Targetron`, `ZeroBounce`.
- `name`: Must be a string and not exceed 255 characters.
- Fields like `id_account` and `id_user` need to be valid GUIDs and correlate appropriately to existing entries.

**Example:**
```json
{
    "name": "Technology",
    "channel": "LinkedIn"
}
```

## Page

**Required Fields:**
- `page`: The specific page number of the results.
- `limit`: The number of results per page.

**Optional Fields:**
- `filters`: Dictionary to apply specific filters, such as name.
- `order`: The field by which to order results. Default is `id`.
- `asc`: Boolean to determine if the order is ascending (default `true`).

**Validations:**
- `name`: The filter must be a string and allows partial matching.
- Channels must meet the same conditions as in the Insert section.

**Example:**
```json
{
    "page": 1,
    "limit": 10,
    "filters": {
        "name": "Tech"
    },
    "order": "name",
    "asc": true
}
```

## Update

**Required Fields:**
- `id`: The identifier of the industry entry to update.
- `channel`: The communication channel associated with the industry. This must be a valid channel.

**Optional Fields:**
- `name`: The name of the industry.

**Validations:**
- `channel`: As before, must be specified and valid.
- `name`: Must meet the same conditions as in the Insert section.

**Example:**
```json
{
    "id": "123e4567-e89b-12d3-a456-426614174000",
    "name": "Tech Innovations",
    "channel": "LinkedIn"
}
```

The `Mass::Industry` class provides crucial functionality for defining and managing industries in a structured manner, ensuring data validity and proper associations with user accounts and channels.# Mass::Industry

The `Mass::Industry` class is designed to manage industry-related information within the MassProspecting platform. It is primarily geared towards associating industry names with specific channels. The class supports various operations like insertion, updating, pagination, and validation of industry data. It ensures correct data management with different validation checks integrated throughout its operations.

## Insert

**Required Fields:**
- `channel`: The communication channel associated with the industry. This must be a valid channel.

**Optional Fields:**
- `id_user`: The user associated with this industry.
- `name`: The name of the industry.

**Validations:**
- `channel`: Must be specified and should exist within the account. Allowed values include `Apollo`, `Facebook`, `FindyMail`, `GMail`, `Indeed`, `LinkedIn`, `Postmark`, `Reoon`, `Targetron`, `ZeroBounce`.
- `name`: Must be a string and not exceed 255 characters.
- Fields like `id_account` and `id_user` need to be valid GUIDs and correlate appropriately to existing entries.

**Example:**
```json
{
    "name": "Technology",
    "channel": "LinkedIn"
}
```

## Page

**Required Fields:**
- `page`: The specific page number of the results.
- `limit`: The number of results per page.

**Optional Fields:**
- `filters`: Dictionary to apply specific filters, such as name.
- `order`: The field by which to order results. Default is `id`.
- `asc`: Boolean to determine if the order is ascending (default `true`).

**Validations:**
- `name`: The filter must be a string and allows partial matching.
- Channels must meet the same conditions as in the Insert section.

**Example:**
```json
{
    "page": 1,
    "limit": 10,
    "filters": {
        "name": "Tech"
    },
    "order": "name",
    "asc": true
}
```

## Update

**Required Fields:**
- `id`: The identifier of the industry entry to update.
- `channel`: The communication channel associated with the industry. This must be a valid channel.

**Optional Fields:**
- `name`: The name of the industry.

**Validations:**
- `channel`: As before, must be specified and valid.
- `name`: Must meet the same conditions as in the Insert section.

**Example:**
```json
{
    "id": "123e4567-e89b-12d3-a456-426614174000",
    "name": "Tech Innovations",
    "channel": "LinkedIn"
}
```

The `Mass::Industry` class provides crucial functionality for defining and managing industries in a structured manner, ensuring data validity and proper associations with user accounts and channels.