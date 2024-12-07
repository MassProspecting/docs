
# Mass::Profile

## Description

The `Mass::Profile` class represents profiles used for managing different types of automation tasks, including RPA (Robotic Process Automation), API integrations, and MTA (Mail Transfer Agent) operations. This class includes validations, configurations for various profile types, and handles tracking, authentication, and scraping options.

### Supported Profile Types
- **Apollo_API**
- **Apollo_RPA**
- **Facebook**
- **FindyMail**
- **GMail**
- **Indeed**
- **LinkedIn**
- **Postmark**
- **Reoon**
- **Targetron_API**
- **Targetron_RPA**
- **ZeroBounce**

---

## Insert Operation

### Required Fields
- **profile_type** (`String`): The type of profile.
- **hostname** (`String`): The hostname associated with the profile.

### Optional Fields
- **name** (`String`): A custom name for the profile.
- **tag** (`String`): An associated tag.
- **state** (`String`): The state of the profile.
- **picture_url** (`String`): URL to the profile's picture.
- **picture_url_dropbox** (`String`): Dropbox link to the profile's picture.
- **ads_power_id** (`String`): Applicable for RPA profiles.
- **api_key** (`String`): API key for API profiles.
- **allow_tracking_domain** (`Boolean`): Whether tracking domains are allowed.
- **tracking_domain** (`String`): The tracking domain.
- **tracking_protocol** (`String`): Protocol for tracking (`http` or `https`).
- **tracking_port** (`Integer`): Port number for tracking.
- **smtp_address** (`String`): SMTP address for MTA profiles.
- **smtp_port** (`Integer`): SMTP port.
- **imap_port** (`Integer`): IMAP port.
- **imap_address** (`String`): IMAP address.
- **authentication** (`String`): Authentication method (`plain`, `login`, `cram_md5`, `none`).
- **enable_starttls_auto** (`Boolean`): Whether to enable STARTTLS.
- **openssl_verify_mode** (`String`): SSL verify mode (`none`, `peer`, `client_once`, `fail_if_no_peer_cert`).
- **inbox_label** (`String`): Label for inbox messages.
- **spam_label** (`String`): Label for spam messages.
- **imap_allowed** (`Boolean`): Whether IMAP is allowed.
- **check_connections_interval** (`Integer`): Interval for checking connections.
- **max_daily_jobs** (`Integer`): Maximum number of daily jobs.

### Validations
- **Mandatory Fields**: `profile_type`, `hostname`
- **String Fields**: `hostname`, `ads_power_id`, `api_key`, `smtp_address`, `imap_address`, `inbox_label`, `spam_label`
- **Boolean Fields**: `enable_starttls_auto`, `imap_allowed`, `allow_tracking_domain`
- **Integer Fields**:
  - `browser_width` (0-1920)
  - `browser_height` (0-1920)
  - `smtp_port`, `imap_port`, `tracking_port` (1-65535)

---

## Page Operation

### Usage
```json
{
    "page": 1,
    "limit": 10,
    "filters": {
        "profile_type": "LinkedIn",
        "tag": "leadgen",
        "name": "JohnDoeProfile"
    }
}
```

### Filters
- **profile_type**: Filter by profile type.
- **tag**: Filter by associated tag.
- **name**: Filter by profile name.
- **state**: Filter by state.
- **hostname**: Filter by hostname.

### Validations
- Unknown `profile_type` or `tag` will result in an error.

---

## Update Operation

### Example Request
```json
{
    "name": "UpdatedProfileName",
    "profile_type": "GMail",
    "smtp_address": "smtp.gmail.com",
    "smtp_port": 587,
    "enable_starttls_auto": true
}
```

### Validations
- **RPA-Specific Fields**: `ads_power_id`, `allow_browser_to_download_multiple_files`, `browser_width`, `browser_height`
- **API-Specific Fields**: `api_key`
- **MTA-Specific Fields**: `smtp_address`, `smtp_port`, `imap_address`, `imap_port`, `authentication`

### Allowed Values
- **`authentication`**: `plain`, `login`, `cram_md5`, `none`
- **`openssl_verify_mode`**: `none`, `peer`, `client_once`, `fail_if_no_peer_cert`
- **`tracking_protocol`**: `http`, `https`

---

## Example Error Messages

- `The profile_type 'UnknownType' is not valid.`
- `The smtp_port '99999' for Profile must be less than 65535.`
- `The hostname is required for Profile.`

---

## Notes

- **State Restrictions**: States like `starting`, `stopping` are valid only for RPA profiles.
- **Tracking Restrictions**: Tracking configurations are allowed only for MTA profiles.

