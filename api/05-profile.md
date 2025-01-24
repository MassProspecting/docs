# Mass::Profile

The `Mass::Profile` class serves as a central component for representing user profiles within the MassProspecting system. It supports the creation, updating, and management of user profiles with varying types and associated parameters, such as hostname, state, and API keys. The class handles validation, storage, and error-checking to ensure data integrity and compliance with specific rules, making it essential for managing user integrations with external services.

## Insert

- **Required Fields:**
  - `profile_type`: Must be one of the allowed profile types, e.g., "Apollo_API", "Facebook", "LinkedIn", etc.
  - `hostname`: Must be a string.

- **Optional Fields:**
  - `id_user`
  - `name`
  - `tag`
  - `state`
  - `picture_url`
  - `picture_url_dropbox`
  - `ads_power_id`
  - `api_key`
  - `allow_tracking_domain`
  - `tracking_domain`
  - `tracking_protocol`
  - `tracking_port`
  - `smtp_address`
  - `smtp_port`
  - `imap_address`
  - `imap_port`
  - `authentication`
  - `enable_starttls_auto`
  - `openssl_verify_mode`
  - `inbox_label`
  - `spam_label`
  - `search_all_wildcard`
  - `imap_allowed`
  - `check_connections_interval`
  - `check_inbox_interval`
  - `jobs_interval`
  - `max_daily_jobs`
  - `outreach_interval`
  - `max_daily_processed_outreaches`
  - `max_daily_aborted_outreaches`
  - `enrichment_interval`
  - `max_daily_processed_enrichments`
  - `max_daily_aborted_enrichments`
  - `allow_browser_to_download_multiple_files`
  - `browser_width`
  - `browser_height`
  - `linkedin`
  - `facebook`
  - `leased`
  - `under_revision`
  - `openssl_verify_mode_code`

- **Validations:**
  - Must comply with naming conventions for `name`.
  - Must be valid URLs for any provided URLs.
  - Boolean fields must be true or false.
  - Integer fields must be within specified ranges.
  - Strings must be valid and within length limits.
  - Must check ownership and existence of account and user IDs.
  - Profile type must be known and valid.
  - Relationships between fields should comply with RPA and MTA access specifications.

- **Allowed Values:**
  - `profile_types`: "Apollo_API", "Apollo_RPA", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron_API", "Targetron_RPA", "ZeroBounce".
  - `tracking_protocol`: "http", "https".
  - `authentication`: "plain", "login", "cram_md5", "none".
  - `openssl_verify_modes`: "none", "peer", "fail_if_no_peer_cert", "client_once".

- **Example:**
  ```json
  {
      "profile_type": "LinkedIn",
      "hostname": "example.hostname.com",
      "name": "User Profile Name",
      "tag": "VIP",
      "state": "online",
      "api_key": "123456789abcdef",
      "linkedin": "https://www.linkedin.com/in/exampleprofile/"
  }
  ```

## Page

- **Required Fields:**
  - `page`: Must be an integer (default is 1).
  - `limit`: Must be an integer (default is 25).

- **Optional Fields:**
  - `filters`: Object containing filter criteria.
  - `filters.profile_type`: Filter by profile type.
  - `filters.tag`: Filter by tag.
  - `filters.name`: Filter by name.
  - `filters.state`: Filter by state.
  - `filters.hostname`: Filter by hostname.

- **Validations:**
  - Filters must refer to known profile types and tags.
  - Filter values must match field types.

- **Allowed Values:**
  - `profile_types`: "Apollo_API", "Apollo_RPA", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron_API", "Targetron_RPA", "ZeroBounce".
  
- **Example:**
  ```json
  {
      "page": 1,
      "limit": 10,
      "filters": {
          "profile_type": "LinkedIn",
          "state": "online"
      },
      "order": "create_time",
      "asc": true
  }
  ```

## Update

- **Required Fields:**
  - `id`: Must be provided to identify the profile being updated.

- **Optional Fields:**
  - Any field used in Insert can be updated as long as it adheres to the same validation.

- **Validations:**
  - Must comply with naming conventions for `name`.
  - Must be valid URLs for any provided URLs.
  - Boolean fields must be true or false.
  - Integer fields must be within specified ranges.
  - Strings must be valid and within length limits.
  - Ownership and existence of account and user IDs must be confirmed.
  - Profile type must be known and valid.
  - Fields need to comply with RPA and MTA access specifications when applicable.

- **Allowed Values:**
  - `profile_types`: "Apollo_API", "Apollo_RPA", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron_API", "Targetron_RPA", "ZeroBounce".

- **Example:**
  ```json
  {
      "id": "123e4567-e89b-12d3-a456-426614174000",
      "name": "Updated Profile Name",
      "state": "idle",
      "facebook": "https://www.facebook.com/exampleprofile"
  }
  ```

This documentation provides an overview of the `Mass::Profile` functionality and its API endpoints. Users need to ensure they comply with the field requirements and validations for successful profile management. The examples illustrate typical JSON requests for interacting with the profiles.# Mass::Profile

