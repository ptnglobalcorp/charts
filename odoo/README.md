# Odoo Chart [Support with Static Volume Provisioning]

## TL;DR

```console
helm install <release-name> oci://registry-1.docker.io/ptnglobalcorp/odoo
```

## Parameters

### Common parameters

| Name                     | Description                                                                                          | Value                  |
| ------------------------ | ---------------------------------------------------------------------------------------------------- | ---------------------- |
| `kubeVersion`            | Override Kubernetes version                                                                          | `""`                   |
| `nameOverride`           | String to partially override common.names.fullname                                                   | `""`                   |
| `fullnameOverride`       | String to fully override common.names.fullname                                                       | `""`                   |
| `commonLabels`           | Labels to add to all deployed objects                                                                | `{}`                   |
| `commonAnnotations`      | Annotations to add to all deployed objects                                                           | `{}`                   |
| `diagnosticMode.enabled` | Enable diagnostic mode (all probes will be disabled and the command will be overridden)              | `false`                |
| `image.registry`         | Odoo image registry                                                                                  | `REGISTRY_NAME`        |
| `image.repository`       | Odoo image repository                                                                                | `REPOSITORY_NAME/odoo` |
| `image.digest`           | Odoo image digest in the way sha256:aa.... Please note this parameter, if set, will override the tag | `""`                   |
| `image.pullPolicy`       | Odoo image pull policy                                                                               | `IfNotPresent`         |
| `image.debug`            | Enable image debug mode                                                                              | `false`                |

### Odoo Configuration parameters

| Name                    | Description                                                          | Value              |
| ----------------------- | -------------------------------------------------------------------- | ------------------ |
| `odooEmail`             | Odoo user email                                                      | `user@example.com` |
| `odooPassword`          | Odoo user password                                                   | `""`               |
| `odooSkipInstall`       | Skip Odoo installation wizard                                        | `false`            |
| `loadDemoData`          | Whether to load demo data for all modules during initialization      | `false`            |
| `allowEmptyPassword`    | Allow the container to be started with blank passwords               | `false`            |

### Odoo Deployment parameters

