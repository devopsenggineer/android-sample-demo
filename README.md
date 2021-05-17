# android-sample-demo

git clone https://github.com/devopsenggineer/android-sample-demo.git

cd android-sample-demo

docker build -t devopssysadmin:android-gradle-build .

docker run --rm -v `pwd`:/application devopssysadmin:android-gradle-build  bash -c 'cd /application; ls; pwd; ./gradlew build'

