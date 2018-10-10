
### Anchore demo of a container build/scan/publish pipeline

* Contains a very simple Nodejs application, which is published to a registry as a runnable docker container.

* After container is built, it is sent through an Anchore engine scan.
    * `anchore/anchore-engine:latest` is used as the build container for the scan job.
    * `anchore/engine-preload-db:latest` is a postgres DB, preloaded with the Anchore vulnerability data. This is used as a service in the scan job.
    * A [default configuration](https://raw.githubusercontent.com/anchore/anchore-engine/master/scripts/docker-compose/config.yaml) for Anchore engine is used on the build container.
    * Scans are currently using the default [Anchore policy](https://anchore.freshdesk.com/support/solutions/articles/36000074706-policies). Using customized policies will become an option at a future time.

* To gate the container publish on a successful Anchore Engine scan, set the following environment variable `ANCHORE_FAIL_ON_POLICY='true'`. This will cause pipeline to fail if scan fails.

* A timeout of 500s is used for this project, this value can be adjusted for whatever container is being scanned with the `ANCHORE_TIMEOUT` environment variable. Some containers take longer to scan than others.
