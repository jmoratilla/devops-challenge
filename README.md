## Description

This repo contains all the work and docs for the code test.

## Status Badges

[![CircleCI](https://circleci.com/bb/moratilla/cl-challenge.svg?style=svg&circle-token=ae29e48d6587f59393ae60bc5b0b906d8368d253)](https://circleci.com/bb/moratilla/cl-challenge)


## The way to use and run it

First, download the repository using git:

```shell
$ git clone https://bitbucket.org/moratilla/cl-challenge.git
```

## About documentation

The documentation is under the doc/ subdirectory and in form of ADRs (Architecture Decision Records), as recomended by [Michael Nygard](http://thinkrelevance.com/blog/2011/11/15/documenting-architecture-decisions).]


## About the code

This repo is a kind of handmade monorepo, that means all microservices are under the same repository.

Is an API interface to expose a CRUD for Items and Products.

![diagram of the microservices example](/doc/assets/microservices_diag01.png)



## Deploy the cluster

Change the env vars needed (they are in the scripts/variables.kops file)

    $ source scripts/variables.kops

Use the script procedure to provision your cluster:

    $ cd scripts
    $ ./kops_create.sh

Or use the template to provision your cluster:

    $ cd kubernetes-template
    $ kops toolbox template \
      --values values.yaml \
      --template cluster-template.yaml \
      --output cluster.yaml
    $ kops create secret \
      --name $NAME \
      sshpublickey admin \
      -i $KOPS_SSH_KEY_PATH
    $ kops replace -f cluster.yaml --force
    $ kops update cluster $NAME --yes

## Tools used

* [ASDF-VM](https://asdf-vm.com): to install all the packages (like in rbenv)
* [ADR tools](https://github.com/npryce/adr-tools/blob/master/INSTALL.md): to help with the documentation of the decisions assumed in the project.
* [SDKMAN](https://sdkman.io/): to help with the download of some of the packages.
* [ConventionalCommits Guidelines](https://www.conventionalcommits.org/en/v1.0.0/): to ease the CHANGELOG and versioning of the code.

