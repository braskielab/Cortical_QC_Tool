# Cortical QC Tool
Software Demonstation presented at OHBM 2019

Steps to use in a bash environment

1)Run 'make_cortical_pngs_slices_qsub.sh' to create directories with image files
 - You can modify the code to run in a for loop or an SGE, depending on your system capabilities.

2)Run 'make_cortical_QC_internal_braskie.sh' to create the webpage
  - Usage: navigate to the directory with the image files, and then run
  - 'bash make_cortical_QC_internal_braskie.sh specified output directory'

