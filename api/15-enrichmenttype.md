# MassProspecting EnrichmentType Class

The `Mass::EnrichmentType` class defines the criteria for enriching lead and company data within the MassProspecting system. It leverages various enrichment parameters to provide richer insights and potential contact points for leads and companies. The class also integrates several validation and serialization methods to ensure data integrity and streamline data handling processes.

## Insert

- **Required Fields:**
  - `name`: must be a string less than 255 characters.
  - `profile_type`: must be one of the allowed profile types.
  
- **Optional Fields:**
  - `description`: must be a string.
  - `available`: boolean indicating if the enrichment type is available.
  - `picture_url`, `picture_url_dropbox`: must be valid URLs.
  - `allow_filter`: boolean indicating if filtering is allowed.
  - `parameters`: string containing one or more of these values: 
    - `email_verification_result`
    - `email`
    - `phone`
    - `linkedin`
    - `facebook`
    - `english_names_only`
    - `keyword`
    - `industry`
    - `headcount`
    - `revenue`
    - `country`
    - `sic`
    - `naics`
    - `location`
    
- **Validations:**
  - Mandatory: `profile_type`
  - Boolean: `available`, `allow_filter`
  - URL: `picture_url`, `picture_url_dropbox`
  - Profile Type must exist.
  
- **Allowed Values for `profile_type`:**
  - `Apollo_API`, `Apollo_RPA`, `Facebook`, `FindyMail`, `GMail`, `Indeed`, `LinkedIn`, `Postmark`, `Reoon`, `Targetron_API`, `Targetron_RPA`, `ZeroBounce`

- **Example:**
```json
{
  "name": "Basic Enrichment",
  "profile_type": "Apollo_API",
  "description": "Enrichment offering by Apollo",
  "available": true,
  "allow_filter": true,
  "parameters": "email;phone"
}
```

## Page

- **Required Fields:**
  - `page`: integer, defaults to 1.
  - `limit`: integer, defaults to 25.
  
- **Optional Fields:**
  - `filters`: can include the field `name`.
  - `order`: filters records based on field, e.g., `id`.
  - `asc`: boolean to set ascending order.

- **Validations:**
  - No unknown filters allowed.

- **Allowed Values for `profile_type`:**
  - `Apollo_API`, `Apollo_RPA`, `Facebook`, `FindyMail`, `GMail`, `Indeed`, `LinkedIn`, `Postmark`, `Reoon`, `Targetron_API`, `Targetron_RPA`, `ZeroBounce`

- **Example:**
```json
{
  "page": 1,
  "limit": 10,
  "filters": { "name": "Basic Enrichment" },
  "order": "id",
  "asc": true
}
```

## Update

- **Required Fields:**
  - `id`: identifier of the enrichment type to be updated.

- **Optional Fields:**
  - `name`: must be a string less than 255 characters.
  - `description`: must be a string.
  - `available`: boolean indicating availability.
  - `picture_url`, `picture_url_dropbox`: must be valid URLs.
  - `allow_filter`: boolean indicating if filtering is allowed.
  - `parameters`: string containing parameters separated by `;`.
  
- **Validations:**
  - String: `parameters` must be a string containing allowed values.
  - Boolean: `available`, `allow_filter`
  - URL: `picture_url`, `picture_url_dropbox`
  - Profile Type must exist.
  
- **Allowed Values for `profile_type`:**
  - `Apollo_API`, `Apollo_RPA`, `Facebook`, `FindyMail`, `GMail`, `Indeed`, `LinkedIn`, `Postmark`, `Reoon`, `Targetron_API`, `Targetron_RPA`, `ZeroBounce`

- **Example:**
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "name": "Advanced Enrichment",
  "description": "Updated enrichment by Apollo",
  "available": false,
  "allow_filter": false,
  "parameters": "email_verification_result;linkedin"
}
```# MassProspecting EnrichmentType Class

The `Mass::EnrichmentType` class defines the criteria for enriching lead and company data within the MassProspecting system. It leverages various enrichment parameters to provide richer insights and potential contact points for leads and companies. The class also integrates several validation and serialization methods to ensure data integrity and streamline data handling processes.

## Insert

- **Required Fields:**
  - `name`: must be a string less than 255 characters.
  - `profile_type`: must be one of the allowed profile types.
  
- **Optional Fields:**
  - `description`: must be a string.
  - `available`: boolean indicating if the enrichment type is available.
  - `picture_url`, `picture_url_dropbox`: must be valid URLs.
  - `allow_filter`: boolean indicating if filtering is allowed.
  - `parameters`: string containing one or more of these values: 
    - `email_verification_result`
    - `email`
    - `phone`
    - `linkedin`
    - `facebook`
    - `english_names_only`
    - `keyword`
    - `industry`
    - `headcount`
    - `revenue`
    - `country`
    - `sic`
    - `naics`
    - `location`
    
- **Validations:**
  - Mandatory: `profile_type`
  - Boolean: `available`, `allow_filter`
  - URL: `picture_url`, `picture_url_dropbox`
  - Profile Type must exist.
  
- **Allowed Values for `profile_type`:**
  - `Apollo_API`, `Apollo_RPA`, `Facebook`, `FindyMail`, `GMail`, `Indeed`, `LinkedIn`, `Postmark`, `Reoon`, `Targetron_API`, `Targetron_RPA`, `ZeroBounce`

- **Example:**
```json
{
  "name": "Basic Enrichment",
  "profile_type": "Apollo_API",
  "description": "Enrichment offering by Apollo",
  "available": true,
  "allow_filter": true,
  "parameters": "email;phone"
}
```

## Page

- **Required Fields:**
  - `page`: integer, defaults to 1.
  - `limit`: integer, defaults to 25.
  
- **Optional Fields:**
  - `filters`: can include the field `name`.
  - `order`: filters records based on field, e.g., `id`.
  - `asc`: boolean to set ascending order.

- **Validations:**
  - No unknown filters allowed.

- **Allowed Values for `profile_type`:**
  - `Apollo_API`, `Apollo_RPA`, `Facebook`, `FindyMail`, `GMail`, `Indeed`, `LinkedIn`, `Postmark`, `Reoon`, `Targetron_API`, `Targetron_RPA`, `ZeroBounce`

- **Example:**
```json
{
  "page": 1,
  "limit": 10,
  "filters": { "name": "Basic Enrichment" },
  "order": "id",
  "asc": true
}
```

## Update

- **Required Fields:**
  - `id`: identifier of the enrichment type to be updated.

- **Optional Fields:**
  - `name`: must be a string less than 255 characters.
  - `description`: must be a string.
  - `available`: boolean indicating availability.
  - `picture_url`, `picture_url_dropbox`: must be valid URLs.
  - `allow_filter`: boolean indicating if filtering is allowed.
  - `parameters`: string containing parameters separated by `;`.
  
- **Validations:**
  - String: `parameters` must be a string containing allowed values.
  - Boolean: `available`, `allow_filter`
  - URL: `picture_url`, `picture_url_dropbox`
  - Profile Type must exist.
  
- **Allowed Values for `profile_type`:**
  - `Apollo_API`, `Apollo_RPA`, `Facebook`, `FindyMail`, `GMail`, `Indeed`, `LinkedIn`, `Postmark`, `Reoon`, `Targetron_API`, `Targetron_RPA`, `ZeroBounce`

- **Example:**
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "name": "Advanced Enrichment",
  "description": "Updated enrichment by Apollo",
  "available": false,
  "allow_filter": false,
  "parameters": "email_verification_result;linkedin"
}
```