The `Mass::Profile` class serves as a central component for representing user profiles within the MassProspecting system. It supports the creation, updating, and management of user profiles with varying types and associated parameters, such as hostname, state, and API keys. The class handles validation, storage, and error-checking to ensure data integrity and compliance with specific rules, making it essential for managing user integrations with external services.

## Insert

- **Required Fields:**
  - `profile_type`: Must be one of the allowed profile types, e.g., "Apollo_API", "Facebook", "LinkedIn", etc.
  - `hostname`: Must be a string.

- **Optional Fields:**
  - `id_user`
  - `name`
  - `tag`
  - `state`
  - `picture_url`
  - `picture_url_dropbox`
  - `ads_power_id`
  - `api_key`
  - `allow_tracking_domain`
  - `tracking_domain`
  - `tracking_protocol`
  - `tracking_port`
  - `smtp_address`
  - `smtp_port`
  - `imap_address`
  - `imap_port`
  - `authentication`
  - `enable_starttls_auto`
  - `openssl_verify_mode`
  - `inbox_label`
  - `spam_label`
  - `search_all_wildcard`
  - `imap_allowed`
  - `check_connections_interval`
  - `check_inbox_interval`
  - `jobs_interval`
  - `max_daily_jobs`
  - `outreach_interval`
  - `max_daily_processed_outreaches`
  - `max_daily_aborted_outreaches`
  - `enrichment_interval`
  - `max_daily_processed_enrichments`
  - `max_daily_aborted_enrichments`
  - `allow_browser_to_download_multiple_files`
  - `browser_width`
  - `browser_height`
  - `linkedin`
  - `facebook`
  - `leased`
  - `under_revision`
  - `openssl_verify_mode_code`

- **Validations:**
  - Must comply with naming conventions for `name`.
  - Must be valid URLs for any provided URLs.
  - Boolean fields must be true or false.
  - Integer fields must be within specified ranges.
  - Strings must be valid and within length limits.
  - Must check ownership and existence of account and user IDs.
  - Profile type must be known and valid.
  - Relationships between fields should comply with RPA and MTA access specifications.

- **Allowed Values:**
  - `profile_types`: "Apollo_API", "Apollo_RPA", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron_API", "Targetron_RPA", "ZeroBounce".
  - `tracking_protocol`: "http", "https".
  - `authentication`: "plain", "login", "cram_md5", "none".
  - `openssl_verify_modes`: "none", "peer", "fail_if_no_peer_cert", "client_once".

- **Example:**
  ```json
  {
      "profile_type": "LinkedIn",
      "hostname": "example.hostname.com",
      "name": "User Profile Name",
      "tag": "VIP",
      "state": "online",
      "api_key": "123456789abcdef",
      "linkedin": "https://www.linkedin.com/in/exampleprofile/"
  }
  ```

## Page

- **Required Fields:**
  - `page`: Must be an integer (default is 1).
  - `limit`: Must be an integer (default is 25).

- **Optional Fields:**
  - `filters`: Object containing filter criteria.
  - `filters.profile_type`: Filter by profile type.
  - `filters.tag`: Filter by tag.
  - `filters.name`: Filter by name.
  - `filters.state`: Filter by state.
  - `filters.hostname`: Filter by hostname.

- **Validations:**
  - Filters must refer to known profile types and tags.
  - Filter values must match field types.

- **Allowed Values:**
  - `profile_types`: "Apollo_API", "Apollo_RPA", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron_API", "Targetron_RPA", "ZeroBounce".
  
- **Example:**
  ```json
  {
      "page": 1,
      "limit": 10,
      "filters": {
          "profile_type": "LinkedIn",
          "state": "online"
      },
      "order": "create_time",
      "asc": true
  }
  ```

## Update

- **Required Fields:**
  - `id`: Must be provided to identify the profile being updated.

- **Optional Fields:**
  - Any field used in Insert can be updated as long as it adheres to the same validation.

- **Validations:**
  - Must comply with naming conventions for `name`.
  - Must be valid URLs for any provided URLs.
  - Boolean fields must be true or false.
  - Integer fields must be within specified ranges.
  - Strings must be valid and within length limits.
  - Ownership and existence of account and user IDs must be confirmed.
  - Profile type must be known and valid.
  - Fields need to comply with RPA and MTA access specifications when applicable.

- **Allowed Values:**
  - `profile_types`: "Apollo_API", "Apollo_RPA", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron_API", "Targetron_RPA", "ZeroBounce".

- **Example:**
  ```json
  {
      "id": "123e4567-e89b-12d3-a456-426614174000",
      "name": "Updated Profile Name",
      "state": "idle",
      "facebook": "https://www.facebook.com/exampleprofile"
  }
  ```

This documentation provides an overview of the `Mass::Profile` functionality and its API endpoints. Users need to ensure they comply with the field requirements and validations for successful profile management. The examples illustrate typical JSON requests for interacting with the profiles.