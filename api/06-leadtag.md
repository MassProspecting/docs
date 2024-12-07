
# Mass::LeadTag API Documentation

## Overview

The `Mass::LeadTag` class is responsible for associating tags with leads in the MassProspecting system. It provides validation, error handling, and methods to insert, update, and list lead-tag associations.

---

## Insert Operation

### Endpoint

```
POST /api/leadtag/insert
```

### Required Fields

| Field       | Type   | Description                                    |
|-------------|--------|------------------------------------------------|
| `id_lead`   | String | The unique identifier of the lead.             |
| `name`      | String | The name of the tag to associate with the lead.|

### Optional Fields

| Field       | Type   | Description                                         |
|-------------|--------|-----------------------------------------------------|
| `id_user`   | String | The unique identifier of the user performing the operation.|
| `id_account`| String | The unique identifier of the account. This is typically added by access point listeners.|

### Validations

- **Ownership Validation**: Ensures the `id_account` and `id_user` belong to the same account.
- **Mandatory Validation**: `id_lead` and `name` are required fields.
- **Existence Validation**: The `id_lead` must refer to a valid lead within the account.

### Error Responses

| Error Message                                 | Description                                                |
|-----------------------------------------------|------------------------------------------------------------|
| `Unknown lead ({id_lead}).`                  | The specified lead does not exist for the account.         |
| `The id_account is required.`                | Missing `id_account` field.                                |
| `The id_user must belong to the account.`    | The `id_user` does not belong to the specified account.    |

### Example Request

```json
{
    "id_lead": "123e4567-e89b-12d3-a456-426614174000",
    "name": "VIP Client",
    "id_user": "987e6543-e21b-34d5-b678-426614174111"
}
```

---

## Update Operation

### Endpoint

```
POST /api/leadtag/update
```

### Required Fields

| Field       | Type   | Description                                    |
|-------------|--------|------------------------------------------------|
| `id_lead`   | String | The unique identifier of the lead.             |
| `name`      | String | The new tag name to associate with the lead.   |

### Optional Fields

| Field       | Type   | Description                                         |
|-------------|--------|-----------------------------------------------------|
| `id_user`   | String | The unique identifier of the user performing the operation.|
| `id_account`| String | The unique identifier of the account. This is typically added by access point listeners.|

### Validations

- **Ownership Validation**: Ensures the `id_account` and `id_user` belong to the same account.
- **Mandatory Validation**: `id_lead` and `name` are required fields.
- **Existence Validation**: The `id_lead` must refer to a valid lead within the account.

### Example Request

```json
{
    "id_lead": "123e4567-e89b-12d3-a456-426614174000",
    "name": "High Priority",
    "id_user": "987e6543-e21b-34d5-b678-426614174111"
}
```

---

## List Operation

### Endpoint

```
GET /api/leadtag/list
```

### Filters

| Filter       | Type   | Description                             |
|--------------|--------|-----------------------------------------|
| `id_lead`   | String | Filter by the unique identifier of a lead.|
| `id_company`| String | Filter by the unique identifier of a company.|

### Example Request

```
GET /api/leadtag/list?id_lead=123e4567-e89b-12d3-a456-426614174000
```

### Example Response

```json
[
    {
        "id": "321e6547-e89b-56d3-a456-426614174999",
        "id_account": "111e2227-a89b-34d3-a456-426614174aaa",
        "id_user": "987e6543-e21b-34d5-b678-426614174111",
        "id_lead": "123e4567-e89b-12d3-a456-426614174000",
        "name": "VIP Client",
        "create_time": "2024-06-07T12:34:56Z",
        "update_time": "2024-06-07T14:22:33Z",
        "delete_time": null
    }
]
```

---

## Validations Summary

- **Mandatory Fields**: `id_lead`, `name`
- **Ownership Checks**: `id_account`, `id_user`
- **Existence Checks**: `id_lead` must refer to a valid lead.
- **Allowed Keys**: `id_account`, `id_user`, `id_lead`, `name`

---

## Errors

- **Key Errors**: Invalid keys will return errors indicating which key is not allowed.
- **Ownership Errors**: Ensures `id_account` and `id_user` are valid.
- **Mandatory Errors**: Missing required fields like `id_lead` or `name`.

---

## Notes

- The `id_account` is typically managed by access point listeners and should not be included in request examples.
- Use the `upsert` operation to insert or update a lead tag in a single request.

