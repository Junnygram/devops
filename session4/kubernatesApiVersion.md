
### 1. **Core API Group (v1)**
   - **Resources**: Pods, Services, ConfigMaps, Secrets, PersistentVolumes (PVs), PersistentVolumeClaims (PVCs), Namespaces, etc.
   - **Example**: `apiVersion: v1`

### 2. **apps/v1**
   - **Resources**: Deployments, StatefulSets, DaemonSets, ReplicaSets.
   - **Example**: `apiVersion: apps/v1`

### 3. **batch/v1**
   - **Resources**: Jobs, CronJobs.
   - **Example**: `apiVersion: batch/v1`

### 4. **autoscaling/v1, autoscaling/v2**
   - **Resources**: HorizontalPodAutoscalers (HPA).
   - **Example**: `apiVersion: autoscaling/v2`

### 5. **networking.k8s.io/v1**
   - **Resources**: Ingress, NetworkPolicy.
   - **Example**: `apiVersion: networking.k8s.io/v1`

### 6. **policy/v1**
   - **Resources**: PodDisruptionBudgets.
   - **Example**: `apiVersion: policy/v1`

### 7. **rbac.authorization.k8s.io/v1**
   - **Resources**: Roles, RoleBindings, ClusterRoles, ClusterRoleBindings.
   - **Example**: `apiVersion: rbac.authorization.k8s.io/v1`

### 8. **storage.k8s.io/v1**
   - **Resources**: StorageClasses, VolumeAttachments, CSI drivers.
   - **Example**: `apiVersion: storage.k8s.io/v1`

### 9. **admissionregistration.k8s.io/v1**
   - **Resources**: MutatingWebhookConfigurations, ValidatingWebhookConfigurations.
   - **Example**: `apiVersion: admissionregistration.k8s.io/v1`

### 10. **apiextensions.k8s.io/v1**
   - **Resources**: CustomResourceDefinitions (CRDs).
   - **Example**: `apiVersion: apiextensions.k8s.io/v1`

### 11. **certificates.k8s.io/v1**
   - **Resources**: CertificateSigningRequests.
   - **Example**: `apiVersion: certificates.k8s.io/v1`

### 12. **coordination.k8s.io/v1**
   - **Resources**: Leases (used in leader election).
   - **Example**: `apiVersion: coordination.k8s.io/v1`

### 13. **events.k8s.io/v1**
   - **Resources**: Events (a newer version of the original Event resource in `v1`).
   - **Example**: `apiVersion: events.k8s.io/v1`

### 14. **discovery.k8s.io/v1**
   - **Resources**: EndpointSlices.
   - **Example**: `apiVersion: discovery.k8s.io/v1`

### 15. **node.k8s.io/v1**
   - **Resources**: RuntimeClasses.
   - **Example**: `apiVersion: node.k8s.io/v1`

### 16. **scheduling.k8s.io/v1**
   - **Resources**: PriorityClasses.
   - **Example**: `apiVersion: scheduling.k8s.io/v1`

### 17. **flowcontrol.apiserver.k8s.io/v1beta1**
   - **Resources**: FlowSchemas, PriorityLevelConfigurations (used for API request flow control).
   - **Example**: `apiVersion: flowcontrol.apiserver.k8s.io/v1beta1`

### 18. **metrics.k8s.io/v1beta1**
   - **Resources**: ResourceMetrics (used by metrics server).
   - **Example**: `apiVersion: metrics.k8s.io/v1beta1`

