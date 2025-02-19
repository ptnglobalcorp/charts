{{/*
Create a default fully qualified app name for PostgreSQL Primary objects
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "postgresql.v1.primary.fullname" -}}
{{- if eq .Values.architecture "replication" -}}
    {{- printf "%s-%s" (include "common.names.fullname" .) .Values.primary.name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
    {{- include "common.names.fullname" . -}}
{{- end -}}
{{- end -}}

{{/*
Create the default FQDN for PostgreSQL primary headless service
We truncate at 63 chars because of the DNS naming spec.
*/}}
{{- define "postgresql.v1.primary.svc.headless" -}}
{{- printf "%s-hl" (include "postgresql.v1.primary.fullname" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the proper PostgreSQL image name
*/}}
{{- define "postgresql.v1.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the name for a custom user to create
*/}}
{{- define "postgresql.v1.username" -}}
{{- if .Values.global.postgresql.auth.username -}}
    {{- .Values.global.postgresql.auth.username -}}
{{- else -}}
    {{- .Values.auth.username -}}
{{- end -}}
{{- end -}}

{{/*
Return the name for a custom database to create
*/}}
{{- define "postgresql.v1.database" -}}
{{- if .Values.global.postgresql.auth.database -}}
    {{- printf "%s" (tpl .Values.global.postgresql.auth.database $) -}}
{{- else if .Values.auth.database -}}
    {{- printf "%s" (tpl .Values.auth.database $) -}}
{{- end -}}
{{- end -}}

{{/*
Get the password secret.
*/}}
{{- define "postgresql.v1.secretName" -}}
{{- printf "%s" (include "common.names.fullname" .) -}}
{{- end -}}

{{/*
Get the admin-password key.
*/}}
{{- define "postgresql.v1.adminPasswordKey" -}}
{{- "postgres-password" -}}
{{- end -}}

{{/*
Get the user-password key.
*/}}
{{- define "postgresql.v1.userPasswordKey" -}}
{{- "password" -}}
{{- end -}}

{{/*
Return true if a secret object should be created
*/}}
{{- define "postgresql.v1.createSecret" -}}
{{- $customUser := include "postgresql.v1.username" . -}}
{{- $postgresPassword := include "common.secrets.lookup" (dict "secret" (include "common.names.fullname" .) "key" .Values.auth.secretKeys.adminPasswordKey "defaultValue" (ternary (coalesce .Values.global.postgresql.auth.postgresPassword .Values.auth.postgresPassword .Values.global.postgresql.auth.password .Values.auth.password) (coalesce .Values.global.postgresql.auth.postgresPassword .Values.auth.postgresPassword) (or (empty $customUser) (eq $customUser "postgres"))) "context" $) -}}
{{- if and (or $postgresPassword .Values.auth.enablePostgresUser (and (not (empty $customUser)) (ne $customUser "postgres"))) -}}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return PostgreSQL service port
*/}}
{{- define "postgresql.v1.service.port" -}}
{{- if .Values.global.postgresql.service.ports.postgresql -}}
    {{- .Values.global.postgresql.service.ports.postgresql -}}
{{- else -}}
    {{- .Values.primary.service.ports.postgresql -}}
{{- end -}}
{{- end -}}

{{/*
Return true if a configmap object should be created for PostgreSQL primary with the extended configuration
*/}}
{{- define "postgresql.v1.primary.createExtendedConfigmap" -}}
{{- false -}}
{{- end -}}

{{/*
 Create the name of the service account to use
 */}}
{{- define "postgresql.v1.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Get the readiness probe command
*/}}
{{- define "postgresql.v1.readinessProbeCommand" -}}
{{- $customUser := include "postgresql.v1.username" . -}}
- |
{{- if (include "postgresql.v1.database" .) }}
  exec pg_isready -U {{ default "postgres" $customUser | quote }} -d "dbname={{ include "postgresql.v1.database" . }}" -h 127.0.0.1 -p {{ .Values.containerPorts.postgresql }}
{{- end }}
{{- if contains "bitnami/" .Values.image.repository }}
  [ -f /opt/bitnami/postgresql/tmp/.initialized ] || [ -f /bitnami/postgresql/.initialized ]
{{- end }}
{{- end -}}