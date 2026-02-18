{{/*
ORT Server name
Create a name for the ORT Server deployment.
By default, this is the same as the chart name, but it can be overridden with the nameOverride value.
The value is trimmed to 63 characters and any trailing dashes are removed to comply with Kubernetes naming conventions.
*/}}
{{- define "ortserver.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
ORT Server fullname
Create a default fully qualified app name.
By default, this is the release name followed by the chart name, but it can be overridden with the fullnameOverride value.
The value is trimmed to 63 characters and any trailing dashes are removed to comply with Kubernetes naming conventions.
*/}}
{{- define "ortserver.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
ORT Server chart name
Generate a name for the ORT Server chart.
This is used for the helm.sh/chart label, which is required by some tools like the Helm Operator.
The value is the chart name and version, separated by a dash.
The version is sanitized to replace any "+" characters with "_" and the entire value is trimmed to 63 characters and any trailing dashes are removed to comply with Kubernetes naming conventions.
*/}}
{{- define "ortserver.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
ORT Server labels
Define labels for all ORT Server objects.
Merges default values for helm.sh/chart, app.kubernetes.io/managed-by and app.kubernetes.io/version with selector labels and commonLabels.
commonLabels take precedence over selector labels, which take precedence over default values.
*/}}
{{- define "ortserver.labels" -}}
{{- $default := dict
    "helm.sh/chart" (include "ortserver.chart" .)
    "app.kubernetes.io/managed-by" .Release.Service
    "app.kubernetes.io/version" .Chart.AppVersion -}}
{{- $selectorLabels := include "ortserver.selectorLabels" . | fromYaml -}}
{{- $commonLabels := .Values.commonLabels | default dict -}}
{{- merge $commonLabels $selectorLabels $default | toYaml }}
{{- end }}

{{/*
Selector labels
Define default selector labels app.kubernetes.io/name and app.kubernetes.io/instance.
If they are also defined in commonLabels, the values from commonLabels take precedence.
*/}}
{{- define "ortserver.selectorLabels" -}}
{{- $default := dict
    "app.kubernetes.io/name" (include "ortserver.name" .)
    "app.kubernetes.io/instance" .Release.Name -}}
{{- $override := dict -}}
{{- with .Values.commonLabels -}}
  {{- $override = pick . "app.kubernetes.io/name" "app.kubernetes.io/instance" -}}
{{- end -}}
{{- merge $override $default | toYaml }}
{{- end }}

{{/*
Render a value that might contain templates.
*/}}
{{- define "tplvalues.render" -}}
  {{- $value := typeIs "string" .value | ternary .value (.value | toYaml) }}
  {{- if contains "{{" (toString $value) }}
    {{- tpl $value .context }}
  {{- else }}
    {{- $value }}
  {{- end }}
{{- end -}}
