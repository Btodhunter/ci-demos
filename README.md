# Anchore GitLab Demo

### Example of a container build pipeline, which includes Anchore container security scanning

Contains a very simple Nodejs application, which is published to a registry as a runnable docker container.

After container is built, it is sent through an Anchore engine scan.
* `anchore/anchore-engine:v0.2.4` is used as the build container for the scan job.
* `anchore/engine-preload-db:v0.2.4` is a postgres database, preloaded with the Anchore vulnerability data. This is used as a service in the scan job.
* The [default configuration](https://raw.githubusercontent.com/anchore/anchore-engine/v0.2.4/scripts/docker-compose/config.yaml) for Anchore engine is used on the build container.
* Scans use the default [Anchore policy](https://anchore.freshdesk.com/support/solutions/articles/36000074706-policies). Using customized policies will become an option at a future time.
* A timeout of 500s is used for this project, this value can be adjusted for whatever container is being scanned with the `ANCHORE_TIMEOUT` environment variable. Some containers take longer to scan than others.

To gate the container publish on a successful Anchore Engine scan, set the environment variable `ANCHORE_FAIL_ON_POLICY='true'`. This will cause pipeline to fail if scan fails.

### Reports provided by Anchore

When Anchore scanning finishes, by default, the following reports are available as artifacts. Report generation is configurable in anchore_ci_tools.py with the --content & --report flags.
* `image-content-os-report.json` - all OS packages installed in image.
* `image-content-npm-report.json` - all NPM modules installed in image.
* `image-content-gem-report.json` - all Ruby gems installed in image.
* `image-content-python-report.json` - all Python modules installed in image.
* `image-content-java-report.json` - all Java modules installed in image.
* `image-vuln-report.json` - all CVE's found in image.
* `image-details-report.json` - image metadata utilized by Anchore engine.
* `image-policy-report.json` - details of policy applied to the Anchore scan.
