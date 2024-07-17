# API Shell Suite for SAP Intelligent Agriculture

**SAP Intelligent Agriculture (SIA)** enables agribusinesses to sustainably increase farming efficiency by digitizing their farming processes and services from plan-to-harvest, taking advantage of data science and machine learning capabilities. The documentation is available on the [SAP Help Portal](https://help.sap.com/docs/SAP_INTELLIGENT_AGRICULTURE).

## About this project

**API Shell Suite** is a `natively simple`, yet robust project designed to provide an isolated, reproducible, and scalable environment to validate and monitor the availability and performance of SAP Intelligent Agriculture APIs. By combining the containerization capabilities of Docker with the simplicity of shell scripting and the adaptability of `curl`, we have created a tool that seamlessly integrates into your development and operational workflows, providing instant feedback on the health of your SAP interfaces.

> ⚠️ **Important Disclaimer:** The API Shell Suite aims to support you during testing and trying out of the APIs. While it may be enhanced over time, **it is not an official tool delivered with the solution**. Do not use this tool for productive purposes.

### Key Component Features

- **Shell Script**
  - **Task Automation:** Shell scripts enable the automation of repetitive tasks, ensuring consistency and efficiency.
  - **Rapid Prototyping:** Facilitates quick prototyping of solutions without needing to compile code.

- **cURL**
  - **Data Transfer:** curl is a command-line tool for transferring data with URLs. It's instrumental for interacting with APIs, web services, and downloading/uploading files.
  - **Shell Script Integration:** It's frequently embedded within shell scripts to handle network operations.

- **jq**
  - **JSON Processing:** jq is a lightweight, flexible command-line JSON processor. It's ideal for parsing, querying, and manipulating JSON data.
  - **Integration with Curl:** Commonly used in tandem with curl to process JSON responses from APIs or web services within shell scripts.

- **Docker**
  - **Isolation**: Docker containers offer an isolated environment to run apps, ensuring they function consistently across different setups.
  - **Portability**: A Docker container can run on any machine with Docker installed, regardless of the underlying OS.

- **Docker Compose**
  - **Multi-container Definition:** Define and operate multi-container Docker apps via a straightforward YAML file.
  - **Ease of Use:** With a single command (docker-compose up), you can initiate your entire application stack, encompassing services, databases, queues, etc.

## Entity-Dependency Diagram

### Overview

The [Entity-Dependency Diagrams](diagrams/entity-dependency.svg) were created using BPMN (Business Process Model and Notation) which provides some insights and delineate the dependencies between the SAP Intelligent Agriculture entities.

### Purpose of the BPMN Diagram

The BPMN diagram has been designed with the primary intent of showcasing the relationships among the SIA entities. It aims to provide a clear, visual representation of how they interact with each other, the flow of data, and their interdependencies.

### Tool Used: bpmn.io

The diagram was constructed using the `bpmn.io` tool, which is a web-based modeler for BPMN. One of the significant advantages of using bpmn.io is its integration capability with the Camunda Platform. 
- *Learn More:* [bpmn.io Official Documentation](https://bpmn.io/toolkit/bpmn-js/)

### Why bpmn.io?

- **Web-based Modeler**: Allows for easy access and collaboration. Users can design, edit, and share BPMN diagrams directly from their browser without the need for any local software installation.
  
- **Open Source**: `bpmn.io` is open source, making it a community-driven platform that's continually improved by contributions from developers worldwide.
  
- **Integration with Camunda**: The Camunda engine powers the core of bpmn.io. Camunda, a BPM platform, provides robust capabilities for designing and executing BPMN workflows. The synergy between bpmn.io and Camunda ensures that the BPMN diagrams created are not only visually descriptive but also executable.

- **Permitted by SAP**: `bpmn.io` is based on Camunda which is **Permitted** by SAP, according to the Software Rating Information (SRI) internal page.

## QuickStart

### Requirements

Before proceeding with the SAP Docker API Test Suite, please ensure you have the following prerequisites installed on your system:

- **cURL:** A command-line tool used for transferring data with URLs. It's essential for sending requests to SAP APIs in our test suite.
  
  *Installation Guide:* [cURL Official Documentation](https://curl.se/docs/install.html)

- **jq:** A lightweight and flexible command-line JSON processor.

  *Installation:* [jq Official Documentation](https://stedolan.github.io/jq/download/)

- **Docker:** A platform used to develop, ship, and run applications inside containers. This ensures a consistent environment for testing the SAP APIs.

  *Installation Guide:* [Docker Official Documentation](https://docs.docker.com/get-docker/)

Please verify the correct installation and functioning of both tools before continuing.

### Additional Requirements

- **Shell Script Execution Permissions:** The suite is composed of shell script files. Make sure these files have execution permissions before running the tests.

  To set the execution permissions, navigate to the directory containing the shell scripts and run:

  ```
  chmod +x *.sh
  ```
### Configuration

Create a copy of the `set-tenant-template.sh` file and rename it to `set-tenant.sh`, changing the variables accordingly. Execute the same steps for `set-user-template.sh`, creating the `set-user.sh` file.

### Execution

#### Parameters

We can use this tool considering three different contexts, passing the `script_type` as a parameter:

`--load-data`: Use the POST method to create a new basic data structure for the [following APIs](app/data-apis).

`--test-api`: Execute the POST, GET, PATCH, PUT and DELETE HTTP verbs for the [following APIs](app/test-apis).

`--load-scenario`: Execute a script to create the necessary data for the following scenarios.
- Under construction.

#### Using Shell

```
./app/run.sh --load-data
```
*Optionally, you can run the command in the background and redirect the output to a log file.*

```
./app/run.sh --load-data > output.log &
```

#### Using Docker

```
./app/run-with-docker.sh --load-data
```

#### Using Docker-Compose

> ⚠️ **Warning:** Be careful when scaling the number of service instances (second parameter).

```
./app/run-with-docker-compose.sh --load-data 3
```

## Manual Execution Option

### Overview

The [manual-execution-apis](app/manual-execution-apis) folder contains a set of files that are designed for manual copying and execution. You can go through each file and command, understand its purpose, and execute it as needed. Always ensure you understand the implications of a command before executing it.

## Support

This project is open to feature requests/suggestions, bug reports etc. via [GitHub issues](https://github.com/sap-contributions/api-shell-suite/issues).

## Code of Conduct

We as members, contributors, and leaders pledge to make participation in our community a harassment-free experience for everyone. By participating in this project, you agree to always abide by its [Code of Conduct](https://github.com/SAP/.github/blob/main/CODE_OF_CONDUCT.md) at all times.

## Licensing

Copyright 2023 SAP SE or an SAP affiliate company and contributors. Please see our [LICENSE](LICENSE) for copyright and license information. 
