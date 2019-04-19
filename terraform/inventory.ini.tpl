localhost ansible_connection=local ansible_python_interpreter="/usr/bin/env python"

[all:vars]

dockerhub_base=ansible
# Kubernetes Install
kubernetes_context=${kubernetes_context}
kubernetes_namespace=awx

# Common Docker parameters
awx_web_hostname=awxwebhost
postgres_data_dir=/tmp/pgdocker
host_port=80
docker_compose_dir=/tmp/awxcompose

# Set pg_hostname if you have an external postgres server, otherwise
# a new postgres service will be created
pg_hostname=${pg_hostname}
pg_username=${pg_username}
# pg_password should be random 10 character alphanumeric string, when postgresql is running on kubernetes
# NB: it's a limitation of the "official" postgres helm chart
pg_password=${pg_password}
pg_database=postgres
pg_port=5432
pg_sslmode=require

# RabbitMQ Configuration
rabbitmq_password=${rabbitmq_password}
rabbitmq_erlang_cookie=${rabbitmq_erlang_cookie}

# This will create or update a default admin (superuser) account in AWX, if not provided
# then these default values are used
admin_user=${admin_user}
admin_password=${admin_password}

# Whether or not to create preload data for demonstration purposes
create_preload_data=False

# AWX Secret key
# It's *very* important that this stay the same between upgrades or you will lose the ability to decrypt
# your credentials
secret_key=${secret_key}

# Build AWX with official logos
# Requires cloning awx-logos repo as a sibling of this project.
# Review the trademark guidelines at https://github.com/ansible/awx-logos/blob/master/TRADEMARKS.md
# awx_official=false