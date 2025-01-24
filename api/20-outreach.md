# MassProspecting API Documentation: Mass::Outreach

The `Mass::Outreach` class in MassProspecting represents various outreach actions within the platform, allowing users to perform and manage different types of outreach activities directed towards leads or companies. This class provides functionalities to insert, update, and page through outreach records while supporting diverse channels and outreach types like LinkedIn direct messages or Facebook friend requests.

## Insert

To create a new outreach record, use the `/ajax/outreach/insert.json` endpoint. Below are the required and optional fields:

### Required Fields
- `outreach_type`: Type of outreach intended. Must be one of:
  - "Facebook_DirectMessage"
  - "Facebook_FriendRequest"
  - "GMail_DirectMessage"
  - "LinkedIn_ConnectionRequest"
  - "LinkedIn_DirectMessage"
  - "Postmark_DirectMessage"
  
- `status`: Current status of the outreach. Must be specified as a symbol or string:
  - `:pending`
  - `:running`
  - `:performed`
  - `:failed`
  - `:aborted`
  - `:canceled`

### Optional Fields
- `approved`: Boolean indicating if the outreach is approved.
- `skip_repliers`: Value dictating if repliers should be skipped. Accepts:
  - `:global`
  - `:tag_only`
  - `:none`
- `direction`: The direction of the outreach. Options are:
  - `:outgoing`
  - `:incoming`
  - `:accepted`
- `tag`: Tag for categorizing the outreach. Must be a valid tag associated with the account.
- `subject`: The subject of the outreach message.
- `body`: Content of the outreach message.
- `body_type`: Format of the body. Can be:
  - `:plain`
  - `:html`
- `error_description`: A string detailing any errors that occurred.
- `screenshot_url`: URL to a screenshot associated with the outreach.
- `message_id` and `reply_to_message_id`: Applicable only if the outreach type is associated with an MTA profile.

### Validations
- URLs must be valid and reachable.

### Example
```json
{
  "outreach_type": "LinkedIn_DirectMessage",
  "status": "pending",
  "approved": true,
  "direction": "outgoing",
  "tag": "important_lead",
  "subject": "Special Offer for You",
  "body": "<p>Hello, we have an offer...</p>",
  "body_type": "html",
  "screenshot_url": "https://example.com/screenshot.png"
}
```

## Page

To retrieve a paginated list of outreach records, use the `/ajax/outreach/page.json` endpoint. Below are the parameters:

### Required Fields
- `page`: Page number for pagination, starting at 1.

### Optional Fields
- `limit`: Number of results per page. Default is 25.
- `filters`: A set of criteria to filter the outreach records.
- `order`: Field to order results by. Default is `id`.
- `asc`: Boolean indicating ascending order. Default is `true`.

### Validations
- Ensure that filter values provided match the required data types and constraints.

### Example
```json
{
  "page": 1,
  "limit": 50,
  "filters": {
    "status": "pending",
    "outreach_type": "LinkedIn_DirectMessage"
  },
  "order": "create_time",
  "asc": false
}
```

## Update

To update an existing outreach record, use the `/ajax/outreach/update.json` endpoint. The following fields are considered:

### Required Fields
- `id`: Unique identifier of the outreach entry to be updated.

### Optional Fields
- Same as those listed in the insert section, such as `outreach_type`, `status`, `tag`, `subject`, `body`, etc.

### Validations
- All fields must adhere to the expected data types and allowed values. Specifically, `status` must be a known status code, and any URL must be valid.

### Example
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "status": "running",
  "subject": "Updated Offer",
  "body": "New offer details inside!"
}
```# MassProspecting API Documentation: Mass::Outreach

The `Mass::Outreach` class in MassProspecting represents various outreach actions within the platform, allowing users to perform and manage different types of outreach activities directed towards leads or companies. This class provides functionalities to insert, update, and page through outreach records while supporting diverse channels and outreach types like LinkedIn direct messages or Facebook friend requests.

## Insert

To create a new outreach record, use the `/ajax/outreach/insert.json` endpoint. Below are the required and optional fields:

### Required Fields
- `outreach_type`: Type of outreach intended. Must be one of:
  - "Facebook_DirectMessage"
  - "Facebook_FriendRequest"
  - "GMail_DirectMessage"
  - "LinkedIn_ConnectionRequest"
  - "LinkedIn_DirectMessage"
  - "Postmark_DirectMessage"
  
- `status`: Current status of the outreach. Must be specified as a symbol or string:
  - `:pending`
  - `:running`
  - `:performed`
  - `:failed`
  - `:aborted`
  - `:canceled`

### Optional Fields
- `approved`: Boolean indicating if the outreach is approved.
- `skip_repliers`: Value dictating if repliers should be skipped. Accepts:
  - `:global`
  - `:tag_only`
  - `:none`
- `direction`: The direction of the outreach. Options are:
  - `:outgoing`
  - `:incoming`
  - `:accepted`
- `tag`: Tag for categorizing the outreach. Must be a valid tag associated with the account.
- `subject`: The subject of the outreach message.
- `body`: Content of the outreach message.
- `body_type`: Format of the body. Can be:
  - `:plain`
  - `:html`
- `error_description`: A string detailing any errors that occurred.
- `screenshot_url`: URL to a screenshot associated with the outreach.
- `message_id` and `reply_to_message_id`: Applicable only if the outreach type is associated with an MTA profile.

### Validations
- URLs must be valid and reachable.

### Example
```json
{
  "outreach_type": "LinkedIn_DirectMessage",
  "status": "pending",
  "approved": true,
  "direction": "outgoing",
  "tag": "important_lead",
  "subject": "Special Offer for You",
  "body": "<p>Hello, we have an offer...</p>",
  "body_type": "html",
  "screenshot_url": "https://example.com/screenshot.png"
}
```

## Page

To retrieve a paginated list of outreach records, use the `/ajax/outreach/page.json` endpoint. Below are the parameters:

### Required Fields
- `page`: Page number for pagination, starting at 1.

### Optional Fields
- `limit`: Number of results per page. Default is 25.
- `filters`: A set of criteria to filter the outreach records.
- `order`: Field to order results by. Default is `id`.
- `asc`: Boolean indicating ascending order. Default is `true`.

### Validations
- Ensure that filter values provided match the required data types and constraints.

### Example
```json
{
  "page": 1,
  "limit": 50,
  "filters": {
    "status": "pending",
    "outreach_type": "LinkedIn_DirectMessage"
  },
  "order": "create_time",
  "asc": false
}
```

## Update

To update an existing outreach record, use the `/ajax/outreach/update.json` endpoint. The following fields are considered:

### Required Fields
- `id`: Unique identifier of the outreach entry to be updated.

### Optional Fields
- Same as those listed in the insert section, such as `outreach_type`, `status`, `tag`, `subject`, `body`, etc.

### Validations
- All fields must adhere to the expected data types and allowed values. Specifically, `status` must be a known status code, and any URL must be valid.

### Example
```json
{
  "id": "123e4567-e89b-12d3-a456-426614174000",
  "status": "running",
  "subject": "Updated Offer",
  "body": "New offer details inside!"
}
```