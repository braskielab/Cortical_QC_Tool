QC_output_directory='/ifs/loni/faculty/thompson/four_d/sthomopo/UKBB/protocol_test/FreeSurfer5.3/QC/'
FS_directory='/ifs/loni/faculty/thompson/four_d/sthomopo/UKBB/protocol_test/FreeSurfer5.3/'
a=dir(char(strcat(FS_directory,'/*')));%Choose this so that it selects only your 
%subject folders that contain FS output

for x = 3:size(a,1)
    [c,b,d]=fileparts(a(x,1).name); %b becomes the subject_name
    try
        func_make_corticalpngs_ENIGMA_QC(QC_output_directory, b, [FS_directory, '/', b, '/mri/orig.mgz'], [FS_directory,'/', b, '/mri/aparc+aseg.mgz']);
    end
    display(['Done with subject: ', b, ': ', num2str(x-2), ' of ', num2str(size(a,1)-2)]);
end