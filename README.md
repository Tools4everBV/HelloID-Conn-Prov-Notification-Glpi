# HelloID-Conn-Prov-Notification-GLPI

| :warning: Warning                                                                                                                                                                                                                                 |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Please be aware that the current notifications only can be triggered by built-in events. For other applications please use the Target connector |


| :information_source: Information                                                                                                                                                                                                                                                                                                                                                       |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| This repository contains the connector and configuration code only. The implementer is responsible to acquire the connection details such as username, token , certificate, etc. You might even need to sign a contract or agreement with the supplier before implementing this connector. Please contact the client's application manager to coordinate the connector requirements. |
<br />
<p align="center"> 
  <img src="https://www.tools4ever.fr/wp-content/uploads/sites/3/2024/12/glpi-logo.png">
</p>

## Table of contents

- [HelloID-Conn-Prov-Notification-GLPI](#helloid-conn-prov-notification-Glpi)
  - [Table of contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Getting started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Connection settings](#connection-settings)
    - [Templates](#templates)
      - [Tickets](#tickets)
  - [Getting help](#getting-help)
  - [HelloID docs](#helloid-docs)

## Introduction

_HelloID-Conn-Prov-Notification-GLPI_ is a _notifcation_ connector. GLPI provides a set of REST APIs that allow you to programmatically interact with its data. The [GLPI documentation](https://glpi-developer-documentation.readthedocs.io/en/master/devapi/index.html) provides details of API commands that are used.

## Getting started
### Prerequisites

  - Credentials with the rights as described in permissions

### Connection settings

The following settings are required to connect to the API.

| Setting     | Description |
| ------------ | ----------- |
| GLPI Url | Example: https://192.168.1.1/apirest.php |
| App Token | API key for application |
| User Token | API key of the user |

More about API keys: https://tic.gal/how-to-setup-glpi-api/


### Templates

There is currently only one template. When configuring the tickets, make sure to provide the correct _UserToken_ and the correct _AppToken_.
The projects are supplied in a dropdown list in the template. Change this for each implementation. 
| :warning: Warning                                                                                                                           |
| :------------------------------------------------------------------------------------------------------------------------------------------ |
|                                                                                                                                             |
| Please keep in mind that the key form field names in the templates are used in the notification.ps1 changing them will break the connector. |

### Ticket




## Getting help

> _For more information on how to configure a HelloID PowerShell connector, please refer to our [documentation](https://docs.helloid.com/en/provisioning/notifications--provisioning-/notification-systems--provisioning-/powershell-notification-systems--provisioning-/add,-edit,-or-remove-a-powershell-notification-system.html) pages_


## HelloID docs

> The official HelloID documentation can be found at: https://docs.helloid.com/