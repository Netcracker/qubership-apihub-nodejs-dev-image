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

echo "**** CHROME ****"

yum install -y mesa-libGL

wget -r -l1 --no-parent -A "google-chrome-stable-121.0.6167.184-1.x86_64.rpm" https://dl.google.com/linux/chrome/rpm/stable/x86_64/google-chrome-stable-121.0.6167.184-1.x86_64.rpm
yum --disableplugin=fastestmirror -y -v install dl.google.com/linux/chrome/rpm/stable/x86_64/google-chrome-stable-121.0.6167.184-1.x86_64.rpm

google-chrome-stable --version