| Name                                                | Description                                                                                                                          | Value                                                              |
| --------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------| ------------------------------------------------------------------ |
| `replicaCount`                                      | Number of Odoo replicas to deploy                                                                                                 	 | `1`                                                                |
| `containerPorts.http`                               | Odoo HTTP container port                                                                                                             | `8069`                                                             |
| `extraContainerPorts`                               | Optionally specify extra list of additional ports for Odoo container(s)                                                              | `[]`                                                               |
| `resourcesPreset`                                   | Set container resources according to one common preset (allowed values: none, nano, micro, small, medium, large, xlarge, 2xlarge)	 | `large`                                                            |
| `resources`                                         | Set container requests and limits for different resources like CPU or memory (essential for production workloads)                    | `{}`                                                               |
| `podSecurityContext.enabled`                        | Enabled Odoo pods' Security Context                                                                                                  | `true`                                                             |
| `podSecurityContext.fsGroupChangePolicy`            | Set filesystem group change policy                                                                                                   | `Always`                                                           |
| `podSecurityContext.sysctls`                        | Set kernel settings using the sysctl interface                                                                                       | `[]`                                                               |
| `podSecurityContext.supplementalGroups`             | Set filesystem extra groups                                                                                                          | `[]`                                                               |
| `podSecurityContext.fsGroup`                        | Set Odoo pod's Security Context fsGroup                                                                                              | `0`                                                                |
| `containerSecurityContext.enabled`                  | Enabled containers' Security Context                                                                                                 | `true`                                                             |
| `containerSecurityContext.seLinuxOptions`           | Set SELinux options in container                                                                                                     | `{}`                                                               |
| `containerSecurityContext.runAsUser`                | Set containers' Security Context runAsUser                                                                                           | `0`                                                                |
| `containerSecurityContext.runAsGroup`               | Set containers' Security Context runAsGroup                                                                                          | `0`                                                                |
| `containerSecurityContext.runAsNonRoot`             | Set container's Security Context runAsNonRoot                                                                                        | `false`                                                            |
| `containerSecurityContext.privileged`               | Set container's Security Context privileged                                                                                          | `false`                                                            |
| `containerSecurityContext.readOnlyRootFilesystem`   | Set container's Security Context readOnlyRootFilesystem                                                                              | `false`                                                            |
| `containerSecurityContext.allowPrivilegeEscalation` | Set container's Security Context allowPrivilegeEscalation                                                                            | `false`                                                            |
| `containerSecurityContext.capabilities.add`         | List of capabilities to be added                                                                                                     | `["CHOWN","FOWNER","SYS_CHROOT","SETGID","SETUID","DAC_OVERRIDE"]` |
| `containerSecurityContext.capabilities.drop`        | List of capabilities to be dropped                                                                                                   | `["ALL"]`                                                          |
| `containerSecurityContext.seccompProfile.type`      | Set container's Security Context seccomp profile                                                                                     | `RuntimeDefault`                                                   |
| `livenessProbe.enabled`                             | Enable livenessProbe                                                                                                                 | `true`                                                             |
| `livenessProbe.initialDelaySeconds`                 | Initial delay seconds for livenessProbe                                                                                              | `600`                                                              |
| `livenessProbe.periodSeconds`                       | Period seconds for livenessProbe                                                                                                     | `30`                                                               |
| `livenessProbe.timeoutSeconds`                      | Timeout seconds for livenessProbe                                                                                                    | `5`                                                                |
| `livenessProbe.failureThreshold`                    | Failure threshold for livenessProbe                                                                                                  | `6`                                                                |
| `livenessProbe.successThreshold`                    | Success threshold for livenessProbe                                                                                                  | `1`                                                                |
| `readinessProbe.enabled`                            | Enable readinessProbe                                                                                                                | `true`                                                             |
| `readinessProbe.path`                               | Path to check for readinessProbe                                                                                                     | `/web/health`                                                      |
| `readinessProbe.initialDelaySeconds`                | Initial delay seconds for readinessProbe                                                                                             | `30`                                                               |
| `readinessProbe.periodSeconds`                      | Period seconds for readinessProbe                                                                                                    | `10`                                                               |
| `readinessProbe.timeoutSeconds`                     | Timeout seconds for readinessProbe                                                                                                   | `5`                                                                |
| `readinessProbe.failureThreshold`                   | Failure threshold for readinessProbe                                                                                                 | `12`                                                               |
| `readinessProbe.successThreshold`                   | Success threshold for readinessProbe                                                                                                 | `1`                                                                |
| `automountServiceAccountToken`                      | Mount Service Account token in pod                                                            										 |`false`															  |
| `podLabels`                                         | Extra labels for Odoo pods                                                                                                           | `{}`                                                               |
| `podAnnotations`                                    | Annotations for Odoo pods                                                                                                            | `{}`                                                               |
| `podAntiAffinityPreset`                             | Pod anti-affinity preset. Ignored if `affinity` is set. Allowed values: `soft` or `hard`                                             | `soft`                                                             |
| `affinity`                                          | Affinity for pod assignment                                                                                                          | `{}`                                                               |
| `nodeSelector`                                      | Node labels for pod assignment                                                                                                       | `{}`                                                               |
| `tolerations`                                       | Tolerations for pod assignment                                                                                                       | `[]`                                                               |
| `updateStrategy.type`                               | Odoo deployment strategy type                                                                                                        | `RollingUpdate`                                                    |
| `updateStrategy.rollingUpdate`                      | Odoo deployment rolling update configuration parameters                                                                              | `nil`                                                              |

### Persistence Parameters

