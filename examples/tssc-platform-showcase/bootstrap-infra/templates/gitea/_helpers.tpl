{{/*
Common labels for Gitea chart resources.
*/}}
{{- define "gitea.labels" -}}
demo.redhat.com/application: "tssc-platform-showcase"
app.kubernetes.io/name: gitea
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: tssc-platform-showcase
{{- end -}}

{{/*
Route host for the operator-managed Gitea instance.
*/}}
{{- define "gitea.routeHost" -}}
{{- if .Values.deployer.domain -}}
{{ .Values.gitea.routeHostPrefix }}.{{ .Values.deployer.domain }}
{{- else -}}
{{ .Values.gitea.routeHostPrefix }}.apps.cluster.example.com
{{- end -}}
{{- end -}}

{{- define "gitea.url" -}}
https://{{ include "gitea.routeHost" . }}
{{- end -}}

{{/*
External clone URL for the migrated repo (the whole rhdp-gitops-patterns
monorepo — see values.yaml gitea.migratedRepo comment for why) once migrated
by the operator (repos land directly under the created user's own account —
this CR has no concept of Gitea Organizations).
*/}}
{{- define "gitea.migratedRepoCloneUrl" -}}
{{ include "gitea.url" . }}/{{ .Values.gitea.user.username }}/{{ .Values.gitea.migratedRepo.repoName }}.git
{{- end -}}
