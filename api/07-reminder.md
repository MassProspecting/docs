# Mass::Reminder

Mass::Reminder is a class used to facilitate the creation, retrieval, and management of reminders associated with leads within the MassProspecting SaaS platform. It allows users to set notes, deadlines, and completion statuses for reminders, ensuring effective lead management.

## Insert

To insert a new reminder, you need to provide certain fields, and adhere to specific validations and constraints.

### Required Fields

- `id_lead`: The ID of the lead associated with the reminder. This must be a valid lead associated with the account.
- `deadline`: The date for the deadline of the reminder. Must be in a date format.
- `note`: A textual note for the reminder. Must be a string.

### Optional Fields

- `completed`: A boolean indicating whether the reminder has been completed. Defaults to false if not provided.

### Validations

- `id_lead` must correspond to an existing lead under the same account.
- `deadline` must be a valid date string.
- `note` must be a string.
- `completed` must be a boolean (true or false).

### Example

```json
{
  "id_lead": "lead-guid",
  "deadline": "2023-10-30",
  "note": "Follow-up on proposal",
  "completed": false
}
```

## Page

The `page.json` endpoint fetches a paginated list of reminders based on given filters and pagination options.

### Required Fields

- `page`: Integer indicating the page number to retrieve. Defaults to 1 if not provided.

### Optional Fields

- `limit`: Integer indicating the number of records per page. Defaults to 25 if not provided.
- `filters`: A hash of filters to apply on the reminders. Supported filters are:
  - `id_lead`: Filter reminders by lead ID.
  - `id_company`: Filter reminders by company ID (not directly validated in the source but implied for context).
- `order`: The field by which to order the results. Defaults to ordering by `id`.
- `asc`: Boolean indicating if the ordering should be ascending. Defaults to true.

### Validations

- Ensure provided `id_lead` is valid and exists for the given account.
- Ensure pagination inputs (`page` and `limit`) are integers and within reasonable limits.

### Example

```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "id_lead": "lead-guid"
  },
  "order": "deadline",
  "asc": true
}
```

## Update

To update an existing reminder, you need to provide the specific fields that require changes.

### Required Fields

- `id`: The ID of the reminder to be updated.

### Optional Fields

- `id_lead`: New lead ID if you want to associate the reminder with another lead.
- `deadline`: New deadline date for the reminder.
- `note`: Updated note for the reminder.
- `completed`: Updated completion status.

### Validations

- Ensure `id` corresponds to an existing reminder.
- `id_lead` must be a valid lead ID, and under the same account.
- `deadline` must be in a valid date format.
- `note` must be a string.
- `completed` should be a boolean.

### Example

```json
{
  "id": "reminder-guid",
  "deadline": "2023-11-15",
  "note": "Send a follow-up email",
  "completed": true
}
```# Mass::Reminder

Mass::Reminder is a class used to facilitate the creation, retrieval, and management of reminders associated with leads within the MassProspecting SaaS platform. It allows users to set notes, deadlines, and completion statuses for reminders, ensuring effective lead management.

## Insert

To insert a new reminder, you need to provide certain fields, and adhere to specific validations and constraints.

### Required Fields

- `id_lead`: The ID of the lead associated with the reminder. This must be a valid lead associated with the account.
- `deadline`: The date for the deadline of the reminder. Must be in a date format.
- `note`: A textual note for the reminder. Must be a string.

### Optional Fields

- `completed`: A boolean indicating whether the reminder has been completed. Defaults to false if not provided.

### Validations

- `id_lead` must correspond to an existing lead under the same account.
- `deadline` must be a valid date string.
- `note` must be a string.
- `completed` must be a boolean (true or false).

### Example

```json
{
  "id_lead": "lead-guid",
  "deadline": "2023-10-30",
  "note": "Follow-up on proposal",
  "completed": false
}
```

## Page

The `page.json` endpoint fetches a paginated list of reminders based on given filters and pagination options.

### Required Fields

- `page`: Integer indicating the page number to retrieve. Defaults to 1 if not provided.

### Optional Fields

- `limit`: Integer indicating the number of records per page. Defaults to 25 if not provided.
- `filters`: A hash of filters to apply on the reminders. Supported filters are:
  - `id_lead`: Filter reminders by lead ID.
  - `id_company`: Filter reminders by company ID (not directly validated in the source but implied for context).
- `order`: The field by which to order the results. Defaults to ordering by `id`.
- `asc`: Boolean indicating if the ordering should be ascending. Defaults to true.

### Validations

- Ensure provided `id_lead` is valid and exists for the given account.
- Ensure pagination inputs (`page` and `limit`) are integers and within reasonable limits.

### Example

```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "id_lead": "lead-guid"
  },
  "order": "deadline",
  "asc": true
}
```

## Update

To update an existing reminder, you need to provide the specific fields that require changes.

### Required Fields

- `id`: The ID of the reminder to be updated.

### Optional Fields

- `id_lead`: New lead ID if you want to associate the reminder with another lead.
- `deadline`: New deadline date for the reminder.
- `note`: Updated note for the reminder.
- `completed`: Updated completion status.

### Validations

- Ensure `id` corresponds to an existing reminder.
- `id_lead` must be a valid lead ID, and under the same account.
- `deadline` must be in a valid date format.
- `note` must be a string.
- `completed` should be a boolean.

### Example

```json
{
  "id": "reminder-guid",
  "deadline": "2023-11-15",
  "note": "Send a follow-up email",
  "completed": true
}
```