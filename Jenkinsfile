node {

// -- Get Active Jobs with 'Buildable' state
activeJobs = hudson.model.Hudson.instance.items.findAll{job -> job.isBuildable()}
 
// -- Get a subset of buildable jobs with result status of 'SUCCESSFUL'
goodRuns = activeJobs.findAll{job -> job.lastBuild != null && job.lastBuild.result == hudson.model.Result.SUCCESS}
 
// Do something with them - e.g. listing them
goodRuns.each{run -> println "Successful Job Name: ${run.name}"}

  stage ('Checkout') {
    checkout scm
    sh 'pod install'
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