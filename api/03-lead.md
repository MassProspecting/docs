# Mass::Lead

The `Mass::Lead` class in the MassProspecting platform is responsible for managing and organizing lead information, which includes attributes like names, job titles, contact information (such as email, phone, and social media links), and additional metadata like location and tags. This class interacts with other systems for data enrichment and implements various verification methods to ensure data quality and consistency.

## Insert

**Required Fields:**
- `id_user`: Must be a valid GUID and belong to the account.
- Either `first_name` or `name`: Must be a string.
- `email`: Must be a valid email format.

**Optional Fields:**
- `middle_name`: Must be a string.
- `last_name`: Must be a string.
- `job_title`: Must be a string.
- `country`: Must refer to a known country.
- `timezone`: Must refer to a known timezone.
- `data`: Must be an array of data descriptors.
- `tags`: Tags associated with the lead.
- `company`: Information to associate the lead with a company.
- `location`: Must refer to a known location.
- `picture_url`: Not validated for reachability.
- `picture_url_dropbox`: Must be a valid and reachable URL.
- `phone`: General string format.
- `linkedin`: Must be a valid LinkedIn URL.
- `linkedin_2`: An alternative LinkedIn URL.
- `facebook`: Must be a valid Facebook URL.
- `facebook_2`: An alternative Facebook URL.
- `snapshot_url`: General URL string.
- `email_verification_result`: Should be one of the valid verification results - any, pending, valid, invalid, catchall, role, unknown, disabled, disposable, inbox_full, role_account, spamtrap.

**Validations:**
- Ownership must be confirmed (valid `id_user` belonging to the account).
- Email, LinkedIn, and Facebook links should match their respective URL patterns.
- `country`, `location`, and `timezone` should map to existing entries.
- Mutual exclusivity for `first_name` and `name`.
- Correct types for all fields as per the description (string, URL format, etc.).

**Example:**
```json
{
    "id_user": "123e4567-e89b-12d3-a456-426614174000",
    "first_name": "John",
    "last_name": "Doe",
    "job_title": "Sales Manager",
    "email": "john.doe@example.com",
    "linkedin": "https://www.linkedin.com/in/johndoe/",
    "country": "United States",
    "timezone": "UTC-5"
}
```

## Page

**Required Fields:**
- `page`: Defaults to 1 if not provided and must be an integer.
- `limit`: Defaults to 25 if not provided and must be an integer.

**Optional Fields:**
- `filters`: Dictionary of filters that can include:
  - `first_name`
  - `middle_name`
  - `last_name`
  - `job_title`
  - `country`
  - `location`
  - `timezone`
  - `email`
  - `phone`
  - `linkedin`, `linkedin_2`
  - `facebook`, `facebook_2`

**Validations:**
- Filter keys must be among the allowed keys.
- The filter values are subject to the same validation logic as in `insert`.

**Example:**
```json
{
    "page": 1,
    "limit": 25,
    "filters": {
        "email": "example.com",
        "country": "United States"
    },
    "order": "create_time",
    "asc": true
}
```

## Update

**Required Fields:**
- `id`: Must be a valid GUID referring to the lead to update.

**Optional Fields:**
- Same as those listed in `Insert`.

**Validations:**
- Ownership verification: `id_user` must belong to the account.
- All field values are subject to same type and integrity validations as in `insert`.

**Example:**
```json
{
    "id": "f47ac10b-58cc-3372-a567-0e02b2c3d479",
    "job_title": "Senior Sales Manager",
    "phone": "+1 555-0100"
}
```# Mass::Lead

The `Mass::Lead` class in the MassProspecting platform is responsible for managing and organizing lead information, which includes attributes like names, job titles, contact information (such as email, phone, and social media links), and additional metadata like location and tags. This class interacts with other systems for data enrichment and implements various verification methods to ensure data quality and consistency.

## Insert

**Required Fields:**
- `id_user`: Must be a valid GUID and belong to the account.
- Either `first_name` or `name`: Must be a string.
- `email`: Must be a valid email format.

**Optional Fields:**
- `middle_name`: Must be a string.
- `last_name`: Must be a string.
- `job_title`: Must be a string.
- `country`: Must refer to a known country.
- `timezone`: Must refer to a known timezone.
- `data`: Must be an array of data descriptors.
- `tags`: Tags associated with the lead.
- `company`: Information to associate the lead with a company.
- `location`: Must refer to a known location.
- `picture_url`: Not validated for reachability.
- `picture_url_dropbox`: Must be a valid and reachable URL.
- `phone`: General string format.
- `linkedin`: Must be a valid LinkedIn URL.
- `linkedin_2`: An alternative LinkedIn URL.
- `facebook`: Must be a valid Facebook URL.
- `facebook_2`: An alternative Facebook URL.
- `snapshot_url`: General URL string.
- `email_verification_result`: Should be one of the valid verification results - any, pending, valid, invalid, catchall, role, unknown, disabled, disposable, inbox_full, role_account, spamtrap.

**Validations:**
- Ownership must be confirmed (valid `id_user` belonging to the account).
- Email, LinkedIn, and Facebook links should match their respective URL patterns.
- `country`, `location`, and `timezone` should map to existing entries.
- Mutual exclusivity for `first_name` and `name`.
- Correct types for all fields as per the description (string, URL format, etc.).

**Example:**
```json
{
    "id_user": "123e4567-e89b-12d3-a456-426614174000",
    "first_name": "John",
    "last_name": "Doe",
    "job_title": "Sales Manager",
    "email": "john.doe@example.com",
    "linkedin": "https://www.linkedin.com/in/johndoe/",
    "country": "United States",
    "timezone": "UTC-5"
}
```

## Page

**Required Fields:**
- `page`: Defaults to 1 if not provided and must be an integer.
- `limit`: Defaults to 25 if not provided and must be an integer.

**Optional Fields:**
- `filters`: Dictionary of filters that can include:
  - `first_name`
  - `middle_name`
  - `last_name`
  - `job_title`
  - `country`
  - `location`
  - `timezone`
  - `email`
  - `phone`
  - `linkedin`, `linkedin_2`
  - `facebook`, `facebook_2`

**Validations:**
- Filter keys must be among the allowed keys.
- The filter values are subject to the same validation logic as in `insert`.

**Example:**
```json
{
    "page": 1,
    "limit": 25,
    "filters": {
        "email": "example.com",
        "country": "United States"
    },
    "order": "create_time",
    "asc": true
}
```

## Update

**Required Fields:**
- `id`: Must be a valid GUID referring to the lead to update.

**Optional Fields:**
- Same as those listed in `Insert`.

**Validations:**
- Ownership verification: `id_user` must belong to the account.
- All field values are subject to same type and integrity validations as in `insert`.

**Example:**
```json
{
    "id": "f47ac10b-58cc-3372-a567-0e02b2c3d479",
    "job_title": "Senior Sales Manager",
    "phone": "+1 555-0100"
}
```