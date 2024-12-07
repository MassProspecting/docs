# Mass::Click API Documentation

Mass::Click is a class designed to manage recording and tracking click events within the MassProspecting SaaS. This class is primarily used for logging each instance where a user interacts with a link sent as a part of an outreach initiative. It ensures accurate linkage between clicks, the corresponding outreach, and links. Moreover, this class ensures the data integrity and ownership validations in relation to account and user data.

## Insert

### Required Fields
- `id_outreach` (GUID): The ID of the outreach instance that triggered the link.
- `id_link` (GUID): The ID of the link that was clicked.

### Optional Fields
- `id_user` (GUID): The ID of the user who is responsible for the outreach.

### Validations
- **Key Errors**: Only allows mentioned fields.
- **Ownership**: Requires `id_account` and checks its existence.
- **Mandatory**: `id_outreach` and `id_link` are mandatory.
- **Unique Outreach**: Validates the existence of `id_outreach` related to the account.

### Example
```json
{
  "id_outreach": "12345678-1234-5678-1234-567812345678",
  "id_link": "87654321-4321-8765-4321-876543218765",
  "id_user": "11111111-2222-3333-4444-555555555555"
}
```

## Page

### Required Fields
- `page` (Integer): Page number of the results.
- `limit` (Integer): Number of results per page.

### Optional Fields
- `filters`: 
  - `id_lead` (GUID): Filter clicks associated with a specific lead.
  - `id_company` (GUID): Filter clicks associated with a specific company.

### Validations
- **Allowed Keys**: Only `id_lead` and `id_company` are permissible in filters.
- **Account Requirement**: Account must be provided when using `id_lead` or `id_company`.

### Example
```json
{
  "page": 1,
  "limit": 25,
  "filters": {
    "id_lead": "abcdefab-cdef-abcd-efab-cdefabcdefab"
  },
  "order": "create_time",
  "asc": true
}
```

## Update

### Required Fields
- `id` (GUID): The ID of the click record you want to update.

### Optional Fields
- `id_outreach` (GUID): Update the outreach ID.
- `id_link` (GUID): Update the link ID.
- `id_user` (GUID): Update the user ID.

### Validations
- **Key Errors**: Only allows mentioned fields.
- **Ownership**: Ensures ownership is maintained through `id_account`.
- **Record Existence**: Validates the existence of the click record before updating.

### Example
```json
{
  "id": "abcdef12-3456-7890-abcd-ef1234567890",
  "id_outreach": "12345678-1234-5678-1234-567812345678",
  "id_link": "87654321-4321-8765-4321-876543218765"
}
```# Mass::Click API Documentation

Mass::Click is a class designed to manage recording and tracking click events within the MassProspecting SaaS. This class is primarily used for logging each instance where a user interacts with a link sent as a part of an outreach initiative. It ensures accurate linkage between clicks, the corresponding outreach, and links. Moreover, this class ensures the data integrity and ownership validations in relation to account and user data.

## Insert

### Required Fields
- `id_outreach` (GUID): The ID of the outreach instance that triggered the link.
- `id_link` (GUID): The ID of the link that was clicked.

### Optional Fields
- `id_user` (GUID): The ID of the user who is responsible for the outreach.

### Validations
- **Key Errors**: Only allows mentioned fields.
- **Ownership**: Requires `id_account` and checks its existence.
- **Mandatory**: `id_outreach` and `id_link` are mandatory.
- **Unique Outreach**: Validates the existence of `id_outreach` related to the account.

### Example
```json
{
  "id_outreach": "12345678-1234-5678-1234-567812345678",
  "id_link": "87654321-4321-8765-4321-876543218765",
  "id_user": "11111111-2222-3333-4444-555555555555"
}
```

## Page

### Required Fields
- `page` (Integer): Page number of the results.
- `limit` (Integer): Number of results per page.

### Optional Fields
- `filters`: 
  - `id_lead` (GUID): Filter clicks associated with a specific lead.
  - `id_company` (GUID): Filter clicks associated with a specific company.

### Validations
- **Allowed Keys**: Only `id_lead` and `id_company` are permissible in filters.
- **Account Requirement**: Account must be provided when using `id_lead` or `id_company`.

### Example
```json
{
  "page": 1,
  "limit": 25,
  "filters": {
    "id_lead": "abcdefab-cdef-abcd-efab-cdefabcdefab"
  },
  "order": "create_time",
  "asc": true
}
```

## Update

### Required Fields
- `id` (GUID): The ID of the click record you want to update.

### Optional Fields
- `id_outreach` (GUID): Update the outreach ID.
- `id_link` (GUID): Update the link ID.
- `id_user` (GUID): Update the user ID.

### Validations
- **Key Errors**: Only allows mentioned fields.
- **Ownership**: Ensures ownership is maintained through `id_account`.
- **Record Existence**: Validates the existence of the click record before updating.

### Example
```json
{
  "id": "abcdef12-3456-7890-abcd-ef1234567890",
  "id_outreach": "12345678-1234-5678-1234-567812345678",
  "id_link": "87654321-4321-8765-4321-876543218765"
}
```