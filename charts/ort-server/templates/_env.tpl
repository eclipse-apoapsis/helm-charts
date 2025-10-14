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
  value: "true"
{{- end -}}

{{/* Environment variables to configure the provider for user secrets. */}}
{{- define "ortserver.env.userSecrets" -}}
{{- if .Values.secrets.fileBased.enabled }}
- name: SECRETS_PROVIDER_NAME
  value: fileBased
- name: FILE_BASED_PATH
  value: {{ .Values.secrets.fileBased.path }}
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

{{/* Environment variables to configure the file list storage. */}}
{{- define "ortserver.env.fileListStorage" -}}
{{- if .Values.storage.database.enabled }}
- name: FILE_LIST_STORAGE_NAME
  value: database
- name: FILE_LIST_STORAGE_NAMESPACE
  value: {{ .Values.storage.database.namespaces.fileLists }}
- name: FILE_LIST_STORAGE_IN_MEMORY_LIMIT
  value: "{{ .Values.storage.database.inMemoryLimit }}"
{{- end }}
{{- end -}}

{{/* Environment variables to configure the report storage. */}}
{{- define "ortserver.env.reportStorage" -}}
{{- if .Values.storage.database.enabled }}
- name: REPORT_STORAGE_NAME
  value: database
- name: REPORT_STORAGE_NAMESPACE
  value: {{ .Values.storage.database.namespaces.reports }}
- name: REPORT_STORAGE_IN_MEMORY_LIMIT
  value: "{{ .Values.storage.database.inMemoryLimit }}"
{{- end }}
{{- end -}}
