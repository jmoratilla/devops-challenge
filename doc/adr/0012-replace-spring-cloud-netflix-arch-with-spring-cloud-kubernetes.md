# 12. replace spring cloud netflix arch with spring cloud kubernetes

Date: 2020-03-05

## Status

Accepted

## Context

Kubernetes and Spring Cloud Netflix have both solutions for the microservices
 architecture, sometimes they can be combined, but some times they conflict.
 This has been my case, as I was using some services with netflix and they didn't
 integrate with kubernetes.  In fact, all the examples, docs and recomendations I
 have found just recommends to eliminate the netflix dependencies.
 
Features affected with this issue:

* Service Discovery: netflix eureka vs kubernetes naming
* Config Service: spring config vs kubernetes ConfigMaps and Secrets
* API Gateway: zuul vs ingress

## Decision

My original code was valid for autonomous microservices (deployed in docker), but
 in kubernetes are not working.  I'm going to refactor them in order to make them
 work with the target of the test.


## Consequences

1. Eliminate Eureka, Config services
2. Refactor Service discovery in servicio-item and zuul-server
3. [TBD] Refactor or eliminate Zuul server
 