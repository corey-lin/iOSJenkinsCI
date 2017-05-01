node {
  // Mark the code checkout 'stage'....
  stage ('Checkout/Build/Test') {
    checkout scm
    echo "My branch is: ${env.BRANCH_NAME}"
    sh 'pod install'
    sh 'set -o pipefail && xcodebuild -destination "platform=iOS Simulator,name=iPhone 7,OS=10.3" -workspace iOSJenkinsCI.xcworkspace -scheme "iOSJenkinsCI" -sdk iphonesimulator clean build test | xcpretty -c -r junit -o "$WORKSPACE/junit.xml"'
  }
}
