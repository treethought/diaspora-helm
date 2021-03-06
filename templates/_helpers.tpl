{{/*
Expand the name of the chart.
*/}}
{{- define "diaspora.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "diaspora.fullname" -}}
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
Create chart name and version as used by the chart label.
*/}}
{{- define "diaspora.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "diaspora.labels" -}}
helm.sh/chart: {{ include "diaspora.chart" . }}
{{ include "diaspora.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "diaspora.selectorLabels" -}}
app.kubernetes.io/name: {{ include "diaspora.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "diaspora.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "diaspora.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

/* Taken from gitea helm chart */
{{- define "postgresql.host" -}}
{{- printf "%s-postgresql.%s.svc.%s" .Release.Name .Release.Namespace .Values.clusterDomain -}}
{{- end -}}

{{- define "redis.url" -}}
{{- printf "redis://%s-redis-master.%s.svc.%s:6379" .Release.Name .Release.Namespace .Values.clusterDomain  -}}
{{- end -}}

{{- define "diaspora.hostURL" -}}
{{- if .Values.diaspora.configuration.environment.require_ssl }}
{{- printf "https://%s" .Values.host }}
{{- else }}
{{- printf "http://%s" .Values.host }}
{{- end -}}
{{- end -}}


{{- define "diaspora.redisUrl" -}}
{{- printf "redis://%s-redis-master.%s.svc.%s:6379" .Release.Name .Release.Namespace .Values.clusterDomain  -}}
{{- end -}}


