# README

## Getting Started

Below instructions will get you a copy of the project up and running on your local machine for development.

### Prerequisites

You need to install below the softwares

```
RVM
ruby '3.3.6'
rails, '8.0.1'
MySQL -  8

```

### Installing

```
git clone https://github.com/Thasbeeh/api_app.git
cd api_app
```

### DB setup

Setup the credentials to connect the database in config/database.yml

### Workflow

By default the rails server will run at port:3000 while running local host.

#### User

1. The user can be created using GET request '/register' with payloads username, email, password.
2. The user can be authenticated using POST request '/login' with payloads username and email.

#### Task

3. The tasks can be created using POST request '/tasks' with payloads title, description, status, due_date.
4. The tasks can be listed using GET request '/tasks'. For pagination the 'page' parameter denoting page no. can be passed. By default each page will have 25 records. That also can be changed by passing the 'limit' parameter.
5. A specific task can be retrived using GET request '/tasks/:id'.
6. The task can be updated using UPDATE request '/tasks/:id' with payloads to edit the task.
7. The task can be deleted using DELETE request '/tasks/:id'.


