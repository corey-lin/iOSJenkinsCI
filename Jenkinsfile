node {

  stage ('Checkout') {
    checkout scm
    sh 'gem install bundler'
    sh 'bundle install'
    sh 'bundle exec pod repo update --silent'
    sh 'bundle exec pod install'
  }

  stage ('Build/Test') {
    echo "My branch is: ${env.BRANCH_NAME}"
    ansiColor('xterm') {
      timestamps {
        sh 'set -o pipefail && xcodebuild -destination "platform=iOS Simulator,name=iPhone 7,OS=10.3" -workspace iOSJenkinsCI.xcworkspace -scheme "iOSJenkinsCI" -sdk iphonesimulator clean build test | xcpretty -c'
      }
    }
  }
}
