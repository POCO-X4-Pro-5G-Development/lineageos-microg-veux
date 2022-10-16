#!/bin/bash

set -e

# build
docker pull lineageos4microg/docker-lineage-cicd
docker run \
    -e "BRANCH_NAME=lineage-19.1" \
    -e "DEVICE_LIST=veux" \
    -e "SIGN_BUILDS=true" \
    -e "SIGNATURE_SPOOFING=restricted" \
    -e "INCLUDE_PROPRIETARY=false" \
    -e "CUSTOM_PACKAGES=GmsCore GsfProxy Phonesky IchnaeaNlpBackend OpenWeatherMapWeatherProvider NominatimGeocoderBackend FDroid FDroidPrivilegedExtension additional_repos" \
    -e "PARALLEL_JOBS=6" \
    -v "$PWD/srv/src:/srv/src" \
    -v "$PWD/srv/zips:/srv/zips" \
    -v "$PWD/srv/logs:/srv/logs" \
    -v "$PWD/srv/ccache:/srv/ccache" \
    -v "$PWD/srv/keys:/srv/keys" \
    -v "$PWD/srv/local_manifests:/srv/local_manifests" \
   lineageos4microg/docker-lineage-cicd
