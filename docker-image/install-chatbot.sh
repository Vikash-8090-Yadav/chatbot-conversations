#!/bin/bash

#
# Copyright 2019, 2020, 2021 Mani Sarkar
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

set -e
set -u
set -o pipefail

source common.sh

gitClone https://github.com/neomatrix369/chatbot-conversations "feature/add-single-dockerfile"
cd chatbot-conversations

echo "Build & Run quarkus-world"
cd quarkus-world
./mvnw package
./run-quarkus-world.sh &
cd ..

echo "Build & Run connecting_worlds"
cd connecting_worlds
./mvnw package
./run-connecting-worlds.sh &
cd ..
       
echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
set +x

CHATBOT_VERSION="0.1"

cd ..