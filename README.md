<div align="center">
  
  <h1 align="center">Install OpenNebula on Ubuntu</h1>

</div>
## Why OpenNebula?
OpenNebula combines existing virtualization technologies like KVM and VMware with advanced features for multi-tenancy, automatic provisioning, and elasticity. Its aim is to make cloud management simple. It can be compared with other cloud management platforms like OpenStack and CloudStack.

---

## OpenNebula Components
OpenNebula has two main components:
- **OpenNebula Front-end**: The management engine that executes the OpenNebula services.
- **OpenNebula Hypervisor Nodes**: Hypervisors providing the resources needed by the VMs.

### Minimum Recommended Specs for Front-end
| Resource       | Minimum Recommended Configuration |
|----------------|------------------------------------|
| Memory         | 2 GB                              |
| CPU            | 1 CPU (2 cores)                   |
| Disk Size      | 100 GB                            |
| Network        | 2 NICs                            |

The OpenNebula Front-end machine needs network connectivity to all hosts and possibly access to the storage Datastores. The base installation takes less than 150 MB.

---

## Installation Steps

### Step 1: Add OpenNebula and Debian Repositories
Import the repository key and add the OpenNebula repository:

```bash
wget -q -O- https://downloads.opennebula.org/repo/repo.key | sudo apt-key add -
echo "deb https://downloads.opennebula.org/repo/6.1/Ubuntu/20.04 stable opennebula" | sudo tee /etc/apt/sources.list.d/opennebula.list