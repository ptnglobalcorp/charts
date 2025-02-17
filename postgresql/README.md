# Postgresql Chart

## TL;DR

```console
helm install <release-name> oci://registry-1.docker.io/ptnglobalcorp/postgresql
```
## Parameters

### Global parameters

| Name                                                       | Description                                                                                                                   | Value   |
| ---------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------- | ------- |
| `global.postgresql.auth.postgresPassword`                  | Password for the "postgres" admin user (overrides `auth.postgresPassword`)                                                    | `""`    |
| `global.postgresql.auth.username`                          | Name for a custom user to create (overrides `auth.username`)                                                                  | `""`    |
| `global.postgresql.auth.password`                          | Password for the custom user to create (overrides `auth.password`)                                                            | `""`    |
| `global.postgresql.auth.database`                          | Name for a custom database to create (overrides `auth.database`)                                                              | `""`    |
| `global.postgresql.auth.secretKeys.adminPasswordKey`       | Name of key in existing secret to use for PostgreSQL credentials                                                              | `""`    |
| `global.postgresql.auth.secretKeys.userPasswordKey`        | Name of key in existing secret to use for PostgreSQL credentials                                                              | `""`    |
| `global.postgresql.service.ports.postgresql`               | PostgreSQL service port (overrides `service.ports.postgresql`)                                                                | `""`    |

### Common parameters

| Name                     | Description                                                                                  | Value           |
| ------------------------ | -------------------------------------------------------------------------------------------- | --------------- |
| `kubeVersion`            | Override Kubernetes version                                                                  | `""`            |
| `nameOverride`           | String to partially override common.names.fullname template (will maintain the release name) | `""`            |
| `fullnameOverride`       | String to fully override common.names.fullname template                                      | `""`            |
| `commonLabels`           | Add labels to all the deployed resources                                                     | `{}`            |
| `commonAnnotations`      | Add annotations to all the deployed resources                                                | `{}`            |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden)      | `false`         |

### PostgreSQL common parameters

| Name                                     | Description                                                                                                                                                                       | Value                        |
| ---------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------- |
| `image.registry`                         | PostgreSQL image registry                                                                                                                                                         | `REGISTRY_NAME`              |
| `image.repository`                       | PostgreSQL image repository                                                                                                                                                       | `REPOSITORY_NAME/postgresql` |
| `image.digest`                           | PostgreSQL image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag                                                                        | `""`                         |
| `image.pullPolicy`                       | PostgreSQL image pull policy                                                                                                                                                      | `IfNotPresent`               |
| `image.debug`                            | Specify if debug values should be set                                                                                                                                             | `false`                      |
| `auth.enablePostgresUser`                | Assign a password to the "postgres" admin user. Otherwise, remote access will be blocked for this user                                                                            | `true`                       |
| `auth.postgresPassword`                  | Password for the "postgres" admin user. Ignored if `auth.existingSecret` is provided                                                                                              | `""`                         |
| `auth.username`                          | Name for a custom user to create                                                                                                                                                  | `""`                         |
| `auth.password`                          | Password for the custom user to create. Ignored if `auth.existingSecret` is provided                                                                                              | `""`                         |
| `auth.database`                          | Name for a custom database to create                                                                                                                                              | `""`                         |
| `auth.secretKeys.adminPasswordKey`       | Name of key in existing secret to use for PostgreSQL credentials. Only used when `auth.existingSecret` is set.                                                                    | `postgres-password`          |
| `auth.secretKeys.userPasswordKey`        | Name of key in existing secret to use for PostgreSQL credentials. Only used when `auth.existingSecret` is set.                                                                    | `password`                   |
| `architecture`                           | PostgreSQL architecture (`standalone` or `replication`)                                                                                                                           | `standalone`                 |
| `containerPorts.postgresql`              | PostgreSQL container port                                                                                                                                                         | `5432`                       |
| `audit.logHostname`                      | Log client hostnames                                                                                                                                                              | `false`                      |
| `audit.logConnections`                   | Add client log-in operations to the log file                                                                                                                                      | `false`                      |
| `audit.logDisconnections`                | Add client log-outs operations to the log file                                                                                                                                    | `false`                      |
| `audit.pgAuditLogCatalog`                | Log catalog using pgAudit                                                                                                                                                         | `off`                        |
| `audit.clientMinMessages`                | Message log level to share with the user                                                                                                                                          | `error`                      |
| `ldap.enabled`                           | Enable LDAP support                                                                                                                                                               | `false`                      |
| `postgresqlDataDir`                      | PostgreSQL data dir folder                                                                                                                                                        | `/bitnami/postgresql/data`   |
| `postgresqlSharedPreloadLibraries`       | Shared preload libraries (comma-separated list)                                                                                                                                   | `pgaudit`                    |
| `shmVolume.enabled`                      | Enable emptyDir volume for /dev/shm for PostgreSQL pod(s)                                                                                                                         | `true`                       |
| `shmVolume.sizeLimit`                    | Set this to enable a size limit on the shm tmpfs                                                                                                                                  | `""`                         |
| `tls.enabled`                            | Enable TLS traffic support                                                                                                                                                        | `false`                      |

