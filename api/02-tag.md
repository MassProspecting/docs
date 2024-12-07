# MassProspecting API Documentation: `tag` Class

## Insert

### Required Fields

| Field         | Type    | Description                                     |
|---------------|---------|-------------------------------------------------|
| name          | String  | The name of the tag.                            |

### Optional Fields

| Field         | Type    | Description                                     |
|---------------|---------|-------------------------------------------------|
| color_code    | String  | The color code for the tag. Must be a valid key from the palette. |

### Validations

| Field         | Validation                                                  |
|---------------|-------------------------------------------------------------|
| name          | Required and must be a string of fewer than 255 characters.|
| color_code    | Must be a valid color code from the palette.               |

### Allowed Values

- **color_code**: red, green, blue, yellow, orange, cyan, magenta, white, gray, maroon, olive, navy, purple, teal, light_blue, light_green, light_red, black

### Example Request

```json
{
    "name": "Important",
    "color_code": "red"
}
```

---

## Page

### Required Fields

- None.

### Optional Fields

| Field     | Type    | Description                                        |
|-----------|---------|----------------------------------------------------|
| page      | Integer | The page number to retrieve (default is 1).        |
| limit     | Integer | The number of records per page (default is 25).    |
| filters   | Object  | Key-value pairs to filter tags (e.g., by `name`).  |
| order     | String  | Field to order the results by (default is 'id').   |
| asc       | Boolean | Set to `true` for ascending order (default is `true`). |

### Example Request

```json
{
    "page": 1,
    "limit": 25,
    "filters": {
        "name": "Important"
    },
    "order": "create_time",
    "asc": false
}
```

---

## Update

### Required Fields

| Field         | Type    | Description                                      |
|---------------|---------|--------------------------------------------------|
| id            | String  | The unique identifier of the tag to update.      |

### Optional Fields

Same as the fields allowed in the **Insert** operation.

### Example Request

```json
{
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "name": "Urgent",
    "color_code": "yellow"
}
```
