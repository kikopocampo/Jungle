# The Jungle

A mini e-commerce application built with Rails 6.1.

![](./public/images/Screen%20Shot%202023-01-03%20at%2010.04.56%20AM.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Usage

After all the set-up, you will be shown a home page that displays the products available and their information.

![](./public/images/navigation.gif)

Product to detail page

![](./public/images/product-detail.gif)

Adding products to cart and checking out

![](./public/images/add-to-cart.gif)

As an admin a sign-in page will be displayed and when entered the correct credentials, access to products, categories, and dashboard will be granted.

![](./public/images/Add%20products.gif)
![](./public/images/add-category.gif)


## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
