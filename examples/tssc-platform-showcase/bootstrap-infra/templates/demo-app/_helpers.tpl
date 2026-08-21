{{/*
Common labels for demo-app chart resources.
*/}}
{{- define "demoApp.labels" -}}
demo.redhat.com/application: "tssc-platform-showcase"
app.kubernetes.io/name: sample-service
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/part-of: tssc-platform-showcase
{{- end -}}

{{/*
In-cluster Gitea clone URL for the migrated repo (the whole rhdp-gitops-patterns
monorepo — sample-service lives at .Values.gitea.migratedRepo.appSubdir inside
it; Gitea operator migrates repos directly under the created user's account,
no Organization).
*/}}
{{- define "demoApp.giteaRepoUrl" -}}
http://gitea.{{ .Values.gitea.namespace }}.svc:3000/{{ .Values.gitea.user.username }}/{{ .Values.gitea.migratedRepo.repoName }}.git
{{- end -}}

{{/*
Internal registry pull ref for the sample-service image built by this component.
*/}}
{{- define "demoApp.imageRef" -}}
image-registry.openshift-image-registry.svc:5000/{{ .Values.demoApp.namespace }}/sample-service:latest
{{- end -}}

{{/*
Route host for the deployed demo-app.
*/}}
{{- define "demoApp.routeHost" -}}
{{- if .Values.deployer.domain -}}
sample-service-{{ .Values.demoApp.namespace }}.{{ .Values.deployer.domain }}
{{- else -}}
sample-service-{{ .Values.demoApp.namespace }}.apps.cluster.example.com
{{- end -}}
{{- end -}}