### PostgreSQL Primary parameters

| Name                                                                     | Description                                                                                                                          | Value                 |
| ------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------| --------------------- |
| `primary.name`                                                           | Name of the primary database (eg primary, master, leader, ...)                                                                       | `primary`             |
| `primary.livenessProbe.enabled`                                          | Enable livenessProbe on PostgreSQL Primary containers                                                                                | `true`                |
| `primary.livenessProbe.initialDelaySeconds`                              | Initial delay seconds for livenessProbe                                                                                              | `30`                  |
| `primary.livenessProbe.periodSeconds`                                    | Period seconds for livenessProbe                                                                                                     | `10`                  |
| `primary.livenessProbe.timeoutSeconds`                                   | Timeout seconds for livenessProbe                                                                                                    | `5`                   |
| `primary.livenessProbe.failureThreshold`                                 | Failure threshold for livenessProbe                                                                                                  | `6`                   |
| `primary.livenessProbe.successThreshold`                                 | Success threshold for livenessProbe                                                                                                  | `1`                   |
| `primary.readinessProbe.enabled`                                         | Enable readinessProbe on PostgreSQL Primary containers                                                                               | `true`                |
| `primary.readinessProbe.initialDelaySeconds`                             | Initial delay seconds for readinessProbe                                                                                             | `5`                   |
| `primary.readinessProbe.periodSeconds`                                   | Period seconds for readinessProbe                                                                                                    | `10`                  |
| `primary.readinessProbe.timeoutSeconds`                                  | Timeout seconds for readinessProbe                                                                                                   | `5`                   |
| `primary.readinessProbe.failureThreshold`                                | Failure threshold for readinessProbe                                                                                                 | `6`                   |
| `primary.readinessProbe.successThreshold`                                | Success threshold for readinessProbe                                                                                                 | `1`                   |
| `primary.resourcesPreset`                                                | Set container resources according to one common preset (allowed values: none, nano, micro, small, medium, large, xlarge, 2xlarge).   | `nano`                |
| `primary.resources`                                                      | Set container requests and limits for different resources like CPU or memory (essential for production workloads)                    | `{}`                  |
| `primary.podSecurityContext.enabled`                                     | Enable security context                                                                                                              | `true`                |
| `primary.podSecurityContext.fsGroupChangePolicy`                         | Set filesystem group change policy                                                                                                   | `Always`              |
| `primary.podSecurityContext.sysctls`                                     | Set kernel settings using the sysctl interface                                                                                       | `[]`                  |
| `primary.podSecurityContext.supplementalGroups`                          | Set filesystem extra groups                                                                                                          | `[]`                  |
| `primary.podSecurityContext.fsGroup`                                     | Group ID for the pod                                                                                                                 | `1001`                |
| `primary.containerSecurityContext.enabled`                               | Enabled containers' Security Context                                                                                                 | `true`                |
| `primary.containerSecurityContext.seLinuxOptions`                        | Set SELinux options in container                                                                                                     | `{}`                  |
| `primary.containerSecurityContext.runAsUser`                             | Set containers' Security Context runAsUser                                                                                           | `1001`                |
| `primary.containerSecurityContext.runAsGroup`                            | Set containers' Security Context runAsGroup                                                                                          | `1001`                |
| `primary.containerSecurityContext.runAsNonRoot`                          | Set container's Security Context runAsNonRoot                                                                                        | `true`                |
| `primary.containerSecurityContext.privileged`                            | Set container's Security Context privileged                                                                                          | `false`               |
| `primary.containerSecurityContext.readOnlyRootFilesystem`                | Set container's Security Context readOnlyRootFilesystem                                                                              | `true`                |
| `primary.containerSecurityContext.allowPrivilegeEscalation`              | Set container's Security Context allowPrivilegeEscalation                                                                            | `false`               |
| `primary.containerSecurityContext.capabilities.drop`                     | List of capabilities to be dropped                                                                                                   | `["ALL"]`             |
| `primary.containerSecurityContext.seccompProfile.type`                   | Set container's Security Context seccomp profile                                                                                     | `RuntimeDefault`      |
| `primary.automountServiceAccountToken`                                   | Mount Service Account token in pod                                                                                                   | `false`               |
| `primary.hostNetwork`                                                    | Specify if host network should be enabled for PostgreSQL pod (postgresql primary)                                                    | `false`               |
| `primary.hostIPC`                                                        | Specify if host IPC should be enabled for PostgreSQL pod (postgresql primary)                                                        | `false`               |
| `primary.labels`                                                         | Map of labels to add to the statefulset (postgresql primary)                                                                         | `{}`                  |
| `primary.podLabels`                                                      | Map of labels to add to the pods (postgresql primary)                                                                                | `{}`                  |
| `primary.podAnnotations`                                                 | Map of annotations to add to the pods (postgresql primary)                                                                           | `{}`                  |
| `primary.podAntiAffinityPreset`                                          | PostgreSQL primary pod anti-affinity preset. Ignored if `primary.affinity` is set. Allowed values: `soft` or `hard`                  | `soft`                |
| `primary.affinity`                                                       | Affinity for PostgreSQL primary pods assignment                                                                                      | `{}`                  |
| `primary.nodeSelector`                                                   | Node labels for PostgreSQL primary pods assignment                                                                                   | `{}`                  |
| `primary.tolerations`                                                    | Tolerations for PostgreSQL primary pods assignment                                                                                   | `[]`                  |
| `primary.updateStrategy.type`                                            | PostgreSQL Primary statefulset strategy type                                                                                         | `RollingUpdate`       |
| `primary.updateStrategy.rollingUpdate`                                   | PostgreSQL Primary statefulset rolling update configuration parameters                                                               | `{}`                  |
| `primary.pdb.create`                                                     | Enable/disable a Pod Disruption Budget creation                                                                                      | `true`                |
| `primary.pdb.minAvailable`                                               | Minimum number/percentage of pods that should remain scheduled                                                                       | `""`                  |
| `primary.pdb.maxUnavailable`                                             | Maximum number/percentage of pods that may be made unavailable.                                                                      | `""`                  |
| `primary.networkPolicy.enabled`                                          | Specifies whether a NetworkPolicy should be created                                                                                  | `true`                |
| `primary.service.type`                                                   | Kubernetes Service type                                                                                                              | `ClusterIP`           |
| `primary.service.ports.postgresql`                                       | PostgreSQL service port                                                                                                              | `5432`                |
| `primary.service.sessionAffinity`                                        | Session Affinity for Kubernetes service, can be "None" or "ClientIP"                                                                 | `None`                |
| `primary.service.headless.annotations`                                   | Additional custom annotations for headless PostgreSQL primary service                                                                | `{}`                  |
| `primary.persistence.enabled`                                            | Enable PostgreSQL Primary data persistence using PVC                                                                                 | `true`                |
| `primary.persistence.volumeName`                                         | Name to assign the volume                                                                                                            | `data`                |
| `primary.persistence.existingClaim`                                      | Name of an existing PVC to use                                                                                                       | `""`                  |
| `primary.persistence.mountPath`                                          | The path the volume will be mounted at                                                                                               | `/bitnami/postgresql` |
| `primary.persistence.storageClass`                                       | PVC Storage Class for PostgreSQL Primary data volume                                                                                 | `""`                  |
| `primary.persistence.accessModes`                                        | PVC Access Mode for PostgreSQL volume                                                                                                | `["ReadWriteOnce"]`   |
| `primary.persistence.size`                                               | PVC Storage Request for PostgreSQL volume                                                                                            | `8Gi`                 |
| `primary.persistence.annotations`                                        | Annotations for the PVC                                                                                                              | `{}`                  |
| `primary.persistence.labels`                                             | Labels for the PVC                                                                                                                   | `{}`                  |
| `primary.persistence.selector`                                           | Selector to match an existing Persistent Volume (this value is evaluated as a template)                                              | `{}`                  |
| `primary.persistence.dataSource`                                         | Custom PVC data source                                                                                                               | `{}`                  |
| `primary.persistence.dynamicVolumeProvisioning.enabled`                  | Enable Dynamic Volume Provisioning                                                                                                   | `false`               |
| `primary.persistence.dynamicVolumeProvisioning.pvName`                   | Persistenct Volume Name                                                                                                              | `""`                  |
| `primary.persistence.dynamicVolumeProvisioning.pvcName`                  | Persistenct Volume Claim Name                                                                                                        | `""`                  |
| `primary.persistence.dynamicVolumeProvisioning.localPath`                | Specify the file system path for storage                                                                                             | `""`                  |
| `primary.persistence.dynamicVolumeProvisioning.nodeAffinity.key`         | The node lable key used for node affinity                                                                                            | `""`                  |
| `primary.persistence.dynamicVolumeProvisioning.nodeAffinitye.value`      | The node lable value used for node affinity                                                                                          | `""`                  |


### Other Parameters

| Name                                          | Description                                                                                                                                 | Value   |
| --------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `serviceAccount.create`                       | Enable creation of ServiceAccount for PostgreSQL pod                                                                                        | `true`  |
| `serviceAccount.name`                         | The name of the ServiceAccount to use.                                                                                                      | `""`    |
| `serviceAccount.automountServiceAccountToken` | Allows auto mount of ServiceAccountToken on the serviceAccount created                                                                      | `false` |
| `serviceAccount.annotations`                  | Additional custom annotations for the ServiceAccount                                                                                        | `{}`    |