## 🛠️ What is IaC (Infrastructure as Code)

Infrastructure as Code (IaC) is managing and provisioning infrastructure through machine-readable configuration files.

---

## 🌍 What is Terraform

- Terraform is an Infrastructure as Code tool that lets you build, change, and version infrastructure safely and effectively.
- Infrastructure automation tool.
- Open source by HashiCorp, written in Go.
- Allows infrastructure creation with code.
- Offers CLI tool and Terraform Cloud to store modules privately.
- Uses Hashicorp Configuration Tool

---

## ✅ Advantages of Terraform

- Write, deploy, and destroy infrastructure as code.
- Version Control.
- Consistent environments (Dev, QA, Prod, UAT, Pre-Prod).
- Supports CRUD operations.
- Inventory Management.
- Cost Optimization.
- Dependency Management.
- DRY Principle with Modules.
- Declarative scripting approach.

---

## 📦 Variables and Outputs

### 🔹 Variables
- Serve as parameters for Terraform Configuration and Terraform modules.
- Allow customization without editing source code.
- User Data to upload any data 
- Files function to Upload script
- Provisioners: file provisioner etc..

### 🔹 Outputs
- Return values from a module.
- terrafom output -o json

### 🔹 Local Values
- Used to assign short names to complex or repeated expressions.
- we can use functions inside the local block

## Functions:
- we can use functions inside the modules,resources,outputs, locals.

---

## 📁 Terragrunt

- A thin wrapper for Terraform.
- Adds support for managing multiple modules, remote state, and locking.

---

## 🔤 Expressions

### 🔸 Version Constraints
- Example: `version = ">=1.2.0, <2.0.0"`
- Operators: `=`, `!=`, `>`, `<`, `>=`, `<=`

### 🔸 Dynamic Blocks
- Used for nested block creation dynamically.

---

## 🧮 Functions

- `file()` – Read content from a local file.
- `split()` – Split strings based on delimiter.
- `element(list, index)` – Get single element from list.
- `slice(list, start, end)` – Select part of a list.
- `length()` – Get size of a list.
- `lookup(map, key)` – Fetch value for a key in a map.
- `urlencode(string)` – Apply URL encoding.
- `merge()` – Merge variables/maps.
- `min()`, `max()` – Get min/max value.
- `base64encode()`, `base64decode()`
- `concat()` – Combine multiple lists.
- `contains(list, value)` – Check for value existence.
- `base64decode()` 

---

## 🧾 HashiCorp Configuration Language (HCL)

- **Variable Types**: `string`, `bool`, `number`, `map`, `list`,`null`
- Loops
- Locals
- Data Types
- Functions
- Modules
- Expressions

---

## ❓ Why Terraform

- Works on the principle of API as code.
- Interacts with low-level APIs.
- Supports multiple cloud providers (hybrid cloud).
- Written in Go.
- Uses HCL or JSON format.

---

## ⚙️ Essential Aspects of Terraform

- Console to validate functions.
- Interpolation support.
- `module count` tracks the number of provisioned resources.

---

## 🧩 Terraform Modules

- Logical grouping of Terraform resources.
- Supports multi-env and multi-team use.
- Commonly reused components defined once.

---

## 📂 Terraform State File

- Tracks managed resources.
- Maintains a record of created resources.

---

## 🪟 What is Terraform D

- A Windows plugin used by Terraform.
- `terraform init` looks for it in the plugin directory.

---

## 🔄 Null Resource: 

- Executes local scripts (e.g., using `local-exec`).
- Doesnt create actual infrastructure but is useful for provisioning steps.

---

## 🧑‍💻 Most Common CLI Commands

- `terraform init`
- `terraform validate`
- `terraform fmt`
- `terraform plan`
- `terraform apply`
- `terraform destroy`
- `terraform destroy --target="resource_name"`
- `terraform refresh`
- `terraform output`
- `terraform graph`

---

## 🗂️ Terraform Backend

- Backend is where the state file is stored.
- Commonly stored in cloud for team collaboration and locking.

---

## 🛰️ Terraform Remote Backend

