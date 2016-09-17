#
# Cookbook Name:: nomad_agent
#
# Copyright 2016 Brian Clark
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

module NomadAgent
  module Helpers
    def checksums
      {
        'nomad_0.2.0_darwin_amd64.zip' => '1606cc268298852b0e413d3799843597a9aa0c47c53313ef2a523cc595ccb2f1',
        'nomad_0.2.0_linux_386.zip' => '8c30962821b77714baf62d90bdaa43e58c25231a93ba99066b435547a0c5a1ae',
        'nomad_0.2.0_linux_amd64.zip' => 'f4525cbd99fd57ef607f9556be4f4bc39f82391947f40cc993538bba7da5bf90',
        'nomad_0.2.0_windows_386.zip' => '249a66e63e48ad9bfe51edeae5ca0eab3113cca5c402675b6911f815c802a60a',
        'nomad_0.2.0_windows_amd64.zip' => 'b2d25d22cb0511b9f2596f6b91a91796b96dd2124a6f0927bc91554f68681dcf',
        'nomad_0.2.1_darwin_amd64.zip' => '7f40f24c7c386bff4f97fad89c258ca7549d9629260d319a71a27fbb9e9ba31f',
        'nomad_0.2.1_linux_386.zip' => 'f565a430bd2d65373749d22d9d2f0c96de6a9fa39232205ee258903699e55640',
        'nomad_0.2.1_linux_amd64.zip' => 'a47881efc148cc37a8c94fb120c1d198371b9124e92668e8fc0badddef99cc2a',
        'nomad_0.2.1_windows_386.zip' => '87228962f291cd25ed433878d60cb45570bc45d6970db6b90ec0641767e21527',
        'nomad_0.2.1_windows_amd64.zip' => '833fd3fd247ee80f38ed64a6900980833b32012785dc510896df1d4170052768',
        'nomad_0.2.3_darwin_amd64.zip' => 'ad7caf0641bb7be2aab0dd2496545461010cbc667a857aaac4f10b7296c59ca9',
        'nomad_0.2.3_linux_386.zip' => '0966b354b9b4a2ead44f2528b02b98b2bd731c0f80dc8eb7e7776cae59be175b',
        'nomad_0.2.3_linux_amd64.zip' => '0f3a7083d160893a291b5f8b4359683c2df7991fa0a3e969f8785ddb40332a8c',
        'nomad_0.2.3_windows_386.zip' => 'b2f7abd879b95e4a8ffd7dc3fce3d36945635892ab1837194585e9d9c1c3e540',
        'nomad_0.2.3_windows_amd64.zip' => '761996bf3c0296c07b503574cee08e41cb93e1c6412d2927ae0ca6567f91f921',
        'nomad_0.3.0_darwin_amd64.zip' => 'dd2d769ccceb532849072c4e088ebd1f338a0e60916cfe4317a2661716803894',
        'nomad_0.3.0_linux_386.zip' => '93b130f69d880f37253cbacd2012717bcbee6349f01c3b2f607986390d7de8a3',
        'nomad_0.3.0_linux_amd64.zip' => '530e5177cecd65d36102953099db19ecdbfa62b3acf20a0c48e20753a597f28e',
        'nomad_0.3.0_windows_386.zip' => 'fe2e302a68fcf01c7fa91951df2fa94e74324a4c4a9dd35d0e63e7af259a8232',
        'nomad_0.3.0_windows_amd64.zip' => '393494c33b98f8f270d114ab8954d45d2db775fa7bb9541695c27bc37637c1c3',
        'nomad_0.3.1_darwin_amd64.zip' => 'c300a3b5c195fbccf26dfcdb756b4c953ca0e5e566a41fce1d10ef1947ec4279',
        'nomad_0.3.1_linux_386.zip' => '350b749699426b13d399dd2a2778079e45e554a63db54b3445a3b121267253f7',
        'nomad_0.3.1_linux_amd64.zip' => '467fcebe9f0a349063a4f16c97cb71d9c57451fc1f10cdb2292761cf56542671',
        'nomad_0.3.1_windows_386.zip' => '1edb0809122b2b1be500f3bb4734b8b2a4d10c9bb37006c6241ecb8e92d3c943',
        'nomad_0.3.1_windows_amd64.zip' => '85fb5ddbf4e8ae838084235e61360e827041dc330dc5dc9b50da663844befc43',
        'nomad_0.3.2_darwin_amd64.zip' => '96808b9b8056490026327bdc6614e1813cee7d42978676e0024085709fd3fcac',
        'nomad_0.3.2_linux_386.zip' => '29e988ee58621dfff99a8a59d33a4226b5c0b6a9885c13095b21af1d453d5941',
        'nomad_0.3.2_linux_amd64.zip' => '710ff3515bc449bc2a06652464f4af55f1b76f63c77a9048bc30d6fde284b441',
        'nomad_0.3.2_windows_386.zip' => '34da6ff58ea8ea833131956779ed788bb6c7cdb53136fac01efbf1df6a51575d',
        'nomad_0.3.2_windows_amd64.zip' => 'd303e1feb251775ee694c7115de9bcd34271cf5c90bcfc0f92520197c106cd8b',
        'nomad_0.4.0_darwin_amd64.zip' => '2f6bff636ae48343017e0e5edd4371f7abe434d1f70d95d7e28f08490c978c40',
        'nomad_0.4.0_linux_386.zip' => '3f04fcdf60c5c18fb5c640bcd7af47cc6ad11f6bdc7d929fdec67ba4a7b7f35a',
        'nomad_0.4.0_linux_amd64.zip' => 'c0479dcc03d35c1b0f6e7be256732431384bec16901a124dd97b2a60d465fb91',
        'nomad_0.4.0_windows_386.zip' => '4aa6f3b9beb89ce6ae707624fa3ac54ca4954ee1c8f9a5fabbb4b51bcc9c9d1a',
        'nomad_0.4.0_windows_amd64.zip' => 'c98029f73c9cd173d6624d85dcfb5330308ee61033138334e8eea666f39d3919',
        'nomad_0.4.1_darwin_amd64.zip' => '5f2d52c73e992313e803fb29b6957ad1b754ed6e68bed5fa9fbe9b8e10a67aeb',
        'nomad_0.4.1_linux_386.zip' => 'fc5b750c9b895f2ddf6d4a6e313d0724f7d0c623ca44119b3cd7732f0b6415ae',
        'nomad_0.4.1_linux_amd64.zip' => '0cdb5dd95c918c6237dddeafe2e9d2049558fea79ed43eacdfcd247d5b093d67',
        'nomad_0.4.1_linux_arm64.zip' => '4cfc7501c277c6b8b3c1af0fd29fac8b2f3cfd7039fd2137a5a3832e642adb38',
        'nomad_0.4.1_linux_arm.zip' => '6f74092e232702bf921e52ed1e2e7e76aeb24ae119802b024b865f81bccca29b',
        'nomad_0.4.1_windows_386.zip' => '16a6751efa0f6278ec34ec79b8ba2ee6fbf3dbd80b79e7fe67128a2d9beeb219',
        'nomad_0.4.1_windows_amd64.zip' => '9940bf71b970df2c9e89ffb8307976a2c2e1d256e80da3767b36d3110594b969'
      }
    end
  end
end

Chef::Resource.send(:include, NomadAgent::Helpers)
