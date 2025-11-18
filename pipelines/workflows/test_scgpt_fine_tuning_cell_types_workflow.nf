nextflow.enable.dsl = 2

// params.config = "${projectDir}/../scripts/scgpt/config.yml"
// params.data_dir = "${projectDir}/../data"
// params.model_dir = "${projectDir}/../model/pan_cancer"
params.config = "${projectDir}/../scripts/scgpt/config.yml"
params.data_dir = "${projectDir}/../data"
params.model_dir = "${projectDir}/../model/pan_cancer"
params.container_image = "bh2025scllmsp30-scgpt:latest"

include { fine_tuning_cell_types } from '../modules/scgpt/test_fine_tuning_cell_types'

// Workflow block
workflow {

    main:
    ch_data_dir = file(params.data_dir)
    ch_model_dir = file(params.model_dir)
    ch_config = file(params.config)
    fine_tuning_cell_types(
        ch_data_dir,
        ch_model_dir,
        ch_config,
    )

    // publish:
    // out = out
}

// output {
//     out {
//     }
// }
