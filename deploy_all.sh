#!/bin/sh
sh package.sh
cp -rf /root/sweet-admin/sweet-admin/target/cms.war  /usr/local/sweet/deploy
sh /usr/local/sweet/server.sh redeploy
