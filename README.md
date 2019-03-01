# Anchore CI Demos

## Example of a container build pipeline, including an Anchore Engine image security scan

Contains a very simple Nodejs application, which is published to a registry as a runnable docker container.

After container is built, it is sent through an Anchore engine scan.

## Example configurations for the following CI/CD tools
* GitLab - [.gitlab-ci.yml](./.gitlab-ci.yml) - [![Gitlab Badge](https://gitlab.com/anchore/gitlab-demo/badges/master/build.svg)](https://gitlab.com/anchore/gitlab-demo/pipelines)
* CircleCi - [config.yml](./.circleci/config.yml) - [![CircleCI](https://circleci.com/gh/Btodhunter/ci-demos.svg?style=svg)](https://circleci.com/gh/Btodhunter/ci-demos)
* Jenkins Pipeline - [Jenkinsfile](./Jenkinsfile)
* AWS CodeBuild - [buildspec.yml](./buildspec.yml) - ![CodeBuild](https://codebuild.us-west-2.amazonaws.com/badges?uuid=eyJlbmNyeXB0ZWREYXRhIjoiMWRxZGRnUkJtMm56azlsTlhoOHJnS3ZjV1RjWW5LN2JKY29lOFdobm1CcmRIeWJra3FWRjBOTWRhKzlaUkNQajhDL3BPZW9YREZQWGtFbVFqYWFUamJjPSIsIml2UGFyYW1ldGVyU3BlYyI6IjlHanptWS9zVlBUYnVXdU0iLCJtYXRlcmlhbFNldFNlcmlhbCI6MX0%3D&branch=master)
* CodeShip - [codeship-services.yml](./codeship-services.yml) & [codeship-steps.yml](./codeship-steps.yml) - [![Codeship Status for Btodhunter/ci-demos](https://app.codeship.com/projects/456c5cf0-16e1-0137-044b-72ecfd83031e/status?branch=master)](https://app.codeship.com/projects/328008)
* Codefresh - [codefresh.yml](./codefresh.yml) - [![Codefresh build status](https://g.codefresh.io/api/badges/pipeline/btodhunter/Btodhunter%2Fci-demos%2Fci-demos?type=cf-1)](https://g.codefresh.io/public/accounts/btodhunter/pipelines/Btodhunter/ci-demos/ci-demos)
* TravisCI - [.travis.yml](./.travis.yml) - [![Build Status](https://travis-ci.org/Btodhunter/ci-demos.svg?branch=master)](https://travis-ci.org/Btodhunter/ci-demos)

### Reports provided by Anchore Engine

When Anchore scanning finishes, by default, the following reports are available as artifacts.
* `image-content-os-report.json` - all OS packages installed in image.
* `image-content-python-report.json` - all Python modules installed in image.
* `image-content-java-report.json` - all Java modules installed in image.
* `image-vuln-report.json` - all CVE's found in image.
* `image-details-report.json` - image metadata utilized by Anchore engine.
* `image-policy-report.json` - details of policy applied to the Anchore scan.
