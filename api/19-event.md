# Mass::Event

The `Mass::Event` class is responsible for managing events in the MassProspecting platform. It includes methods for inserting, updating, and retrieving events, along with validation mechanisms for ensuring data integrity. Events can be associated with leads or companies and may include various metadata such as URLs, titles, and content descriptions.

## Insert

To insert an event, the following fields are required and optional:

- **Required Fields:**
  - `url`: A string representing the URL associated with the event.

- **Optional Fields:**
  - `id_job`: A string identifying a job. Must exist and belong to the account.
  - `lead`: A hash representing a lead descriptor. Cannot be present if `company` is present.
  - `company`: A hash representing a company descriptor. Cannot be present if `lead` is present.
  - `title`: A string representing the title of the event.
  - `content`: A string representing the content of the event.
  - `pictures`: An array of picture URLs.
  - `snapshot_url`: A string representing the URL of a snapshot.
  - `lead_desc`: A description of the lead in the form of a hash.
  - `company_desc`: A description of the company in the form of a hash.

- **Validations:**
  - The `url` field is required and must be a valid URL in string format.
  - Either `lead` or `company` can be present, but not both.
  - If `id_job` is provided, it must exist for the account and be valid.
  - `lead` and `company` should be valid descriptors if provided.

- **Example:**
  ```json
  {
    "url": "https://example.com/event",
    "lead": {
      "id_account": "your-account-id",
      "lead_specific_field": "value"
    },
    "title": "Event Title",
    "content": "Event content goes here."
  }
  ```

## Page

The `page.json` endpoint allows you to retrieve a paginated list of events with optional filtering, ordering, and sorting.

- **Required Fields:**
  - `page`: Integer for the page number (default is 1).

- **Optional Fields:**
  - `limit`: Integer for the number of results per page (default is 25).
  - `filters`: A hash for filtering results based on `url` and `has_snapshot`.
  - `order`: The field by which to order the results (default is by `id`).
  - `asc`: Boolean value to determine ascending order (default is true).

- **Validations:**
  - `has_snapshot` filter must be a boolean value.
  - `url` filter must be a string and will perform a case-insensitive partial match.

- **Example:**
  ```json
  {
    "page": 1,
    "limit": 25,
    "filters": {
      "url": "https://example.com",
      "has_snapshot": true
    },
    "order": "create_time",
    "asc": true
  }
  ```

## Update

To update an existing event, certain fields are required:

- **Required Fields:**
  - `id`: The unique identifier of the event to update.

- **Optional Fields:**
  - Any field allowed during insertion can be updated with the same rules and validations.

- **Validations:**
  - The `id` must exist for the account.
  - Updated fields should meet the same validation criteria as during insertion.

- **Example:**
  ```json
  {
    "id": "event-id",
    "title": "Updated Event Title",
    "content": "Updated content for this event.",
    "url": "https://example.com/updated-event"
  }
  ```# Mass::Event

The `Mass::Event` class is responsible for managing events in the MassProspecting platform. It includes methods for inserting, updating, and retrieving events, along with validation mechanisms for ensuring data integrity. Events can be associated with leads or companies and may include various metadata such as URLs, titles, and content descriptions.

## Insert

To insert an event, the following fields are required and optional:

- **Required Fields:**
  - `url`: A string representing the URL associated with the event.

- **Optional Fields:**
  - `id_job`: A string identifying a job. Must exist and belong to the account.
  - `lead`: A hash representing a lead descriptor. Cannot be present if `company` is present.
  - `company`: A hash representing a company descriptor. Cannot be present if `lead` is present.
  - `title`: A string representing the title of the event.
  - `content`: A string representing the content of the event.
  - `pictures`: An array of picture URLs.
  - `snapshot_url`: A string representing the URL of a snapshot.
  - `lead_desc`: A description of the lead in the form of a hash.
  - `company_desc`: A description of the company in the form of a hash.

- **Validations:**
  - The `url` field is required and must be a valid URL in string format.
  - Either `lead` or `company` can be present, but not both.
  - If `id_job` is provided, it must exist for the account and be valid.
  - `lead` and `company` should be valid descriptors if provided.

- **Example:**
  ```json
  {
    "url": "https://example.com/event",
    "lead": {
      "id_account": "your-account-id",
      "lead_specific_field": "value"
    },
    "title": "Event Title",
    "content": "Event content goes here."
  }
  ```

## Page

The `page.json` endpoint allows you to retrieve a paginated list of events with optional filtering, ordering, and sorting.

- **Required Fields:**
  - `page`: Integer for the page number (default is 1).

- **Optional Fields:**
  - `limit`: Integer for the number of results per page (default is 25).
  - `filters`: A hash for filtering results based on `url` and `has_snapshot`.
  - `order`: The field by which to order the results (default is by `id`).
  - `asc`: Boolean value to determine ascending order (default is true).

- **Validations:**
  - `has_snapshot` filter must be a boolean value.
  - `url` filter must be a string and will perform a case-insensitive partial match.

- **Example:**
  ```json
  {
    "page": 1,
    "limit": 25,
    "filters": {
      "url": "https://example.com",
      "has_snapshot": true
    },
    "order": "create_time",
    "asc": true
  }
  ```

## Update

To update an existing event, certain fields are required:

- **Required Fields:**
  - `id`: The unique identifier of the event to update.

- **Optional Fields:**
  - Any field allowed during insertion can be updated with the same rules and validations.

- **Validations:**
  - The `id` must exist for the account.
  - Updated fields should meet the same validation criteria as during insertion.

- **Example:**
  ```json
  {
    "id": "event-id",
    "title": "Updated Event Title",
    "content": "Updated content for this event.",
    "url": "https://example.com/updated-event"
  }
  ```