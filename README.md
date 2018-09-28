# Todo Backend - Hanami Implementation

Sample implementation for [Todo-Backend](http://www.todobackend.com) using Hanami and Postgres.

## Setup

There is a docker container to run a Postgres instance in for local development.

You'll need Docker and Docker compose installed to use it.

```
docker-compose up -d
```

How to run tests:

```
% bundle exec rspec
```

How to run the development console:

```
% bundle exec hanami console
```

How to run the development server:

```
% bundle exec hanami server
```

How to prepare (create and migrate) DB for `development` and `test` environments:

```
% bundle exec hanami db prepare

% HANAMI_ENV=test bundle exec hanami db prepare
```

### Deployment

If for some reason you want to actually deploy this you'll need to ensure the `BASE_URL` environment variable is set on your server.

Explore Hanami [guides](http://hanamirb.org/guides/), [API docs](http://docs.hanamirb.org/1.2.0/), or jump in [chat](http://chat.hanamirb.org) for help. Enjoy! 🌸
