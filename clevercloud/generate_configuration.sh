echo "
DISABLE_AUTH: true
OSM_VEX: http://localhost:1000
SPARKPOST_KEY: your-sparkpost-key
SPARKPOST_EMAIL: email@example.com
GTFS_DATABASE_URL: jdbc:postgresql://${POSTGRESQL_ADDON_HOST}:${POSTGRESQL_ADDON_PORT}/${POSTGRESQL_ADDON_DB}
GTFS_DATABASE_USER: ${POSTGRESQL_ADDON_USER}
GTFS_DATABASE_PASSWORD: ${POSTGRESQL_ADDON_PASSWORD}
MONGO_URI: ${MONGODB_ADDON_URI}
MONGO_DB_NAME: ${MONGODB_ADDON_DB}
" > configurations/default/env.yml

echo "env.yml:"
cat configurations/default/env.yml

echo "
application:
  assets_bucket: datatools-staging # dist directory
  public_url: http://localhost:9966
  notifications_enabled: false
  port: 8080
  data:
    gtfs: ${APP_HOME}/data
    use_s3_storage: false
    s3_region: us-east-1
    aws_role: arn:aws:iam::${AWS_ACCOUNT_NUMBER}:role/${AWS_ROLE_NAME}
    gtfs_s3_bucket: bucket-name
modules:
  enterprise:
    enabled: false
  editor:
    enabled: false
  user_admin:
    enabled: true
  r5_network:
    enabled: false
  gtfsapi:
    enabled: true
    load_on_fetch: false
    load_on_startup: false
    use_extension: xyz
#    update_frequency: 3600 # in seconds
extensions:
  transitland:
    enabled: false
    api: https://transit.land/api/v1/feeds
  transitfeeds:
    enabled: false
    api: http://api.transitfeeds.com/v1/getFeeds
    key: your-api-key
" > configurations/default/server.yml


echo "server.yml:"
cat configurations/default/server.yml
