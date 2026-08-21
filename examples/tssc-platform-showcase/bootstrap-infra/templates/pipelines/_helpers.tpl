{{/*
Common labels for Pipelines chart resources.
*/}}
{{- define "pipelines.labels" -}}
demo.redhat.com/application: "tssc-platform-showcase"
app.kubernetes.io/name: pipelines
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: tssc-platform-showcase
{{- end -}}
