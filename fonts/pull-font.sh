#!/bin/bash
#Zhuque Fangsong
expected_sha="bb8b661a7643d2296a72d9d10530a00949419c4e527fb61783f73c2ba1a8c062"
version="v0.212"
curl -LOC - "https://github.com/TrionesType/zhuque/releases/download/${version}/ZhuqueFangsong-${version}.zip"
sha=$(sha256sum "ZhuqueFangsong-${version}.zip" | awk '{print $1;}')
if [[ "${sha}" != "${expected_sha}" ]]; then
	exit 1
fi
unzip -u "ZhuqueFangsong-${version}.zip"
rm "ZhuqueFangsong-${version}.zip"
