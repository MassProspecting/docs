# Mass::Tag API Documentation

Mass::Tag is a class designed to manage tags within the MassProspecting system. It facilitates the insertion, retrieval, and updating of tag information such as the tag's name and color. It ensures the validation of input data and handles operations like error-checking and normalization. Tags are used to categorize and organize data efficiently.

## Insert

To insert a new tag, the following fields are required:

- **name** (string): The name of the tag.
- **color_code** (string or symbol): The color code representing the tag's color. It should be a valid key from the pre-defined color palette (e.g., `:red`, `:green`, `:blue`, etc.).

Validations include:
- Name should be a non-empty string.
- Name must be less than 255 characters.
- The `color_code` must be either a symbol or string and should exist in the color palette.

Example:

```json
{
    "name": "High Priority",
    "color_code": ":red"
}
```

## Page

To retrieve paginated lists of tags, the following fields can be specified:

Required fields:
- None

Optional fields:
- **filters** (object): Contains fields to filter the tags. It can include:
  - **name** (string): Filter tags matching the provided name.
- **order** (string): Field by which to order the results. Defaults to "create_time".
- **asc** (boolean): Whether to sort the results in ascending or descending order. Defaults to true (ascending).

Example:

```json
{
    "filters": {
        "name": "Priority"
    },
    "order": "name",
    "asc": true
}
```

## Update

To update an existing tag, the following fields are required:

- **id** (UUID): The unique identifier of the tag to update.
- **name** (string): The updated name of the tag.
- **color_code** (string or symbol): The updated color code of the tag following the same palette guidelines.

Validations include:
- The tag `id` must exist.
- Name should be a non-empty string.
- Name must be less than 255 characters.
- The `color_code` must be either a symbol or string and should exist in the color palette.

Example:

```json
{
    "id": "ce8f4180-1022-11ed-861d-0242ac120002",
    "name": "Urgent",
    "color_code": ":orange"
}
```# Mass::Tag API Documentation

Mass::Tag is a class designed to manage tags within the MassProspecting system. It facilitates the insertion, retrieval, and updating of tag information such as the tag's name and color. It ensures the validation of input data and handles operations like error-checking and normalization. Tags are used to categorize and organize data efficiently.

## Insert

To insert a new tag, the following fields are required:

- **name** (string): The name of the tag.
- **color_code** (string or symbol): The color code representing the tag's color. It should be a valid key from the pre-defined color palette (e.g., `:red`, `:green`, `:blue`, etc.).

Validations include:
- Name should be a non-empty string.
- Name must be less than 255 characters.
- The `color_code` must be either a symbol or string and should exist in the color palette.

Example:

```json
{
    "name": "High Priority",
    "color_code": ":red"
}
```

## Page

To retrieve paginated lists of tags, the following fields can be specified:

Required fields:
- None

Optional fields:
- **filters** (object): Contains fields to filter the tags. It can include:
  - **name** (string): Filter tags matching the provided name.
- **order** (string): Field by which to order the results. Defaults to "create_time".
- **asc** (boolean): Whether to sort the results in ascending or descending order. Defaults to true (ascending).

Example:

```json
{
    "filters": {
        "name": "Priority"
    },
    "order": "name",
    "asc": true
}
```

## Update

To update an existing tag, the following fields are required:

- **id** (UUID): The unique identifier of the tag to update.
- **name** (string): The updated name of the tag.
- **color_code** (string or symbol): The updated color code of the tag following the same palette guidelines.

Validations include:
- The tag `id` must exist.
- Name should be a non-empty string.
- Name must be less than 255 characters.
- The `color_code` must be either a symbol or string and should exist in the color palette.

Example:

```json
{
    "id": "ce8f4180-1022-11ed-861d-0242ac120002",
    "name": "Urgent",
    "color_code": ":orange"
}
```