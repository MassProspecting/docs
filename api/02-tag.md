
# Mass::Tag Stub Class Documentation

The `Mass::Tag` class is a Ruby stub class that represents a Tag object within the Mass system. This class provides a client-side interface to interact with Tag resources via API communication, abstracting away the direct database interactions handled by the server-side skeleton class.

## Table of Contents

- [Overview](#overview)
- [Inheritance](#inheritance)
- [Class Methods](#class-methods)
  - [object_name](#object_name)
  - [page](#page)
  - [count](#count)
  - [get](#get)
  - [insert](#insert)
  - [update](#update)
  - [upsert](#upsert)
- [Instance Methods](#instance-methods)
  - [initialize](#initialize)
  - [update (Instance Method)](#update-instance-method)
  - [upsert (Instance Method)](#upsert-instance-method)
- [Usage Examples](#usage-examples)
- [Error Handling](#error-handling)
- [Notes](#notes)
- [Related Classes and Modules](#related-classes-and-modules)

## Overview

The `Mass::Tag` class allows you to perform CRUD (Create, Read, Update, Delete) operations on Tag objects within the Mass system. It communicates with the server via API endpoints defined in the `BlackStack::Base` class. The class handles the serialization and deserialization of Tag objects and provides methods to interact with the server-side resources seamlessly.

## Inheritance

```ruby
module Mass
  class Tag < BlackStack::Base
    def self.object_name
      'tag'
    end
  end
end
```

The `Mass::Tag` class inherits from `BlackStack::Base`, which provides common functionality for stub classes, including methods for API communication and basic CRUD operations.

## Class Methods

### object_name

```ruby
def self.object_name
  'tag'
end
```

Returns the name of the object as a string. This method is used internally by the `BlackStack::Base` class to construct API endpoints.

- **Returns:** `'tag'`

### page

```ruby
def self.page(id_account: nil, promiscuous: false, page:, limit:, filters: {})
```

Retrieves a paginated list of Tag objects.

- **Parameters:**
  - `id_account` (String, optional): The ID of the account to retrieve tags for. If not provided, it defaults to the current user's account unless the user is a sysowner.
  - `promiscuous` (Boolean, optional): Works only for sysowner. If `true`, retrieves all non-deleted tags. If `false`, retrieves tags matching `id_account`. Default is `false`.
  - `page` (Integer): The page number to retrieve.
  - `limit` (Integer): The number of tags per page.
  - `filters` (Hash, optional): Additional filters to apply to the query (e.g., `{'name' => 'Important'}`).

- **Returns:** An array of `Mass::Tag` instances.

- **Example:**

  ```ruby
  tags = Mass::Tag.page(page: 1, limit: 10, filters: {'name' => 'Important'})
  ```

### count

```ruby
def self.count
```

Returns the total count of Tag objects.

- **Returns:** (Integer) The total number of tags.

- **Example:**

  ```ruby
  total_tags = Mass::Tag.count
  ```

### get

```ruby
def self.get(id)
```

Retrieves a Tag object by its ID.

- **Parameters:**
  - `id` (String): The ID of the tag to retrieve.

- **Returns:** A `Mass::Tag` instance.

- **Example:**

  ```ruby
  tag = Mass::Tag.get('some-tag-id')
  ```

### insert

```ruby
def self.insert(desc)
```

Inserts a new Tag object.

- **Parameters:**
  - `desc` (Hash): A hash descriptor of the tag to insert.

- **Returns:** A new `Mass::Tag` instance representing the inserted tag.

- **Example:**

  ```ruby
  new_tag = Mass::Tag.insert({
    'id_account' => 'account-id',
    'id_user' => 'user-id',
    'name' => 'Urgent',
    'color_code' => 'red'
  })
  ```

### update

```ruby
def self.update(desc)
```

Updates an existing Tag object.

- **Parameters:**
  - `desc` (Hash): A hash descriptor of the tag with updated properties. Must include the `id` of the tag to update.

- **Returns:** A `Mass::Tag` instance representing the updated tag.

- **Example:**

  ```ruby
  updated_tag = Mass::Tag.update({
    'id' => 'tag-id',
    'name' => 'Updated Tag Name',
    'color_code' => 'blue'
  })
  ```

### upsert

```ruby
def self.upsert(desc)
```

Inserts or updates a Tag object based on whether it already exists.

- **Parameters:**
  - `desc` (Hash): A hash descriptor of the tag to upsert.

- **Returns:** A `Mass::Tag` instance representing the inserted or updated tag, or `nil` if no changes were made.

- **Example:**

  ```ruby
  tag = Mass::Tag.upsert({
    'id_account' => 'account-id',
    'name' => 'Critical',
    'color_code' => 'orange'
  })
  ```

## Instance Methods

### initialize

```ruby
def initialize(h)
  self.desc = h
end
```

Initializes a new instance of the `Mass::Tag` class with a given hash descriptor.

- **Parameters:**
  - `h` (Hash): A hash descriptor representing the tag's properties.

### update (Instance Method)

```ruby
def update
  self.class.update(self.desc)
end
```

Instance method to update the tag based on its `desc` attribute.

- **Returns:** A `Mass::Tag` instance representing the updated tag.

- **Example:**

  ```ruby
  tag = Mass::Tag.get('tag-id')
  tag.desc['name'] = 'New Tag Name'
  tag.update
  ```

### upsert (Instance Method)

```ruby
def upsert
  self.class.upsert(self.desc)
end
```

Instance method to upsert the tag based on its `desc` attribute.

- **Returns:** A `Mass::Tag` instance representing the upserted tag.

- **Example:**

  ```ruby
  tag = Mass::Tag.new({
    'id_account' => 'account-id',
    'name' => 'Important',
    'color_code' => 'green'
  })
  tag.upsert
  ```

## Usage Examples

### Creating a New Tag

```ruby
new_tag = Mass::Tag.insert({
  'id_account' => 'account-id',
  'id_user' => 'user-id',
  'name' => 'High Priority',
  'color_code' => 'red'
})
```

### Updating an Existing Tag

```ruby
tag = Mass::Tag.get('tag-id')
tag.desc['name'] = 'Updated Tag Name'
tag.desc['color_code'] = 'blue'
tag.update
```

### Upserting a Tag

```ruby
tag = Mass::Tag.new({
  'id_account' => 'account-id',
  'name' => 'Follow Up',
  'color_code' => 'yellow'
})
tag.upsert
```

### Retrieving Tags with Pagination

```ruby
tags = Mass::Tag.page(page: 2, limit: 20, filters: {'name' => 'Follow Up'})
```

### Counting Total Tags

```ruby
total_tags = Mass::Tag.count
```

## Error Handling

All methods that communicate with the server via API calls will raise exceptions if the API call does not return a successful status.

**Example:**

```ruby
begin
  tag = Mass::Tag.get('invalid-id')
rescue => e
  puts "Error: #{e.message}"
end
```

In the above example, if the tag with the given ID does not exist, an exception will be raised with a message indicating the error.

## Notes

- The `desc` attribute holds the tag's properties as a hash and is used when making API calls.
- The `object_name` method is essential for constructing the correct API endpoints.
- The class methods handle serialization and deserialization of data between the client and server.
- Ensure that the `id_account` and `id_user` provided are valid and that the user has the necessary permissions.

## Related Classes and Modules

- **`BlackStack::Base`**: The base class that provides common functionality for stub classes, including methods for API communication and basic CRUD operations.
- **Server-side `Mass::Tag` Skeleton Class**: Handles the database interactions and business logic on the server side.

---

By understanding and utilizing the `Mass::Tag` class, developers can efficiently manage Tag objects within the Mass system, performing operations such as creating new tags, updating existing ones, and retrieving tags based on various criteria.