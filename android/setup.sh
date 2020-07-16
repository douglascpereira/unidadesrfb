#!/bin/bash -e
git submodule init
git submodule update

read -p "Do you want run gradle in DAEMON? [Recommended to developers machines] (Y/N)" -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  touch ~/.gradle/gradle.properties && echo "org.gradle.daemon=true" > ~/.gradle/gradle.properties
  echo "Enabled DAEMON on file ~/.gradle/gradle.properties"
else
  touch ~/.gradle/gradle.properties && echo "org.gradle.daemon=false" > ~/.gradle/gradle.properties
  echo "Disabled DAEMON on file ~/.gradle/gradle.properties"
fi
./gradlew clean build
