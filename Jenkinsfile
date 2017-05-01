node {
  
  stage ('Checkout/Build/Test') {
    ansiColor('xterm') {
      checkout scm
      echo "My branch is: ${env.BRANCH_NAME}"
      sh 'pod install'
      timestamps {
        sh 'set -o pipefail && xcodebuild -destination "platform=iOS Simulator,name=iPhone 7,OS=10.3" -workspace iOSJenkinsCI.xcworkspace -scheme "iOSJenkinsCI" -sdk iphonesimulator clean build test | xcpretty -c -r junit -o "$WORKSPACE/junit.xml"'
      }
     }
  }
}
