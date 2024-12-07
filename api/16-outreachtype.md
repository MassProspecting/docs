# Mass::OutreachType

The `Mass::OutreachType` class is a part of the MassProspecting SaaS platform which deals with different types of outreach methods supported by profiles. It enables definition and management of outreach types specifying properties like profile types, availability, parameters, etc. This class supports operations like insertion, pagination, and updating outreach types through the API.

## Insert

### Required Fields

- `name`: A unique string identifier for the outreach type, not exceeding 255 characters.
- `profile_type`: Specifies the profile type from which the outreach is initiated. Must be one of the following: "Apollo_API", "Apollo_RPA", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron_API", "Targetron_RPA", "ZeroBounce".

### Optional Fields

- `description`: A short description of the outreach type.
- `available`: A boolean indicating if the outreach type is available.
- `picture_url`: URL of the picture associated with the outreach type, which must be reachable.
- `picture_url_dropbox`: A Dropbox URL for storing pictures.
- `allow_subject`: A boolean indicating if the outreach type allows customizing the subject line.
- `allow_body`: A boolean indicating if the outreach type allows customizing the message body.
- `body_type`: Specifies the type of body content. Must be one of: "plain", "html".
- `allow_filter`: A boolean determining if the outreach type supports additional filters.
- `parameters`: A string of parameters separated by `;`. Each parameter must be one of the following: "email_verification_result", "email", "phone", "linkedin", "facebook", "english_names_only", "keyword", "industry", "headcount", "revenue", "country", "sic", "naics", "location".
- `outreach_type_for_further_outreaches`: Specifies another outreach type for further outreach processes.
- `outreach_type_for_further_outreaches_desc`: A description for the further outreach type.

### Validations

- URL fields must point to a reachable resource.
- Booleans for specific configurations need to be validated against true or false.
- The `body_type` must adhere to specified options and is case-sensitive.
- References to related models like `profile_type` and `outreach_type_for_further_outreaches` need validation and verification against existing records.

### Example 

```json
{
  "name": "LinkedIn Direct Message",
  "profile_type": "LinkedIn",
  "description": "Outreach for LinkedIn direct messaging",
  "available": true,
  "picture_url": "https://example.com/image.png",
  "allow_subject": false,
  "allow_body": true,
  "body_type": "html",
  "allow_filter": true,
  "parameters": "email;phone",
  "outreach_type_for_further_outreaches": "LinkedIn_ConnectionRequest"
}
```

## Page

### Required Fields

- `page`: The page number to retrieve (default is 1 if not provided).
- `limit`: The number of records per page (default is 25 if not provided).

### Optional Fields

- `filters`: Contains optional filters like `name` to narrow the search.
- `order`: Specifies the field to order the results by (default is `create_time`).
- `asc`: A boolean determining if the results are in ascending order (default is `true`).

### Validations

- Filter fields must correspond to allowed filters like `name`.
- Pagination inputs (page and limit) must be positive integers.

### Example

```json
{
  "page": 1,
  "limit": 20,
  "filters": { "name": "LinkedIn Direct Message" },
  "order": "create_time",
  "asc": true
}
```

## Update

### Required Fields

- `id`: The unique identifier of the outreach type that needs to be updated.

### Optional Fields

- All fields mentioned in the Insert section can be updated.

### Validations

- `id` must refer to an existing record.
- All other fields are subject to the same validation outlined in the Insert section.

### Example

```json
{
  "id": "some-unique-id",
  "description": "Updated description for LinkedIn messaging",
  "available": false,
  "allow_body": false
}
```# Mass::OutreachType

The `Mass::OutreachType` class is a part of the MassProspecting SaaS platform which deals with different types of outreach methods supported by profiles. It enables definition and management of outreach types specifying properties like profile types, availability, parameters, etc. This class supports operations like insertion, pagination, and updating outreach types through the API.

## Insert

### Required Fields

- `name`: A unique string identifier for the outreach type, not exceeding 255 characters.
- `profile_type`: Specifies the profile type from which the outreach is initiated. Must be one of the following: "Apollo_API", "Apollo_RPA", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron_API", "Targetron_RPA", "ZeroBounce".

### Optional Fields

- `description`: A short description of the outreach type.
- `available`: A boolean indicating if the outreach type is available.
- `picture_url`: URL of the picture associated with the outreach type, which must be reachable.
- `picture_url_dropbox`: A Dropbox URL for storing pictures.
- `allow_subject`: A boolean indicating if the outreach type allows customizing the subject line.
- `allow_body`: A boolean indicating if the outreach type allows customizing the message body.
- `body_type`: Specifies the type of body content. Must be one of: "plain", "html".
- `allow_filter`: A boolean determining if the outreach type supports additional filters.
- `parameters`: A string of parameters separated by `;`. Each parameter must be one of the following: "email_verification_result", "email", "phone", "linkedin", "facebook", "english_names_only", "keyword", "industry", "headcount", "revenue", "country", "sic", "naics", "location".
- `outreach_type_for_further_outreaches`: Specifies another outreach type for further outreach processes.
- `outreach_type_for_further_outreaches_desc`: A description for the further outreach type.

### Validations

- URL fields must point to a reachable resource.
- Booleans for specific configurations need to be validated against true or false.
- The `body_type` must adhere to specified options and is case-sensitive.
- References to related models like `profile_type` and `outreach_type_for_further_outreaches` need validation and verification against existing records.

### Example 

```json
{
  "name": "LinkedIn Direct Message",
  "profile_type": "LinkedIn",
  "description": "Outreach for LinkedIn direct messaging",
  "available": true,
  "picture_url": "https://example.com/image.png",
  "allow_subject": false,
  "allow_body": true,
  "body_type": "html",
  "allow_filter": true,
  "parameters": "email;phone",
  "outreach_type_for_further_outreaches": "LinkedIn_ConnectionRequest"
}
```

## Page

### Required Fields

- `page`: The page number to retrieve (default is 1 if not provided).
- `limit`: The number of records per page (default is 25 if not provided).

### Optional Fields

- `filters`: Contains optional filters like `name` to narrow the search.
- `order`: Specifies the field to order the results by (default is `create_time`).
- `asc`: A boolean determining if the results are in ascending order (default is `true`).

### Validations

- Filter fields must correspond to allowed filters like `name`.
- Pagination inputs (page and limit) must be positive integers.

### Example

```json
{
  "page": 1,
  "limit": 20,
  "filters": { "name": "LinkedIn Direct Message" },
  "order": "create_time",
  "asc": true
}
```

## Update

### Required Fields

- `id`: The unique identifier of the outreach type that needs to be updated.

### Optional Fields

- All fields mentioned in the Insert section can be updated.

### Validations

- `id` must refer to an existing record.
- All other fields are subject to the same validation outlined in the Insert section.

### Example

```json
{
  "id": "some-unique-id",
  "description": "Updated description for LinkedIn messaging",
  "available": false,
  "allow_body": false
}
```