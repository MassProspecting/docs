# Mass::Revenue Class Documentation

The `Mass::Revenue` class is part of the MassProspecting SaaS that manages revenue-related operations in the system. This class allows the insertion, updating, and retrieval of revenue data based on specific channels and other parameters. The class includes necessary validations to ensure the integrity and proper management of revenue records.

## 1. Insert

The `insert` operation allows you to add a new revenue record into the system.

### Required Fields

- `channel`: Specifies the channel associated with the revenue. It must be one of the following allowed values: "Apollo", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron", "ZeroBounce".
- `min`: An integer representing the minimum revenue value. Must be greater than or equal to 0.
- `max`: An integer representing the maximum revenue value. Must be greater than or equal to `min`.

### Optional Fields

- `name`: A string representing the name of the revenue record. It must be a valid string of less than 255 characters.

### Validations

- Mandatory fields (`channel`, `min`, `max`) must be present.
- The `channel` specified must exist in the account's list of channels.
- `min` and `max` must be integers where `min` is less than or equal to `max`.
- `name` must be a string under 255 characters.
- Ownership of the revenue record is validated by checking `id_account`.

### Example

To insert a new revenue record:

```json
{
    "name": "Quarterly Revenue",
    "channel": "LinkedIn",
    "min": 50000,
    "max": 100000
}
```

## 2. Page

The `page` operation retrieves a paginated list of revenue records.

### Required Fields

- `page`: Integer representing the page number for pagination. Defaults to 1 if not provided.
- `limit`: Integer representing the number of records per page. Defaults to 25 if not provided.

### Optional Fields

- `filters`: A hash with filters to be applied to the revenue records. Currently supports filtering by `name`.
- `order`: The field by which the results are ordered. Defaults to `id`.
- `asc`: Boolean to determine if the results should be sorted in ascending order. Defaults to true.

### Validations

- The `filters` hash can only contain allowed keys, e.g., `name`.
- The `name` filter uses a case-insensitive `LIKE` SQL query for matching.

### Example

To get a paginated list of revenue records:

```json
{
    "page": 1,
    "limit": 25,
    "filters": {
        "name": "Revenue Name"
    },
    "order": "create_time",
    "asc": true
}
```

## 3. Update

The `update` operation allows you to modify an existing revenue record.

### Required Fields

- `id`: The unique identifier of the revenue record to be updated.

### Optional Fields

- `name`: A string representing the new name of the revenue record. Must be a valid string of less than 255 characters.
- `channel`: Specifies the new channel associated with the revenue. It should be within the allowed channels.
- `min`: An updated minimum revenue value. Must be an integer greater than or equal to 0 and less than or equal to `max`.
- `max`: An updated maximum revenue value. Must be an integer greater than or equal to `min`.

### Validations

- The `id` must exist and be associated with the current account.
- Fields must meet the same criteria as in the insert operation.
- Changes to the channel must reference an existing channel for the account.

### Example

To update an existing revenue record:

```json
{
    "id": "abc123",
    "name": "Updated Revenue Name",
    "channel": "Targetron",
    "min": 60000,
    "max": 120000
}
```# Mass::Revenue Class Documentation

The `Mass::Revenue` class is part of the MassProspecting SaaS that manages revenue-related operations in the system. This class allows the insertion, updating, and retrieval of revenue data based on specific channels and other parameters. The class includes necessary validations to ensure the integrity and proper management of revenue records.

## 1. Insert

The `insert` operation allows you to add a new revenue record into the system.

### Required Fields

- `channel`: Specifies the channel associated with the revenue. It must be one of the following allowed values: "Apollo", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron", "ZeroBounce".
- `min`: An integer representing the minimum revenue value. Must be greater than or equal to 0.
- `max`: An integer representing the maximum revenue value. Must be greater than or equal to `min`.

### Optional Fields

- `name`: A string representing the name of the revenue record. It must be a valid string of less than 255 characters.

### Validations

- Mandatory fields (`channel`, `min`, `max`) must be present.
- The `channel` specified must exist in the account's list of channels.
- `min` and `max` must be integers where `min` is less than or equal to `max`.
- `name` must be a string under 255 characters.
- Ownership of the revenue record is validated by checking `id_account`.

### Example

To insert a new revenue record:

```json
{
    "name": "Quarterly Revenue",
    "channel": "LinkedIn",
    "min": 50000,
    "max": 100000
}
```

## 2. Page

The `page` operation retrieves a paginated list of revenue records.

### Required Fields

- `page`: Integer representing the page number for pagination. Defaults to 1 if not provided.
- `limit`: Integer representing the number of records per page. Defaults to 25 if not provided.

### Optional Fields

- `filters`: A hash with filters to be applied to the revenue records. Currently supports filtering by `name`.
- `order`: The field by which the results are ordered. Defaults to `id`.
- `asc`: Boolean to determine if the results should be sorted in ascending order. Defaults to true.

### Validations

- The `filters` hash can only contain allowed keys, e.g., `name`.
- The `name` filter uses a case-insensitive `LIKE` SQL query for matching.

### Example

To get a paginated list of revenue records:

```json
{
    "page": 1,
    "limit": 25,
    "filters": {
        "name": "Revenue Name"
    },
    "order": "create_time",
    "asc": true
}
```

## 3. Update

The `update` operation allows you to modify an existing revenue record.

### Required Fields

- `id`: The unique identifier of the revenue record to be updated.

### Optional Fields

- `name`: A string representing the new name of the revenue record. Must be a valid string of less than 255 characters.
- `channel`: Specifies the new channel associated with the revenue. It should be within the allowed channels.
- `min`: An updated minimum revenue value. Must be an integer greater than or equal to 0 and less than or equal to `max`.
- `max`: An updated maximum revenue value. Must be an integer greater than or equal to `min`.

### Validations

- The `id` must exist and be associated with the current account.
- Fields must meet the same criteria as in the insert operation.
- Changes to the channel must reference an existing channel for the account.

### Example

To update an existing revenue record:

```json
{
    "id": "abc123",
    "name": "Updated Revenue Name",
    "channel": "Targetron",
    "min": 60000,
    "max": 120000
}
```