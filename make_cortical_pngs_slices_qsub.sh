#!/bin/bash
#$ -S /bin/bash
#Change with your desired subject numbers, then use SGE if available . 
#Otherwise, for a large amount of subjects, it will take a very long time

#Lisf of Subject IDs
SUBJECT=(8426 8403)

#Leave this line as is if you are going to use an SGE, comment otherwise.
subj=${SUBJECT[${SGE_TASK_ID}-1]}

## A For loop for the subject IDs. Uncomment the two below lines if you're not using SGE. 
#for subj in SUBJECT
#do


echo $subj

#QC Output Directory. Change directories 
QC_output_directory=/enter/your/directory/here

#Freesurfer Parent Directory - where the Freesurfer output files are located/ifs/loni/faculty/mbraskie/HABLE/MPRAGE
FS_directory=/this/is/where/my/Freesurfer/files/are

mkdir -p $QC_output_directory

b=${subj} #subject folder

#change this to modify where your files are
imageF=${FS_directory}/${b}/baseline/${b}/mri/orig_nu.mgz
overlay=${FS_directory}/${b}/baseline/${b}/mri/aparc+aseg.mgz

#navigate to the subscripts folder, which has the necessary matlab scripts
cd subscripts

dirs

if [ -f ${imageF} ]
then

#creating the images with no overlay
matlabcall="func_make_corticalpngs_40_slices('${QC_output_directory}','${b}','${imageF}','${overlay}')"
/usr/local/MATLAB/R2014b/bin/matlab -nodisplay -nosplash -singleCompThread -r "${matlabcall};quit"

#create the images with overlay
matlabcall2="func_make_corticalpngs_no_overlay('${QC_output_directory}','${b}','${imageF}','${overlay}')"
/usr/local/MATLAB/R2014b/bin/matlab -nodisplay -nosplash -singleCompThread -r "${matlabcall2};quit"

echo 'Done with subject: ' ${subj}

else

echo 'Freesurfer files not found'

chmod 775 -R $QC_output_directory

fi

## End of for loop through subject IDs, Uncomment if you're not using SGE
#done
