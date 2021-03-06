#!/usr/bin/env bash

set -o errexit
set -o pipefail

container=$(buildah from fedora:30)

buildah config --author 'Douglas Mendizábal <douglas@redrobot.io>' $container

buildah run $container -- dnf upgrade -y --refresh
buildah run $container -- dnf install -y hostname
buildah run $container -- dnf install -y mariadb-server

buildah config --port 3306 $container
buildah config --volume /var/lib/mysql $container
buildah config --user mysql $container

buildah config --cmd /usr/libexec/mysqld $container

buildah commit $container mariadb
buildah rm $container