- Stores state file in shared cloud location.
- Enables state file locking to avoid conflicts during deployments.
- 

---

## 🔐 Handling Secrets in Terraform

- Environment Variables.
- HashiCorp Vault.
- AWS SSM Parameter Store.
- Use `sensitive = true`.
- Secure remote backends + strict IAM policies.
- data block is used to retrieve secrets and output block is used to use those in configs
- 
---

## 🔗 Terraform Resource Graph

- A dependency graph that shows resource relationships.

---

## 🔒 Terraform State Locking

- Prevents concurrent modifications.
- Commonly implemented with DynamoDB.

---

## ❗ Taint Terraform Resource

- Marks a resource as needing replacement.
- Will be recreated during next apply.
- when you want to recreate or destrou

## 🔁 Terraform State Rollback

- Used to revert to a previous known state.
- Helpful during failures or misconfigurations in deployments.

---

## ⬆️ How to Upgrade Plugins in Terraform

``` terraform init -upgrade ```
- Downloads and upgrades modules/plugins to the newest acceptable version.

---

## 🔗 Sharing Outputs Between Modules

1. **Module 1 (Providing Outputs)**:  
   - Creates resources and defines outputs using `output` blocks.
2. **Module 2 (Consuming Outputs)**:  
   - Uses `module.module1_name.output_name` to consume the output and create dependent resources.

---

## Terraform Architecture Components

- **Sub-Graphs**
- **Evaluation of Expressions**
- **Evaluation of Vertex**
- **Walk the Graph** (builds dependency graph and executes in order)

---

## 📉 What is a Resource Graph

- Visual representation of Terraform-managed infrastructure.
- Helps manage dependencies and parallelism in resource creation.

---

## 🔐 Sentinel Policies Use Cases

- Enforce resource ownership.
- Restrict provider roles.
- Audit Terraform Cloud operations.
- Control usage of certain services or data sources.

### 🎚️ Degrees of Sentinel Policing

1: Advisory  
2: Soft Mandatory  
3: Hard Mandatory

---

## 📁 What is Terragrunt (Recap)

- Thin wrapper for Terraform.
- Simplifies managing multiple modules and remote state.
- Implements DRY principle.

### Use Cases:

1: Managing multiple AWS accounts.
2: Managing infrastructure in different modules.
3: DRY and reusable configurations.

---

## 🔒 State File Locking

- Prevents simultaneous modifications to the same state file.
- Usually implemented via remote backend with state locking (e.g., DynamoDB in AWS).

---

## 🚀 How to Deploy Infra with Terraform

1. Write configuration (`.tf` files).
2. Initialize: `terraform init`
3. Validate: `terraform validate`
4. Plan: `terraform plan`
5. Apply: `terraform apply`

---

## ⚠️ Problems with Terraform

- No native API—relies on provider APIs.
- State File Challenges:
  - Can become monolithic.
  - Requires locking.
  - Cannot update only a part of infra directly.

---

## 🌱 Passing Environment Variables in Terraform

```export TF_VAR_example_var="custom_value" ```

---

## 🔐 Sensitive Variable Output

- Variables marked with `sensitive = true` will not show in CLI output (e.g., `terraform apply`).

---

## 📋 List Created Resources

``` terraform state list ```

---

## 🔢 Count Resources Example

```
output "number_of_resources" {
  value = length(aws_instance.example)
}
```

---

### What is a Null Resource?

- A resource that performs an action but doesn't create infrastructure.

### Use Cases:

1. Execute local scripts using `local-exec`.
2. Call external APIs.
3. Run custom logic during apply lifecycle.

---

## ✅ Terraform Validate Command

- Checks for syntax and internal consistency.

``` terraform validate ```

---

## 🔄 Create Resources Using Loops

### Method 1: Using `count`

```
count = 2
var.name[count.index]
```

### Method 2: Using `for_each`

```hcl
variable "sub" {
  type = set(string)
  default = ["10.1.0.0/24", "10.2.0.0/24"]
}

resource "aws_subnet" "example" {
  for_each = var.sub
  cidr_block = each.value
}
```

---

## ❓ Create Resources Conditionally (ternary operator)

