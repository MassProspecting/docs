# Mass::Source

The `Mass::Source` class serves as a fundamental component within the MassProspecting SaaS, primarily used for managing different sources utilized in the prospecting process. It allows users to define, insert, update, and retrieve source-related data based on source types, tags, and other parameters. The `Mass::Source` class includes mechanisms for validation and serialization, ensuring data integrity and consistent formatting.

## Insert

**Required Fields:**
- `source_type`: Specifies the type of the source.
- `urls`: A list of URLs associated with the source.
- `active`: A boolean indicating whether the source is active.
- `interval`: An integer defining the interval for processing the source.

**Optional Fields:**
- `id_user`
- `name`
- `tag`
- `params`
- `paginable`
- `max_jobs`
- `download_pictures`
- `scrolling_step`
- `scrolling_step_random`
- `max_scrolls`
- `max_scrolls_random`
- `event_limit`
- `delay_base`
- `delay_random`
- `total_results`
- `page_results`

**Validations:**
- `source_type` must be a known type.
- `urls` must match the URL pattern associated with the `source_type`.
- `active`, `download_pictures`, and `paginable` must be boolean values.
- Integer fields must be within allowed limits (`interval`, `scrolling_step`, `scrolling_step_random`, `max_scrolls`, `max_scrolls_random`, `event_limit`, `delay_base`, `delay_random`, `total_results`, and `page_results`).

**Allowed Values for source_type:**
Refer to registered source types in the application database.

**Examples:**

```json
{
    "source_type": "LinkedIn",
    "urls": ["https://linkedin.com/example"],
    "active": true,
    "interval": 10
}
```

## Page

**Required Fields:**
- `page`: Page number for pagination.
- `limit`: Limit of items per page.

**Optional Fields:**
- Filters like `name`, `source_type`, `tag`, and `active`.
- `order`: Field by which to order results.
- `asc`: Boolean indicating ascending or descending order.

**Validations:**
- `source_type` and `tag` must be known entities.
- Ensure correct data types for each filter and pagination field.

**Allowed Values:**
Refer to registered source types and tags in the application database.

**Examples:**

```json
{
    "page": 1,
    "limit": 25,
    "filters": {"active": true},
    "order": "name",
    "asc": true
}
```

## Update

**Required Fields:**
- `id`: Identifier of the source to update.
- `source_type`: Specifies the type of the source.
- `urls`: A list of URLs associated with the source.
- `active`: A boolean indicating whether the source is active.
- `interval`: An integer defining the interval for processing the source.

**Optional Fields:**
- `id_user`
- `name`
- `tag`
- `params`
- `paginable`
- `max_jobs`
- `download_pictures`
- `scrolling_step`
- `scrolling_step_random`
- `max_scrolls`
- `max_scrolls_random`
- `event_limit`
- `delay_base`
- `delay_random`
- `total_results`
- `page_results`

**Validations:**
- Ensure valid source identifier (`id`).
- `source_type` must be a known type.
- `urls` must match the URL pattern associated with the `source_type`.
- `active`, `download_pictures`, and `paginable` must be boolean values.
- Integer fields must be within allowed limits (`interval`, `scrolling_step`, `scrolling_step_random`, `max_scrolls`, `max_scrolls_random`, `event_limit`, `delay_base`, `delay_random`, `total_results`, and `page_results`).

**Examples:**

```json
{
    "id": "1234",
    "source_type": "LinkedIn",
    "urls": ["https://linkedin.com/example"],
    "active": true,
    "interval": 15
}
```# Mass::Source

The `Mass::Source` class serves as a fundamental component within the MassProspecting SaaS, primarily used for managing different sources utilized in the prospecting process. It allows users to define, insert, update, and retrieve source-related data based on source types, tags, and other parameters. The `Mass::Source` class includes mechanisms for validation and serialization, ensuring data integrity and consistent formatting.

## Insert

**Required Fields:**
- `source_type`: Specifies the type of the source.
- `urls`: A list of URLs associated with the source.
- `active`: A boolean indicating whether the source is active.
- `interval`: An integer defining the interval for processing the source.

**Optional Fields:**
- `id_user`
- `name`
- `tag`
- `params`
- `paginable`
- `max_jobs`
- `download_pictures`
- `scrolling_step`
- `scrolling_step_random`
- `max_scrolls`
- `max_scrolls_random`
- `event_limit`
- `delay_base`
- `delay_random`
- `total_results`
- `page_results`

**Validations:**
- `source_type` must be a known type.
- `urls` must match the URL pattern associated with the `source_type`.
- `active`, `download_pictures`, and `paginable` must be boolean values.
- Integer fields must be within allowed limits (`interval`, `scrolling_step`, `scrolling_step_random`, `max_scrolls`, `max_scrolls_random`, `event_limit`, `delay_base`, `delay_random`, `total_results`, and `page_results`).

**Allowed Values for source_type:**
Refer to registered source types in the application database.

**Examples:**

```json
{
    "source_type": "LinkedIn",
    "urls": ["https://linkedin.com/example"],
    "active": true,
    "interval": 10
}
```

## Page

**Required Fields:**
- `page`: Page number for pagination.
- `limit`: Limit of items per page.

**Optional Fields:**
- Filters like `name`, `source_type`, `tag`, and `active`.
- `order`: Field by which to order results.
- `asc`: Boolean indicating ascending or descending order.

**Validations:**
- `source_type` and `tag` must be known entities.
- Ensure correct data types for each filter and pagination field.

**Allowed Values:**
Refer to registered source types and tags in the application database.

**Examples:**

```json
{
    "page": 1,
    "limit": 25,
    "filters": {"active": true},
    "order": "name",
    "asc": true
}
```

## Update

**Required Fields:**
- `id`: Identifier of the source to update.
- `source_type`: Specifies the type of the source.
- `urls`: A list of URLs associated with the source.
- `active`: A boolean indicating whether the source is active.
- `interval`: An integer defining the interval for processing the source.

**Optional Fields:**
- `id_user`
- `name`
- `tag`
- `params`
- `paginable`
- `max_jobs`
- `download_pictures`
- `scrolling_step`
- `scrolling_step_random`
- `max_scrolls`
- `max_scrolls_random`
- `event_limit`
- `delay_base`
- `delay_random`
- `total_results`
- `page_results`

**Validations:**
- Ensure valid source identifier (`id`).
- `source_type` must be a known type.
- `urls` must match the URL pattern associated with the `source_type`.
- `active`, `download_pictures`, and `paginable` must be boolean values.
- Integer fields must be within allowed limits (`interval`, `scrolling_step`, `scrolling_step_random`, `max_scrolls`, `max_scrolls_random`, `event_limit`, `delay_base`, `delay_random`, `total_results`, and `page_results`).

**Examples:**

```json
{
    "id": "1234",
    "source_type": "LinkedIn",
    "urls": ["https://linkedin.com/example"],
    "active": true,
    "interval": 15
}
```