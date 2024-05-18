{{- define "secret-path" }}
{{- if .Values.global.existingSecret -}}
{{ .Values.global.existingSecret }}
{{- else -}}
{{ .Release.Name }}-secrets
{{- end }}
{{- end}}

{{- define "kubectlVersion" }}
{{- if .Values.global.kubectlVersion -}}
{{ .Values.global.kubectlVersion }}
{{- else -}}
{{ printf "%s.%s" .Capabilities.KubeVersion.Major .Capabilities.KubeVersion.Minor }}
{{- end }}
{{- end}}

{{- /*
Lago API URL
*/}}
{{- define "apiUrl" }}
{{- printf "%s://%s" (.Values.apiUrlScheme | default "https") (required "apiUrlDomain is required" .Values.apiUrlDomain) }}
{{- end }}

{{- /*
Lago Front URL
*/}}
{{- define "frontUrl" }}
{{- printf "%s://%s" (.Values.frontUrlScheme | default "https") (required "frontUrlDomain is required" .Values.frontUrlDomain) }}
{{- end }}
