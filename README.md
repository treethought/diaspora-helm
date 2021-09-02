# diaspora

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.7.15.0](https://img.shields.io/badge/AppVersion-v0.7.15.0-informational?style=flat-square)

Diaspora helm chart for kubernetes

**Homepage:** <https://diasporafoundation.org>

## Source Code

* <https://github.com/treethought/diaspora-helm>
* <https://gitlab.koehn.com/docker/diaspora>
* <https://hub.docker.com/r/koehn/diaspora/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 10.3.17 |
| https://charts.bitnami.com/bitnami | redis | 13.0.* |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| clusterDomain | string | `"cluster.local"` |  |
| database.postgresql.enabled | bool | `true` | whether to enable the provided postresql dependency |
| diaspora.configuration.admins.account | string | `"podmaster"` |  |
| diaspora.configuration.admins.podmin_email | string | `"podmin@example.org"` |  |
| diaspora.configuration.chat.enabled | bool | `false` | Enable the chat service and all its components. Please make sure that you followed the Installation-Instructions first: https://wiki.diasporafoundation.org/Integration/Chat#Installation.2FUpdate |
| diaspora.configuration.chat.server.bosh.address | string | `"0.0.0.0"` |  |
| diaspora.configuration.chat.server.bosh.bind | string | `"/http-bind"` |  |
| diaspora.configuration.chat.server.bosh.port | int | `5280` |  |
| diaspora.configuration.chat.server.bosh.proto | string | `"http"` |  |
| diaspora.configuration.chat.server.bosh.proxy | bool | `true` |  |
| diaspora.configuration.chat.server.certs | string | `"config/certs"` | Set the directory in which to look for virtual hosts TLS certificates. |
| diaspora.configuration.chat.server.enabled | bool | `false` | Use the configuration bridge to prosody. In case you want to run your own server or want to configure prosody on your own, you should disable it. |
| diaspora.configuration.chat.server.log | string | `nil` | Specify log behaviour here. |
| diaspora.configuration.environment.assets.serve | bool | `true` | Serve static assets via the appserver  This is highly discouraged for production use. Let your reverse proxy/webserver do it by serving the files under public/ directly. TODO disable this |
| diaspora.configuration.environment.assets.upload | bool | `false` | Upload your assets to S3  |
| diaspora.configuration.environment.certificate_authorities | string | `"/etc/ssl/certs/ca-certificates.crt"` | Set the bundle of certificate authorities (CA) certificates. This is specific to your operating system. Examples (uncomment the relevant one or add your own): For Debian, Ubuntu, Archlinux, Gentoo (package ca-certificates): |
| diaspora.configuration.environment.image_redirect_url | string | `""` | Set redirect URL for an external image host (Amazon S3 or other). If hosting images for your pod on an external server (even your own), add its URL here. All requests made to images under /uploads/images will be redirected to https://yourhost.tld/uploads/images/ |
| diaspora.configuration.environment.logging.debug | object | `{"federation":false,"sql":false}` | Debug logging |
| diaspora.configuration.environment.logging.debug.federation | bool | `false` | Enables the federation-debug-log  This logs all XMLs that are used for the federation |
| diaspora.configuration.environment.logging.debug.sql | bool | `false` | Enables the debug-logging for SQL  This logs every SQL-statement! |
| diaspora.configuration.environment.logging.logrotate.days | int | `7` | The number of days to keep  |
| diaspora.configuration.environment.logging.logrotate.enable | bool | `true` | Roll the application log on a daily basis  |
| diaspora.configuration.environment.pubsub_server | string | `"https://pubsubhubbub.appspot.com/"` | Pubsub server  Diaspora is only tested against the default pubsub server. You probably don't want to uncomment or change this. |
| diaspora.configuration.environment.redis | string | this will be set automatically based on included redis dependency | URL for a remote Redis  Don't forget to restrict IP access if you uncomment these! |
| diaspora.configuration.environment.require_ssl | bool | `true` |  |
| diaspora.configuration.environment.s3.bucket | string | `"my_photos"` |  |
| diaspora.configuration.environment.s3.cache | bool | `true` | Use max-age header on Amazon S3 resources  When true, this allows locally cached images to be served for up to one year. This can improve load speed and save requests to the image host. Set to false to revert to browser defaults (usually less than one year). |
| diaspora.configuration.environment.s3.enable | bool | `false` | Use Amazon S3 instead of your local filesystem |
| diaspora.configuration.environment.s3.key | string | `"change_me"` |  |
| diaspora.configuration.environment.s3.region | string | `"us-east-1"` |  |
| diaspora.configuration.environment.s3.secret | string | `"change_me"` |  |
| diaspora.configuration.environment.sidekiq.backtrace | int | `15` | Lines of backtrace that are stored on failure  Set n to the required value. Set this to false to reduce Redis memory usage (and log size) if you're not interested in this data. |
| diaspora.configuration.environment.sidekiq.concurrency | int | `5` | Number of parallel threads Sidekiq uses  If you touch this, please set the pool setting in your database.yml to a value that's at minimum close to this! You can safely increase it to 25 and more on a medium-sized pod. This applies per started Sidekiq worker, so if you set it to 25 and start two workers, you'll process up to 50 jobs in parallel. |
| diaspora.configuration.environment.sidekiq.dead_jobs_limit | int | `5000` | Number of jobs to keep in the dead queue  Jobs get into the dead queue after they failed and exhausted all retries. Increasing this setting will increase the memory usage of Redis. Once gone from the dead queue, a failed job is permanently lost and cannot be retried manually. |
| diaspora.configuration.environment.sidekiq.dead_jobs_timeout | int | `3628800` | Number of seconds a job remains in the dead queue  Jobs get into the dead queue after they failed and exhausted all retries. Increasing this setting will increase the memory usage of Redis. Once gone from the dead queue, a failed job is permanently lost and cannot be retried manually. |
| diaspora.configuration.environment.sidekiq.log | string | `"log/sidekiq.log"` | Log file for Sidekiq  |
| diaspora.configuration.environment.sidekiq.retry | int | `10` | Number of times a job is retried  There's an exponential effect to this: if you set this too high you might get too many jobs building up in the queue. Set it to 0 to disable it completely. |
| diaspora.configuration.environment.single_process_mode | bool | `false` | Single-process mode (default=false). If set to true, Diaspora will work with just the appserver (Unicorn by default) running. However, this makes it quite slow as intensive jobs must be run all the time inside the request cycle. We strongly recommended you leave this disabled for production setups. Set to true to enable. |
| diaspora.configuration.environment.url | string | will be set based on .Values.host | Set the hostname of the machine you're running Diaspora on, as seen from the internet. This should be the URL you want to use to access the pod. So if you plan to use a reverse proxy, it should be the URL the proxy listens on. DO NOT CHANGE THIS AFTER INITIAL SETUP! However changing http to https is okay and has no consequences. If you do change the URL, you will have to start again as the URL will be hardcoded into the database. |
| diaspora.configuration.mail.enable | bool | `false` |  |
| diaspora.configuration.mail.method | string | `"smtp"` | selects which mailer should be used. Use 'smtp' for a smtp connection or 'sendmail' to use the sendmail binary. |
| diaspora.configuration.mail.sender_address | string | `"no-reply@example.org"` | Sender address used in mail sent by Diaspora. |
| diaspora.configuration.mail.sendmail | string | `nil` |  |
| diaspora.configuration.mail.smtp | string | `nil` |  |
| diaspora.configuration.map.mapbox.access_token | string | `"youraccesstoken"` |  |
| diaspora.configuration.map.mapbox.enabled | bool | `false` |  |
| diaspora.configuration.map.mapbox.style | string | `"mapbox/streets-v9"` |  |
| diaspora.configuration.privacy.camo | string | `nil` |  |
| diaspora.configuration.privacy.google_analytics_key | string | `""` | Google Analytics  Provide a key to enable tracking by Google Analytics. |
| diaspora.configuration.privacy.jquery_cdn | bool | `false` | Include jQuery from jquery.com's CDN  Enabling this can reduce traffic and speed up load time since most clients already have this one cached. When set to false (the default), the jQuery library will be loaded from your pod's own resources. |
| diaspora.configuration.privacy.piwik.enable | bool | `false` |  |
| diaspora.configuration.privacy.piwik.host | string | `"stats.example.org"` |  |
| diaspora.configuration.privacy.piwik.site_id | int | `1` |  |
| diaspora.configuration.privacy.statistics.comment_counts | bool | `true` | Local comments total count. |
| diaspora.configuration.privacy.statistics.post_counts | bool | `true` | Local post total count. |
| diaspora.configuration.privacy.statistics.user_counts | bool | `true` | Local user total and 6 month active counts. |
| diaspora.configuration.relay.inbound.include_user_tags | bool | `false` | If scope is 'tags', should we include tags that users on this pod follow? These are added in addition to 'pod_tags', if set. |
| diaspora.configuration.relay.inbound.pod_tags | string | `nil` | If scope is 'tags', a comma separated list of tags here can be set. For example "linux,diaspora", to receive posts related to these tags |
| diaspora.configuration.relay.inbound.scope | string | `"tags"` | Scope is either 'all' or 'tags' (default). - 'all', means this pod wants to receive all public posts from a relay - 'tags', means this pod wants only posts tagged with certain tags |
| diaspora.configuration.relay.inbound.subscribe | bool | `false` | Enable this to receive public posts from relays |
| diaspora.configuration.relay.outbound.send | bool | `false` | Enable this setting to send out public posts from this pod to a relay |
| diaspora.configuration.relay.outbound.url | string | `"https://relay.iliketoast.net/receive/public"` | Change default remote relay url used for sending out here |
| diaspora.configuration.server.embed_sidekiq_worker | bool | `false` | Embed a Sidekiq worker inside the unicorn process  Useful for minimal Heroku setups. |
| diaspora.configuration.server.listen | string | `"0.0.0.0:3000"` | Where the appserver should listen to  @default this will be set based on service.port value |
| diaspora.configuration.server.pid | string | `"tmp/pids/web.pid"` | Set the path for the PID file of the unicorn master process  |
| diaspora.configuration.server.rails_environment | string | `"production"` |  |
| diaspora.configuration.server.sidekiq_workers | int | `1` | Number of Sidekiq worker processes  In most cases it is better to increase environment.sidekiq.concurrency instead! |
| diaspora.configuration.server.stderr_log | string | `"/usr/local/app/diaspora/log/unicorn-stderr.log"` | Write unicorn stderr log. |
| diaspora.configuration.server.stdout_log | string | `"/usr/local/app/diaspora/log/unicorn-stdout.log"` | Write unicorn stdout log. |
| diaspora.configuration.server.unicorn_timeout | int | `90` | Number of seconds before a request is aborted  Increase if you get empty responses, or if large image uploads fail. Decrease if you're under heavy load and don't care if some requests fail. |
| diaspora.configuration.server.unicorn_worker | int | `2` | Number of Unicorn worker processes  Increase this if you have many users. |
| diaspora.configuration.services.facebook.app_id | string | `"abcdef"` |  |
| diaspora.configuration.services.facebook.authorized | bool | `false` |  |
| diaspora.configuration.services.facebook.enable | bool | `false` |  |
| diaspora.configuration.services.facebook.secret | string | `"change_me"` |  |
| diaspora.configuration.services.tumblr.enable | bool | `false` |  |
| diaspora.configuration.services.tumblr.key | string | `"abcdef"` |  |
| diaspora.configuration.services.tumblr.secret | string | `"change_me"` |  |
| diaspora.configuration.services.twitter.enable | bool | `false` |  |
| diaspora.configuration.services.twitter.key | string | `"abcdef"` |  |
| diaspora.configuration.services.twitter.secret | string | `"change_me"` |  |
| diaspora.configuration.services.wordpress.client_id | string | `"abcdef"` |  |
| diaspora.configuration.services.wordpress.enable | bool | `false` |  |
| diaspora.configuration.services.wordpress.secret | string | `"change_me"` |  |
| diaspora.configuration.settings.autofollow_on_join | bool | `true` |  |
| diaspora.configuration.settings.autofollow_on_join_user | string | `"hq@pod.diaspora.software"` |  |
| diaspora.configuration.settings.bitcoin_address | string | `"change_me"` |  |
| diaspora.configuration.settings.captcha.captcha_length | int | `5` | Length of captcha text (default=5)(max=12) |
| diaspora.configuration.settings.captcha.distortion | string | `"low"` |  |
| diaspora.configuration.settings.captcha.enable | bool | `true` |  |
| diaspora.configuration.settings.captcha.image_size | string | `"120x20"` | Captcha image size  |
| diaspora.configuration.settings.captcha.image_style | string | `"simply_green"` |  |
| diaspora.configuration.settings.changelog_url | string | `"https://github.com/diaspora/diaspora/blob/master/Changelog.md"` |  |
| diaspora.configuration.settings.community_spotlight.enable | bool | `false` | Enable community spotfilight  |
| diaspora.configuration.settings.community_spotlight.suggest_email | string | `"admin@example.org"` | E-mail address to which users can make suggestions about who should be in the community spotlight (optional). |
| diaspora.configuration.settings.csp.report_only | bool | `true` |  |
| diaspora.configuration.settings.csp.report_uri | string | `""` |  |
| diaspora.configuration.settings.default_color_theme | string | `"original"` | Default color theme You can change which color theme is displayed when a user is not signed in or has not selected any color theme from the available ones. You simply have to enter the name of the theme's folder in "app/assets/stylesheets/color_themes/". ("original" for the theme in "app/assets/stylesheets/color_themes/original/", for example). |
| diaspora.configuration.settings.default_metas.description | string | `"diaspora* is the online social world where you are in control."` |  |
| diaspora.configuration.settings.default_metas.title | string | `"diaspora* social network"` |  |
| diaspora.configuration.settings.enable_registrations | bool | `true` |  |
| diaspora.configuration.settings.export_concurrency | int | `1` | Maximum number of parallel user data export jobs  Be careful, exports of big/old profiles can use a lot of memory, running many of them in parallel can be a problem for small servers. |
| diaspora.configuration.settings.invitations.count | int | `25` | Number of invitations per invite link  Every user will see such a link if you have enabled invitations on your pod. |
| diaspora.configuration.settings.invitations.open | bool | `true` |  |
| diaspora.configuration.settings.liberapay_username | string | `"change_me"` |  |
| diaspora.configuration.settings.maintenance.remove_old_users.after_days | int | `730` |  |
| diaspora.configuration.settings.maintenance.remove_old_users.enable | bool | `false` |  |
| diaspora.configuration.settings.maintenance.remove_old_users.limit_removals_to_per_day | int | `100` | Limit queuing for removal per day. |
| diaspora.configuration.settings.maintenance.remove_old_users.warn_days | int | `30` |  |
| diaspora.configuration.settings.paypal_donations.currency | string | `"USD"` | Currency used (USD, EUR...) |
| diaspora.configuration.settings.paypal_donations.enable | bool | `false` | enable paybal donations towards running the pod |
| diaspora.configuration.settings.paypal_donations.paypal_hosted_button_id | string | `"change_me"` |  |
| diaspora.configuration.settings.paypal_donations.paypal_unhosted_button_encrypted | string | `"-----BEGIN PKCS7-----"` |  |
| diaspora.configuration.settings.pod_name | string | `"diaspora*"` | The pod name displayed in various locations, including the header. |
| diaspora.configuration.settings.source_url | string | `""` |  |
| diaspora.configuration.settings.terms.enable | bool | `false` |  |
| diaspora.configuration.settings.terms.jurisdiction | string | `""` |  |
| diaspora.configuration.settings.terms.minimum_age | bool | `false` | Age limit for signups. Set a number to activate this setting. This age limit is shown in the default ToS document. |
| diaspora.configuration.settings.typhoeus_concurrency | int | `20` | Maximum number of parallel HTTP requests made to other pods  Be careful, raising this setting will heavily increase the memory usage of your Sidekiq workers. |
| diaspora.configuration.settings.typhoeus_verbose | bool | `false` |  |
| diaspora.configuration.settings.welcome_message.enabled | bool | `false` |  |
| diaspora.configuration.settings.welcome_message.subject | string | `"Welcome Message"` |  |
| diaspora.configuration.settings.welcome_message.text | string | `"Hello %{username}, welcome to diaspora."` |  |
| diaspora.development.environment | string | `nil` |  |
| diaspora.production.environment | string | `nil` |  |
| fullnameOverride | string | `""` |  |
| host | string | `"diaspora.example.com"` | the hostname of your diaspora pod |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"koehn/diaspora"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.labels | object | `{}` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.global.postgresql.postgresqlDatabase | string | `"diaspora_production"` |  |
| postgresql.global.postgresql.postgresqlPassword | string | `"diaspora"` |  |
| postgresql.global.postgresql.postgresqlUsername | string | `"diaspora"` |  |
| postgresql.global.postgresql.servicePort | int | `5432` |  |
| postgresql.persistence.size | string | `"10Gi"` |  |
| redis.enabled | bool | `true` |  |
| redis.password | string | `"changeme"` |  |
| redis.usePassword | bool | `false` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `3000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)
