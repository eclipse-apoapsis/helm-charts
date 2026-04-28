# ort-server

![Version: 0.15.0](https://img.shields.io/badge/Version-0.15.0-informational?style=flat-square) <!-- x-release-please-version -->
![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square)
![AppVersion: 0.61.0](https://img.shields.io/badge/AppVersion-0.61.0-informational?style=flat-square)

A generic Helm chart for the ORT Server.

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| containerRegistry | string | `"ghcr.io/eclipse-apoapsis"` |  |
| imagePullSecret | string | `nil` | Name of the image pull secret to use for pulling the Docker images |
| nameOverride | string | `""` | String to partially override ortserver.fullname |
| fullnameOverride | string | `""` | String to fully override ortserver.fullname |
| commonLabels | object | `{}` | Map of labels to add to all deployed objects |
| podLabels | object | `{}` | Map of labels to add to all pods |
| configFileProvider.gitConfig.enabled | bool | `true` |  |
| configFileProvider.gitConfig.repositoryUrl | string | `"https://github.com/mnonnenmacher/ort-server-config.git"` |  |
| database.host | string | `"ort-server-db.postgres.database.azure.com"` |  |
| database.port | int | `5432` |  |
| database.name | string | `"ort-server"` |  |
| database.schema | string | `"ort-server"` |  |
| database.username | string | `"ort-server"` |  |
| database.password | string | `"ort-server"` |  |
| database.sslMode | string | `"require"` |  |
| secrets.azureKeyVault.enabled | bool | `false` | If enabled, user secrets are stored in Azure Key Vault. |
| secrets.azureKeyVault.keyVaultName | string | `""` | The name of the Azure Key Vault to use. |
| secrets.database.enabled | bool | `false` | If enabled, database credentials are stored in the database. |
| secrets.database.masterPassword | string | `""` | Master password for encrypting secrets stored in the database. Must be at least 16 characters long. |
| secrets.database.salt | string | `""` | Salt for encrypting secrets stored in the database. Must be a hex-encoded string of at least 32 hex characters. |
| secrets.database.keyVersion | int | `1` | Version of the encryption key. Do not change, key rotation is not yet supported. |
| secrets.fileBased.enabled | bool | `true` | If enabled, user secrets are stored in a file. This should only be used for testing, not in production. |
| secrets.fileBased.path | string | `"/mnt/secrets/secrets"` | Path to the file where user secrets are stored. |
| secrets.scaleway.enabled | bool | `false` | If enabled, user secrets are stored in Scaleway Secret Manager. |
| secrets.scaleway.serverUrl | string | `"https://api.scaleway.com/"` | The URL of the Scaleway Secret Manager API. |
| secrets.scaleway.apiVersion | string | `"v1beta1"` | The API version of the Scaleway Secret Manager to use. |
| secrets.scaleway.region | string | `"fr-par"` | The region where the Scaleway Secret Manager is hosted. |
| secrets.scaleway.projectId | string | `""` | The ID of the Scaleway project where secrets are stored. |
| secrets.scaleway.secretKey | string | `""` | The secret key for accessing the Scaleway Secret Manager. |
| secrets.vault.enabled | bool | `false` | If enabled, user secrets are stored in HashiCorp Vault. |
| secrets.vault.uri | string | `""` | The URI of the Vault server. |
| secrets.vault.roleId | string | `""` | The role ID assigned to this client application. |
| secrets.vault.secretId | string | `""` | The secret ID assigned to this client application. |
| secrets.vault.rootPath | string | `""` | The path in Vault where secrets are stored. |
| secrets.vault.prefix | string | `"secret"` | The path prefix under which the secrets engine is located. |
| secrets.vault.namespace | string | `nil` | The Vault namespace to use for storing secrets. This is only relevant if Vault namespaces are enabled in the Vault server. |
| secrets.vault.timeoutSeconds | string | `""` | Timeout for requests to the Vault server in seconds. If not set, the default HTTP client timeout is used. |
| configSecrets.name | string | `"secret-file"` |  |
| configSecrets.files | string | `""` |  |
| configSecrets.allowSecretsFromConfig | bool | `true` | If enabled, secrets are read from environment variables, otherwise from the configured files. |
| storage.azureBlob.enabled | bool | `false` | If enabled, Azure Blob Storage is used for storing file archives, file lists, and reports. |
| storage.azureBlob.endpointUrl | string | `""` | The endpoint URL of the Azure Blob Storage account. Mutually exclusive with accountName. |
| storage.azureBlob.accountName | string | `""` | The name of the Azure Blob Storage account when using the default blob storage endpoint. Mutually exclusive with endpointUrl. |
| storage.azureBlob.containers.fileArchives | string | `"file-archives"` | The name of the Azure Blob Storage container to use for storing file archives. |
| storage.azureBlob.containers.fileLists | string | `"file-lists"` | The name of the Azure Blob Storage container to use for storing file lists. |
| storage.azureBlob.containers.reports | string | `"reports"` | The name of the Azure Blob Storage container to use for storing reports. |
| storage.database.enabled | bool | `true` | If enabled, the database is used for storing file archives, file lists, and reports. This is not recommended for production use. |
| storage.database.inMemoryLimit | int | `1048576` | The maximum of data to load into memory before buffering to disk. |
| storage.database.namespaces.fileArchives | string | `"fileArchives"` | The namespace to use for storing file archives in the database. |
| storage.database.namespaces.fileLists | string | `"fileLists"` | The namespace to use for storing file lists in the database. |
| storage.database.namespaces.reports | string | `"reports"` | The namespace to use for storing reports in the database. |
| storage.s3.enabled | bool | `false` | If enabled, an S3-compatible object storage is used for storing file archives, file lists, and reports. |
| storage.s3.endpointUrl | string | `""` | The endpoint URL of the S3-compatible object storage. |
| storage.s3.accessKey | string | `""` | The access key to use. |
| storage.s3.secretKey | string | `""` | The secret key to use. |
| storage.s3.region | string | `""` | The optional region of the S3-compatible object storage. |
| storage.s3.buckets.fileArchives | string | `"file-archives"` | The name of the S3 bucket to use for storing file archives. |
| storage.s3.buckets.fileLists | string | `"file-lists"` | The name of the S3 bucket to use for storing file lists. |
| storage.s3.buckets.reports | string | `"reports"` | The name of the S3 bucket to use for storing reports. |
| storage.s3.prefixes.fileArchives | string | `""` | An optional prefix to use for storing file archives in the S3 bucket. Required when sharing the bucket with file lists or reports to avoid name collisions. |
| storage.s3.prefixes.fileLists | string | `""` | An optional prefix to use for storing file lists in the S3 bucket. Required when sharing the bucket with file archives or reports to avoid name collisions. |
| storage.s3.prefixes.reports | string | `""` | An optional prefix to use for storing reports in the S3 bucket. Required when sharing the bucket with file archives or file lists to avoid name collisions. |
| transport.queues.advisor | string | `"advisor"` |  |
| transport.queues.analyzer | string | `"analyzer"` |  |
| transport.queues.core | string | `"core"` |  |
| transport.queues.evaluator | string | `"evaluator"` |  |
| transport.queues.orchestrator | string | `"orchestrator"` |  |
| transport.queues.reporter | string | `"reporter"` |  |
| transport.queues.scanner | string | `"scanner"` |  |
| transport.kubernetes.imagePullPolicy | string | `"Always"` |  |
| transport.kubernetes.backoffLimit | int | `0` |  |
| transport.kubernetes.restartPolicy | string | `"Never"` |  |
| transport.kubernetes.userId | int | `1000` | The user ID to run the worker containers as. |
| transport.kubernetes.advisor.cpuRequest | string | `""` | CPU request for advisor worker pods. If not set, no CPU request is defined. |
| transport.kubernetes.advisor.cpuLimit | string | `""` | CPU limit for advisor worker pods. If not set, no CPU limit is defined. |
| transport.kubernetes.advisor.memoryRequest | string | `"1Gi"` | Memory request for advisor worker pods. If not set, no memory request is defined. |
| transport.kubernetes.advisor.memoryLimit | string | `"1Gi"` | Memory limit for advisor worker pods. If not set, no memory limit is defined. |
| transport.kubernetes.advisor.mountEmptyDirs | string | `""` | EmptyDir volumes to mount into the advisor worker pods. Each entry must be in the format "name->path", where "name" is the name of the EmptyDir volume and "path" is the path inside the container to mount the volume to. Multiple entries must be separated by whitespace. |
| transport.kubernetes.advisor.mountPvcs | string | `""` | PVCs to mount into the advisor worker pods. Each entry must be in the format "pvcName->path,access", where "pvcName" is the name of the PVC to mount, "path" is the path inside the container to mount the PVC to, and "access" is either "R" for read-only or "W" for read-write access. Multiple entries must be separated by whitespace. |
| transport.kubernetes.advisor.mountSecrets | string | `""` | Secrets to mount into the advisor worker pods. Each entry must be in the format "secret->path|subPath", where "secret" is the name of the Secret to mount, "path" is the path inside the container to mount the Secret to, and "subPath" is an optional subPath of the Secret to mount. |
| transport.kubernetes.analyzer.cpuRequest | string | `""` | CPU request for analyzer worker pods. If not set, no CPU request is defined. |
| transport.kubernetes.analyzer.cpuLimit | string | `""` | CPU limit for analyzer worker pods. If not set, no CPU limit is defined. |
| transport.kubernetes.analyzer.memoryRequest | string | `"4Gi"` | Memory request for analyzer worker pods. If not set, no memory request is defined. |
| transport.kubernetes.analyzer.memoryLimit | string | `"4Gi"` | Memory limit for analyzer worker pods. If not set, no memory limit is defined. |
| transport.kubernetes.analyzer.mountEmptyDirs | string | `""` | EmptyDir volumes to mount into the analyzer worker pods. Each entry must be in the format "name->path", where "name" is the name of the EmptyDir volume and "path" is the path inside the container to mount the volume to. Multiple entries must be separated by whitespace. |
| transport.kubernetes.analyzer.mountPvcs | string | `""` | PVCs to mount into the analyzer worker pods. Each entry must be in the format "pvcName->path,access", where "pvcName" is the name of the PVC to mount, "path" is the path inside the container to mount the PVC to, and "access" is either "R" for read-only or "W" for read-write access. Multiple entries must be separated by whitespace. |
| transport.kubernetes.analyzer.mountSecrets | string | `""` | Secrets to mount into the analyzer worker pods. Each entry must be in the format "secret->path|subPath", where "secret" is the name of the Secret to mount, "path" is the path inside the container to mount the Secret to, and "subPath" is an optional subPath of the Secret to mount. |
| transport.kubernetes.config.cpuRequest | string | `""` | CPU request for config worker pods. If not set, no CPU request is defined. |
| transport.kubernetes.config.cpuLimit | string | `""` | CPU limit for config worker pods. If not set, no CPU limit is defined. |
| transport.kubernetes.config.memoryRequest | string | `"1Gi"` | Memory request for config worker pods. If not set, no memory request is defined. |
| transport.kubernetes.config.memoryLimit | string | `"1Gi"` | Memory limit for config worker pods. If not set, no memory limit is defined. |
| transport.kubernetes.config.mountEmptyDirs | string | `""` | EmptyDir volumes to mount into the config worker pods. Each entry must be in the format "name->path", where "name" is the name of the EmptyDir volume and "path" is the path inside the container to mount the volume to. Multiple entries must be separated by whitespace. |
| transport.kubernetes.config.mountPvcs | string | `""` | PVCs to mount into the config worker pods. Each entry must be in the format "pvcName->path,access", where "pvcName" is the name of the PVC to mount, "path" is the path inside the container to mount the PVC to, and "access" is either "R" for read-only or "W" for read-write access. Multiple entries must be separated by whitespace. |
| transport.kubernetes.config.mountSecrets | string | `""` | Secrets to mount into the config worker pods. Each entry must be in the format "secret->path|subPath", where "secret" is the name of the Secret to mount, "path" is the path inside the container to mount the Secret to, and "subPath" is an optional subPath of the Secret to mount. |
| transport.kubernetes.evaluator.cpuRequest | string | `""` | CPU request for evaluator worker pods. If not set, no CPU request is defined. |
| transport.kubernetes.evaluator.cpuLimit | string | `""` | CPU limit for evaluator worker pods. If not set, no CPU limit is defined. |
| transport.kubernetes.evaluator.memoryRequest | string | `"4Gi"` | Memory request for evaluator worker pods. If not set, no memory request is defined. |
| transport.kubernetes.evaluator.memoryLimit | string | `"4Gi"` | Memory limit for evaluator worker pods. If not set, no memory limit is defined. |
| transport.kubernetes.evaluator.mountEmptyDirs | string | `""` | EmptyDir volumes to mount into the evaluator worker pods. Each entry must be in the format "name->path", where "name" is the name of the EmptyDir volume and "path" is the path inside the container to mount the volume to. Multiple entries must be separated by whitespace. |
| transport.kubernetes.evaluator.mountPvcs | string | `""` | PVCs to mount into the evaluator worker pods. Each entry must be in the format "pvcName->path,access", where "pvcName" is the name of the PVC to mount, "path" is the path inside the container to mount the PVC to, and "access" is either "R" for read-only or "W" for read-write access. Multiple entries must be separated by whitespace. |
| transport.kubernetes.evaluator.mountSecrets | string | `""` | Secrets to mount into the evaluator worker pods. Each entry must be in the format "secret->path|subPath", where "secret" is the name of the Secret to mount, "path" is the path inside the container to mount the Secret to, and "subPath" is an optional subPath of the Secret to mount. |
| transport.kubernetes.reporter.cpuRequest | string | `""` | CPU request for reporter worker pods. If not set, no CPU request is defined. |
| transport.kubernetes.reporter.cpuLimit | string | `""` | CPU limit for reporter worker pods. If not set, no CPU limit is defined. |
| transport.kubernetes.reporter.memoryRequest | string | `"4Gi"` | Memory request for reporter worker pods. If not set, no memory request is defined. |
| transport.kubernetes.reporter.memoryLimit | string | `"4Gi"` | Memory limit for reporter worker pods. If not set, no memory limit is defined. |
| transport.kubernetes.reporter.mountEmptyDirs | string | `""` | EmptyDir volumes to mount into the reporter worker pods. Each entry must be in the format "name->path", where "name" is the name of the EmptyDir volume and "path" is the path inside the container to mount the volume to. Multiple entries must be separated by whitespace. |
| transport.kubernetes.reporter.mountPvcs | string | `""` | PVCs to mount into the reporter worker pods. Each entry must be in the format "pvcName->path,access", where "pvcName" is the name of the PVC to mount, "path" is the path inside the container to mount the PVC to, and "access" is either "R" for read-only or "W" for read-write access. Multiple entries must be separated by whitespace. |
| transport.kubernetes.reporter.mountSecrets | string | `""` | Secrets to mount into the reporter worker pods. Each entry must be in the format "secret->path|subPath", where "secret" is the name of the Secret to mount, "path" is the path inside the container to mount the Secret to, and "subPath" is an optional subPath of the Secret to mount. |
| transport.kubernetes.scanner.cpuRequest | string | `""` | CPU request for scanner worker pods. If not set, no CPU request is defined. |
| transport.kubernetes.scanner.cpuLimit | string | `""` | CPU limit for scanner worker pods. If not set, no CPU limit is defined. |
| transport.kubernetes.scanner.memoryRequest | string | `"8Gi"` | Memory request for scanner worker pods. If not set, no memory request is defined. |
| transport.kubernetes.scanner.memoryLimit | string | `"8Gi"` | Memory limit for scanner worker pods. If not set, no memory limit is defined. |
| transport.kubernetes.scanner.mountEmptyDirs | string | `""` | EmptyDir volumes to mount into the scanner worker pods. Each entry must be in the format "name->path", where "name" is the name of the EmptyDir volume and "path" is the path inside the container to mount the volume to. Multiple entries must be separated by whitespace. |
| transport.kubernetes.scanner.mountPvcs | string | `""` | PVCs to mount into the scanner worker pods. Each entry must be in the format "pvcName->path,access", where "pvcName" is the name of the PVC to mount, "path" is the path inside the container to mount the PVC to, and "access" is either "R" for read-only or "W" for read-write access. Multiple entries must be separated by whitespace. |
| transport.kubernetes.scanner.mountSecrets | string | `""` | Secrets to mount into the scanner worker pods. Each entry must be in the format "secret->path|subPath", where "secret" is the name of the Secret to mount, "path" is the path inside the container to mount the Secret to, and "subPath" is an optional subPath of the Secret to mount. |
| transport.rabbitmq.enabled | bool | `true` |  |
| transport.rabbitmq.serverUri | string | `""` |  |
| transport.rabbitmq.username | string | `""` |  |
| transport.rabbitmq.password | string | `""` |  |
| core.uiHosts | string | `"localhost:5173,localhost:8082"` |  |
| core.service.port | int | `8081` |  |
| core.keycloak.jwtUri | string | `"https://keycloak.ortserver.org/realms/master/protocol/openid-connect/certs"` |  |
| core.keycloak.jwtIssuer | string | `"https://keycloak.ortserver.org/realms/master"` |  |
| core.keycloak.jwtAudience | string | `"ort-server"` |  |
| core.keycloak.jwtRealm | string | `"ort-server"` |  |
| core.keycloak.jwtRoleCacheLifetime | int | `60` |  |
| core.keycloak.accessTokenUrl | string | `"https://keycloak.ortserver.org/realms/master/protocol/openid-connect/token"` |  |
| core.keycloak.apiUrl | string | `"https://keycloak.ortserver.org/admin/realms/master"` |  |
| core.keycloak.apiUser | string | `"ort-server"` |  |
| core.keycloak.apiSecret | string | `"ort-server"` |  |
| core.keycloak.clientId | string | `"admin-cli"` |  |
| core.keycloak.subjectClientId | string | `"ort-server"` |  |
| core.livenessProbe.enabled | bool | `true` | Enable livenessProbe for the core deployment |
| core.livenessProbe.initialDelaySeconds | int | `60` | Initial delay before the liveness probe is initiated |
| core.livenessProbe.periodSeconds | int | `10` | Period between liveness probe checks |
| core.livenessProbe.timeoutSeconds | int | `5` | Timeout for the liveness probe |
| core.livenessProbe.successThreshold | int | `1` | Minimum consecutive successes for the liveness probe to be considered successful |
| core.livenessProbe.failureThreshold | int | `6` | Minimum consecutive failures for the liveness probe to be considered failed |
| core.resources | object | `{"limits":{"cpu":2,"memory":"2Gi"},"requests":{"cpu":"100m","memory":"512Mi"}}` | CPU and memory requests and limits for the core deployment |
| core.certificates.path | string | `""` | Path to a directory containing PEM-encoded certificates to import into the Java keystore at startup. Each file in the directory must contain one PEM-encoded certificate. When set, the container command is overridden to run the import script before starting the application. Typical usage: mount a Kubernetes Secret (one key per certificate) via extraVolumes and extraVolumeMounts, then set this to the mount path. |
| core.extraVolumes | list | `[]` | Additional volumes for the core deployment |
| core.extraVolumeMounts | list | `[]` | Additional volume mounts for the core deployment |
| core.extraEnv | list | `[]` | Additional environment variables for the core deployment |
| core.extraInitContainers | list | `[]` | Additional init containers for the core deployment |
| orchestrator.resources | object | `{"limits":{"cpu":1,"memory":"1Gi"},"requests":{"cpu":"100m","memory":"256Mi"}}` | CPU and memory requests and limits for the orchestrator deployment |
| orchestrator.extraVolumes | list | `[]` | Additional volumes for the orchestrator deployment |
| orchestrator.extraVolumeMounts | list | `[]` | Additional volume mounts for the orchestrator deployment |
| orchestrator.extraEnv | list | `[]` | Additional environment variables for the orchestrator deployment |
| orchestrator.extraInitContainers | list | `[]` | Additional init containers for the orchestrator deployment |
| tasks.resources | object | `{"limits":{"cpu":1,"memory":"1Gi"},"requests":{"cpu":"100m","memory":"256Mi"}}` | CPU and memory requests and limits for the task cron jobs |
| tasks.certificates.path | string | `""` | Path to a directory containing PEM-encoded certificates to import into the Java keystore at startup. Each file in the directory must contain one PEM-encoded certificate. When set, the container command is overridden to run the import script before starting the application. Typical usage: mount a Kubernetes Secret (one key per certificate) via extraVolumes and extraVolumeMounts, then set this to the mount path. |
| tasks.extraVolumes | list | `[]` | Additional volumes for the task cron jobs |
| tasks.extraVolumeMounts | list | `[]` | Additional volume mounts for the task cron jobs |
| tasks.extraEnv | list | `[]` | Additional environment variables for the task cron jobs |
| tasks.extraInitContainers | list | `[]` | Additional init containers for the task cron jobs |
| tasks.configs[0].name | string | `"delete-old-ort-runs"` |  |
| tasks.configs[0].schedule | string | `"15 0 * * *"` |  |
| tasks.configs[0].dataRetention.ortRunDays | int | `90` |  |
| tasks.configs[1].name | string | `"delete-orphaned-entities"` |  |
| tasks.configs[1].schedule | string | `"30 1 * * *"` |  |
| tasks.configs[1].vcsInfo.limit | int | `1024` |  |
| tasks.configs[1].vcsInfo.chunkSize | int | `64` |  |
| tasks.configs[1].remoteArtifacts.limit | int | `1024` |  |
| tasks.configs[1].remoteArtifacts.chunkSize | int | `64` |  |
| tasks.configs[1].snippets.limit | int | `1048576` |  |
| tasks.configs[1].snippets.chunkSize | int | `1024` |  |
| tasks.configs[1].snippetFindings.limit | int | `1048576` |  |
| tasks.configs[1].snippetFindings.chunkSize | int | `1024` |  |
| tasks.configs[2].name | string | `"kubernetes-reaper"` |  |
| tasks.configs[2].schedule | string | `"*/5 * * * *"` |  |
| tasks.configs[2].reaperMaxAge | int | `600` |  |
| tasks.configs[3].name | string | `"kubernetes-long-running-jobs-finder"` |  |
| tasks.configs[3].schedule | string | `"*/5 * * * *"` |  |
| tasks.configs[3].timeouts.configWorker | int | `1` |  |
| tasks.configs[3].timeouts.analyzerWorker | int | `120` |  |
| tasks.configs[3].timeouts.advisorWorker | int | `2` |  |
| tasks.configs[3].timeouts.scannerWorker | int | `1440` |  |
| tasks.configs[3].timeouts.evaluatorWorker | int | `5` |  |
| tasks.configs[3].timeouts.reporterWorker | int | `30` |  |
| tasks.configs[3].timeouts.notifierWorker | int | `10` |  |
| tasks.configs[4].name | string | `"kubernetes-lost-jobs-finder"` |  |
| tasks.configs[4].schedule | string | `"*/2 * * * *"` |  |
| tasks.configs[4].lostJobsMinAge | int | `30` |  |
| ui.url | string | `""` |  |
| ui.apiUrl | string | `""` |  |
| ui.authority | string | `""` |  |
| ui.clientId | string | `""` |  |
| ui.service.port | int | `8082` |  |
| ui.resources | object | `{"limits":{"cpu":"500m","memory":"256Mi"},"requests":{"cpu":"50m","memory":"64Mi"}}` | CPU and memory requests and limits for the UI deployment |
| ui.extraVolumes | list | `[]` | Additional volumes for the UI deployment |
| ui.extraVolumeMounts | list | `[]` | Additional volume mounts for the UI deployment |
| extraObjects | list | `[]` |  |
