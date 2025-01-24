# Mass::Link

The `Mass::Link` class in the MassProspecting API is responsible for managing URL link creation, association, and validation within specified rules for an account. This class ensures that links are correctly associated with account rules and belong to the account. It performs validations for mandatory fields and checks the accessibility of URLs.

## Insert

### Required Fields

- `id_rule`: A rule ID to associate with this link; it must belong to the same account and be a valid rule.
- `url`: The URL to be used; it must be a valid and reachable URL.

### Optional Fields

- `id_user`: The user ID; it must be a valid user belonging to the account.

### Validations

- The `id_rule` must not only exist but also be valid and belong to the account.
- The `url` must be valid as a URL and reachable.
- Ownership errors are checked to ensure that the provided account ID (`id_account`) is valid and exists, and that the user ID (if provided) must belong to the account.

### Examples

Successful insertion example:
```json
{
  "id_rule": "valid-rule-guid",
  "url": "http://example.com",
  "id_user": "valid-user-guid"
}
```

Failure due to invalid URL:
```json
{
  "id_rule": "valid-rule-guid",
  "url": "http://invalid-url"
}
```

## Page

### Required Fields

- `page`: The page number to fetch, defaults to 1 if not specified.
- `limit`: The number of records per page, default to 25 if not specified.

### Optional Fields

- `filters`: A hash containing optional filters. Allowed keys are `id_lead` and `id_company`.
- `order`: The field name to order the results by. Defaults to `create_time`.
- `asc`: A boolean to indicate the ascending order; defaults to true if not specified.

### Validations

- If filtering by `id_lead`, the account must be specified.
- The parameters should contain only allowed keys, throwing errors for any unrecognized keys.

### Examples

Fetching a page of links:
```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "id_lead": "valid-lead-guid"
  },
  "order": "create_time",
  "asc": true
}
```

## Update

### Required Fields

- `id`: The ID of the link to update; it must exist and belong to the account.

### Optional Fields

- `id_rule`: A new rule ID to associate with this link, must be a valid rule ID.
- `url`: A new URL to associate with this link, must be valid and reachable.

### Validations

- The `id` must exist in the database for the update.
- Similar validations as in insert, ensuring the rule is valid and the URL is reachable.
- If `id_rule` is specified, it must exist and belong to the same account.
- Ownership of the link must be intact before performing update operations.

### Example

Updating a link:
```json
{
  "id": "existing-link-guid",
  "url": "http://new-example.com",
  "id_rule": "new-valid-rule-guid"
}
```

Failure due to non-existing ID:
```json
{
  "id": "non-existing-link-guid",
  "url": "http://new-example.com"
}
```# Mass::Link

The `Mass::Link` class in the MassProspecting API is responsible for managing URL link creation, association, and validation within specified rules for an account. This class ensures that links are correctly associated with account rules and belong to the account. It performs validations for mandatory fields and checks the accessibility of URLs.

## Insert

### Required Fields

- `id_rule`: A rule ID to associate with this link; it must belong to the same account and be a valid rule.
- `url`: The URL to be used; it must be a valid and reachable URL.

### Optional Fields

- `id_user`: The user ID; it must be a valid user belonging to the account.

### Validations

- The `id_rule` must not only exist but also be valid and belong to the account.
- The `url` must be valid as a URL and reachable.
- Ownership errors are checked to ensure that the provided account ID (`id_account`) is valid and exists, and that the user ID (if provided) must belong to the account.

### Examples

Successful insertion example:
```json
{
  "id_rule": "valid-rule-guid",
  "url": "http://example.com",
  "id_user": "valid-user-guid"
}
```

Failure due to invalid URL:
```json
{
  "id_rule": "valid-rule-guid",
  "url": "http://invalid-url"
}
```

## Page

### Required Fields

- `page`: The page number to fetch, defaults to 1 if not specified.
- `limit`: The number of records per page, default to 25 if not specified.

### Optional Fields

- `filters`: A hash containing optional filters. Allowed keys are `id_lead` and `id_company`.
- `order`: The field name to order the results by. Defaults to `create_time`.
- `asc`: A boolean to indicate the ascending order; defaults to true if not specified.

### Validations

- If filtering by `id_lead`, the account must be specified.
- The parameters should contain only allowed keys, throwing errors for any unrecognized keys.

### Examples

Fetching a page of links:
```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "id_lead": "valid-lead-guid"
  },
  "order": "create_time",
  "asc": true
}
```

## Update

### Required Fields

- `id`: The ID of the link to update; it must exist and belong to the account.

### Optional Fields

- `id_rule`: A new rule ID to associate with this link, must be a valid rule ID.
- `url`: A new URL to associate with this link, must be valid and reachable.

### Validations

- The `id` must exist in the database for the update.
- Similar validations as in insert, ensuring the rule is valid and the URL is reachable.
- If `id_rule` is specified, it must exist and belong to the same account.
- Ownership of the link must be intact before performing update operations.

### Example

Updating a link:
```json
{
  "id": "existing-link-guid",
  "url": "http://new-example.com",
  "id_rule": "new-valid-rule-guid"
}
```

Failure due to non-existing ID:
```json
{
  "id": "non-existing-link-guid",
  "url": "http://new-example.com"
}
```