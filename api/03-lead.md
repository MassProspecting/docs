# MassProspecting API Documentation: `lead` Class

## Insert

### Required Fields

| Field               | Type    | Description                                     |
|---------------------|---------|-------------------------------------------------|
| first_name / name   | String  | The first name or full name of the lead (at least one is required). |
| email               | String  | The email address of the lead.                 |

### Optional Fields

| Field               | Type    | Description                                     |
|---------------------|---------|-------------------------------------------------|
| middle_name         | String  | The middle name of the lead.                   |
| last_name           | String  | The last name of the lead.                     |
| job_title           | String  | The job title of the lead.                     |
| country             | String  | The country of the lead.                       |
| timezone            | String  | The timezone of the lead.                      |
| phone               | String  | The phone number of the lead.                  |
| linkedin            | String  | LinkedIn profile URL of the lead.              |
| facebook            | String  | Facebook profile URL of the lead.              |
| company             | Object  | Company information related to the lead.       |
| data                | Array   | Additional data descriptors related to the lead.|
| tags                | Array   | List of tags associated with the lead.         |
| picture_url_dropbox | String  | Dropbox URL of the lead's picture.             |

### Validations

| Field               | Validation                                                 |
|---------------------|------------------------------------------------------------|
| email               | Must be a valid email address.                            |
| linkedin            | Must be a valid LinkedIn URL.                             |
| facebook            | Must be a valid Facebook URL.                             |
| country             | Must be a recognized country.                             |
| timezone            | Must be a recognized timezone.                            |

### Example Request

```json
{
    "first_name": "John",
    "last_name": "Doe",
    "email": "john.doe@example.com",
    "job_title": "Software Engineer",
    "country": "United States",
    "timezone": "America/New_York",
    "linkedin": "https://www.linkedin.com/in/johndoe",
    "tags": ["important", "developer"]
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
| filters   | Object  | Key-value pairs to filter leads (e.g., by `name`, `email`). |
| order     | String  | Field to order the results by (default is 'id').   |
| asc       | Boolean | Set to `true` for ascending order (default is `true`). |

### Example Request

```json
{
    "page": 1,
    "limit": 25,
    "filters": {
        "first_name": "John",
        "email": "john.doe@example.com"
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
| id            | String  | The unique identifier of the lead to update.     |

### Optional Fields

Same as the fields allowed in the **Insert** operation.

### Example Request

```json
{
    "id": "550e8400-e29b-41d4-a716-446655440000",
    "first_name": "Jane",
    "last_name": "Smith",
    "email": "jane.smith@example.com",
    "job_title": "Product Manager",
    "linkedin": "https://www.linkedin.com/in/janesmith"
}
```
