# Changelog

## [0.13.0](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.12.0...ort-server-v0.13.0) (2026-04-13)


### Features

* Add support for mounting empty dirs into worker pods ([7aba205](https://github.com/eclipse-apoapsis/helm-charts/commit/7aba205453e59bec3d83d1b32b878cdef323aad4))
* Add support for mounting secrets into worker pods ([a5252f9](https://github.com/eclipse-apoapsis/helm-charts/commit/a5252f99ae1841f2b49942b2c2d0fe7327af10b0))


### Dependencies

* update dependency eclipse-apoapsis/ort-server to v0.60.0 ([e0c4f98](https://github.com/eclipse-apoapsis/helm-charts/commit/e0c4f9866a296cf40c9382dc686f1fe91ec27fec))


### Documentation

* Document the `mountPvcs` options for workers ([d874c8b](https://github.com/eclipse-apoapsis/helm-charts/commit/d874c8bfca23118a2b9c4fca2cf4e23477385f96))

## [0.12.0](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.11.0...ort-server-v0.12.0) (2026-04-01)


### Features

* Add the common and pod labels also to worker pods ([7214d56](https://github.com/eclipse-apoapsis/helm-charts/commit/7214d5633f913d6c6e216b3e6f49befca9fc7ac6))


### Bug Fixes

* Prevent mutation of .Values.commonLabels in ortserver.labels ([0581c45](https://github.com/eclipse-apoapsis/helm-charts/commit/0581c45bf033410be0a140934dcec2c00365ebcd))

## [0.11.0](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.10.0...ort-server-v0.11.0) (2026-04-01)


### Features

* Make the user ID for the Kubernetes transport configurable ([0d532cc](https://github.com/eclipse-apoapsis/helm-charts/commit/0d532cc120658f7cffec0b46fdb8fadbef4ec0fd))

## [0.10.0](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.9.0...ort-server-v0.10.0) (2026-04-01)


### Features

* Add support for S3 storage key prefixes ([b27ca4e](https://github.com/eclipse-apoapsis/helm-charts/commit/b27ca4e2818e82f445f4185b0f66170392d27ea0))


### Dependencies

* update dependency eclipse-apoapsis/ort-server to v0.59.0 ([be873c6](https://github.com/eclipse-apoapsis/helm-charts/commit/be873c6f0793b483059efc5c9d78c64c42723ee4))

## [0.9.0](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.8.1...ort-server-v0.9.0) (2026-03-25)


### Features

* Add support for all file storages ([2dbcec9](https://github.com/eclipse-apoapsis/helm-charts/commit/2dbcec909cd5cdffe4abd866ff5ce27f8d9feb6a))
* Add support for all secret storages ([bd53b05](https://github.com/eclipse-apoapsis/helm-charts/commit/bd53b05d9fe2ae5186934c3b3efa84086dba0947))

## [0.8.1](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.8.0...ort-server-v0.8.1) (2026-03-24)


### Dependencies

* update dependency eclipse-apoapsis/ort-server to v0.58.0 ([1fa3f8c](https://github.com/eclipse-apoapsis/helm-charts/commit/1fa3f8cac002501e4519a7c67b37b3626229a08e))

## [0.8.0](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.7.0...ort-server-v0.8.0) (2026-03-23)


### Features

* Add support for custom init containers ([b88b4dc](https://github.com/eclipse-apoapsis/helm-charts/commit/b88b4dc00b3756dc9c60370a5d7ef4d9c73dd80a))
* Support extra environment variables for the task cronjobs ([bbc9b9e](https://github.com/eclipse-apoapsis/helm-charts/commit/bbc9b9e4ed703fa0527a9f382f000002db7bfba7))

## [0.7.0](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.6.0...ort-server-v0.7.0) (2026-03-20)


### Features

* Add options to import certificates ([b519144](https://github.com/eclipse-apoapsis/helm-charts/commit/b5191448c2ec1d50ec9ead8a44f3e32aa529b510))
* Make the resource requests and limits configurable ([5a31e45](https://github.com/eclipse-apoapsis/helm-charts/commit/5a31e450cc78e32696f2a36b9d8421eb79b3f476))

## [0.6.0](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.5.2...ort-server-v0.6.0) (2026-03-19)


### Features

* Support extra volumes and volume mounts for the UI ([846c56f](https://github.com/eclipse-apoapsis/helm-charts/commit/846c56f30d499f0a2b64e25c91402ca11457b9b7))


### Dependencies

* update dependency eclipse-apoapsis/ort-server to v0.57.1 ([e8b31d5](https://github.com/eclipse-apoapsis/helm-charts/commit/e8b31d5fd4a504db0668ddc7c61b8a16636e903d))

## [0.5.2](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.5.1...ort-server-v0.5.2) (2026-03-13)


### Dependencies

* update dependency eclipse-apoapsis/ort-server to v0.56.0 ([b8b1662](https://github.com/eclipse-apoapsis/helm-charts/commit/b8b16626d837ec831efe7fb678c9327c2d65064c))
* update dependency eclipse-apoapsis/ort-server to v0.57.0 ([ea432f4](https://github.com/eclipse-apoapsis/helm-charts/commit/ea432f461f4eb240c3d5e45d3f705b7ef69a7395))

## [0.5.1](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.5.0...ort-server-v0.5.1) (2026-03-05)


### Bug Fixes

* Fix the check if the core liveness probe is enabled ([08d0df5](https://github.com/eclipse-apoapsis/helm-charts/commit/08d0df57fe339252489dd8ddcf2d2d146c8e1999))

## [0.5.0](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.4.0...ort-server-v0.5.0) (2026-03-05)


### Features

* Make the liveness probe for core configurable ([75e40dc](https://github.com/eclipse-apoapsis/helm-charts/commit/75e40dcfba9e143b944103faf8c1396435e5afc7))

## [0.4.0](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.3.0...ort-server-v0.4.0) (2026-03-05)


### Features

* add option to pass extra environment variables ([8c44d22](https://github.com/eclipse-apoapsis/helm-charts/commit/8c44d22b0e93a4a7de0e20afb80226ee3575336c))
* Configure the config secret provider ([72985c0](https://github.com/eclipse-apoapsis/helm-charts/commit/72985c0bb49ebb33032734c6ad703d213e37d52d))
* Make `allowSecretsFromConfig` configurable ([5c2c029](https://github.com/eclipse-apoapsis/helm-charts/commit/5c2c0294823ea1f90bad0db83a8c96ed282385dc))
* Support extra volumes and volume mounts for orchestrator and tasks ([850ad58](https://github.com/eclipse-apoapsis/helm-charts/commit/850ad584897d9d8c2be8bf060fdf91a9d44887b5))

## [0.3.0](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.2.1...ort-server-v0.3.0) (2026-03-03)


### Features

* Make the image pull secret configurable ([f547281](https://github.com/eclipse-apoapsis/helm-charts/commit/f547281057838dc3175704361fcbb19ba83880c8))


### Dependencies

* update dependency eclipse-apoapsis/ort-server to v0.55.0 ([53cb1b9](https://github.com/eclipse-apoapsis/helm-charts/commit/53cb1b96b37818e09ccb3a678ad813d42cd8169c))

## [0.2.1](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.2.0...ort-server-v0.2.1) (2026-02-27)


### Dependencies

* update dependency eclipse-apoapsis/ort-server to v0.54.0 ([0ef8f41](https://github.com/eclipse-apoapsis/helm-charts/commit/0ef8f4154b3efc8562b8930760b4cac0410f8866))

## [0.2.0](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.1.0...ort-server-v0.2.0) (2026-02-19)


### Features

* Add service accounts for all pods ([4f895d1](https://github.com/eclipse-apoapsis/helm-charts/commit/4f895d18d7c816fcad3443212e912c8beb9eed81))
* Improve resource names and labels ([1cc0597](https://github.com/eclipse-apoapsis/helm-charts/commit/1cc05974f59ee1eee16809db21d6ed8267a57b86))


### Dependencies

* update dependency eclipse-apoapsis/ort-server to v0.53.0 ([767b8d3](https://github.com/eclipse-apoapsis/helm-charts/commit/767b8d3d840d6d9e214ff1ff0e2e5f8a09163e8d))

## [0.1.0](https://github.com/eclipse-apoapsis/helm-charts/compare/ort-server-v0.0.1...ort-server-v0.1.0) (2026-02-12)


### Features

* Add an initial Helm chart for the ORT Server ([247eda7](https://github.com/eclipse-apoapsis/helm-charts/commit/247eda71549595450890cef295cf9ff304f08f51))
* **ort-server:** Add missing JWT options ([f014c30](https://github.com/eclipse-apoapsis/helm-charts/commit/f014c3000be8f8ded04980b22b1fae803e0081af))
* **ort-server:** Complete worker configuration ([b438aa4](https://github.com/eclipse-apoapsis/helm-charts/commit/b438aa40ea94538eecedb70431ef2536cf3a8e2a))


### Dependencies

* **ort-server:** Upgrade ORT Server to 0.36.1 ([2a1e822](https://github.com/eclipse-apoapsis/helm-charts/commit/2a1e822b9a1e5aec47e98d406b9c294c783b5f2b))
* update dependency eclipse-apoapsis/ort-server to v0.43.0 ([577f204](https://github.com/eclipse-apoapsis/helm-charts/commit/577f2047e1ccb204f5f0b124f92603f6322a786f))
* update dependency eclipse-apoapsis/ort-server to v0.44.0 ([9a71d36](https://github.com/eclipse-apoapsis/helm-charts/commit/9a71d36770c0a9e2d4115aff91e6bf9926b1da62))
* update dependency eclipse-apoapsis/ort-server to v0.45.0 ([0f44cae](https://github.com/eclipse-apoapsis/helm-charts/commit/0f44caebb8a5339b3ae1c701692213fd54f06f11))
* update dependency eclipse-apoapsis/ort-server to v0.46.0 ([4c3ae51](https://github.com/eclipse-apoapsis/helm-charts/commit/4c3ae5164821db6d0a59195c728a2a31cc697dd1))
* update dependency eclipse-apoapsis/ort-server to v0.47.0 ([fb07830](https://github.com/eclipse-apoapsis/helm-charts/commit/fb078305fc03d3f23c73e4f04ed9abe238eb8dd0))
* update dependency eclipse-apoapsis/ort-server to v0.48.0 ([047fce6](https://github.com/eclipse-apoapsis/helm-charts/commit/047fce60ccd91f82daa4ce262ec9379de079379d))
* update dependency eclipse-apoapsis/ort-server to v0.49.0 ([5ff9f08](https://github.com/eclipse-apoapsis/helm-charts/commit/5ff9f081dfeb8b0e499b9a8d7d421639f002654f))
* update dependency eclipse-apoapsis/ort-server to v0.50.0 ([584f624](https://github.com/eclipse-apoapsis/helm-charts/commit/584f6240cd832524a9c95ee0bf4228ade58bdfe9))
* update dependency eclipse-apoapsis/ort-server to v0.51.0 ([f0d1bc4](https://github.com/eclipse-apoapsis/helm-charts/commit/f0d1bc4a24d892f6cc987ef019060400a1cafad5))
* update dependency eclipse-apoapsis/ort-server to v0.52.0 ([1cea13f](https://github.com/eclipse-apoapsis/helm-charts/commit/1cea13f66fecdb2b23a422539610d60b6f473243))
