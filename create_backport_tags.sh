#!/usr/bin/env bash

echo "Creating v-prefixed backport tags"

read -p "Would you like to enable GPG signing first? [Y/n]: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    git config --global tag.gpgsign true
fi

echo "Tagging 1.2.3"
export GIT_COMMITTER_DATE="2024-02-05 02:26:10"
git tag -a -f -s -m "Version 1.2.3 for Minecraft 1.20.4" v1.2.3+mc1.20.4 d0a32527598a61513718fcf150230fb5f1393f4f
git tag -a -f -s -m "Version 1.2.3 for Minecraft 1.19.4" v1.2.3+mc1.19.4 9b766f6467660af52a6b6d051dd0af7f05e5082e
git tag -a -f -s -m "Version 1.2.3 for Minecraft 1.19.2" v1.2.3+mc1.19.2 d0a32527598a61513718fcf150230fb5f1393f4f
git tag -a -f -s -m "Version 1.2.3 for Minecraft 1.18.2" v1.2.3+mc1.18.2 bfe4a1bd304ac7a5761e12bc2e4502b389e53384
git tag -a -f -s -m "Version 1.2.3 for Minecraft 1.17.1" v1.2.3+mc1.17.1 64cd335e3d5bee4ef6b482659b083d31a9651ee4
git tag -a -f -s -m "Version 1.2.3 for Minecraft 1.16.5" v1.2.3+mc1.16.5 2247e910e10280444c7ffbb6025fe48be12cc5d6

echo "Tagging 1.2.2"
export GIT_COMMITTER_DATE="2023-12-25 05:21:55"
git tag -a -f -s -m "Version 1.2.2 for Minecraft 1.20.4" v1.2.2+mc1.20.4 3c40a83b4ba8b9c78f211aed8b5cc6b1ee787752

echo "Tagging 1.2.1.1"
echo GIT_COMMITTER_DATE="2023-10-05 01:50:18"
git tag -a -f -s -m "Version 1.2.1.1 for Minecraft 1.20.2" v1.2.1.1+mc1.20.2 e945f797077332e570f7c6c80086d5d6e3c52a07

echo "Tagging 1.2.1" 
export GIT_COMMITTER_DATE="2023-07-13 22:57:29"
git tag -a -f -s -m "Version 1.2.1 for Minecraft 1.20.2" v1.2.1+mc1.20.2 a7f71afddd85aac5cbf4d491f299638ad2e3050b
git tag -a -f -s -m "Version 1.2.1 for Minecraft 1.20.1" v1.2.1+mc1.20.1 f8c5f7c7c92f3012ff5178b0f1abf755fe99705b
git tag -a -f -s -m "Version 1.2.1 for Minecraft 1.19.4" v1.2.1+mc1.19.4 3c6d4afdede6e7d27407bb0352788b8f983e221f
git tag -a -f -s -m "Version 1.2.1 for Minecraft 1.18.2" v1.2.1+mc1.18.2 02d00252f67b3da6027ac031e2a15c35036a781f
git tag -a -f -s -m "Version 1.2.1 for Minecraft 1.17.1" v1.2.1+mc1.17.1 b2d89ff9fdd6a88bb051fe87cb066be08955427c
git tag -a -f -s -m "Version 1.2.1 for Minecraft 1.16.5" v1.2.1+mc1.16.5 1d509f10f55ea1ebf66c6272f6a17818e76267c0

echo "Tagging 1.2.0"
export GIT_COMMITTER_DATE="2023-06-18 08:34:42"
git tag -a -f -s -m "Version 1.2.0 for Minecraft 1.20.1" v1.2.0+mc1.20.1 d98db3431fa23b93aa9f626ba6debe72f4b63397
git tag -a -f -s -m "Version 1.2.0 for Minecraft 1.19.4" v1.2.0+mc1.19.4 9a9459b9ec63e507988508de45d055fdbdbd45c2
git tag -a -f -s -m "Version 1.2.0 for Minecraft 1.18.2" v1.2.0+mc1.18.2 7a185b641b48d4d471b3b17f1271e0f761d2e3b0
git tag -a -f -s -m "Version 1.2.0 for Minecraft 1.17.1" v1.2.0+mc1.17.1 99c9a074681786ebf5af4dda9085a9458619205a
git tag -a -f -s -m "Version 1.2.0 for Minecraft 1.16.5" v1.2.0+mc1.16.5 520f56df93ff7d8c01303a2fd16f71e660039121

echo "Done"

