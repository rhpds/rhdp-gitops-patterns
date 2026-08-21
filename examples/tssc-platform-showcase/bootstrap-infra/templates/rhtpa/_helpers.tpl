{{/*
Common labels for RHTPA chart resources.
*/}}
{{- define "rhtpa.labels" -}}
demo.redhat.com/application: "tssc-platform-showcase"
app.kubernetes.io/name: rhtpa
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: tssc-platform-showcase
{{- end -}}

{{/*
Operator namespace — defaults to the instance namespace (namespace-scoped Operator).
*/}}
{{- define "rhtpa.operatorNamespace" -}}
{{- if .Values.rhtpa.operator.namespace -}}
{{- .Values.rhtpa.operator.namespace -}}
{{- else -}}
{{- .Values.rhtpa.namespace -}}
{{- end -}}
{{- end -}}

{{/*
OIDC issuer URL for TPA frontend / CLI.
*/}}
{{- define "rhtpa.oidcIssuer" -}}
{{- if .Values.rhtpa.oidc.issuerURL -}}
{{- .Values.rhtpa.oidc.issuerURL -}}
{{- else if .Values.deployer.domain -}}
https://{{ .Values.keycloak.routeHostPrefix }}.{{ .Values.deployer.domain }}/realms/{{ .Values.rhtpa.oidc.realm }}
{{- else -}}
https://{{ .Values.keycloak.routeHostPrefix }}.apps.cluster.example.com/realms/{{ .Values.rhtpa.oidc.realm }}
{{- end -}}
{{- end -}}

{{/*
TPA server / UI URL (OpenShift Route pattern used by the Operator).
*/}}
{{- define "rhtpa.serverUrl" -}}
{{- if .Values.deployer.domain -}}
https://server-{{ .Values.rhtpa.namespace }}.{{ .Values.deployer.domain }}
{{- else -}}
https://server-{{ .Values.rhtpa.namespace }}.apps.cluster.example.com
{{- end -}}
{{- end -}}

{{/*
PostgreSQL host FQDN inside the cluster.
*/}}
{{- define "rhtpa.pgsqlHost" -}}
{{ .Values.rhtpa.postgresql.name }}.{{ .Values.rhtpa.namespace }}.svc
{{- end -}}

{{/*
appDomain suffix for TrustedProfileAnalyzer CR (leading dash + ns.domain).
*/}}
{{- define "rhtpa.appDomain" -}}
{{- if .Values.deployer.domain -}}
-{{ .Values.rhtpa.namespace }}.{{ .Values.deployer.domain }}
{{- else -}}
-{{ .Values.rhtpa.namespace }}.apps.cluster.example.com
{{- end -}}
{{- end -}}
