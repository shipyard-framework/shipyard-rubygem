pipeline {
  agent { docker 'ruby' }
  stages {
    stage('Setup') {
      steps {
        sh './ci/setup'
      }
    }
    stage('Test') {
      parallel {
        stage('Jekyll') {
          steps {
            sh './ci/jekyll'
          }
        }
        stage('RSpec') {
          steps {
            sh 'bundle exec rspec'
          }
        }
        stage('SASS') {
          steps {
            sh './ci/sass_lint'
          }
        }
        stage('Percy') {
          steps {
            echo 'This step only runs in builds on the Codeship project: https://app.codeship.com/projects/246808'
          }
        }
      }
    }
    stage('Deploy') {
      when { branch 'master' }
      parallel {
        stage('RubyGems') {
          steps {
            echo 'This step only runs in Travis CI builds at the moment: https://travis-ci.org/codeship/shipyard'
          }
        }
        stage('GitHub Pages') {
          steps {
            echo 'This step only runs in Codeship builds at the moment: https://app.codeship.com/projects/246808'
          }
        }
      }
    }
  }
}
