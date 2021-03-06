#!/bin/bash

# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

# build and install are separated so changes to build don't invalidate
# the whole docker cache for the image

set -ex
cd "$(dirname "$0")"
# install libraries for mxnet's r package on ubuntu
echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list

#key=E084DAB9
#gpg --keyserver keyserver.ubuntu.com --recv-key $key || \
#    gpg --keyserver keyserver.pgp.com --recv-keys $key || \
#    gpg --keyserver ha.pool.sks-keyservers.net --recv-keys $key ;
#gpg -a --export $key | apt-key add -
apt-key add r.gpg

apt-get update
apt-get install -y --allow-unauthenticated r-base r-base-dev libxml2-dev libssl-dev libxt-dev
