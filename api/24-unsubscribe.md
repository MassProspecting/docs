# Mass::Unsubscribe

The `Mass::Unsubscribe` class handles the operations related to managing unsubscribe records in the MassProspecting service. This class is responsible for ensuring that unsubscriptions are properly recorded and validated according to the system's requirements. It offers functionalities for inserting, updating, and paginating unsubscribe records while maintaining the integrity of the data through various checks and validations.

## Insert

- **Required Fields:**
  - `id_outreach`: The unique identifier for the outreach that led to the unsubscribe action. This field must be provided and valid.

- **Optional Fields:**
  - `id_user`: The identifier for the user associated with the unsubscribe action. If provided, it will be associated with the record.

- **Validations:**
  - The `id_outreach` is mandatory and must correspond to a valid outreach record within the account's scope. 
  - The `id_user`, if provided, must be a valid GUID and exist in the system.

- **Example:**
  ```json
  {
    "id_outreach": "valid-outreach-id-guid",
    "id_user": "optional-user-id-guid"
  }
  ```

## Page

- **Required Fields:**
  - `page`: The page number to retrieve. Defaults to 1 if not provided.
  - `limit`: The number of records per page. Defaults to 25 if not specified.

- **Optional Fields:**
  - `filters`: A hash of filters for narrowing down the list of unsubscribes. Supported filter keys are `id_lead` and `id_company`.
  - `order`: The field by which the results should be ordered.
  - `asc`: Boolean indicating if the order should be ascending (true) or descending (false).

- **Validations:**
  - Filter keys must be valid fields within the unsubscribe context.
  - If ordering is specified, the field must be valid and exist in the context of unsubscribes.

- **Example:**
  ```json
  {
    "page": 1,
    "limit": 25,
    "filters": {
      "id_lead": "valid-lead-id-guid"
    },
    "order": "create_time",
    "asc": true
  }
  ```

## Update

- **Required Fields:**
  - `id_outreach`: The unique identifier of the outreach that led to the unsubscribe action. This field must be present and valid for updates.

- **Optional Fields:**
  - `id_user`: The identifier for the user associated with the unsubscribe action. This can be updated if provided.

- **Validations:**
  - `id_outreach` is mandatory and must exist as a valid record for the account.
  - The `id_user`, if provided, must be a valid GUID and exist in the system.

- **Example:**
  ```json
  {
    "id_outreach": "existing-outreach-id-guid",
    "id_user": "optional-new-user-id-guid"
  }
  ```

By using the `Mass::Unsubscribe` class, users can effectively manage their unsubscribe records, ensuring all interactions remain appropriate and valid within the system's rules and constraints.# Mass::Unsubscribe

The `Mass::Unsubscribe` class handles the operations related to managing unsubscribe records in the MassProspecting service. This class is responsible for ensuring that unsubscriptions are properly recorded and validated according to the system's requirements. It offers functionalities for inserting, updating, and paginating unsubscribe records while maintaining the integrity of the data through various checks and validations.

## Insert

- **Required Fields:**
  - `id_outreach`: The unique identifier for the outreach that led to the unsubscribe action. This field must be provided and valid.

- **Optional Fields:**
  - `id_user`: The identifier for the user associated with the unsubscribe action. If provided, it will be associated with the record.

- **Validations:**
  - The `id_outreach` is mandatory and must correspond to a valid outreach record within the account's scope. 
  - The `id_user`, if provided, must be a valid GUID and exist in the system.

- **Example:**
  ```json
  {
    "id_outreach": "valid-outreach-id-guid",
    "id_user": "optional-user-id-guid"
  }
  ```

## Page

- **Required Fields:**
  - `page`: The page number to retrieve. Defaults to 1 if not provided.
  - `limit`: The number of records per page. Defaults to 25 if not specified.

- **Optional Fields:**
  - `filters`: A hash of filters for narrowing down the list of unsubscribes. Supported filter keys are `id_lead` and `id_company`.
  - `order`: The field by which the results should be ordered.
  - `asc`: Boolean indicating if the order should be ascending (true) or descending (false).

- **Validations:**
  - Filter keys must be valid fields within the unsubscribe context.
  - If ordering is specified, the field must be valid and exist in the context of unsubscribes.

- **Example:**
  ```json
  {
    "page": 1,
    "limit": 25,
    "filters": {
      "id_lead": "valid-lead-id-guid"
    },
    "order": "create_time",
    "asc": true
  }
  ```

## Update

- **Required Fields:**
  - `id_outreach`: The unique identifier of the outreach that led to the unsubscribe action. This field must be present and valid for updates.

- **Optional Fields:**
  - `id_user`: The identifier for the user associated with the unsubscribe action. This can be updated if provided.

- **Validations:**
  - `id_outreach` is mandatory and must exist as a valid record for the account.
  - The `id_user`, if provided, must be a valid GUID and exist in the system.

- **Example:**
  ```json
  {
    "id_outreach": "existing-outreach-id-guid",
    "id_user": "optional-new-user-id-guid"
  }
  ```

By using the `Mass::Unsubscribe` class, users can effectively manage their unsubscribe records, ensuring all interactions remain appropriate and valid within the system's rules and constraints.