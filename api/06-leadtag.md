# Mass::LeadTag API Documentation

The `Mass::LeadTag` class is an integral part of the MassProspecting API, responsible for managing tags associated with leads. It offers functionalities to insert, update, and list tags for leads. This class ensures data integrity through validations and ownership rules, making it essential for categorizing leads efficiently.

## 1. Insert

The `insert.json` endpoint allows the creation of a new LeadTag with specific attributes.

### Required Fields:
- **id_lead**: The unique identifier of the lead. It must exist and belong to the same account.
- **name**: The name of the tag. It must be a string and cannot exceed 255 characters.

### Optional Fields:
- **id_user**: The identifier of the user. Must be associated with the account.

### Validations:
- The `id_lead` must refer to an existing lead within the same account.
- The `name` should be a non-empty string with a maximum length of 255 characters.
- The `id_user` must exist and belong to the specified account.

### Example:
```json
{
    "id_lead": "lead-guid",
    "name": "Prospect",
    "id_user": "user-guid"
}
```

## 2. Page

The `page.json` endpoint retrieves a list of LeadTags based on filters and pagination parameters.

### Required Fields:
- None

### Optional Fields:
- **filters**: 
  - `id_lead`: Filter tags by a specific lead.
  - `id_company`: Filter tags connected to a specific company.

- **page**: The page number to retrieve. Defaults to 1.
- **limit**: The number of entries per page. Defaults to 25.
- **order**: The field to sort the results by. Defaults to `id`.
- **asc**: Boolean indicating ascending (`true`) or descending (`false`) order. Defaults to `true`.

### Validations:
- Filters must adhere to allowed keys (`id_lead`, `id_company`).
-  `order` should be a valid field in the LeadTag dataset.

### Example:
```json
{
    "filters": {
        "id_lead": "lead-guid"
    },
    "page": 1,
    "limit": 10,
    "order": "create_time",
    "asc": true
}
```

## 3. Update

The `update.json` endpoint modifies the details of an existing LeadTag.

### Required Fields:
- **id**: The identifier of the LeadTag to update.
- **id_lead**: The new or existing lead identifier.

### Optional Fields:
- **name**: The new name for the tag.

### Validations:
- The `id` must exist and belong to the account.
- The `id_lead` must reference an existing lead within the account.
- The `name`, if provided, must be a string no longer than 255 characters.

### Example:
```json
{
    "id": "leadtag-guid",
    "id_lead": "new-lead-guid",
    "name": "Updated Tag Name"
}
```

This structured documentation provides clear instructions on how to interact with the `Mass::LeadTag` class, including field requirements, validation rules, and usage examples for each of the key operations supported by our API.# Mass::LeadTag API Documentation

The `Mass::LeadTag` class is an integral part of the MassProspecting API, responsible for managing tags associated with leads. It offers functionalities to insert, update, and list tags for leads. This class ensures data integrity through validations and ownership rules, making it essential for categorizing leads efficiently.

## 1. Insert

The `insert.json` endpoint allows the creation of a new LeadTag with specific attributes.

### Required Fields:
- **id_lead**: The unique identifier of the lead. It must exist and belong to the same account.
- **name**: The name of the tag. It must be a string and cannot exceed 255 characters.

### Optional Fields:
- **id_user**: The identifier of the user. Must be associated with the account.

### Validations:
- The `id_lead` must refer to an existing lead within the same account.
- The `name` should be a non-empty string with a maximum length of 255 characters.
- The `id_user` must exist and belong to the specified account.

### Example:
```json
{
    "id_lead": "lead-guid",
    "name": "Prospect",
    "id_user": "user-guid"
}
```

## 2. Page

The `page.json` endpoint retrieves a list of LeadTags based on filters and pagination parameters.

### Required Fields:
- None

### Optional Fields:
- **filters**: 
  - `id_lead`: Filter tags by a specific lead.
  - `id_company`: Filter tags connected to a specific company.

- **page**: The page number to retrieve. Defaults to 1.
- **limit**: The number of entries per page. Defaults to 25.
- **order**: The field to sort the results by. Defaults to `id`.
- **asc**: Boolean indicating ascending (`true`) or descending (`false`) order. Defaults to `true`.

### Validations:
- Filters must adhere to allowed keys (`id_lead`, `id_company`).
-  `order` should be a valid field in the LeadTag dataset.

### Example:
```json
{
    "filters": {
        "id_lead": "lead-guid"
    },
    "page": 1,
    "limit": 10,
    "order": "create_time",
    "asc": true
}
```

## 3. Update

The `update.json` endpoint modifies the details of an existing LeadTag.

### Required Fields:
- **id**: The identifier of the LeadTag to update.
- **id_lead**: The new or existing lead identifier.

### Optional Fields:
- **name**: The new name for the tag.

### Validations:
- The `id` must exist and belong to the account.
- The `id_lead` must reference an existing lead within the account.
- The `name`, if provided, must be a string no longer than 255 characters.

### Example:
```json
{
    "id": "leadtag-guid",
    "id_lead": "new-lead-guid",
    "name": "Updated Tag Name"
}
```

This structured documentation provides clear instructions on how to interact with the `Mass::LeadTag` class, including field requirements, validation rules, and usage examples for each of the key operations supported by our API.