``` count = var.env == "dev" ? 1 : 0 ```

---

### What are Data Sources?

- Allow Terraform to fetch and reference existing data/infrastructure.

### Example: AWS AMI

```
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
```

### Example: Vault Secrets

```
data "vault_generic_secrets" "database" {
  path = "secret/data/database"
}

resource "aws_db_instance" "example" {
  username = data.vault_generic_secrets.database.data["username"]
  password = data.vault_generic_secrets.database.data["password"]
}
```

---

## 🔐 Sensitive Variable Example

```
variable "example_password" {
  type        = string
  description = "A Sensitive Variable"
  sensitive   = true
}
```

## What are local Variable: These are type of Variable where we cannot

## How to Delete particular resources in terraform: 
- `1: terraform destroy -target=resource.name`

## what resources can be Set variables in with VPC,AutoScaling, LoadBalancer:
- AWS VPC : CIDR as Variable
- AutoScaling: desired_capacity as Variable
- LoadBalancer: LoadBalancer name as variable

## How to provide variable at cli:
When declaring variables at tf vars don't pass any default value then it will ask user to enter

## Terraform Modules:
Used for Bigger project for consistency
module_name/
  ├── main.tf
  ├── variables.tf
  ├── outputs.tf
  └── README.md (optional)

1: Reusability
2: Abstraction
3: Maintainability
4: Versioning
5: Collaboration

## Organization Standards to use terraform:

- 1: Directory Structure : Root Directory
/my_terraform_project
  ├── main.tf
  ├── variables.tf
  ├── outputs.tf # Shows Values required in terminal
  ├── terraform.tfvars #Variable values for each environment.
  ├── provider.tf
  ├── modules/
  ├── environments/
  └── README.md
- 2: Use of Modules
- 3: Variables, inputs, Locals
- 4: Outputs and Documentation
- 5: State Management remote backend
- 6: Naming Conventions : projectname_resource
- 7: Providers and Authentication
- 8: Code Review and Collaboration
- 9: Continuous integration and Continuous Deployment
- 10: Security Considerations
- 11: Logging and Monitoring

## VPC ,EC2,Cloud Trail,IAM
- 1: IAM Will Create
- 2: VPC
- 3: EC2
- 4: Cloud Trail

Import Command:

import {
  to = aws_iot_thing.bar
  id = "foo"
}

terraform plan -generate-config-out=generated.tf

```
Drawbacks of terraform:
1: Error Handling
2: Json and HCL

Terraform Version: 1.5
Hashicorp AWS Version: 5.8.0

Now Terraform Version: 1.7 or 1.8
Now HashiCorp Version: 5.34.0
```

# How to Manage Secrets in Terraform:

1: Use sensitive keyword in variables section
2: Use AWS SSM Parameters --> Data sources
3: Use Hashi-Corp Vault --> using data sources
4: Environment Variables --> /tmp/password.txt
5: Pass Variables in .tfvars

Using Data Sources We Can leverage the automation for Secrets Management

### 1: Using Variables files

variable "database_password" {
  type        = string
  sensitive   = true
  description = "Password for the database"
}

### 2: AWS Systems Manager Parameters Store or Secrets Manager:

retrieve sensitive information such as passwords, API keys, or other credentials

data "aws_ssm_parameter" "database_password" {
  name = "/myapp/database_password"
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Database Password: ${data.aws_ssm_parameter.database_password.value}" > /tmp/password.txt
              EOF
}

### 3: External Secrets Management: Hashi-Corp Vault

provider "vault" {
  address = "https://vault.example.com:8200"
  token   = "your_vault_token"
}

data "vault_generic_secret" "database_credentials" {
  path = "secret/myapp/database"
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Database Username: ${data.vault_generic_secret.database_credentials.data["username"]}" > /tmp/username.txt
              echo "Database Password: ${data.vault_generic_secret.database_credentials.data["password"]}" > /tmp/password.txt
              EOF
}

### 4: Using Environment Variables:

variable "database_password" {
  type = string
}

resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "Database Password: $DATABASE_PASSWORD" > /tmp/password.txt
              EOF
}

