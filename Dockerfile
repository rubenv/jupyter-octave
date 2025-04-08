FROM quay.io/jupyter/minimal-notebook

USER root

RUN apt-get update && \
    apt-get install -y octave \
    octave-symbolic octave-miscellaneous \
    gnuplot ghostscript && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID

RUN conda install --quiet --yes \
    'octave_kernel' && \
    conda clean -a && \
    fix-permissions $CONDA_DIR
