# Anchore CI Demos

### Example of a container build pipeline, which includes Anchore container security scanning

Contains a very simple Nodejs application, which is published to a registry as a runnable docker container.

After container is built, it is sent through an Anchore engine scan.

### Reports provided by Anchore

When Anchore scanning finishes, by default, the following reports are available as artifacts. Report generation is configurable in anchore_ci_tools.py with the --content & --report flags.
* `image-content-os-report.json` - all OS packages installed in image.
* `image-content-python-report.json` - all Python modules installed in image.
* `image-content-java-report.json` - all Java modules installed in image.
* `image-vuln-report.json` - all CVE's found in image.
* `image-details-report.json` - image metadata utilized by Anchore engine.
* `image-policy-report.json` - details of policy applied to the Anchore scan.
