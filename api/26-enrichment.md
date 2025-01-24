# Mass::Enrichment Class Documentation

The `Mass::Enrichment` class is part of the MassProspecting API and is responsible for handling the enrichment process of leads and companies. It allows you to manage enrichment operations, assign tasks, and track the enrichment status of various profiles using different enrichment types like "ApolloRPA_CompanyDomainToLeads", "FindyMailAPI_NameAndDomainToEmail", among others.

## Insert

### Required Fields
- `enrichment_type` (String or Symbol): Must be one of the allowed enrichment types: "ApolloRPA_CompanyDomainToLeads", "ApolloRPA_NameAndLinkedInUrlToEmail", "FindyMailAPI_NameAndDomainToEmail", "Reoon_EmailVerification", "ZeroBounce_EmailVerification".
- `status` (String or Symbol): Must be a valid status symbol like :pending, :running, :performed, etc.

### Optional Fields
- `id_user` (GUID)
- `tag` (String or Symbol): If provided, it must correspond to an existing tag.
- `approved` (Boolean)
- `lead` (GUID): Either `lead` or `company` must be present.
- `company` (GUID): Either `lead` or `company` must be present.
- `error_description` (String)
- `hit` (Boolean)
- `screenshots` (Array of Strings): Must be valid URLs.
- `snapshots` (Array of Strings): Must be valid URLs.

### Validations
- Both `lead` and `company` cannot be present at the same time (conditional).
- If `screenshots` or `snapshots` are provided, they must be arrays of valid URL strings.

### Example
Request:
```json
{
  "enrichment_type": "ApolloRPA_CompanyDomainToLeads",
  "status": "pending",
  "approved": true,
  "lead": "some-lead-guid",
  "screenshots": ["http://example.com/screenshot1.png"]
}
```

## Page

### Required Fields
- `page` (Integer): The page number to retrieve.
- `limit` (Integer): The number of records to retrieve per page.

### Optional Fields
- `filters`: An object containing optional filters such as `id_profile`, `status`, `approved`, and others described for the Insert operation.
- `order` (String): The field by which to order results.
- `asc` (Boolean): If results should be ordered in ascending order.

### Validations
- All filter fields must be valid as per their descriptions in the Insert section.

### Example
Request:
```json
{
  "page": 1,
  "limit": 25,
  "filters": {
    "status": "pending"
  },
  "order": "create_time",
  "asc": true
}
```

## Update

### Required Fields
- `id` (GUID): The unique identifier of the enrichment record you wish to update.

### Optional Fields
- The same optional fields as described in the Insert section (e.g., `status`, `approved`, `lead`, `company`, etc.).

### Validations
- `id` must be a valid GUID that exists in the database.
- Changes to `status` are validated against allowed transitions and status symbols.

### Example
Request:
```json
{
  "id": "existing-enrichment-guid",
  "status": "running",
  "approved": true,
  "error_description": "New error description"
}
```

This documentation gives an overview of the structure and usage of the `Mass::Enrichment` class via the MassProspecting API. Each operation has specific required fields, optional parameters, and validates data to ensure consistent and correct operation.# Mass::Enrichment Class Documentation

The `Mass::Enrichment` class is part of the MassProspecting API and is responsible for handling the enrichment process of leads and companies. It allows you to manage enrichment operations, assign tasks, and track the enrichment status of various profiles using different enrichment types like "ApolloRPA_CompanyDomainToLeads", "FindyMailAPI_NameAndDomainToEmail", among others.

## Insert

### Required Fields
- `enrichment_type` (String or Symbol): Must be one of the allowed enrichment types: "ApolloRPA_CompanyDomainToLeads", "ApolloRPA_NameAndLinkedInUrlToEmail", "FindyMailAPI_NameAndDomainToEmail", "Reoon_EmailVerification", "ZeroBounce_EmailVerification".
- `status` (String or Symbol): Must be a valid status symbol like :pending, :running, :performed, etc.

### Optional Fields
- `id_user` (GUID)
- `tag` (String or Symbol): If provided, it must correspond to an existing tag.
- `approved` (Boolean)
- `lead` (GUID): Either `lead` or `company` must be present.
- `company` (GUID): Either `lead` or `company` must be present.
- `error_description` (String)
- `hit` (Boolean)
- `screenshots` (Array of Strings): Must be valid URLs.
- `snapshots` (Array of Strings): Must be valid URLs.

### Validations
- Both `lead` and `company` cannot be present at the same time (conditional).
- If `screenshots` or `snapshots` are provided, they must be arrays of valid URL strings.

### Example
Request:
```json
{
  "enrichment_type": "ApolloRPA_CompanyDomainToLeads",
  "status": "pending",
  "approved": true,
  "lead": "some-lead-guid",
  "screenshots": ["http://example.com/screenshot1.png"]
}
```

## Page

### Required Fields
- `page` (Integer): The page number to retrieve.
- `limit` (Integer): The number of records to retrieve per page.

### Optional Fields
- `filters`: An object containing optional filters such as `id_profile`, `status`, `approved`, and others described for the Insert operation.
- `order` (String): The field by which to order results.
- `asc` (Boolean): If results should be ordered in ascending order.

### Validations
- All filter fields must be valid as per their descriptions in the Insert section.

### Example
Request:
```json
{
  "page": 1,
  "limit": 25,
  "filters": {
    "status": "pending"
  },
  "order": "create_time",
  "asc": true
}
```

## Update

### Required Fields
- `id` (GUID): The unique identifier of the enrichment record you wish to update.

### Optional Fields
- The same optional fields as described in the Insert section (e.g., `status`, `approved`, `lead`, `company`, etc.).

### Validations
- `id` must be a valid GUID that exists in the database.
- Changes to `status` are validated against allowed transitions and status symbols.

### Example
Request:
```json
{
  "id": "existing-enrichment-guid",
  "status": "running",
  "approved": true,
  "error_description": "New error description"
}
```

This documentation gives an overview of the structure and usage of the `Mass::Enrichment` class via the MassProspecting API. Each operation has specific required fields, optional parameters, and validates data to ensure consistent and correct operation.