###  You have a Parent Module and Child Module :
- Using terraform workspaces
- Terraform is platform agnostic
- 1: terraform workspace new dev
- 2: terraform workspace select dev
- 3: Modules
- 4: terraform apply -var-file=dev.tfvars

###  Scenarios:
- End To End Terraform Flow
- 1: First Write Tf files
- 2: Terraform init
- 3: Terraform validate
- 4: Terraform plan
- 5: Terraform fmt --> Write Canonical Form mostly used in Import

### One Particular Resource needs to be recreated :
- 1: Using terraform taint we can create a particular resource in next apply command

### Terraform taint
- is command used to represent that particular resource is degraded or upgraded or damaged need to be replaced in next apply

- 1: Terraform state list
- 2: terraform taint "resources_name"
- 3: terraform apply
- terraform taint and untaint
- terraform taint is deprecated instead we use
- terraform apply --replace=<resource-name>

# One Particular resource needs to be deleted:

terraform destroy -target=aws_instance.my_instance

# Explain the various types of meta-arguments:

- Meta arguments: changes the default behaviors of terraform configuration

- 1: depends_on[list of resources]
- 2: count
- 3: for_each
- 4: provider
```
provider "aws" {
  alias  = "europe"
  region = "europe-west1"
}
resource "aws" "name" {
  provider = aws.europe
}
```
```
5: lifecycle -- > create_before_destroy
lifecycle {
    create_before_destroy = true
    ignore_changes = [tags["Name"],]
    prevent_destroy =
    replace_triggered_by = [aws_ecs_service.svc.id]
  }
```
# Who Created terraform.tfstate.backup file
terraform destroy command will create the backup file
it is because that to restore the infra to the same state

# Force Unlock --> Manually delete lock on terraform file
terraform apply --force-unlock

# Terraform Refresh
1: When ever there is a mismatch in terraform statefile we run this command

# Interview Session - 1:

### Components used in creating the terraform:
- 1: VPC
- 2: Subnets
- 3: s3
- 4: IAM
- 5: Kubernetes
- 6: VMs

### How to do changes in the already created configuration :

```
Using " Terraform import " command we can do changes which are already created.

State file is get and stored:
Locally or Remote Backend

If we loose state file:  There is no way to get back so we need to lock and save it in Storage

Terraform Validate: used to validate the syntax
Terraform fmt
```

### Types of Modules in terraform:

- 1: Root Module: Main Module to be called with all configurations
- 2: Child Module: called with in the root module and get created based on the structure
- 3: Module Sources: Modules can be sourced from various locations.

### Remote Backend: Used for Locking and storing

```
How to pass variable over run time:
variable.tf
variable "aws" {
  type = string
}
```
### How to Manage Modules in Multiple Environments: using terraform workspace
```
- Traditional IT Infra:
- 1: Slow Deployment
- 2: Expensive
- 3: Limited Automation
- 4: Human Error
- 5: Wasted Resources
- 6: Inconsistency
```

### Terraform Providers:
```
Terraform Provider is a Plugin that lets terraform managers an external api
when we run terraform init plugin required for the provider are automatically downloaded and saved locally
```

### Resource Block :
```
Describe one or more infrastructure objects
Hashi-Corp Maintained: No need Required Providers section
Non Hashi-Corp Maintained: Need to provide required_providers Section

```
```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.22.12"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "resource_name" {
  ami = "ami_id"
  instance_type="t2.micro"
}
```
```
How to debug and troubleshoot the terraform:
1: terraform init and terraform debug
2: terraform init
3: terraform validate
4: terraform fmt
5: terraform plan -debug (enable debug output gives detailed info about the terraform doing)
6: terraform state (terraform show)
7: increase verbosity using trace command
TF_LOG=TRACE terraform plan
8: to check the function issues we use terraform console
9: terraform init -upgrade
```

### Terraform fmt:
```
document some commonly accepted formatting guidelines for terraform code these conventions can e enforced automatically with terraform fmt
```

