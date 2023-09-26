# API Shell Suite for SAP Intelligent Agriculture

**SAP Intelligent Agriculture (SIA)** enables agribusinesses to sustainably increase farming efficiency by digitizing their farming processes and services from plan-to-harvest, taking advantage of data science and machine learning capabilities. The documentation is available on the [SAP Help Portal](https://help.sap.com/docs/SAP_INTELLIGENT_AGRICULTURE).

## About this project

**API Shell Suite** is a lightweight, yet robust project designed to provide an isolated, reproducible, and scalable environment to validate and monitor the availability and performance of SAP Intelligent Agriculture APIs. By combining the containerization capabilities of Docker with the simplicity of shell scripting and the adaptability of `curl`, we have created a tool that seamlessly integrates into your development and operational workflows, providing instant feedback on the health of your SAP interfaces.

> ⚠️ **Disclaimer:** Do not use this tool for productive purposes.

### Key Features

- **Containerized Testing:** Utilize Docker to create consistent, isolated testing environments, eliminating the "it works on my machine" problem.

- **Simplicity:** Using only shell script and `curl`, the tool is easy to set up and run on almost any platform.

- **Functional Testing:** Validate the actual functionality of SAP Intelligent Agriculture APIs, ensuring they not only respond but also deliver the expected outputs and side effects.

- **Scenario-Based Execution:** Group APIs into specific scenarios, allowing for targeted testing of workflows and business processes.

- **Performance Testing:** Measure the response times, latency, and throughput of SAP APIs, helping identify potential bottlenecks and ensuring optimal performance.

- **Comprehensive HTTP Verb Support:** Test all facets of your APIs by including all HTTP verbs (GET, POST, PUT, DELETE, PATCH), ensuring a thorough validation of CRUD operations and more.

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

`--load-data`: Use the POST method to create a new data structure for the following APIs.
- Farms, Areas, FieldGroups, Destinations, LocationTypes, Locations, ClimateZones, Fields

`--test-api`: Exetute the GET, PATCH, PUT and DELETE HTTP verbs for the APIs below, deleting the inserted data before finishing the execution.
- Farms, Areas, FieldGroups, Destinations, LocationTypes, Locations, ClimateZones

`--load-scenario`: Execute a script to create the necessary data for the following scenarios.
- Under construction.

#### Using Shell

```
./app/run.sh --load-data
```
*Optionaly, you can run the command in the background and redirect the output to a log file.*

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

## Entity-Dependency Diagram

### Overview

The [Entity-Dependency Diagram](diagrams/entity-dependency.svg) was created using BPMN (Business Process Model and Notation) which provides some insights and delineate the dependencies between the SAP Intelligent Agriculture entities.

### Purpose of the BPMN Diagram

The BPMN diagram has been designed with the primary intent of showcasing the relationships among the SIA entities. It aims to provide a clear, visual representation of how they interact with each other, the flow of data, and their interdependencies.

### Tool Used: bpmn.io

The diagram was constructed using the `bpmn.io` tool, which is a web-based modeler for BPMN. One of the significant advantages of using bpmn.io is its integration capability with the Camunda Platform. 
- *Learn More:* [bpmn.io Official Documentation](https://bpmn.io/toolkit/bpmn-js/)

### Why bpmn.io?

- **Web-based Modeler**: Allows for easy access and collaboration. Users can design, edit, and share BPMN diagrams directly from their browser without the need for any local software installation.
  
- **Open Source**: `bpmn.io` is open source, making it a community-driven platform that's continually improved by contributions from developers worldwide.
  
- **Integration with Camunda**: The Camunda engine powers the core of bpmn.io. Camunda, a BPM platform, provides robust capabilities for designing and executing BPMN workflows. The synergy between bpmn.io and Camunda ensures that the BPMN diagrams created are not only visually descriptive but also executable.

- **Permitted by SAP**: `bpmn.io` is based on Camunda which is **Permited** by SAP, according to the Software Rating Information (SRI) internal page.

## Support

This project is open to feature requests/suggestions, bug reports etc. via [GitHub issues](https://github.com/sap-contributions/api-shell-suite/issues).

## Code of Conduct

We as members, contributors, and leaders pledge to make participation in our community a harassment-free experience for everyone. By participating in this project, you agree to always abide by its [Code of Conduct](https://github.com/SAP/.github/blob/main/CODE_OF_CONDUCT.md) at all times.

## Licensing

Copyright 2023 SAP SE or an SAP affiliate company and contributors. Please see our [LICENSE](LICENSE) for copyright and license information. 
