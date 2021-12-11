# README
---

## Deployment
```sh
Ruby Version 3.0.0
Rails version 6.1.4.1
```

### Instructions
```sh
bundle install
rails db:create db:migrate db:seed
rails s
```
<br/>
<br/>
<br/>

------
------
## EndPoints
<br/>

### User Create

```ruby
EndPoint
http://127.0.0.1:3000/users
```

```sh
Example cURL Request
curl --location --request POST 'http://127.0.0.1:3000/users' \
--form 'user[name]="Saurabh Sharma"' \
--form 'user[email]="saurabh22@email.com"' \
--form 'user[password]="password"' \
--form 'user[password_confirmation]="password"' \
--form 'user[admin]="false"' \
--form 'user[region_id]="1"'
```

```sh
Response
{
    "id": 5,
    "name": "Saurabh Sharma",
    "email": "saurabh221@email.com",
    "password_digest": "$2a$12$cBNimlOgFj/6Y6gS6FAG8.",
    "admin": false,
    "region_id": 1,
    "created_at": "2021-12-11T05:44:42.619Z",
    "updated_at": "2021-12-11T05:44:42.619Z"
}
```

<br/>

---
### Get Regions (All)

```ruby
EndPoint
http://127.0.0.1:3000/regions
```

```sh
Example cURL Request
curl --location --request GET 'http://127.0.0.1:3000/regions'
```

```sh
Response
[
    {
        "id": 1,
        "title": "United States",
        "country_id": 3,
        "currency_id": 1,
        "tax": 5.5,
        "created_at": "2021-12-10T20:43:27.180Z",
        "updated_at": "2021-12-10T20:43:27.180Z"
    },
    {
        "id": 2,
        "title": "Thailand",
        "country_id": 1,
        "currency_id": 3,
        "tax": 5.5,
        "created_at": "2021-12-10T20:43:27.191Z",
        "updated_at": "2021-12-10T20:43:27.191Z"
    }
]
```

<br/>

---
### Get Region (Singular)

```ruby
EndPoint
http://127.0.0.1:3000/region/<region_id>
```

```sh
Example cURL Request
curl --location --request GET 'http://127.0.0.1:3000/region/1'
```

```sh
Response
{
    "id": 1,
    "title": "United States",
    "country_id": 3,
    "currency_id": 1,
    "tax": 5.5,
    "created_at": "2021-12-10T20:43:27.180Z",
    "updated_at": "2021-12-10T20:43:27.180Z"
}
```

<br/>

---
### Get User

```ruby
EndPoint
http://127.0.0.1:3000/users/<user_id>
```

```sh
Example cURL Request
curl --location --request GET 'http://127.0.0.1:3000/users/1' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpc19hZG1pbiI6ZmFsc2V9.aAoBPoCJZ31dh-vJ4kDzyvNyeSBedPn9KIw65Uw8xpg'
```

```sh
Response
{
    "id": 1,
    "name": "Saurabh Sharma",
    "email": "saurabh@email.com",
    "password_digest": "$2a$12$sAmuKGgWiwUXxJdy6AopYOolkl",
    "admin": false,
    "region_id": 1,
    "created_at": "2021-12-10T09:28:55.859Z",
    "updated_at": "2021-12-10T09:28:55.859Z"
}
```

<br/>

---
### Get Products by Region

```ruby
EndPoint
http://127.0.0.1:3000/products/<region_id>
```

```sh
Example cURL Request
curl --location --request GET 'http://127.0.0.1:3000/products/1' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpc19hZG1pbiI6ZmFsc2V9.aAoBPoCJZ31dh-vJ4kDzyvNyeSBedPn9KIw65Uw8xpg'
```

