{{/* Environment variables to configure the database. */}}
{{- define "ortserver.env.database" -}}
- name: DB_HOST
  value: {{ .Values.database.host | quote }}
- name: DB_PORT
  value: {{ .Values.database.port | quote }}
- name: DB_NAME
  value: {{ .Values.database.name | quote }}
- name: DB_SCHEMA
  value: {{ .Values.database.schema | quote }}
- name: DB_USERNAME
  value: {{ .Values.database.username | quote }}
- name: DB_PASSWORD
  value: {{ .Values.database.password | quote }}
- name: DB_SSL_MODE
  value: {{ .Values.database.sslMode | quote }}
{{- end -}}

{{/* Environment variables to configure the provider for admin secrets. */}}
{{- define "ortserver.env.adminSecrets" -}}
- name: ALLOW_SECRETS_FROM_CONFIG
  value: "{{ .Values.configSecrets.allowSecretsFromConfig }}"
{{- end -}}

{{/* Environment variables to configure the provider for user secrets. */}}
{{- define "ortserver.env.userSecrets" -}}
{{- if .Values.secrets.azureKeyVault.enabled }}
- name: SECRETS_PROVIDER_NAME
  value: azure-keyvault
- name: AZURE_KEY_VAULT_NAME
  value: {{ .Values.secrets.azureKeyVault.keyVaultName | quote }}
{{- else if .Values.secrets.database.enabled }}
- name: SECRETS_PROVIDER_NAME
  value: database
- name: DATABASE_SECRETS_MASTER_PASSWORD
  value: {{ .Values.secrets.database.masterPassword | quote }}
- name: DATABASE_SECRETS_SALT
  value: {{ .Values.secrets.database.salt | quote }}
- name: DATABASE_SECRETS_KEY_VERSION
  value: "{{ .Values.secrets.database.keyVersion }}"
{{- else if .Values.secrets.fileBased.enabled }}
- name: SECRETS_PROVIDER_NAME
  value: fileBased
- name: FILE_BASED_PATH
  value: {{ .Values.secrets.fileBased.path | quote }}
{{- else if .Values.secrets.scaleway.enabled }}
- name: SECRETS_PROVIDER_NAME
  value: scaleway
- name: SCW_SERVER_URL
  value: {{ .Values.secrets.scaleway.serverUrl | quote }}
- name: SCW_API_VERSION
  value: {{ .Values.secrets.scaleway.apiVersion | quote }}
- name: SCW_REGION
  value: {{ .Values.secrets.scaleway.region | quote }}
- name: SCW_PROJECT_ID
  value: {{ .Values.secrets.scaleway.projectId | quote }}
- name: SCW_SECRET_KEY
  value: {{ .Values.secrets.scaleway.secretKey | quote }}
{{- else if .Values.secrets.vault.enabled }}
- name: SECRETS_PROVIDER_NAME
  value: vault
- name: VAULT_URI
  value: {{ .Values.secrets.vault.uri | quote }}
- name: VAULT_ROLE_ID
  value: {{ .Values.secrets.vault.roleId | quote }}
- name: VAULT_SECRET_ID
  value: {{ .Values.secrets.vault.secretId | quote }}
- name: VAULT_ROOT_PATH
  value: {{ .Values.secrets.vault.rootPath | quote }}
- name: VAULT_PREFIX
  value: {{ .Values.secrets.vault.prefix | quote }}
- name: VAULT_NAMESPACE
  value: {{ .Values.secrets.vault.namespace | quote }}
{{- end }}
{{- end -}}

{{/* Environment variables to configure the logFile. */}}
{{- define "ortserver.env.logFileService" -}}
{{- if .Values.logFileService.enabled }}
- name: LOG_FILE_PROVIDER_NAME
  value: {{ .Values.logFileService.name | quote }}
- name: LOKI_SERVER_URL
  value: {{ .Values.logFileService.lokiServerUrl | quote }}
- name: LOKI_NAMESPACE
  value: {{ .Values.logFileService.lokiNamespace | quote }}
- name: LOKI_QUERY_LIMIT
  value: {{ .Values.logFileService.lokiQueryLimit | quote }}
- name: LOKI_USERNAME
  value: {{ .Values.logFileService.lokiUsername | quote }}
