# Mass::Location Class API Documentation

The `Mass::Location` class is a part of the API for managing location data associated with user accounts in the MassProspecting SaaS platform. It supports basic CRUD operations and utilizes several modules for handling data validation and storage operations. The class ensures that all data operations comply with predefined validation rules and ownership constraints to maintain data integrity.

## 1. Insert

- **Required Fields:**
  - `channel`: The channel associated with the location. This must be one of the allowed values.
  
- **Optional Fields:**
  - `id`
  - `id_user`
  - `name`

- **Validations:**
  - `channel` must be provided and must be one of the following allowed values: "Apollo", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron", "ZeroBounce".
  - `name` must be a string with a maximum length of 255 characters and must be unique.
  - Ensure that the `id_user` is a valid GUID and exists within the current account.

- **Example:**

```json
{
  "name": "San Francisco",
  "channel": "LinkedIn"
}
```

## 2. Page

- **Required Fields:**
  - `page`: The page number to retrieve, starting from 1.
  - `limit`: The maximum number of records to retrieve per page.

- **Optional Fields:**
  - `filters`: A set of filters to apply for narrowing down the results. Currently supports filtering by `name`.
  - `order`: Field name to sort the results by. Default is "id".
  - `asc`: Boolean flag to determine the order of sorting. Default is true (ascending order).

- **Validations:**
  - Ensure that `filters` only include valid keys: `name`.
  - `name` filter supports partial matches using the SQL `LIKE` syntax.

- **Example:**

```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "name": "New York"
  },
  "order": "name",
  "asc": true
}
```

## 3. Update

- **Required Fields:**
  - `id`: The unique identifier of the location record to update.

- **Optional Fields:**
  - `name`
  - `channel`

- **Validations:**
  - `channel`, if provided, must be one of the following allowed values: "Apollo", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron", "ZeroBounce".
  - `name` must be a string with a maximum length of 255 characters.

- **Example:**

```json
{
  "id": "5d6ede6a0ba62570afcedd3a",
  "name": "Madrid",
  "channel": "Facebook"
}
```# Mass::Location Class API Documentation

The `Mass::Location` class is a part of the API for managing location data associated with user accounts in the MassProspecting SaaS platform. It supports basic CRUD operations and utilizes several modules for handling data validation and storage operations. The class ensures that all data operations comply with predefined validation rules and ownership constraints to maintain data integrity.

## 1. Insert

- **Required Fields:**
  - `channel`: The channel associated with the location. This must be one of the allowed values.
  
- **Optional Fields:**
  - `id`
  - `id_user`
  - `name`

- **Validations:**
  - `channel` must be provided and must be one of the following allowed values: "Apollo", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron", "ZeroBounce".
  - `name` must be a string with a maximum length of 255 characters and must be unique.
  - Ensure that the `id_user` is a valid GUID and exists within the current account.

- **Example:**

```json
{
  "name": "San Francisco",
  "channel": "LinkedIn"
}
```

## 2. Page

- **Required Fields:**
  - `page`: The page number to retrieve, starting from 1.
  - `limit`: The maximum number of records to retrieve per page.

- **Optional Fields:**
  - `filters`: A set of filters to apply for narrowing down the results. Currently supports filtering by `name`.
  - `order`: Field name to sort the results by. Default is "id".
  - `asc`: Boolean flag to determine the order of sorting. Default is true (ascending order).

- **Validations:**
  - Ensure that `filters` only include valid keys: `name`.
  - `name` filter supports partial matches using the SQL `LIKE` syntax.

- **Example:**

```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "name": "New York"
  },
  "order": "name",
  "asc": true
}
```

## 3. Update

- **Required Fields:**
  - `id`: The unique identifier of the location record to update.

- **Optional Fields:**
  - `name`
  - `channel`

- **Validations:**
  - `channel`, if provided, must be one of the following allowed values: "Apollo", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron", "ZeroBounce".
  - `name` must be a string with a maximum length of 255 characters.

- **Example:**

```json
{
  "id": "5d6ede6a0ba62570afcedd3a",
  "name": "Madrid",
  "channel": "Facebook"
}
```