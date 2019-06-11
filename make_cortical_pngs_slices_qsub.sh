#!/bin/bash
#$ -S /bin/bash

#SUBJECT=(3304936_20216_2_0_oriented_BF_adj) #58

#subj=${SUBJECT[${SGE_TASK_ID}]}

#echo pwd: "$PWD"
#echo SUBJECT: $subj


QC_output_directory=/ifs/loni/faculty/thompson/four_d/mbraskie/Practice_Brains/QC_FS_cortex/internalQCtraining
mkdir -p $QC_output_directory

for arg
do

FS_directory=/ifs/loni/faculty/thompson/four_d/mbraskie/Practice_Brains/QC_FS_cortex/Freesurfer5.3

b=${arg} #subject folder
imageF=${FS_directory}/${b}/mri/orig_nu.mgz
overlay=${FS_directory}/${b}/mri/aparc+aseg.mgz

cd /ifs/loni/faculty/thompson/four_d/mbraskie/Practice_Brains/QC_FS_cortex/scripts

dirs

if [ -f ${imageF} ]
then

matlabcall="func_make_corticalPNGs_no_overlay('${QC_output_directory}','${b}','${imageF}','${overlay}')"
/usr/local/MATLAB/R2014b/bin/matlab -nodisplay -nosplash -singleCompThread -r "${matlabcall};quit"
echo 'Done with subject: ' ${arg}

else

echo 'Freesurfer files not found'

fi
done



