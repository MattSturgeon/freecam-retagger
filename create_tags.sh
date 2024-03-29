#!/usr/bin/env bash

echo "Creating v-prefixed signed new-format tags"

read -p "Would you like to enable GPG signing first? [Y/n]: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    git config --global tag.gpgsign true
fi

echo "Tagging 1.2.x"
GIT_COMMITTER_DATE="2024-02-05 02:26:10" git tag -a -f -s -m "Version 1.2.3" v1.2.3 74719169ef6e4d8583beb26487da15938c2b4ef8
GIT_COMMITTER_DATE="2023-12-25 05:21:55" git tag -a -f -s -m "Version 1.2.2" v1.2.2 3c40a83b4ba8b9c78f211aed8b5cc6b1ee787752
GIT_COMMITTER_DATE="2023-10-05 01:50:18" git tag -a -f -s -m "Version 1.2.1.1" v1.2.1.1 e945f797077332e570f7c6c80086d5d6e3c52a07
GIT_COMMITTER_DATE="2023-07-13 22:57:29" git tag -a -f -s -m "Version 1.2.1" v1.2.1 f8c5f7c7c92f3012ff5178b0f1abf755fe99705b
GIT_COMMITTER_DATE="2023-06-18 08:34:42" git tag -a -f -s -m "Version 1.2.0" v1.2.0 d98db3431fa23b93aa9f626ba6debe72f4b63397
echo "Tagging 1.1.x"
GIT_COMMITTER_DATE="2023-06-15 02:09:55" git tag -a -f -s -m "Version 1.1.10" v1.1.10 4b22d328a2eda86eecd0b0a817b637b5ac92b82e
GIT_COMMITTER_DATE="2023-03-19 21:23:15" git tag -a -f -s -m "Version 1.1.9" v1.1.9 6409447670d81846dd6ef611b29350f8ee1fac77
GIT_COMMITTER_DATE="2022-12-19 02:36:52" git tag -a -f -s -m "Version 1.1.8" v1.1.8 60bd22b241885db5276ea2e7c874751d24d29285
GIT_COMMITTER_DATE="2022-12-10 05:42:09" git tag -a -f -s -m "Version 1.1.7" v1.1.7 1a14e59551603efc4581360992f26b8b0f826650
GIT_COMMITTER_DATE="2022-09-11 19:53:03" git tag -a -f -s -m "Version 1.1.6" v1.1.6 c52ff8bd24191f00196328326c82cfa071e925b2
GIT_COMMITTER_DATE="2022-08-28 21:47:24" git tag -a -f -s -m "Version 1.1.5" v1.1.5 be4d453c31c74b6a3c2a52c0cc4b9e059fb5e863
GIT_COMMITTER_DATE="2022-07-21 04:15:08" git tag -a -f -s -m "Version 1.1.4" v1.1.4 6cd59f30617a47dad7f1ae2c7d384e689ac2d7e7
GIT_COMMITTER_DATE="2022-07-20 18:35:32" git tag -a -f -s -m "Version 1.1.3" v1.1.3 666dfb2ad14b2b5caad05a48e758183a3afe28a6
GIT_COMMITTER_DATE="2022-07-06 10:13:00" git tag -a -f -s -m "Version 1.1.2" v1.1.2 f83428aaca0d701b17f01692eb4043ca324b6bf8
GIT_COMMITTER_DATE="2022-07-06 00:29:12" git tag -a -f -s -m "Version 1.1.1" v1.1.1 6d3f9bf2dbb7162256deb61d45d7a23182b6f836
GIT_COMMITTER_DATE="2022-07-04 21:15:09" git tag -a -f -s -m "Version 1.1.0" v1.1.0 7d13fb2861cc58a0cdf92a33a368101da5426288
echo "Tagging 1.0.x"
GIT_COMMITTER_DATE="2022-06-26 22:45:06" git tag -a -f -s -m "Version 1.0.9" v1.0.9 aa9ecb62c17b60301e7642bd5c4096ca4407a3e7
GIT_COMMITTER_DATE="2022-06-11 00:45:45" git tag -a -f -s -m "Version 1.0.8" v1.0.8 7b9aa453636079c9b32bfcc4c5f140a430b27676
GIT_COMMITTER_DATE="2022-06-10 00:52:43" git tag -a -f -s -m "Version 1.0.7" v1.0.7 284296119b2c7adc32d54dccb24a872e2635e28a
GIT_COMMITTER_DATE="2022-06-08 23:16:57" git tag -a -f -s -m "Version 1.0.6" v1.0.6 37cc74a42cc9edaf6ae84caa5520545e4762202c
GIT_COMMITTER_DATE="2022-05-14 23:20:55" git tag -a -f -s -m "Version 1.0.5" v1.0.5 2ac9c3bafe21068d222f8071c252dea52c65786f
GIT_COMMITTER_DATE="2022-04-11 02:27:00" git tag -a -f -s -m "Version 1.0.4" v1.0.4 fd76ed550e89c8bb93b2c6fa394bb83b7ee08573
GIT_COMMITTER_DATE="2022-04-05 05:22:32" git tag -a -f -s -m "Version 1.0.3" v1.0.3 d9ec78abafa67c0f62f56eb2c756ce1644dfcccf
GIT_COMMITTER_DATE="2022-04-03 09:57:38" git tag -a -f -s -m "Version 1.0.2" v1.0.2 e8118b5ea16c992cb1894447355c6248242fb42f
GIT_COMMITTER_DATE="2022-04-02 04:43:44" git tag -a -f -s -m "Version 1.0.1" v1.0.1 18918e6c49ff6ac228d0dae0f8e19adf2fe836df
GIT_COMMITTER_DATE="2022-03-18 05:44:12" git tag -a -f -s -m "Version 1.0.0" v1.0.0 0cb4131a5b84eebb84d1aa3a4db7ec8a0cf743df
echo "Tagging 0.4.x"
GIT_COMMITTER_DATE="2022-03-14 23:06:52" git tag -a -f -s -m "Version 0.4.9" v0.4.9 85fcbb8effc3410a16b8978964a15d92ab3c8e42
GIT_COMMITTER_DATE="2022-03-03 03:43:22" git tag -a -f -s -m "Version 0.4.8" v0.4.8 03076fbef9688446ac714d5979ff2ce38cec54a0
GIT_COMMITTER_DATE="2022-02-27 22:56:51" git tag -a -f -s -m "Version 0.4.7" v0.4.7 9f3e8f676db5aa30f73fd88897e5c2fad7a4ea28
GIT_COMMITTER_DATE="2022-02-26 06:52:17" git tag -a -f -s -m "Version 0.4.6" v0.4.6 359d4ed1b86cb7b617f61579f0966b834f51e728
GIT_COMMITTER_DATE="2022-02-25 01:06:31" git tag -a -f -s -m "Version 0.4.5" v0.4.5 91a50aac47c2d7727f676bd3a210c1f48c74e391
GIT_COMMITTER_DATE="2022-02-12 03:10:20" git tag -a -f -s -m "Version 0.4.4.1" v0.4.4.1 183087209aeb6c8fe6b36639244936e6bc41951e
GIT_COMMITTER_DATE="2022-02-12 03:10:20" git tag -a -f -s -m "Version 0.4.4" v0.4.4 183087209aeb6c8fe6b36639244936e6bc41951e
GIT_COMMITTER_DATE="2022-02-11 05:30:24" git tag -a -f -s -m "Version 0.4.3" v0.4.3 fe40bc27b9575a539c66cdfd7dc7547fb49a0fe5
GIT_COMMITTER_DATE="2022-02-10 20:35:16" git tag -a -f -s -m "Version 0.4.2" v0.4.2 0e6e1772904c0c863456bd34a636b6fb90e8d205
GIT_COMMITTER_DATE="2022-02-10 05:27:13" git tag -a -f -s -m "Version 0.4.1" v0.4.1 61cf91302a90b8389d04bc1d2d9baf69f70b94d2
GIT_COMMITTER_DATE="2022-02-10 03:47:10" git tag -a -f -s -m "Version 0.4.0" v0.4.0 12d8d7b9f0d2ca1715b10934d59de323d014ce65
echo "Tagging 0.3.x"
GIT_COMMITTER_DATE="2022-01-10 10:03:00" git tag -a -f -s -m "Version 0.3.5" v0.3.5 5c0325d82ad3c502cb7d950537bc17d1f8511ec0
GIT_COMMITTER_DATE="2021-12-29 11:13:30" git tag -a -f -s -m "Version 0.3.4" v0.3.4 9605622ca3dd0ebd81e62214a919e5862501775b
GIT_COMMITTER_DATE="2021-12-25 20:06:14" git tag -a -f -s -m "Version 0.3.3" v0.3.3 768b8711c5f9726059269d3be592e33c202c928a
GIT_COMMITTER_DATE="2021-12-21 08:52:31" git tag -a -f -s -m "Version 0.3.2" v0.3.2 dcb2831472c44c41cb12536361530fe32e0b51de
GIT_COMMITTER_DATE="2021-12-19 08:50:59" git tag -a -f -s -m "Version 0.3.1" v0.3.1 5769082052f12b35fb5d47017cc862c736c39506
GIT_COMMITTER_DATE="2021-12-17 02:02:17" git tag -a -f -s -m "Version 0.3" v0.3 a043d92eeee10e24f4fb3df222b6e8619a284fd5
echo "Tagging 0.2.x"
GIT_COMMITTER_DATE="2021-12-16 09:03:39" git tag -a -f -s -m "Version 0.2.5" v0.2.5 73730b495dc7687f5652b8524aa45a3ca12b845a
GIT_COMMITTER_DATE="2021-12-14 21:11:39" git tag -a -f -s -m "Version 0.2.4" v0.2.4 c0977bd7b72bdbcacc3e5e943807756f0fd1a72a
GIT_COMMITTER_DATE="2021-12-14 21:11:39" git tag -a -f -s -m "Version 0.2.3" v0.2.3 c0977bd7b72bdbcacc3e5e943807756f0fd1a72a
GIT_COMMITTER_DATE="2021-12-14 21:11:39" git tag -a -f -s -m "Version 0.2.2" v0.2.2 c0977bd7b72bdbcacc3e5e943807756f0fd1a72a
echo "Done"
