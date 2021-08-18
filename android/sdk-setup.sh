ANDROID_HOME='/opt/android-sdk-linux'
CMD_TOOLS='/opt/android-cmdline-tools'
NDK_BUNDLE='${ANDROID_HOME}/ndk-bundle'

cd /opt

echo "Downloading cmdline-tools"
mkdir -p ${CMD_TOOLS} \
    && curl -sSL https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -o cmdline-tools.zip \
    && bsdtar xvf cmdline-tools.zip --strip-components=1 -C ${CMD_TOOLS} \
    && rm cmdline-tools.zip

echo "Downloading android-sdk-linux"
mkdir -p ${ANDROID_HOME} \