- name: LOKI_PASSWORD
  value: {{ .Values.logFileService.lokiPassword | quote }}
- name: LOKI_TENANT_ID
  value: {{ .Values.logFileService.lokiTenantId | quote }}
{{- end }}
{{- end -}}

{{/*
Allow setting all typesafe config properties with environment variables. This is required because not all config
properties have environment variable substitutions configured.
*/}}
{{- define "ortserver.env.typesafeConfigOverride" -}}
- name: JAVA_TOOL_OPTIONS
  value: "-Dconfig.override_with_env_vars=true"
{{- end -}}

{{/* Environment variables to configure the file archive storage. */}}
{{- define "ortserver.env.fileArchiveStorage" -}}
{{- if .Values.storage.azureBlob.enabled }}
- name: FILE_ARCHIVE_STORAGE_NAME
  value: azure-blob
{{- if .Values.storage.azureBlob.endpointUrl }}
- name: FILE_ARCHIVE_STORAGE_ENDPOINT_URL
  value: {{ .Values.storage.azureBlob.endpointUrl | quote }}
{{- end }}
{{- if .Values.storage.azureBlob.accountName }}
- name: FILE_ARCHIVE_STORAGE_ACCOUNT_NAME
  value: {{ .Values.storage.azureBlob.accountName | quote }}
{{- end }}
- name: FILE_ARCHIVE_STORAGE_CONTAINER_NAME
  value: {{ .Values.storage.azureBlob.containers.fileArchives | quote }}
{{- else if .Values.storage.database.enabled }}
- name: FILE_ARCHIVE_STORAGE_NAME
  value: database
- name: FILE_ARCHIVE_STORAGE_NAMESPACE
  value: {{ .Values.storage.database.namespaces.fileArchives }}
- name: FILE_ARCHIVE_STORAGE_IN_MEMORY_LIMIT
  value: "{{ .Values.storage.database.inMemoryLimit }}"
{{- else if .Values.storage.s3.enabled }}
- name: FILE_ARCHIVE_STORAGE_NAME
  value: s3
- name: FILE_ARCHIVE_STORAGE_ENDPOINT_URL
  value: {{ .Values.storage.s3.endpointUrl | quote }}
- name: FILE_ARCHIVE_STORAGE_ACCESS_KEY
  value: {{ .Values.storage.s3.accessKey | quote }}
- name: FILE_ARCHIVE_STORAGE_SECRET_KEY
  value: {{ .Values.storage.s3.secretKey | quote }}
{{- if .Values.storage.s3.region }}
- name: FILE_ARCHIVE_STORAGE_REGION
  value: {{ .Values.storage.s3.region | quote }}
{{- end }}
{{- if .Values.storage.s3.forcePathStyle }}
- name: FILE_ARCHIVE_STORAGE_FORCE_PATH_STYLE
  value: "{{ .Values.storage.s3.forcePathStyle }}"
{{- end }}
- name: FILE_ARCHIVE_STORAGE_BUCKET_NAME
  value: {{ .Values.storage.s3.buckets.fileArchives | quote }}
{{- if .Values.storage.s3.prefixes.fileArchives }}
- name: FILE_ARCHIVE_STORAGE_KEY_PREFIX
  value: {{ .Values.storage.s3.prefixes.fileArchives | quote }}
{{- end }}
{{- end }}
{{- end -}}

{{/* Environment variables to configure the file list storage. */}}
{{- define "ortserver.env.fileListStorage" -}}
{{- if .Values.storage.azureBlob.enabled }}
- name: FILE_LIST_STORAGE_NAME
  value: azure-blob
{{- if .Values.storage.azureBlob.endpointUrl }}
- name: FILE_LIST_STORAGE_ENDPOINT_URL
  value: {{ .Values.storage.azureBlob.endpointUrl | quote }}
{{- end }}
{{- if .Values.storage.azureBlob.accountName }}
- name: FILE_LIST_STORAGE_ACCOUNT_NAME
  value: {{ .Values.storage.azureBlob.accountName | quote }}
{{- end }}
- name: FILE_LIST_STORAGE_CONTAINER_NAME
  value: {{ .Values.storage.azureBlob.containers.fileLists | quote }}
{{- else if .Values.storage.database.enabled }}
- name: FILE_LIST_STORAGE_NAME
  value: database
