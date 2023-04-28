# Tecnoglass project

Este proyecto es una API que se encarga de manejar los pedidos y los clientes para una tienda virtual. Los clientes pueden hacer pedidos, que a su vez contienen varios artículos de vidrio.

## Requisitos
Este proyecto fue desarrollado en Ruby 2.7.5 y Rails 7.0.4. Asegúrate de tener estas versiones instaladas en tu computadora antes de intentar correr el proyecto.

## Instalación
`git clone git@github.com:Rubncal04/tecnoglass.git`

* Instala las gemas necesarias:
`bundle i`

* Crea la base de datos y corre las migraciones:
`rails db:create`
`rails db:migrate`

* Corre el servidor:
`rails server` o `rails s`

## Uso
### Autenticación
Para usar la API, necesitas estar autenticado. Puedes hacer esto enviando una solicitud POST a api/v1/auth/login con tus credenciales. Recibirás un token JWT que debes usar en las solicitudes posteriores.

* ejemplo:
#### POST `{{URL}}/api/v1/auth/login`
* Request:
```
{
    "user_name": "user_name",
    "password": "123456"
}
```

O
```
{
    "email": "ejemplo@gmail.com",
    "password": "123456"
}
```

* Response:
```
{
  "token": {{TOKEN}}
}
```

### Sign up
#### POST `{{URL}}/api/v1/users`
* Request:
```
{
    "user": {
        "name": "Name",
        "user_name": "user_name",
        "email": "ejemplo@gmail.com",
        "password": "123456"
    }
}
```

* Response:
```
{
  "user":
    {
      "name": "Name",
      "user_name": "user_name",
      "email": "ejemplo@gmail.com",
      "password": "123456"
     },
   "token": {{TOKEN}}
}
```
""" Update user
#### PUT `{{URL}}/api/v1/users/:id`

* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```
* Body:
```
{
    "user": {
        "name": "name",
        "user_name": "user_name",
        "email": "ejemplo@gmail.com",
        "password": "123456"
    }
}
```

* Response:
```
{
    "user": {
        "name": "name",
        "user_name": "user_name",
        "email": "ejemplo@gmail.com",
        "password": "123456"
    }
}
```

### Endpoints
A continuación se muestran los endpoints disponibles en la API:

### Customers
####GET `{{URL}}/api/v1/customers: devuelve una lista de todos los clientes.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```

* Response:
```
{
  "name": "Testing 2",
  "address": "calle 2 # 3",
  "phone": "312456",
  "email": "testing2@gmail.com",
  "nationality": "colombia"
}
```


#### GET `{{URL}}/api/v1/customers/:id`: devuelve información sobre un cliente específico.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```
* Response:
```
{
  "name": "Testing 2",
  "address": "calle 2 # 3",
  "phone": "312456",
  "email": "testing2@gmail.com",
  "nationality": "colombia"
}
```

#### POST `{{URL}}/api/v1/customers`: crea un nuevo cliente.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```
* Body:
```
{
    "customer": {
        "name": "Testing 2",
        "address": "calle 2 # 3",
        "phone": "312456",
        "email": "testing2@gmail.com",
        "nationality": "colombia"
    }
}
```

* Response:
```
{
  "name": "Testing 2",
  "address": "calle 2 # 3",
  "phone": "312456",
  "email": "testing2@gmail.com",
  "nationality": "colombia"
}
```

#### PATCH `{{URL}}/api/v1/customers/:id`: actualiza la información de un cliente.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```
* Body:
```
{
    "customer": {
        "name": "Testing 2",
        "address": "calle 2 # 3",
        "phone": "312456",
        "email": "testing2@gmail.com",
        "nationality": "colombia"
    }
}
```

* Response:
```
{
  "name": "Testing 2",
  "address": "calle 2 # 3",
  "phone": "312456",
  "email": "testing2@gmail.com",
  "nationality": "colombia"
}
```

#### DELETE `{{URL}}/api/v1/customers/:id`: elimina un cliente y todos sus pedidos asociados.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```

* Response:
`Head no content`

### Orders
#### GET `{{URL}}/api/v1/orders`: devuelve una lista de todos los pedidos.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```

#### GET `{{URL}}/api/v1/orders/:id`: devuelve información sobre un pedido específico.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```

* Response:
```
{
  "num_order": "1234we",
  "order_date": "2023-04-27",
  "status": "approved",
  "customer_id": 3
}
```

#### POST `{{URL}}/api/v1/orders`: crea un nuevo pedido.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```
* Body:
```
{
    "order": {
        "num_order": "1234we",
        "order_date": "2023-04-27",
        "status": "approved",
        "customer_id": 3
    }
}
```

* Response:
```
{
  "num_order": "1234we",
  "order_date": "2023-04-27",
  "status": "approved",
  "customer_id": 3
}
```

#### POST `{{URL}}/api/v1/orders/:id/:approve`: actualiza el estado de una orden a aprobada.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```
* Response:
```
{
    { "message": "Order approved" }
}
```

#### POST `{{URL}}/api/v1/orders/:id/:reject`: actualiza el estado de una orden a rechazada.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```

* Response:
```
{
    { "message": "Order rejected" }
}
```

### Glass Items
##### GET `{{URL}}/api/v1/glass_items`: devuelve una lista de todos los artículos de vidrio.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```

* Response:
```
[
  {
    "item_sequential_num": "12332",
    "width": "12.3",
    "height": "14.5",
    "order_id": 4
  },
  {
    "item_sequential_num": "1232",
    "width": "12",
    "height": "14.5",
    "order_id": 4
  }
]
```

#### GET `{{URL}}/api/v1/glass_items/:id`: devuelve información sobre un artículo de vidrio específico.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```

* Response:
```
{
  "item_sequential_num": "1232",
  "width": "12",
  "height": "14.5",
  "order_id": 4
}
```

#### POST `{{URL}}/api/v1/glass_items`: crea un nuevo artículo de vidrio.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```
* Body:
```
{
  "glass_item": {
    "item_sequential_num": "12332",
    "width": "12.3",
    "height": "14.5",
    "order_id": 4
  }
}
```

* Response:
```
{
  "item_sequential_num": "1232",
  "width": "12",
  "height": "14.5",
  "order_id": 4
}
```
#### PATCH `{{URL}}/api/v1/glass_items/:id`: actualiza la información de un artículo de vidrio.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```
* Body:
```
{
  "glass_item": {
    "item_sequential_num": "12332",
    "width": "12.3",
    "height": "14.5",
    "order_id": 4
  }
}
```

* Response:
```
{
  "item_sequential_num": "1232",
  "width": "12",
  "height": "14.5",
  "order_id": 4
}
```

#### DELETE `{{URL}}/api/v1/glass_items/:id`: elimina un artículo de vidrio específico.
* Request:
* Head:
```
{ "Authorization": {{TOKEN}} }
```

* Response:
`Head no content`
`Status code: Ok (200)`
