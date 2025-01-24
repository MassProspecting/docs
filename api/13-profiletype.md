# Mass::ProfileType API Documentation

The `Mass::ProfileType` class serves to manage the various profile types that determine how profiles interact with channels in a SaaS context. It is used to configure and control access and communication protocols for different channels such as LinkedIn, Facebook, Apollo, etc. The class provides capabilities to insert, update, retrieve, and list profile types based on different criteria.

## Insert

When inserting a new profile type, the following fields are considered:

### Required Fields

- `access`: The type of access. Must be one of `:rpa`, `:api`, `:mta`, or `:basic`.
- `channel`: The communication channel associated with the profile type. Allowed values are: "Apollo", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron", "ZeroBounce".

### Optional Fields

- `name`: A string representing the name of the profile type.
- `available`: A boolean indicating whether the profile type is available.
- `description`: A string description of the profile type.

Additional optional fields related to `:mta` access:

- `default_smtp_address`
- `default_smtp_port`
- `default_imap_address`
- `default_imap_port`
- `default_authentication`: Valid values are `:plain`, `:login`, `:cram_md5`, `:none`.
- `default_enable_starttls_auto`
- `default_openssl_verify_mode`: Valid values are `:none`, `:peer`, `:client_once`.
- `default_inbox_label`
- `default_spam_label`
- `default_search_all_wildcard`

### Validations

- `access` must be specified and valid.
- `channel` must be specified and valid.
- Integer fields have range constraints (e.g., ports must be between 0 and `MAX_PORT_NUMBER`).
- String fields must be of type string.
- Boolean fields must be either true or false.
- For `:mta` access, relevant SMTP/IMAP fields are required and have specific allowed values for authentication and SSL.

### Example

```json
{
    "channel": "LinkedIn",
    "access": "api",
    "name": "LinkedIn_Profile",
    "available": true,
    "description": "Profile type for LinkedIn API"
}
```

## Page

### Required Fields

- `page`: The page number to retrieve. Defaults to 1 if not provided.
- `limit`: The maximum number of items per page. Defaults to 25 if not provided.

### Optional Fields

- `filters`: Filters based on the profile type, e.g., `name`.
- `order`: The field to order results by. Defaults to `id`.
- `asc`: A boolean value specifying whether the order is ascending. Defaults to true.

### Validations

- Page and limit need to be valid integers.
- Filters must include recognized keys.

### Example

```json
{
    "page": 1,
    "limit": 10,
    "order": "create_time",
    "asc": true,
    "filters": {
        "name": "LinkedIn_Profile"
    }
}
```

## Update

### Required Fields

- `id`: The identifier of the profile type to update.

### Optional Fields

All fields from the insert operation can be included in an update, allowing for full modification of the profile type attributes.

### Validations

- The `id` must exist.
- Validations from the insert operation remain applicable to ensure data integrity.

### Example

```json
{
    "id": "84e6eda1-4a2e-4f71-b56c-1372d61efe45",
    "name": "Updated_LinkedIn_Profile",
    "channel": "LinkedIn",
    "access": "api",
    "available": false,
    "description": "Updated description for LinkedIn API profile type"
}
```

Ensure that definitions and names are precise, fields are correctly types, and required conditions depending on the `access` type are met when performing operations on `Mass::ProfileType`. This includes adhering to constraints such as valid integers for intervals, required SMTP/IMAP fields, and proper channel linkage.# Mass::ProfileType API Documentation

The `Mass::ProfileType` class serves to manage the various profile types that determine how profiles interact with channels in a SaaS context. It is used to configure and control access and communication protocols for different channels such as LinkedIn, Facebook, Apollo, etc. The class provides capabilities to insert, update, retrieve, and list profile types based on different criteria.

## Insert

When inserting a new profile type, the following fields are considered:

### Required Fields

- `access`: The type of access. Must be one of `:rpa`, `:api`, `:mta`, or `:basic`.
- `channel`: The communication channel associated with the profile type. Allowed values are: "Apollo", "Facebook", "FindyMail", "GMail", "Indeed", "LinkedIn", "Postmark", "Reoon", "Targetron", "ZeroBounce".

### Optional Fields

- `name`: A string representing the name of the profile type.
- `available`: A boolean indicating whether the profile type is available.
- `description`: A string description of the profile type.

Additional optional fields related to `:mta` access:

- `default_smtp_address`
- `default_smtp_port`
- `default_imap_address`
- `default_imap_port`
- `default_authentication`: Valid values are `:plain`, `:login`, `:cram_md5`, `:none`.
- `default_enable_starttls_auto`
- `default_openssl_verify_mode`: Valid values are `:none`, `:peer`, `:client_once`.
- `default_inbox_label`
- `default_spam_label`
- `default_search_all_wildcard`

### Validations

- `access` must be specified and valid.
- `channel` must be specified and valid.
- Integer fields have range constraints (e.g., ports must be between 0 and `MAX_PORT_NUMBER`).
- String fields must be of type string.
- Boolean fields must be either true or false.
- For `:mta` access, relevant SMTP/IMAP fields are required and have specific allowed values for authentication and SSL.

### Example

```json
{
    "channel": "LinkedIn",
    "access": "api",
    "name": "LinkedIn_Profile",
    "available": true,
    "description": "Profile type for LinkedIn API"
}
```

## Page

### Required Fields

- `page`: The page number to retrieve. Defaults to 1 if not provided.
- `limit`: The maximum number of items per page. Defaults to 25 if not provided.

### Optional Fields

- `filters`: Filters based on the profile type, e.g., `name`.
- `order`: The field to order results by. Defaults to `id`.
- `asc`: A boolean value specifying whether the order is ascending. Defaults to true.

### Validations

- Page and limit need to be valid integers.
- Filters must include recognized keys.

### Example

```json
{
    "page": 1,
    "limit": 10,
    "order": "create_time",
    "asc": true,
    "filters": {
        "name": "LinkedIn_Profile"
    }
}
```

## Update

### Required Fields

- `id`: The identifier of the profile type to update.

### Optional Fields

All fields from the insert operation can be included in an update, allowing for full modification of the profile type attributes.

### Validations

- The `id` must exist.
- Validations from the insert operation remain applicable to ensure data integrity.

### Example

```json
{
    "id": "84e6eda1-4a2e-4f71-b56c-1372d61efe45",
    "name": "Updated_LinkedIn_Profile",
    "channel": "LinkedIn",
    "access": "api",
    "available": false,
    "description": "Updated description for LinkedIn API profile type"
}
```

Ensure that definitions and names are precise, fields are correctly types, and required conditions depending on the `access` type are met when performing operations on `Mass::ProfileType`. This includes adhering to constraints such as valid integers for intervals, required SMTP/IMAP fields, and proper channel linkage.