- name: FILE_LIST_STORAGE_NAMESPACE
  value: {{ .Values.storage.database.namespaces.fileLists }}
- name: FILE_LIST_STORAGE_IN_MEMORY_LIMIT
  value: "{{ .Values.storage.database.inMemoryLimit }}"
{{- else if .Values.storage.s3.enabled }}
- name: FILE_LIST_STORAGE_NAME
  value: s3
- name: FILE_LIST_STORAGE_ENDPOINT_URL
  value: {{ .Values.storage.s3.endpointUrl | quote }}
- name: FILE_LIST_STORAGE_ACCESS_KEY
  value: {{ .Values.storage.s3.accessKey | quote }}
- name: FILE_LIST_STORAGE_SECRET_KEY
  value: {{ .Values.storage.s3.secretKey | quote }}
{{- if .Values.storage.s3.region }}
- name: FILE_LIST_STORAGE_REGION
  value: {{ .Values.storage.s3.region | quote }}
{{- end }}
{{- if .Values.storage.s3.forcePathStyle }}
- name: FILE_LIST_STORAGE_FORCE_PATH_STYLE
  value: "{{ .Values.storage.s3.forcePathStyle }}"
{{- end }}
- name: FILE_LIST_STORAGE_BUCKET_NAME
  value: {{ .Values.storage.s3.buckets.fileLists | quote }}
{{- if .Values.storage.s3.prefixes.fileLists }}
- name: FILE_LIST_STORAGE_KEY_PREFIX
  value: {{ .Values.storage.s3.prefixes.fileLists | quote }}
{{- end }}
{{- end }}
{{- end -}}

{{/* Environment variables to configure the report storage. */}}
{{- define "ortserver.env.reportStorage" -}}
{{- if .Values.storage.azureBlob.enabled }}
- name: REPORT_STORAGE_NAME
  value: azure-blob
{{- if .Values.storage.azureBlob.endpointUrl }}
- name: REPORT_STORAGE_ENDPOINT_URL
  value: {{ .Values.storage.azureBlob.endpointUrl | quote }}
{{- end }}
{{- if .Values.storage.azureBlob.accountName }}
- name: REPORT_STORAGE_ACCOUNT_NAME
  value: {{ .Values.storage.azureBlob.accountName | quote }}
{{- end }}
- name: REPORT_STORAGE_CONTAINER_NAME
  value: {{ .Values.storage.azureBlob.containers.reports | quote }}
{{- else if .Values.storage.database.enabled }}
- name: REPORT_STORAGE_NAME
  value: database
- name: REPORT_STORAGE_NAMESPACE
  value: {{ .Values.storage.database.namespaces.reports }}
- name: REPORT_STORAGE_IN_MEMORY_LIMIT
  value: "{{ .Values.storage.database.inMemoryLimit }}"
{{- else if .Values.storage.s3.enabled }}
- name: REPORT_STORAGE_NAME
  value: s3
- name: REPORT_STORAGE_ENDPOINT_URL
  value: {{ .Values.storage.s3.endpointUrl | quote }}
- name: REPORT_STORAGE_ACCESS_KEY
  value: {{ .Values.storage.s3.accessKey | quote }}
- name: REPORT_STORAGE_SECRET_KEY
  value: {{ .Values.storage.s3.secretKey | quote }}
{{- if .Values.storage.s3.region }}
- name: REPORT_STORAGE_REGION
  value: {{ .Values.storage.s3.region | quote }}
{{- end }}
- name: REPORT_STORAGE_BUCKET_NAME
  value: {{ .Values.storage.s3.buckets.reports | quote }}
{{- if .Values.storage.s3.prefixes.reports }}
- name: REPORT_STORAGE_KEY_PREFIX
  value: {{ .Values.storage.s3.prefixes.reports | quote }}
{{- end }}
{{- if .Values.storage.s3.forcePathStyle }}
- name: REPORT_STORAGE_FORCE_PATH_STYLE
  value: "{{ .Values.storage.s3.forcePathStyle }}"
{{- end }}
{{- end }}
{{- end -}}
