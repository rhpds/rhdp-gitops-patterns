{{/*
Common labels for RHTAS chart resources.
*/}}
{{- define "rhtas.labels" -}}
demo.redhat.com/application: "tssc-platform-showcase"
app.kubernetes.io/name: rhtas
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: tssc-platform-showcase
{{- end -}}

{{/*
Fulcio commonName — defaults to fulcio.<deployer.domain> when unset.
*/}}
{{- define "rhtas.fulcioCommonName" -}}
{{- if .Values.rhtas.securesign.fulcio.commonName -}}
{{- .Values.rhtas.securesign.fulcio.commonName -}}
{{- else if .Values.deployer.domain -}}
fulcio.{{ .Values.deployer.domain }}
{{- else -}}
fulcio.hostname
{{- end -}}
{{- end -}}

{{/*
Optional Keycloak issuer URL.
*/}}
{{- define "rhtas.keycloakIssuer" -}}
{{- if .Values.rhtas.oidc.keycloak.issuerURL -}}
{{- .Values.rhtas.oidc.keycloak.issuerURL -}}
{{- else if .Values.deployer.domain -}}
https://{{ .Values.keycloak.routeHostPrefix }}.{{ .Values.deployer.domain }}/realms/{{ .Values.rhtas.oidc.keycloak.realm }}
{{- else -}}
https://{{ .Values.keycloak.routeHostPrefix }}.apps.cluster.example.com/realms/{{ .Values.rhtas.oidc.keycloak.realm }}
{{- end -}}
{{- end -}}

{{/*
Fulcio server Route URL hint — used by userinfo and by demo-app's PipelineRun params.
*/}}
{{- define "rhtas.fulcioUrl" -}}
{{- if .Values.deployer.domain -}}
https://fulcio-server-{{ .Values.rhtas.namespace }}.{{ .Values.deployer.domain }}
{{- else -}}
https://fulcio-server-{{ .Values.rhtas.namespace }}.apps.cluster.example.com
{{- end -}}
{{- end -}}

{{/*
Rekor server Route URL hint.
*/}}
{{- define "rhtas.rekorUrl" -}}
{{- if .Values.deployer.domain -}}
https://rekor-server-{{ .Values.rhtas.namespace }}.{{ .Values.deployer.domain }}
{{- else -}}
https://rekor-server-{{ .Values.rhtas.namespace }}.apps.cluster.example.com
{{- end -}}
{{- end -}}

{{/*
TUF Route URL hint.
*/}}
{{- define "rhtas.tufUrl" -}}
{{- if .Values.deployer.domain -}}
https://tuf-{{ .Values.rhtas.namespace }}.{{ .Values.deployer.domain }}
{{- else -}}
https://tuf-{{ .Values.rhtas.namespace }}.apps.cluster.example.com
{{- end -}}
{{- end -}}
