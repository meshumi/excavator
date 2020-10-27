# README

[Test app](http://192.81.223.145:44326/)

1. Install throw dokku

  `wget https://raw.githubusercontent.com/dokku/dokku/v0.21.4/bootstrap.sh;`
  `sudo DOKKU_TAG=v0.21.4 bash bootstrap.sh`

2. Setup SSH key and Virtualhost Settings

3. Install Postgres plugin
  `sudo dokku plugin:install https://github.com/dokku/dokku-postgres.git`

4. Create database
  `dokku postgres:create #{db_name}`

5. Add dokku remote to local application
  `git remote add dokku dokku@#{IP or Domain}:#{dokku app name}`

6. Deploy app
  `git push dokku main:master`

7. link database to app
  `dokku postgres:link #{db_name} #{dokku app name}`

8. Run migrations and seeds
  `dokku run rake db:migrate db:seed`


## Tickets list
![Tickets](https://api.monosnap.com/file/download?id=vQny1OmRDnbMgtqLn654dob6YhHpEw)

## Ticket show page
![Polygon](https://api.monosnap.com/file/download?id=rUmgicBOd96xpAFKEm1KExJxEChHIV)
