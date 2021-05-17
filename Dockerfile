FROM gradle:6.7.1-jdk8
#FROM gradle:4.2.0-jdk8
USER root

#ENV SDK_URL=”https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip” \ ANDROID_HOME=”/usr/local/android-sdk” \ ANDROID_VERSION=30 \ ANDROID_BUILD_TOOLS_VERSION=30.0.3

ENV SDK_URL="https://dl.google.com/android/repository/sdk-tools-linux-3859397.zip" \
    ANDROID_HOME="/usr/local/android-sdk" \
    ANDROID_VERSION=30 \
    ANDROID_BUILD_TOOLS_VERSION=30.0.3

#RUN mkdir “$ANDROID_HOME” .android \ && cd “$ANDROID_HOME” \ && curl -o sdk.zip $SDK_URL \ && unzip sdk.zip \ && rm sdk.zip \ && yes | $ANDROID_HOME/tools/bin/sdkmanager –licenses

RUN mkdir "$ANDROID_HOME" .android \
    && cd "$ANDROID_HOME" \
    && curl -o sdk.zip $SDK_URL \
    && unzip sdk.zip \
    && rm sdk.zip \
    && yes | $ANDROID_HOME/tools/bin/sdkmanager --licenses



#RUN $ANDROID_HOME/tools/bin/sdkmanager –update 
#RUN $ANDROID_HOME/tools/bin/sdkmanager “build-tools;${ANDROID_BUILD_TOOLS_VERSION}” \ “platforms;android-${ANDROID_VERSION}” \ “platform-tools”

RUN $ANDROID_HOME/tools/bin/sdkmanager --update
RUN $ANDROID_HOME/tools/bin/sdkmanager "build-tools;${ANDROID_BUILD_TOOLS_VERSION}" \
    "platforms;android-${ANDROID_VERSION}" \
    "platform-tools"

#RUN apt-get update && \
#    apt-get install build-essential -y && \
#    apt-get install file -y && \
#    apt-get install apt-utils –y

RUN apt-get update 
RUN apt-get install build-essential -y 
RUN apt-get install -qy file 
RUN apt-get install -qy apt-utils 


RUN      mkdir /application
WORKDIR        /application
