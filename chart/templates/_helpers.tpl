{{/*
Expand the name of the chart.
*/}}
{{- define "linkwarden.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "linkwarden.fullname" -}}
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
{{- define "linkwarden.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "linkwarden.labels" -}}
helm.sh/chart: {{ include "linkwarden.chart" . }}
{{ include "linkwarden.selectorLabels" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "linkwarden.selectorLabels" -}}
app.kubernetes.io/name: {{ include "linkwarden.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
NextAuth URL
Return the primary ingress host if enabled and defined; otherwise, return "localhost".
*/}}
{{- define "linkwarden.nextAuthURL" -}}
{{- if and .Values.ingress.enabled (gt (len .Values.ingress.hosts) 0) (index .Values.ingress.hosts 0).host }}
  {{ (index .Values.ingress.hosts 0).host | quote }}
{{- else -}}
  {{ default "http://localhost:3000" .Values.baseUrl }}/api/v1/auth
{{- end -}}
{{- end }}
