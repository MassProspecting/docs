# Mass::Company API Documentation

The `Mass::Company` class is designed for managing company-related data within the MassProspecting SaaS. It allows for operations like inserting, updating, paging, and validating company information, including details such as name, domain, contact information, and additional metadata.

## Insert

### Required Fields
- `id_user`: GUID of the user. Must exist and belong to the account.
- `domain`: String. Must be a valid domain.

### Optional Fields
- `name`: String. Must be less than 255 characters.
- `headcount`: Referenced by `Mass::Headcount` and must exist.
- `revenue`: Referenced by `Mass::Revenue` and must exist.
- `country`: String. Must be a valid country name.
- `location`: Referenced by `Mass::Location` and must exist.
- `timezone`: String. Must be a valid timezone description.
- `email_verification_result`: Must be one of `any`, `pending`, `valid`, `invalid`, `catchall`, `role`, `unknown`, `disabled`, `disposable`, `inbox_full`, `role_account`, `spamtrap`.
- `data`: Array of data descriptors.
- Other URL-validated fields include `picture_url_dropbox`, `email`, `linkedin`, `facebook`, `indeed`, `apollo`, and `snapshot_url`.

### Validations
- Must pass domain, email, LinkedIn, Facebook, Indeed, and Apollo URL validations.
- `data` must be an array if provided.
- Ownership checks to ensure `id_user` belongs to `id_account`.

### Example
```json
POST /ajax/company/insert.json
{
    "id_user": "user-guid-here",
    "domain": "example.com",
    "name": "Example Company",
    "headcount": "10-50",
    "country": "United States",
    "email": "contact@example.com"
}
```

## Page

### Required Fields
- `page`: Integer. The page number to retrieve (default is 1).
- `limit`: Integer. The number of records per page (default is 25).

### Optional Fields
- `filters`: A set of filters can be applied based on `name`, `country`, `location`, `email`, `domain`, `phone`, `linkedin`, `facebook`, `indeed`, and `apollo`.

### Validations
- Filters require valid field names.
- `order` and `asc` parameters control sorting.

### Example
```json
POST /ajax/company/page.json
{
    "page": 1,
    "limit": 10,
    "filters": {
        "country": "United States"
    },
    "order": "create_time",
    "asc": true
}
```

## Update

### Required Fields
- `id`: GUID of the company to be updated. Must exist.

### Optional Fields
- Any field that is available during insert can be updated, subject to the same validation rules.

### Validations
- Must conform to the same validation rules as insert.
- Ownership checks to ensure `id_user` belongs to `id_account`.

### Example
```json
POST /ajax/company/update.json
{
    "id": "company-guid-here",
    "name": "Updated Example Company",
    "email": "newcontact@example.com"
}
```# Mass::Company API Documentation

The `Mass::Company` class is designed for managing company-related data within the MassProspecting SaaS. It allows for operations like inserting, updating, paging, and validating company information, including details such as name, domain, contact information, and additional metadata.

## Insert

### Required Fields
- `id_user`: GUID of the user. Must exist and belong to the account.
- `domain`: String. Must be a valid domain.

### Optional Fields
- `name`: String. Must be less than 255 characters.
- `headcount`: Referenced by `Mass::Headcount` and must exist.
- `revenue`: Referenced by `Mass::Revenue` and must exist.
- `country`: String. Must be a valid country name.
- `location`: Referenced by `Mass::Location` and must exist.
- `timezone`: String. Must be a valid timezone description.
- `email_verification_result`: Must be one of `any`, `pending`, `valid`, `invalid`, `catchall`, `role`, `unknown`, `disabled`, `disposable`, `inbox_full`, `role_account`, `spamtrap`.
- `data`: Array of data descriptors.
- Other URL-validated fields include `picture_url_dropbox`, `email`, `linkedin`, `facebook`, `indeed`, `apollo`, and `snapshot_url`.

### Validations
- Must pass domain, email, LinkedIn, Facebook, Indeed, and Apollo URL validations.
- `data` must be an array if provided.
- Ownership checks to ensure `id_user` belongs to `id_account`.

### Example
```json
POST /ajax/company/insert.json
{
    "id_user": "user-guid-here",
    "domain": "example.com",
    "name": "Example Company",
    "headcount": "10-50",
    "country": "United States",
    "email": "contact@example.com"
}
```

## Page

### Required Fields
- `page`: Integer. The page number to retrieve (default is 1).
- `limit`: Integer. The number of records per page (default is 25).

### Optional Fields
- `filters`: A set of filters can be applied based on `name`, `country`, `location`, `email`, `domain`, `phone`, `linkedin`, `facebook`, `indeed`, and `apollo`.

### Validations
- Filters require valid field names.
- `order` and `asc` parameters control sorting.

### Example
```json
POST /ajax/company/page.json
{
    "page": 1,
    "limit": 10,
    "filters": {
        "country": "United States"
    },
    "order": "create_time",
    "asc": true
}
```

## Update

### Required Fields
- `id`: GUID of the company to be updated. Must exist.

### Optional Fields
- Any field that is available during insert can be updated, subject to the same validation rules.

### Validations
- Must conform to the same validation rules as insert.
- Ownership checks to ensure `id_user` belongs to `id_account`.

### Example
```json
POST /ajax/company/update.json
{
    "id": "company-guid-here",
    "name": "Updated Example Company",
    "email": "newcontact@example.com"
}
```