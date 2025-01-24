# MassProspecting Headcount Class API Documentation

The `Mass::Headcount` class in MassProspecting is used to manage headcount-related data for different channels. Each headcount entry has attributes such as name, channel, and a specified range (minimum and maximum). The class ensures data consistency through validation checks and provides mechanisms for insertion, updates, and pagination of headcount records.

## 1. Insert

### Required Fields
- `channel`: The name of the channel. Must be one of the following allowed values: "Apollo", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron", "ZeroBounce".
- `min`: The minimum value for the headcount range. Must be an integer greater than or equal to 0.
- `max`: The maximum value for the headcount range. Must be an integer greater than or equal to 0.

### Optional Fields
- `id_user`: The user ID associated with this headcount entry.
- `name`: A string representing the name of the headcount entry. The name must be less than 255 characters.

### Validations
- **Mandatory Errors**: `channel`, `min`, and `max` are required fields.
- **Integer Errors**: `min` and `max` must be integers between 0 and the maximum possible integer value.
- **Channel Validation**: The `channel` must match one of the allowed channel names.
- **String Validation**: The `name` must be a string and not exceed 255 characters.

### Example
To insert a new headcount record:

```json
{
  "channel": "LinkedIn",
  "min": 50,
  "max": 100,
  "id_user": "user-guid",
  "name": "LinkedIn Headcount"
}
```

## 2. Page

### Required Fields
- `page`: Indicates which page of results you want to retrieve. Default is 1 if not specified.
- `limit`: Specifies the number of records per page. Default is 25 if not specified.

### Optional Fields
- `filters`: A set of filters to apply when retrieving records. Supports filter by `name`.
- `order`: The field by which to sort the results. Default is `id`.
- `asc`: A boolean to indicate if the sort should be in ascending order. Default is `true` (ascending).

### Validations
- **Key Errors**: Filters must use allowed keys (`name`).
- **Unknown Filter Error**: If an unknown filter key is used, an error is raised.
- **Ordering**: Results can be ordered by any valid field.

### Example
To get a paginated list of headcount records:

```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "name": "LinkedIn"
  },
  "order": "create_time",
  "asc": false
}
```

## 3. Update

### Required Fields
- `id`: The unique identifier of the headcount entry to be updated.

### Optional Fields
- `channel`: The name of the channel. Must be one of the following allowed values: "Apollo", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron", "ZeroBounce".
- `min`: The minimum value for the headcount range. Must be an integer greater than or equal to 0.
- `max`: The maximum value for the headcount range. Must be an integer greater than or equal to 0.
- `name`: A string representing the name of the headcount entry. The name must be less than 255 characters.

### Validations
- **Mandatory Errors**: `id` is required for an update.
- **Integer Errors**: `min` and `max` must be integers between 0 and the maximum possible integer value.
- **Channel Validation**: The `channel` must match one of the allowed channel names.
- **String Validation**: The `name` must be a string and not exceed 255 characters.

### Example
To update an existing headcount record:

```json
{
  "id": "headcount-guid",
  "channel": "GMail",
  "min": 75,
  "max": 150,
  "name": "Updated GMail Headcount"
}
```# MassProspecting Headcount Class API Documentation

The `Mass::Headcount` class in MassProspecting is used to manage headcount-related data for different channels. Each headcount entry has attributes such as name, channel, and a specified range (minimum and maximum). The class ensures data consistency through validation checks and provides mechanisms for insertion, updates, and pagination of headcount records.

## 1. Insert

### Required Fields
- `channel`: The name of the channel. Must be one of the following allowed values: "Apollo", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron", "ZeroBounce".
- `min`: The minimum value for the headcount range. Must be an integer greater than or equal to 0.
- `max`: The maximum value for the headcount range. Must be an integer greater than or equal to 0.

### Optional Fields
- `id_user`: The user ID associated with this headcount entry.
- `name`: A string representing the name of the headcount entry. The name must be less than 255 characters.

### Validations
- **Mandatory Errors**: `channel`, `min`, and `max` are required fields.
- **Integer Errors**: `min` and `max` must be integers between 0 and the maximum possible integer value.
- **Channel Validation**: The `channel` must match one of the allowed channel names.
- **String Validation**: The `name` must be a string and not exceed 255 characters.

### Example
To insert a new headcount record:

```json
{
  "channel": "LinkedIn",
  "min": 50,
  "max": 100,
  "id_user": "user-guid",
  "name": "LinkedIn Headcount"
}
```

## 2. Page

### Required Fields
- `page`: Indicates which page of results you want to retrieve. Default is 1 if not specified.
- `limit`: Specifies the number of records per page. Default is 25 if not specified.

### Optional Fields
- `filters`: A set of filters to apply when retrieving records. Supports filter by `name`.
- `order`: The field by which to sort the results. Default is `id`.
- `asc`: A boolean to indicate if the sort should be in ascending order. Default is `true` (ascending).

### Validations
- **Key Errors**: Filters must use allowed keys (`name`).
- **Unknown Filter Error**: If an unknown filter key is used, an error is raised.
- **Ordering**: Results can be ordered by any valid field.

### Example
To get a paginated list of headcount records:

```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "name": "LinkedIn"
  },
  "order": "create_time",
  "asc": false
}
```

## 3. Update

### Required Fields
- `id`: The unique identifier of the headcount entry to be updated.

### Optional Fields
- `channel`: The name of the channel. Must be one of the following allowed values: "Apollo", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron", "ZeroBounce".
- `min`: The minimum value for the headcount range. Must be an integer greater than or equal to 0.
- `max`: The maximum value for the headcount range. Must be an integer greater than or equal to 0.
- `name`: A string representing the name of the headcount entry. The name must be less than 255 characters.

### Validations
- **Mandatory Errors**: `id` is required for an update.
- **Integer Errors**: `min` and `max` must be integers between 0 and the maximum possible integer value.
- **Channel Validation**: The `channel` must match one of the allowed channel names.
- **String Validation**: The `name` must be a string and not exceed 255 characters.

### Example
To update an existing headcount record:

```json
{
  "id": "headcount-guid",
  "channel": "GMail",
  "min": 75,
  "max": 150,
  "name": "Updated GMail Headcount"
}
```