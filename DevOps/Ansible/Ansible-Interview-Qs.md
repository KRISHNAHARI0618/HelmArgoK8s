
# Medium-Level Ansible Interview Questions and Answers

## General Concepts

### 1. Explain the difference between `playbook`, `task`, and `role` in Ansible.
- **Playbook**: A YAML file containing a list of plays to be run.
- **Task**: A single action to be performed on a host, like installing a package or copying a file.
- **Role**: A structured way of organizing playbooks and other Ansible components like tasks, handlers, templates, etc.

### 2. How does Ansible handle idempotency, and why is it important?
- Ansible modules are idempotent, meaning they only make changes when required. This ensures repeatability and prevents unintended side effects.

### 3. What are Ansible facts? How can you gather and use them in playbooks?
- Facts are system properties (OS, IP, memory) gathered using the `setup` module.
- Use them in playbooks via `{{ ansible_facts['hostname'] }}`.

### 4. What is the purpose of an `inventory` file? Can you use dynamic inventories?
- It defines the list of hosts managed by Ansible.
- Yes, dynamic inventories can be used via external scripts or cloud plugins.

### 5. What are the different types of variables in Ansible and their precedence order?
- Types: inventory vars, playbook vars, role vars, extra vars, etc.
- Precedence: extra vars > task vars > block vars > role vars > inventory vars > facts > default vars

## Playbooks and Roles

### 6. How do you include or import playbooks, tasks, and roles in Ansible?
- Use `import_playbook`, `import_tasks`, `include_tasks`, or define `roles` in a play.

### 7. What is the difference between `include` and `import` in playbooks?
- `import` is static and resolved at playbook parsing time.
- `include` is dynamic and resolved during playbook execution.

### 8. How do you use handlers in Ansible? Give an example scenario.
- Handlers are triggered by `notify`. Used for actions like restarting a service after a config change.

### 9. What is a `when` statement? How do you use conditionals in Ansible?
- It’s used to run tasks conditionally. Example: `when: ansible_os_family == 'Debian'`.

### 10. Explain the structure of an Ansible role and how to create a reusable one.
- Roles have directories like `tasks`, `handlers`, `defaults`, `vars`, etc. Create with `ansible-galaxy init role_name`.

## Templates, Variables, and Filters

### 11. How do you use Jinja2 templates in Ansible?
- Use `.j2` files with variables and render using the `template` module.

### 12. How can you encrypt sensitive data using Ansible Vault?
- Encrypt files with `ansible-vault encrypt file.yml`, and decrypt or edit securely with corresponding commands.

### 13. Give an example of using Ansible filters in a template.
- Example: `{{ some_list | join(', ') }}` joins list items into a string.

## 📋 List & Dictionary Filters

| Filter                  | Description                                                | Example                                          |
| ----------------------- | ---------------------------------------------------------- | ------------------------------------------------ |
| `map(attribute)`        | Applies a **function** or attribute to all items in a list | `users \| map(attribute='name')`                 |
| `selectattr(attribute)` | Filters items by matching attribute                        | `users \| selectattr('active', 'equalto', true)` |
| `sort`                  | Sorts a list                                               | `my_list \| sort`                                |
| `unique`                | Removes duplicates from a list                             | `my_list \| unique`                              |
| `length`                | Gets the length of a list or string                        | `my_list \| length`                              |
| `flatten`               | Flattens nested lists                                      | `nested_list \| flatten`                         |
| `combine`               | Merges dictionaries                                        | `dict1 \| combine(dict2)`                        |
| `dictsort`              | Sorts dictionary items by key or value                     | `my_dict \| dictsort`                            |

---

## 🔤 String Filters

| Filter           | Description                            | Example                                    |
| ---------------- | -------------------------------------- | ------------------------------------------ |
| `lower`, `upper` | Converts string to lower/upper case    | `"Hello" \| lower` → `"hello"`             |
| `replace`        | Replaces substrings                    | `"abc" \| replace('a', 'x')` → `"xbc"`     |
| `split`, `join`  | Splits or joins strings                | `"a,b" \| split(',')`                      |
| `regex_search`   | Extracts substring with regex          | `"abc123" \| regex_search('[0-9]+')`       |
| `regex_replace`  | Replaces parts of a string using regex | `"abc123" \| regex_replace('[0-9]+', 'X')` |

---

## 🔧 Miscellaneous Filters

| Filter                  | Description                                      | Example                      |
| ----------------------- | ------------------------------------------------ | ---------------------------- |
| `default(value)`        | Provides a fallback if the variable is undefined | `my_var \| default('empty')` |
| `bool`                  | Converts a value to boolean                      | `"yes" \| bool`              |
| `to_json` / `from_json` | Converts to/from JSON string                     | `my_dict \| to_json`         |
| `to_nice_json`          | Converts to pretty-printed JSON                  | `my_dict \| to_nice_json`    |

---

### 14. How do you pass extra variables to a playbook at runtime?
- Use `-e` flag: `ansible-playbook playbook.yml -e "var1=value1"`

## Advanced Topics

### 15. Explain how Ansible connects to remote machines. What are `become` and `become_user` used for?
- Ansible uses SSH to connect. `become` allows privilege escalation, and `become_user` defines the user to become.

### 16. How would you write a playbook to deploy an application to multiple environments (dev/stage/prod)?
- Use group_vars or environment-specific variables, and conditionally load them based on the inventory group or tags.

### 17. Describe how to debug Ansible playbooks. What are some best practices for debugging?
- Use `-vvv` verbosity, `debug` module, and `ansible-playbook --step`. Modular playbooks and descriptive task names help.

### 18. What is `check mode` in Ansible? When would you use it?
- Use `--check` to simulate changes without applying them. Useful for testing playbook behavior.

### 19. What are callback plugins in Ansible? Have you customized any?
- Plugins that alter output or behavior. Example: `json`, `yaml`, or `slack` notification plugins. Yes, they can be customized.

### 20. Have you integrated Ansible with CI/CD pipelines? Explain how.
- Yes, by invoking Ansible playbooks from Jenkins, GitLab CI, or GitHub Actions for deployment and configuration automation.

### Precedence Of Vars file [top to bottom]:
- Command line vars
- Prompt
- Include vars [files]
- Role Vars
- Task Vars
- Block Vars/File Vars
- Playbook vars
- Inventroy/Group/Host Vars
- Roles Defaults

### How to Write Variables
- nginx-Package: nginx
  
### Modules Used
- Package
- Service
- Debug
- File
- User
- Templates
- Copy
- get_url
- Archive
- Un_archive
- Systemd
- Commad
- Shell
  
### Loops in Ansible

**For Loop**
```
- name: Install multiple packages
  apt:
    name: "{{ item }}"
    state: present
  loop:
    - git
    - curl
    - vim
```
**For Each Loop**
```
- name: Create multiple users with shell
  user:
    name: "{{ item.key }}"
    shell: "{{ item.value }}"
  loop: "{{ users | dict2items }}"
  vars:
    users:
      alice: /bin/bash
      bob: /bin/zsh
```