### Configuration Syntax in terraform:
```
1: Arguments key value pairs
2: Blocks are used to mention resources
3: identifiers = terraform specific constructs like resources,input variables,etc .. are all identifiers
4: Comments
```
### Terraform Cloud:
```

1: Manages StateFiles in Terraform Cloud
2: Store Variables
Write some Code for Providers:
```hcl
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.22.0"
    }
  }
}
provider "aws" {
  alias = "us-east"
  region = "us-east-1"
}

resource "aws_instance" "Jenkins" {
  ami = "ami_id"
  instance_type = "t2.micro"
  security_groups =
  key_pair =
}
```

### Locals
```hcl
locals {
  environment_name = "production"
}
```

### Data Sources
```hcl
data "aws_ami" "latest_amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}
```

### Variables
```hcl
variable "region" {
  type    = string
  default = "us-west-2"
}

variable "instance_types" {
  type    = list(string)
  default = ["t2.micro", "t2.small", "t2.medium"]
}
```

### Life Cycle
```hcl
resource "aws_instance" "ec2_instances" {
  count         = length(var.instance_types)
  instance_type = var.instance_types[count.index]
  ami           = data.aws_ami.latest_amazon_linux.id
  tags          = local.tags

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
  }
}
```

### For Loop Example
```hcl
resource "aws_s3_bucket" "example_buckets" {
  count         = 3
  bucket        = "example-bucket-${count.index}"
  acl           = "private"
  force_destroy = true
}
```

### For Each Loop Example
```hcl
variable "vpc_cidrs" {
  type    = map(string)
  default = {
    "us-west-1" = "10.0.0.0/16"
    "us-east-1" = "10.1.0.0/16"
    "eu-west-1" = "10.2.0.0/16"
  }
}
resource "aws_vpc" "vpcs" {
  for_each = var.vpc_cidrs

  cidr_block = each.value
  tags       = {
    Name = "VPC-${each.key}"
  }
}
```

### Dynamic Block Example
```hcl
variable "additional_tags" {
  type = map(string)
  default = {
    app = "web"
    env = "prod"
  }
}
```

### Condition Example
```hcl
resource "aws_security_group" "example_sg" {
  name        = "example_sg"
  description = "Example Security Group"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.region == "us-west-2" ? ["0.0.0.0/0"] : []
  }
}
```

### Lifecycle with ignore_changes
```hcl
resource "aws_instance" "ec2_instances" {
  count         = length(var.instance_types)
  instance_type = var.instance_types[count.index]
  ami           = data.aws_ami.latest_amazon_linux.id
  tags          = local.tags

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes = ["tags", "metadata"]
    ignore_changes_on_replace = ["volume_size"]
  }
}
```

### Depends On Example
```hcl
resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  depends_on = [aws_s3_bucket.example_bucket]
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "example-bucket"
  acl    = "private"
}
```

### Terraform Provisioners

#### Local Exec
```hcl
resource "aws_instance" "example" {
  ami = "ami"
  instance_type = "t2.micro"
  provisioner "local-exec" {
    command = "echo 'provisioned only if count is even"
  }
}
```

#### Remote Exec
```hcl
resource "aws_instance" "example" {
  ami = "ami"
  instance_type = "t2.micro"
  provisioner "remote-exec" {
    inline = [
      "sudo apt-get update",
      "sudo apt-get install -y nginx"
    ]
  }
}
```

#### File Provisioner
```hcl
resource "aws_instance" "example" {
  ami = "ami"
  instance_type = "t2.micro"
  provisioner "file" {
    src = "local/path"
    destination = "remote path"
  }
}
```

### Assertion in Terraform
```hcl
variable "bucket_prefix" {
  default = "test"
}
run "valid_string_concat" {
  command = plan
  assert {
    condition = aws_s3_bucket.bucket.bucket == "test-bucket"
    error_message = "S3 bucket name mismatch"
  }
}
```

### Built-in Function Categories
1. String Functions  
2. Numeric Functions  
3. Collection Functions  
4. Encoding Functions  
5. File System Functions  
6. Date and Time Functions  
7. Hash and Crypto Functions  
8. IP Network Functions  
9. Type Conversion Functions  

### Difference Between for_each and dynamic block
- `for_each` supports all datatypes: list, set, map, object  
- `dynamic` only supports list and set  
- `for_each` is easier to use

### Example using dynamic
```hcl
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "first" {
  ami = "ami"
  instance_type = "t2.micro"

  dynamic "setting" {
    for_each = var.sq_ingress_rules
    content {
      namespace = setting.value["description"]
      name      = setting.value["name"]
      value     = setting.value["value"]
    }
  }
}
```

### Locals Example
```hcl
locals {
  coordinates    = [10, 20, 30]
  y_coordinates  = element(local.coordinates, 1)
}
```

### Private Modules
1. Declare configuration in one repo and push to GitHub  
2. Reuse it in another repo with a provider block

### Types of Modules
1. Root Module  
2. Child Module  
3. Published Module  
4. Using Modules  
5. Developing Modules  

### Folder Structure for Module
- LICENSE  
- README.md  
- main.tf  
- variables.tf  
- outputs.tf  

### Naming Convention for Terraform Cloud
- `terraform-provider-cloud`

### Terraform State Commands
```bash
terraform state list
terraform state pull
terraform state push
terraform state refresh
terraform state replace-provider old-provider new-provider
```

### Terraform Backend Configuration

```
terraform {
  required_version = ">= 0.12"
  required_providers {
    aws = {
      version = ">= 3.0"
      source  = "hashicorp/aws"
    }
  }
  backend "s3" {
    bucket  = "my-terraform-state"
    key     = "env/prod/terraform.tfstate"
    region  = "us-west-2"
    profile = "default"
  }
}
```

```
terraform {
  backend "azurerm" {
    use_msi              = true
    use_azuread_auth     = true
    tenant_id            = "TENANT_ID"
    client_id            = "CLIENT_ID"
    storage_account_name = "STORAGE_NAME"
    container_name       = "tfstate"
    key                  = "prod.tfstate"
  }
}
```

### Export IPs to Ansible Inventory File
```
terraform output -json vm_ips | jq -r '.[]' > hosts.txt
```

```hcl
output "vm_ips" {
  value = aws_instance.example.*.public_ip
}

