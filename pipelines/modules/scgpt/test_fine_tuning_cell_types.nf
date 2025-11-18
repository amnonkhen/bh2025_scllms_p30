nextflow.enable.dsl=2

process fine_tuning_cell_types {
    // relative to the launch directory. 
    // outputs copied here after success
    publishDir "./outputs/${workflow.scriptName}/${workflow.runName}"

    tag "test_fine_tuning_cell_types"
    // can be a local or remote docker tag
    // Note: container must use params (evaluated at definition time, not execution time)
    container "${params.container_image}"
        
    input:
    path data_dir
    path model_dir
    path config

    output:
    path "save/*"

    script:
    """
    export CONFIG="${config}"
    mkdir save
    touch save/out.txt
    """
    // python3 "${projectDir}/../scripts/scgpt/fine_tuning_cell_types.py"
}

