# TRACKER API
The Tracker API allows users to login and create to-do lists with items to accomplish tasks.
#### View [Front-End Repository](https://github.com/whitneyburton/todo-fe)

### Technologies & Versions
* [Rails 5.2.3](https://guides.rubyonrails.org/)
* [Devise](https://github.com/plataformatec/devise#starting-with-rails)

### Set-up: 
#### Back-end
In your terminal:

Run `git clone git@github.com:whitneyburton/todo-be.git`  

Run `bundle install` from the root directory  

Run `rails server` 

--- 
### User Endpoints
--- 
#### `POST /api/v1/sessions`
Signs an existing user in.
#### Required Parameters
- `email`
- `password`

Example: 
`POST /api/v1/sessions?email=sally@gmail.com&password=123123`
#### Returned Data Format
```
{
  "authentication_token": "CYHPS5Gg9LEbhmjijSec"
  "email": "sally@gmail.com"
  "id": 1
}
```

--- 
#### `DELETE /api/v1/sessions/:id`
Signs the existing user out. **WIP**

Returns a 204 status.

Does not return any data.

--- 
### To-dos/Items Endpoints
--- 
#### `GET /api/v1/users/:id/todos`
Returns all of the to-do's for the specified user.
#### Returned Data Format
```
[
  {
    "created_at": "2019-05-16T21:10:13.164Z"
    "id": 4
    "title": "Get groceries"
    "updated_at": "2019-05-16T21:10:13.164Z"
    "user_id": 1
  },
  {
    "created_at": "2019-05-16T21:10:13.164Z"
    "id": 5
    "title": "Complete project"
    "updated_at": "2019-05-16T21:10:13.164Z"
    "user_id": 1
  }
]
```

--- 
#### `GET /api/v1/users/:id/todos/:todo_id/items`
Returns the item for the specified to-do for the specified user.
#### Returned Data Format
```
[
  {
    "created_at": "2019-05-16T21:26:57.871Z"
    "done": true
    "id": 6
    "name": "BACON"
    "todo_id": 4
    "updated_at": "2019-05-16T21:27:01.021Z"
  },
  {
    "created_at": "2019-05-16T21:26:57.871Z"
    "done": true
    "id": 6
    "name": "Add tests to Redux thunks"
    "todo_id": 5
    "updated_at": "2019-05-16T21:27:01.021Z"
  }
]
```

--- 
#### `POST /api/v1/users/:id/todos`
Creates a new to-do for the specified user.

Returns a 201 status.

Returns the newly created to-do.

#### Required Parameters
- `title`
- `user_id`

Example:
`POST /api/v1/users/1/todos?title=Clean House&user_id=1`
#### Returned Data Format
```
{
  "created_at": "2019-05-16T21:10:13.164Z"
  "id": 4
  "title": "Clean House"
  "updated_at": "2019-05-16T21:10:13.164Z"
  "user_id": 1
}
```

--- 
#### `POST /api/v1/users/:id/todos/:todo_id/items`
Creates a new item for the specified to-do for the specified user.

Returns a 201 status.

Does not return any data.

#### Required Parameters
- `name`
- `done` (whether the item has been completed or not)

Example:
`POST /api/v1/users/1/todos/1/items?name=Wash the windows&done=false`


--- 
#### `PUT /api/v1/users/:id/todos/:todo_id/items/:item_id`
Updates the done true/false value for an item for the to-do for the specified user.

Returns a 204 status.

Does not return any data.

#### Required Parameters
- `done`

Example:
`POST /api/v1/users/1/todos/2`

--- 
#### `DELETE /api/v1/users/:id/todos/:todo_id`
Deletes the to-do and it's associated item.

Returns a 204 status.

Does not return any data.

Example:
`DELETE /api/v1/users/1/todos/2`

---
## Contributors
**[Whitney Burton](https://github.com/whitneyburton)**
