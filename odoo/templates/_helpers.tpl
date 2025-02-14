{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "odoo.postgresql.fullname" -}}
{{- include "common.names.dependency.fullname" (dict "chartName" "postgresql" "chartValues" .Values.postgresql "context" $) -}}
{{- end -}}

{{/*
Return the proper Odoo image name
*/}}
{{- define "odoo.image" -}}
{{- include "common.images.image" (dict "imageRoot" .Values.image "global" .Values.global) -}}
{{- end -}}

{{/*
Return the Postgresql hostname
*/}}
{{- define "odoo.databaseHost" -}}
{{- include "odoo.postgresql.fullname" . }}
{{- end -}}

{{/*
Return the Postgresql port
*/}}
{{- define "odoo.databasePort" -}}
{{- "5432" -}}
{{- end -}}

{{/*
Return the Postgresql database name
*/}}
{{- define "odoo.databaseName" -}}
{{- .Values.postgresql.auth.database -}}
{{- end -}}

{{/*
Return the Postgresql user
*/}}
{{- define "odoo.databaseUser" -}}
{{- .Values.postgresql.auth.username -}}
{{- end -}}

{{/*
Return the PostgreSQL Secret Name
*/}}
{{- define "odoo.databaseSecretName" -}}
{{- include "odoo.postgresql.fullname" . -}}
{{- end -}}

{{/*
Add environment variables to configure database values
*/}}
{{- define "odoo.databaseSecretPasswordKey" -}}
{{- print "password" -}}
{{- end -}}

{{/*
Odoo credential secret name
*/}}
{{- define "odoo.secretName" -}}
{{- include "common.names.fullname" . -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "odoo.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}