# Mass::Company API Documentation

## Overview

The `Mass::Company` class is responsible for managing company-related data in the MassProspecting system. It includes validations, storage handling, and serialization capabilities through various modules. This class supports creating, updating, listing, and retrieving company records.

---

## Operations

### Insert

**Description:**  
Insert a new company record into the system.

**Required Fields:**
- `id_account` (string, GUID): The unique identifier for the account.
- `id_user` (string, GUID): The unique identifier for the user.
- `name` (string): The name of the company.

**Optional Fields:**
- `domain` (string): The company's domain.
- `headcount` (string): The headcount category (must exist in the system).
- `revenue` (string): The revenue category (must exist in the system).
- `country` (string): The country name.
- `location` (string): The location name.
- `timezone` (string): The timezone description.
- `data` (array): An array of data descriptors.
- `tags` (array): An array of tags associated with the company.
- `industry` (string): The industry name.
- `sic` (string): The Standard Industrial Classification (SIC) code.
- `naics` (string): The North American Industry Classification System (NAICS) code.
- `email_verification_result` (string): Verification result for the email.
- `picture_url_dropbox` (string): URL for the company picture stored in Dropbox.
- `email` (string): A valid email address.
- `phone` (string): The company's phone number.
- `linkedin` (string): A valid LinkedIn company URL.
- `facebook` (string): A valid Facebook company URL.
- `indeed` (string): A valid Indeed company URL.
- `apollo` (string): A valid Apollo company URL.
- `snapshot_url` (string): The URL for the company's snapshot.

**Validations:**
- `domain`: Must be a valid domain.
- `email`: Must be a valid email.
- `linkedin`: Must be a valid LinkedIn company URL.
- `facebook`: Must be a valid Facebook company URL.
- `indeed`: Must be a valid Indeed URL.
- `apollo`: Must be a valid Apollo URL.
- `headcount`: Must exist in the system.
- `revenue`: Must exist in the system.
- `country`: Must exist in the system.
- `location`: Must exist in the system.
- `timezone`: Must exist in the system.

**Example Request:**
```json
{
  "id_user": "abcd1234-5678-90ef-gh12-34567890ijkl",
  "name": "Tech Innovations Inc",
  "domain": "techinnovations.com",
  "headcount": "100-500",
  "revenue": "10M-50M",
  "country": "United States",
  "location": "San Francisco",
  "timezone": "Pacific Time (US & Canada)",
  "email": "contact@techinnovations.com",
  "phone": "+1 415-555-0100",
  "linkedin": "https://www.linkedin.com/company/techinnovations",
  "facebook": "https://web.facebook.com/techinnovations",
  "indeed": "https://www.indeed.com/cmp/techinnovations",
  "apollo": "https://app.apollo.io/#/companies/techinnovations",
  "snapshot_url": "https://snapshot.example.com/techinnovations",
  "tags": ["technology", "innovation"],
  "picture_url_dropbox": "https://dropbox.example.com/techinnovations.png"
}
```

---

### Page

**Description:**  
Retrieve paginated company records.

**Parameters:**
- `page` (integer): The page number to retrieve.
- `limit` (integer): The number of records per page.
- `filters` (object): Key-value pairs to filter results.

**Allowed Filters:**
- `name` (string)
- `country` (string)
- `location` (string)
- `timezone` (string)
- `email` (string)
- `domain` (string)
- `phone` (string)
- `linkedin` (string)
- `facebook` (string)
- `indeed` (string)
- `apollo` (string)

**Example Request:**
```json
{
  "page": 1,
  "limit": 10,
  "filters": {
    "country": "United States",
    "name": "Tech"
  }
}
```

---

### Update

**Description:**  
Update an existing company record.

**Required Fields:**
- `id_account` (string, GUID): The unique identifier for the account.
- `id` (string, GUID): The unique identifier for the company record.

**Optional Fields:**  
Same as those listed in the Insert operation.

**Example Request:**
```json
{
  "id": "12345678-abcd-90ef-1234-567890abcdef",
  "name": "Tech Innovations Ltd",
  "email": "info@techinnovations.com"
}
```

---

## Validations

### Key Validations:
- **Domain:** Must be a valid domain.
- **Email:** Must be a valid email address.
- **LinkedIn URL:** Must follow the pattern `https://www.linkedin.com/company/{slug}`.
- **Facebook URL:** Must follow the pattern `https://web.facebook.com/{slug}`.
- **Indeed URL:** Must be a valid Indeed company profile URL.
- **Apollo URL:** Must be a valid Apollo company profile URL.

---

## Notes

- **Error Handling:** All operations will return validation errors if the input data does not meet the required criteria.
- **Dropbox Storage:** Images can be stored via Dropbox links provided in `picture_url_dropbox`.

