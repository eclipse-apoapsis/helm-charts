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
