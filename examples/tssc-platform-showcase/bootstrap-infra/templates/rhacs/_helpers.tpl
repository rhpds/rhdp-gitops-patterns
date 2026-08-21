{{/*
Common labels for RHACS chart resources.
*/}}
{{- define "rhacs.labels" -}}
demo.redhat.com/application: "tssc-platform-showcase"
app.kubernetes.io/name: rhacs
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: tssc-platform-showcase
{{- end -}}

{{/*
Central Route host pattern (OpenShift).
*/}}
{{- define "rhacs.centralHost" -}}
{{- if .Values.deployer.domain -}}
central-{{ .Values.rhacs.namespace }}.{{ .Values.deployer.domain }}
{{- else -}}
central-{{ .Values.rhacs.namespace }}.apps.cluster.example.com
{{- end -}}
{{- end -}}

{{- define "rhacs.centralUrl" -}}
https://{{ include "rhacs.centralHost" . }}
{{- end -}}

{{- define "rhacs.centralEndpoint" -}}
{{ include "rhacs.centralHost" . }}:443
{{- end -}}
