export ANDROID_HOME=/opt/android-sdk-linux
export ANDROID_SDK_ROOT=${ANDROID_HOME}
export ANDROID_SDK_HOME=${ANDROID_HOME}
export ANDROID_SDK=${ANDROID_HOME}

export PATH=${PATH}:${ANDROID_HOME}/cmdline-tools/latest/bin:${ANDROID_HOME}/platform-tools:${ANDROID_HOME}/tools/bin:${ANDROID_HOME}/emulator:${ANDROID_HOME}/bin:

echo 'Creating ANDROID_HOME at ${ANDROID_HOME}'
mkdir -p ${ANDROID_HOME}

echo "Copying package-list"
cp package-list.txt "${ANDROID_HOME}/package-list.txt"

echo "Copying licences"
cp -r licenses "${ANDROID_HOME}/licenses"

echo "Copying android-accept-licenses.sh"
cp android-accept-licenses.sh "${ANDROID_HOME}/android-accept-licenses.sh"

cd ${ANDROID_HOME}

echo "Downloading cmdline-tools"
mkdir -p cmdline-tools/latest/ \
    && curl -sSL https://dl.google.com/android/repository/commandlinetools-linux-7583922_latest.zip -o cmdline-tools.zip \
    && bsdtar xvf cmdline-tools.zip --strip-components=1 -C cmdline-tools/latest/ \
    && rm cmdline-tools.zip

echo "Create repositories.cfg file"
mkdir -p ~/.android/
touch ~/.android/repositories.cfg

echo "sdkmanager version:"
sdkmanager --version

echo "Installing expect"
apt install expect

echo "Installing packages"
while read p; do
      android-accept-licenses.sh "sdkmanager ${p}"
    done < ${ANDROID_HOME}/package-list.txt

echo "Updating SDK"
android-accept-licenses.sh "sdkmanager --update"

# https://stackoverflow.com/questions/35128229/error-no-toolchains-found-in-the-ndk-toolchains-folder-for-abi-with-prefix-llv
if [ -d /opt/android-sdk-linux/ndk-bundle/toolchains ]
then
    ( cd /opt/android-sdk-linux/ndk-bundle/toolchains \
    && ln -sf aarch64-linux-android-4.9 mips64el-linux-android \
    && ln -sf arm-linux-androideabi-4.9 mipsel-linux-android )
fi

echo "Finished"