```
## commands:
- main:
    - init: "Prepare your working directory for other commands"
    - validate: "Check whether the configuration is valid"
    - plan: "Show changes required by the current configuration"
    - apply: "Create or update infrastructure"
    - destroy: "Destroy previously-created infrastructure"

- other:
    - console: "Try Terraform expressions at an interactive command prompt"
    - fmt: "Reformat your configuration in the standard style"
    - force-unlock: "Release a stuck lock on the current workspace"
    - get: "Install or upgrade remote Terraform modules"
    - graph: "Generate a Graphviz graph of the steps in an operation"
    - import: "Associate existing infrastructure with a Terraform resource"
    - login: "Obtain and save credentials for a remote host"
    - logout: "Remove locally-stored credentials for a remote host"
    - metadata: "Metadata related commands"
    - modules: "Show all declared modules in a working directory"
    - output: "Show output values from your root module"
    - providers: "Show the providers required for this configuration"
    - refresh: "Update the state to match remote systems"
    - show: "Show the current state or a saved plan"
    - state: "Advanced state management"
    - taint: "Mark a resource instance as not fully functional"
    - test: "Execute integration tests for Terraform modules"
    - untaint: "Remove the 'tainted' state from a resource instance"
    - version: "Show the current Terraform version"
    - workspace: "Workspace management"

- global_options:
    - chdir: "Switch to a different working directory before executing the given subcommand."
    - help: "Show this help output, or the help for a specified subcommand."
    - version: "An alias for the 'version' subcommand."

## How Many types of modules will Terraform support:
- Root Modules 
- Child Modules:
  - Local Modules : "Source = ./modules/vpc"
  - Registry Modules : 
    - "Pulled from terrform registries"
    - source = "terraform-aws-modules/vpc/aws"
  - Git based modules:
    - Cloned from git repositories
    - Source="git::https://github.com"
  - S3/Https modules:
    - Souce = "S3::https://my-bucket/module.zip"

## Terraform State commands:
- terraform list 
- terraform mv
- terraform pull
- terraform push
- terffaorm show
- terraform replace-provider