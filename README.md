# Jungle

Junlge is a project by myself for the Web Intensive program at Lighthouse Labs. It uses Ruby/Rails with PostgreSQL. The project gave me a mostly completed program that required debugging and feature adding. It is a A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.

Debugging involved:
  - correcting formatting errors for money across pages
  - fixing errors around users with empty shopping carts

Feature adds include:
  - User authorization (using method from https://gist.github.com/thebucknerlife/10090014)
  - Added basic about page and link
  - Added Dashboard with category and product counts
  - Updated cart functionality to represent details from logged in user, pass that information in stripe processinng and reflect on order page
    - as per project requirments a default user remains for the cart
  - Added sales functionality to administration:
    - create sales, monitor active and unactive sales
    - Added sales notification to home page
  - Added detailed description of products to orders page
  - Testing functionality added with both Rsepc and Cypress


NOTE: Stripe credentials and Administrator credentials need to be included in .env file.

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

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
 Testing Modules:
- Rspec
- Cypress

## Screenshots

!["Screenshot of Admin Login"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/admin-login.jpg)
!["Screenshot of Basic Dashboard"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/basic-dashboard.jpg)
!["Screenshot of Cart With Items"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/cart-with-items.jpg)
!["Screenshot of Category Admin Page"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/catagory-admin.jpg)
!["Screenshot of Creat Product Page"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/create-product.jpg)
!["Screenshot of Create Sale"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/create-sale.jpg)
!["Screenshot of Empty Cart"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/empty-cart.jpg)
!["Screenshot of Home Screen With Sale Anouncement"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/home-screen-with-sale.jpg)
!["Screenshot of Login Page"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/login-page.jpg)
!["Screenshot of Product Admin Page"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/product-admin.jpg)
!["Screenshot of Product Feed With Sold Out"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/product-feed-with-sold-out.jpg)
!["Screenshot of Product Feed"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/product-feed.jpg)
!["Screenshot of Sales Admin Page"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/sales-admin.jpg)
!["Screenshot of Sample Order Page"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/sample-order.jpg)
!["Screenshot of Sample Payment"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/sample-payment.jpg)
!["Screenshot of Sign Up Validations"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/sign-up-validations.jpg)
!["Screenshot of Singup Page"](https://github.com/Dechantg/jungle-rails-v2/blob/master/docs/signup-page.jpg)