| Name                                                             | Description                                                                                                                                          | Value            |
| ---------------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------- |
| `persistence.enabled`                                            | Enable persistence using Persistent Volume Claims                                                                                                    | `true`           |
| `persistence.resourcePolicy`                                     | Setting it to "keep" to avoid removing PVCs during a helm delete operation. Leaving it empty will delete PVCs after the chart deleted                | `""`             |
| `persistence.storageClass`                                       | Persistent Volume storage class                                                                                                                      | `""`             |
| `persistence.accessModes`                                        | Persistent Volume access modes                                                                                                                       | `[]`             |
| `persistence.accessMode`                                         | Persistent Volume access mode (DEPRECATED: use `persistence.accessModes` instead)                                                                    | `ReadWriteOnce`  |
| `persistence.size`                                               | Persistent Volume size                                                                                                                               | `10Gi`           |
| `persistence.dataSource`                                         | Custom PVC data source                                                                                                                               | `{}`             |
| `persistence.annotations`                                        | Annotations for the PVC                                                                                                                              | `{}`             |
| `persistence.selector`                                           | Selector to match an existing Persistent Volume (this value is evaluated as a template)                                                              | `{}`             |
| `persistence.existingClaim`                                      | The name of an existing PVC to use for persistence                                                                                                   | `""`             |
| `persistence.dynamicVolumeProvisioning.enabled`                  | Enable Dynamic Volume Provisioning                                                                                                                   | `false`          |
| `persistence.dynamicVolumeProvisioning.pvName`                   | Persistenct Volume Name                                                                                                                              | `""`             |
| `persistence.dynamicVolumeProvisioning.pvcName`                  | Persistenct Volume Claim Name                                                                                                                        | `""`             |
| `persistence.dynamicVolumeProvisioning.localPath`                | Specify the file system path for storage                                                                                                             | `""`             |
| `persistence.dynamicVolumeProvisioning.nodeAffinity.key`         | The node lable key used for node affinity                                                                                                            | `""`             |
| `persistence.dynamicVolumeProvisioning.nodeAffinitye.value`      | The node lable value used for node affinity                                                                                                          | `""`             |


### RBAC Parameters

| Name                                          | Description                                                                                              | Value   |
| --------------------------------------------- | -------------------------------------------------------------------------------------------------------- | ------- |
| `serviceAccount.create`                       | Specifies whether a ServiceAccount should be created                                                     | `true`  |
| `serviceAccount.name`                         | The name of the ServiceAccount to create (name generated using common.names.fullname template otherwise) | `""`    |
| `serviceAccount.automountServiceAccountToken` | Auto-mount the service account token in the pod                                                          | `false` |
| `serviceAccount.annotations`                  | Additional custom annotations for the ServiceAccount                                                     | `{}`    |

### Other Parameters

| Name                       | Description                                                                                                                                    | Value   |
| -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------- | ------- |
| `pdb.create`               | Enable a Pod Disruption Budget creation                                                                                                        | `true`  |
| `pdb.minAvailable`         | Minimum number/percentage of pods that should remain scheduled                                                                                 | `""`    |
| `pdb.maxUnavailable`       | Maximum number/percentage of pods that may be made unavailable. Defaults to `1` if both `pdb.minAvailable` and `pdb.maxUnavailable` are empty. | `""`    |
| `autoscaling.enabled`      | Enable Horizontal POD autoscaling for Odoo                                                                                                     | `false` |

### Database Parameters

| Name                                                 | Description                                                              | Value          |
| ---------------------------------------------------- | ------------------------------------------------------------------------ | -------------- |
| `postgresql.enabled`                                 | Switch to enable or disable the PostgreSQL helm chart                    | `true`         |
| `postgresql.auth.username`                           | Name for a custom user to create                                         | `bn_odoo`      |
| `postgresql.auth.password`                           | Password for the custom user to create                                   | `""`           |
| `postgresql.auth.database`                           | Name for a custom database to create                                     | `bitnami_odoo` |
| `postgresql.architecture`                            | PostgreSQL architecture (`standalone` or `replication`)                  | `standalone`   |
| `externalDatabase.host`                              | Database host                                                            | `""`           |
| `externalDatabase.port`                              | Database port number                                                     | `5432`         |
| `externalDatabase.user`                              | Non-root username for Odoo                                               | `bn_odoo`      |
| `externalDatabase.password`                          | Password for the non-root username for Odoo                              | `""`           |
| `externalDatabase.database`                          | Odoo database name                                                       | `bitnami_odoo` |
| `externalDatabase.create`                            | Enable PostgreSQL user and database creation (when using an external db) | `true`         |
| `externalDatabase.postgresqlPostgresUser`            | External Database admin username                                         | `postgres`     |
| `externalDatabase.postgresqlPostgresPassword`        | External Database admin password                                         | `""`           |
| `externalDatabase.existingSecret`                    | Name of an existing secret resource containing the database credentials  | `""`           |
| `externalDatabase.existingSecretPasswordKey`         | Name of an existing secret key containing the non-root credentials       | `""`           |
| `externalDatabase.existingSecretPostgresPasswordKey` | Name of an existing secret key containing the admin credentials          | `""`           |

### NetworkPolicy parameters

| Name                                    | Description                                                     | Value  |
| --------------------------------------- | --------------------------------------------------------------- | ------ |
| `networkPolicy.enabled`                 | Specifies whether a NetworkPolicy should be created             | `true` |