# Mass::Source

The `Mass::Source` class serves as a fundamental component within the MassProspecting SaaS, primarily used for managing different sources utilized in the prospecting process. It allows users to define, insert, update, and retrieve source-related data based on source types, tags, and other parameters. The `Mass::Source` class includes mechanisms for validation and serialization, ensuring data integrity and consistent formatting.

## Fields

### source_type
- **Type:** String
- **Usage & Meaning:**
The source_type field indicates the type or category of the data source. It determines which child class or API handler should be used to interact with the source. For example, a value like "LinkedIn" or "Facebook_GroupPosts" is used to dynamically instantiate the corresponding class (e.g., Mass::LinkedIn or Mass::Facebook_GroupPosts). The value of source_type must match one of the registered source types in the application’s database.
- **Validations:**
Must be a recognized type (i.e., an existing source type registered in the system).
Must correctly map to the corresponding Ruby class for processing.

### urls
- **Type:** Array of Strings
- **Usage & Meaning:**
The urls field contains a list (or array) of URLs associated with the source. These URLs represent entry points from which the system will scrape data or perform data extraction tasks. Each URL is processed according to the source’s specifications (e.g., validated against URL patterns or normalized).
- **Validations:**
Every URL in the array must conform to the expected pattern for the specific source_type.
Each URL should be in a valid URL format.

### active
- **Type:** Boolean
- **Usage & Meaning:**
The active field designates whether the source is enabled or paused. When set to true, the source is active and eligible for job scheduling and data extraction. When false, the source is effectively paused or deactivated, and jobs associated with it can be skipped or canceled.
- **Validations:**
Must be a boolean value (true or false).

### interval
- **Type:** Integer
- **Usage & Meaning:**
The interval field defines the minimum time interval—typically in seconds—that must elapse between successive jobs (or scraping sessions) for the same source. This helps ensure that jobs are not created too frequently and provides a buffer to conform with rate-limiting policies. For example, if interval is set to 10, new jobs will not be scheduled until at least 10 seconds have passed since the last job’s execution for that source.
- **Validations:**
Must be an integer.
Should be within any application-specific allowed limits.
Typically greater than zero (unless a special value like -1 indicates a one-time run).

### tag
- **Type:** String (Identifier)
- **Usage & Meaning:**
The id_tag field represents the identifier of a tag associated with the source. It is used to group or filter sources (and corresponding profiles) by certain categories or labels. In job assignment, for example, profiles are considered only if they share the same id_tag as the source.

### max_jobs
- **Type:** Integer
- **Usage & Meaning:**
This field represents the maximum number of jobs that are allowed to be created or processed for a given source. In the job planning logic, once the number of performed jobs for a source reaches the max_jobs value, no new jobs will be scheduled (or they are run “once”). A value of 0 or negative might indicate that there is no limit.

### event_limit
- **Type:** Integer
- **Usage & Meaning:**
The event_limit specifies the target number of event elements (e.g., posts, leads, etc.) to find when scraping a source. During a job’s execution, this limit is used to decide when to stop scrolling or performing additional actions. If the number of events scraped reaches the event_limit, the job can stop collecting further events.

### download_pictures
- **Type:** Boolean
- **Usage & Meaning:**
This flag indicates whether the source should trigger the download of images (or pictures) linked to an event. In the job’s can_download_images? method (which checks both the profile’s and source’s capabilities), this value controls whether multiple file downloads (e.g., pictures for social posts) are permitted.

### scrolling_step
- **Type:** Integer
- **Usage & Meaning:**
The scrolling_step defines the fixed vertical distance (typically in pixels) to scroll down during each iteration when trying to reveal additional event elements on a page. This is used as the base value for each scroll action.

### scrolling_step_random
- **Type:** Integer
- **Usage & Meaning:**
This field defines an additional random offset added to the scrolling_step for each scroll action. The purpose is to vary the scrolling increment slightly (to mimic human behavior or to avoid detection), making the total scroll offset equal to scrolling_step + rand(scrolling_step_random).

### max_scrolls
- **Type:** Integer
- **Usage & Meaning:**
max_scrolls sets the maximum number of scroll attempts (iterations) that the job should perform when trying to load enough event elements. This acts as a safeguard to prevent an endless scrolling loop if the desired event_limit is not reached.

### max_scrolls_random
- **Type:** Integer
- **Usage & Meaning:**
Like the scrolling step randomness, this field provides an additional random amount which can be added to the base max_scrolls value. The effective maximum number of scroll attempts becomes max_scrolls + rand(max_scrolls_random), thus introducing some variability in how many scroll actions are permitted before aborting.

### delay_base
- **Type:** Integer (Seconds)
- **Usage & Meaning:**
This field represents the fixed (base) delay time in seconds to wait after a page load or when performing a navigation step. For example, after opening a URL, the job will wait at least delay_base seconds before proceeding with further actions (such as clicking elements or scrolling).

### delay_random
- **Type:** Integer (Seconds)
- **Usage & Meaning:**
In conjunction with delay_base, this field provides an additional random delay (in seconds). The total waiting time becomes delay_base + rand(delay_random). This randomness helps mimic natural user behavior and may help to avoid triggering anti-scraping mechanisms.

### total_results
- **Type:** Integer
- **Usage & Meaning:**
This optional field can be used to denote an overall cap on the number of event results or data entries that the source should return or process. In contexts where the source supports pagination or dynamic loading, total_results can serve as a target for the maximum number of items to retrieve in total. (Note: In the provided code, this field is not directly referenced, so its interpretation may be determined by further business logic or future functionality.)

### page_results
- **Type:** Integer
- **Usage & Meaning:**
Similar to total_results, the page_results field is used in sources that support pagination. It defines the number of results (items/events) expected or permitted per page when paginating through results. This allows the system to better control data chunks during processing. (Again, the exact usage depends on how pagination is implemented in specific source types.)

### paginable
- **Type:** Boolean
- **Usage & Meaning:**
The paginable field determines whether the source supports pagination. When true, it indicates that the data can be broken into pages (or that multiple pages need to be processed). This setting can affect how the job or source “do” method handles data retrieval—for instance, whether it should expect and process multiple pages of results.


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