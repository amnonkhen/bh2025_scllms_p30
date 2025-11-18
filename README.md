# bh2025_scllms_p30

Monorepo layout for scGPT, Cancer Foundation, and Nextflow pipelines.

## Structure

- external/scgpt: your fork of scGPT as a git submodule
- external/cancerfoundation: your fork of Cancer Foundation as a git submodule
- pipelines: Nextflow pipelines and configs

## Setup

- Use gh to fork upstream repos and clone this repo, then add submodules under external/

### prerequisite

- docker
- nextflow
- gdown python package

## usage

```bash
cd pipelines
nextflow run . -main-script ./workflows/scgpt_fine_tuning_cell_types_workflow.nf
```

Alternatively you could use the makefile for some common scenarios.

```bash
make scgpt
```

### customising the docker image

You might need to specify the name of the docker image you use using the nextflow config parameter _container_image_, which you can specify in a config file such as `~/.nextflow/config`. This file is read automatically so there is no need to change the commandlines.


## RO-Crates

### nf-prov plugin for Nextflow
`nf-prov` is a Nexflow plugin that automatically generates Workflow **Run** RO-Crate (WRROC), this here means it automatically generates the `ro-crate-metadata.json` file in the standard [WRROC format](https://www.researchobject.org/workflow-run-crate/).

You can run it with

```bash
make scgpt-test
```

nf-prov only generates a WRROC for a particular run, and not a [Workflow RO-Crate](https://about.workflowhub.eu/Workflow-RO-Crate/). The latter is the final one we need to publish on WorkflowHub, so we need to do some editing/merging.


