# API Shell Suite for SAP Intelligent Agriculture

**SAP Intelligent Agriculture** enables agribusinesses to sustainably increase farming efficiency by digitizing their farming processes and services from plan-to-harvest, taking advantage of data science and machine learning capabilities. The documentation is available on the [SAP Help Portal](https://help.sap.com/docs/SAP_INTELLIGENT_AGRICULTURE).

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

## Support

This project is open to feature requests/suggestions, bug reports etc. via [GitHub issues](https://github.tools.sap/I831372/api-data-load/issues).

## Code of Conduct

We as members, contributors, and leaders pledge to make participation in our community a harassment-free experience for everyone. By participating in this project, you agree to always abide by its [Code of Conduct](https://github.com/SAP/.github/blob/main/CODE_OF_CONDUCT.md) at all times.

## Licensing

Copyright 2023 SAP SE or an SAP affiliate company and contributors. Please see our [LICENSE](LICENSE) for copyright and license information. 