```sh
Response
[
    {
        "id": 1,
        "title": "Product 1 US",
        "description": "Product 1 for US region",
        "image_url": "https://via.placeholder.com/350x350",
        "price": 99.99,
        "sku": "PRUS0001",
        "stock": 100,
        "region_id": 1,
        "created_at": "2021-12-10T09:28:56.144Z",
        "updated_at": "2021-12-10T09:28:56.144Z"
    },
    {
        "id": 2,
        "title": "Product 2 US",
        "description": "Product 2 for US region",
        "image_url": "https://via.placeholder.com/350x350",
        "price": 19.99,
        "sku": "PRUS0002",
        "stock": 10,
        "region_id": 1,
        "created_at": "2021-12-10T09:28:56.155Z",
        "updated_at": "2021-12-10T09:28:56.155Z"
    }
]
```

<br/>

---
### Add Product

```ruby
EndPoint
http://127.0.0.1:3000/cart/add_product/<product_id>/<quantity>
```

```sh
Example cURL Request
curl --location --request GET 'http://127.0.0.1:3000/cart/add_product/2/10' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpc19hZG1pbiI6ZmFsc2V9.aAoBPoCJZ31dh-vJ4kDzyvNyeSBedPn9KIw65Uw8xpg'
```

```sh
Response
{
    "id": 4,
    "cart_id": 2,
    "product_id": 2,
    "quantity": 10,
    "created_at": "2021-12-10T18:58:35.247Z",
    "updated_at": "2021-12-10T18:58:35.247Z"
}
```

<br/>

---
### Uodate Product

```ruby
EndPoint
http://127.0.0.1:3000/cart/update_product/<product_id>/<quantity>
```

```sh
Example cURL Request
curl --location --request PUT 'http://127.0.0.1:3000/cart/update_product/1/2' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpc19hZG1pbiI6ZmFsc2V9.aAoBPoCJZ31dh-vJ4kDzyvNyeSBedPn9KIw65Uw8xpg'
```

```sh
Response
true
```

<br/>

---
### Remove Product

```ruby
EndPoint
http://127.0.0.1:3000/cart/remove_product/<product_id>
```

```sh
Example cURL Request
curl --location --request DELETE 'http://127.0.0.1:3000/cart/remove_product/1' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpc19hZG1pbiI6ZmFsc2V9.aAoBPoCJZ31dh-vJ4kDzyvNyeSBedPn9KIw65Uw8xpg'
```

```sh
Response
{
    "id": 2,
    "cart_id": 2,
    "product_id": 1,
    "quantity": 2,
    "created_at": "2021-12-10T09:39:53.060Z",
    "updated_at": "2021-12-10T12:01:47.218Z"
}
```

<br/>

---
### Get Cart

```ruby
EndPoint
http://127.0.0.1:3000/cart/
```

```sh
Example cURL Request
curl --location --request GET 'http://127.0.0.1:3000/cart/' \
--header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpc19hZG1pbiI6ZmFsc2V9.aAoBPoCJZ31dh-vJ4kDzyvNyeSBedPn9KIw65Uw8xpg'
```

```sh
Response
{
    "name": "Saurabh Sharma",
    "email": "saurabh@email.com",
    "region": {
        "title": "United States",
        "country": "United States of America",
        "currency": "US Dollar",
        "currency_code": "USD"
    },
    "products": [
        {
            "id": 1,
            "title": "Product 1 US",
            "description": "Product 1 for US region",
            "image_url": "https://via.placeholder.com/350x350",
            "price": 99.99,
            "sku": "PRUS0001",
            "quantity": 2
        },
        {
            "id": 2,
            "title": "Product 2 US",
            "description": "Product 2 for US region",
            "image_url": "https://via.placeholder.com/350x350",
            "price": 19.99,
            "sku": "PRUS0002",
            "quantity": 10
        }
    ],
    "totals": {
        "total": "399.88",
        "tax": "21.99",
        "order_total": "421.87"
    }
}
```

<br/>

---
### User Login

```ruby
EndPoint
http://127.0.0.1:3000/users/login
```

```sh
Example cURL Request
curl --location --request POST 'http://127.0.0.1:3000/users/login' \
--form 'user[email]="saurabh@email.com"' \
--form 'user[password]="password123"'
```

```sh
Response
{
    "token": "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJpc19hZG",
    "user_id": 1
}
```