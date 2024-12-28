# Copyright 2024-2025 NetCracker Technology Corporation
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

echo "**** NODE ****"

DISTR_DIR=$(mktemp -d)
mkdir -p ${NODE_HOME}

curl -o ${DISTR_DIR}/node-v${NODE_VERSION}-linux-x64.tar.gz "http://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-x64.tar.gz"
tar --strip-components 1 -xzvf ${DISTR_DIR}/node-v${NODE_VERSION}-linux-x64.tar.gz -C ${NODE_HOME}
rm -rf ${DISTR_DIR}

ln -s ${NODE_HOME}/bin/node /usr/bin/node
ln -s ${NODE_HOME}/bin/npm /usr/bin/npm
ln -s ${NODE_HOME}/bin/npx /usr/bin/npx

node --version

echo "export NPM_VERSION=$(npm -v)"
npm set strict-ssl false
