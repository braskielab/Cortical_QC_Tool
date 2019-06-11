%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ENIGMA Cortical Protocols
%% QC thickness visualization for FreeSurfer (Fischl Neuroimage, 2012)
%% written by Neda Jahanshad -- neda.jahansad@ini.usc.edu
%% January 2014 - enigma.ini.usc.edu
%% -- updated July 2014 to add another panel and fix insula color (-NJ)
%% -- uses FreeSurfer Matlab Tools for reading in mgh
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%     example inputs

%%dirO='/Volumes/enigma/Neda/CoritcalTest/QC/'    %% output directory
%%subject='8003201_JC'
%%imageF=char(strcat('/Volumes/enigma/Neda/FreesurferRuns/',subject,'/mri/orig.mgz'));
%%overlay=char(strcat('/Volumes/enigma/Neda/FreesurferRuns/',subject,'mri/aparc+aseg.mgz'));
%% make_corticalpngsFS(dirO,subject,imageF,overlay)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function make_corticalpngsFS(dirO,subject,imageF,overlay)

%dirO='/ifs/loni/faculty/thompson/four_d/Vatche/DOD-SPGR/FreeSurfer/sc/FS_v53/QC_1'
%subject='0003107'
%imageF=char(strcat('/ifs/loni/faculty/thompson/four_d/Vatche/DOD-SPGR/FreeSurfer/sc/FS_v53/freesurfer_outputs/',subject,'/mri/orig.mgz'));
%overlay=char(strcat('/ifs/loni/faculty/thompson/four_d/Vatche/DOD-SPGR/FreeSurfer/sc/FS_v53/freesurfer_outputs/',subject,'/mri/aparc+aseg.mgz'));

subj=subject;
dirOS=char(strcat(dirO,filesep,subject,filesep))
mkdir(dirOS)
s_name=subject;
FSmap=textread('FScortical_RGB.txt');
FSmap=FSmap./256;

img=fopen(imageF,'r','l');
fib=fopen(overlay,'r','l');


if img >0 && fib >0

[inputT1img, mr_parms, Mdc, volsz] = load_mgh(imageF);
Nx=volsz(1);
Ny=volsz(2);
Nz=volsz(3);
[inputLABELimg M]=load_mgh(overlay);
fclose all;

if ( length(inputT1img(:))==Nx*Ny*Nz && length(inputLABELimg(:))==Nx*Ny*Nz )

indexs=find(inputT1img~=0);
T1=zeros(Nx,Ny,Nz); T1(indexs)=inputT1img(indexs);

indexs=find(inputLABELimg~=0);
labelsLeft=zeros(Nx,Ny,Nz);
labelsLeft(indexs)=inputLABELimg(indexs);
labelsRight=zeros(Nx,Ny,Nz);
labelsRight(indexs)=inputLABELimg(indexs);

%%Left
labelsLeft(inputLABELimg<1000)=0; labelsLeft(inputLABELimg>1990)=0;
nonZero = find(labelsLeft~=0);
labelsLeft(nonZero)=labelsLeft(nonZero)-1000;

%%Right
labelsRight(inputLABELimg<2000)=0;
nonZero = find(labelsRight~=0);
labelsRight(nonZero)=labelsRight(nonZero)-2000;

Labels=labelsLeft +labelsRight;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% step 1 -- make images with full set of ROIS overlayed

%% find min max of image

indx=find(Labels~=0);
[x y z]=ind2sub([Nx Ny Nz],indx);

XminXmax = quantile(x,[0 1]) ;
YminYmax= quantile(y,[0 1]) ;
ZminZmax = quantile(z,[0 1]) ;

Xmin=max(XminXmax(1),3);Xmax=min(XminXmax(2),Nx-3);
Ymin=max(YminYmax(1),3);Ymax=min(YminYmax(2),Ny-3);
Zmin=max(ZminZmax(1),3);Zmax=min(ZminZmax(2),Nz-3);

T1=T1(Xmin-2:Xmax+2,Ymin-2:Ymax+2,Zmin-2:Zmax+2);
Labels=Labels(Xmin-2:Xmax+2,Ymin-2:Ymax+2,Zmin-2:Zmax+2);

indx=find(Labels~=0);
[x y z]=ind2sub(size(Labels),indx);


%%%%%%%%%%%%%% CHANGED ALL OF THESE AFM %%%%%%%%%%%%%%%%%%
%%%%%128 SLICES%%%%%
%sliceSs = round(quantile(x,[0 0.0078125 0.015625 0.0234375 0.03125 0.0390625 0.046875 0.0546875 0.0625 0.0703125 0.078125 0.0859375 0.09375 0.1015625 0.109375 0.1171875 0.125 0.1328125 0.140625 0.1484375 0.15625 0.1640625 0.171875 0.1796875 0.1875 0.1953125 0.203125 0.2109375 0.21875 0.2265625 0.234375 0.2421875 0.25 0.2578125 0.265625 0.2734375 0.28125 0.2890625 0.296875 0.3046875 0.3125 0.3203125 0.328125 0.3359375 0.34375 0.3515625 0.359375 0.3671875 0.375 0.3828125 0.390625 0.3984375 0.40625 0.4140625 0.421875 0.4296875 0.4375 0.4453125 0.453125 0.4609375 0.46875 0.4765625 0.484375 0.4921875 0.5 0.5078125 0.515625 0.5234375 0.53125 0.5390625 0.546875 0.5546875 0.5625 0.5703125 0.578125 0.5859375 0.59375 0.6015625 0.609375 0.6171875 0.625 0.6328125 0.640625 0.6484375 0.65625 0.6640625 0.671875 0.6796875 0.6875 0.6953125 0.703125 0.7109375 0.71875 0.7265625 0.734375 0.7421875 0.75 0.7578125 0.765625 0.7734375 0.78125 0.7890625 0.796875 0.8046875 0.8125 0.8203125 0.828125 0.8359375 0.84375 0.8515625 0.859375 0.8671875 0.875 0.8828125 0.890625 0.8984375 0.90625 0.9140625 0.921875 0.9296875 0.9375 0.9453125 0.953125 0.9609375 0.96875 0.9765625 0.984375 0.9921875 1]));
%sliceCs = round(quantile(y,[0 0.0078125 0.015625 0.0234375 0.03125 0.0390625 0.046875 0.0546875 0.0625 0.0703125 0.078125 0.0859375 0.09375 0.1015625 0.109375 0.1171875 0.125 0.1328125 0.140625 0.1484375 0.15625 0.1640625 0.171875 0.1796875 0.1875 0.1953125 0.203125 0.2109375 0.21875 0.2265625 0.234375 0.2421875 0.25 0.2578125 0.265625 0.2734375 0.28125 0.2890625 0.296875 0.3046875 0.3125 0.3203125 0.328125 0.3359375 0.34375 0.3515625 0.359375 0.3671875 0.375 0.3828125 0.390625 0.3984375 0.40625 0.4140625 0.421875 0.4296875 0.4375 0.4453125 0.453125 0.4609375 0.46875 0.4765625 0.484375 0.4921875 0.5 0.5078125 0.515625 0.5234375 0.53125 0.5390625 0.546875 0.5546875 0.5625 0.5703125 0.578125 0.5859375 0.59375 0.6015625 0.609375 0.6171875 0.625 0.6328125 0.640625 0.6484375 0.65625 0.6640625 0.671875 0.6796875 0.6875 0.6953125 0.703125 0.7109375 0.71875 0.7265625 0.734375 0.7421875 0.75 0.7578125 0.765625 0.7734375 0.78125 0.7890625 0.796875 0.8046875 0.8125 0.8203125 0.828125 0.8359375 0.84375 0.8515625 0.859375 0.8671875 0.875 0.8828125 0.890625 0.8984375 0.90625 0.9140625 0.921875 0.9296875 0.9375 0.9453125 0.953125 0.9609375 0.96875 0.9765625 0.984375 0.9921875 1]));
%sliceAs = round(quantile(z,[0 0.0078125 0.015625 0.0234375 0.03125 0.0390625 0.046875 0.0546875 0.0625 0.0703125 0.078125 0.0859375 0.09375 0.1015625 0.109375 0.1171875 0.125 0.1328125 0.140625 0.1484375 0.15625 0.1640625 0.171875 0.1796875 0.1875 0.1953125 0.203125 0.2109375 0.21875 0.2265625 0.234375 0.2421875 0.25 0.2578125 0.265625 0.2734375 0.28125 0.2890625 0.296875 0.3046875 0.3125 0.3203125 0.328125 0.3359375 0.34375 0.3515625 0.359375 0.3671875 0.375 0.3828125 0.390625 0.3984375 0.40625 0.4140625 0.421875 0.4296875 0.4375 0.4453125 0.453125 0.4609375 0.46875 0.4765625 0.484375 0.4921875 0.5 0.5078125 0.515625 0.5234375 0.53125 0.5390625 0.546875 0.5546875 0.5625 0.5703125 0.578125 0.5859375 0.59375 0.6015625 0.609375 0.6171875 0.625 0.6328125 0.640625 0.6484375 0.65625 0.6640625 0.671875 0.6796875 0.6875 0.6953125 0.703125 0.7109375 0.71875 0.7265625 0.734375 0.7421875 0.75 0.7578125 0.765625 0.7734375 0.78125 0.7890625 0.796875 0.8046875 0.8125 0.8203125 0.828125 0.8359375 0.84375 0.8515625 0.859375 0.8671875 0.875 0.8828125 0.890625 0.8984375 0.90625 0.9140625 0.921875 0.9296875 0.9375 0.9453125 0.953125 0.9609375 0.96875 0.9765625 0.984375 0.9921875 1]));
%txts={'0 ';'0.78125 ';'1.5625 ';'2.34375 ';'3.125 ';'3.90625 ';'4.6875 ';'5.46875 ';'6.25 ';'7.03125 ';'7.8125 ';'8.59375 ';'9.375 ';'10.15625 ';'10.9375 ';'11.71875 ';'12.5 ';'13.28125 ';'14.0625 ';'14.84375 ';'15.625 ';'16.40625 ';'17.1875 ';'17.96875 ';'18.75 ';'19.53125 ';'20.3125 ';'21.09375 ';'21.875 ';'22.65625 ';'23.4375 ';'24.21875 ';'25 ';'25.78125 ';'26.5625 ';'27.34375 ';'28.125 ';'28.90625 ';'29.6875 ';'30.46875 ';'31.25 ';'32.03125 ';'32.8125 ';'33.59375 ';'34.375 ';'35.15625 ';'35.9375 ';'36.71875 ';'37.5 ';'38.28125 ';'39.0625 ';'39.84375 ';'40.625 ';'41.40625 ';'42.1875 ';'42.96875 ';'43.75 ';'44.53125 ';'45.3125 ';'46.09375 ';'46.875 ';'47.65625 ';'48.4375 ';'49.21875 ';'50 ';'50.78125 ';'51.5625 ';'52.34375 ';'53.125 ';'53.90625 ';'54.6875 ';'55.46875 ';'56.25 ';'57.03125 ';'57.8125 ';'58.59375 ';'59.375 ';'60.15625 ';'60.9375 ';'61.71875 ';'62.5 ';'63.28125 ';'64.0625 ';'64.84375 ';'65.625 ';'66.40625 ';'67.1875 ';'67.96875 ';'68.75 ';'69.53125 ';'70.3125 ';'71.09375 ';'71.875 ';'72.65625 ';'73.4375 ';'74.21875 ';'75 ';'75.78125 ';'76.5625 ';'77.34375 ';'78.125 ';'78.90625 ';'79.6875 ';'80.46875 ';'81.25 ';'82.03125 ';'82.8125 ';'83.59375 ';'84.375 ';'85.15625 ';'85.9375 ';'86.71875 ';'87.5 ';'88.28125 ';'89.0625 ';'89.84375 ';'90.625 ';'91.40625 ';'92.1875 ';'92.96875 ';'93.75 ';'94.53125 ';'95.3125 ';'96.09375 ';'96.875 ';'97.65625 ';'98.4375 ';'99.21875 ';'100'};

%%%%%64 SLICES%%%%%
%sliceCs = round(quantile(x,[0 0.015625 0.03125 0.046875 0.0625 0.078125 0.09375 0.109375 0.125 0.140625 0.15625 0.171875 0.1875 0.203125 0.21875 0.234375 0.25 0.265625 0.28125 0.296875 0.3125 0.328125 0.34375 0.359375 0.375 0.390625 0.40625 0.421875 0.4375 0.453125 0.46875 0.484375 0.5 0.515625 0.53125 0.546875 0.5625 0.578125 0.59375 0.609375 0.625 0.640625 0.65625 0.671875 0.6875 0.703125 0.71875 0.734375 0.75 0.765625 0.78125 0.796875 0.8125 0.828125 0.84375 0.859375 0.875 0.890625 0.90625 0.921875 0.9375 0.953125 0.96875 0.984375 1]));
%sliceAs = round(quantile(x,[0 0.015625 0.03125 0.046875 0.0625 0.078125 0.09375 0.109375 0.125 0.140625 0.15625 0.171875 0.1875 0.203125 0.21875 0.234375 0.25 0.265625 0.28125 0.296875 0.3125 0.328125 0.34375 0.359375 0.375 0.390625 0.40625 0.421875 0.4375 0.453125 0.46875 0.484375 0.5 0.515625 0.53125 0.546875 0.5625 0.578125 0.59375 0.609375 0.625 0.640625 0.65625 0.671875 0.6875 0.703125 0.71875 0.734375 0.75 0.765625 0.78125 0.796875 0.8125 0.828125 0.84375 0.859375 0.875 0.890625 0.90625 0.921875 0.9375 0.953125 0.96875 0.984375 1]));
%txts={'0';'0.015625';'0.03125';'0.046875';'0.0625';'0.078125';'0.09375';'0.109375';'0.125';'0.140625';'0.15625';'0.171875';'0.1875';'0.203125';'0.21875';'0.234375';'0.25';'0.265625';'0.28125';'0.296875';'0.3125';'0.328125';'0.34375';'0.359375';'0.375';'0.390625';'0.40625';'0.421875';'0.4375';'0.453125';'0.46875';'0.484375';'0.5';'0.515625';'0.53125';'0.546875';'0.5625';'0.578125';'0.59375';'0.609375';'0.625';'0.640625';'0.65625';'0.671875';'0.6875';'0.703125';'0.71875';'0.734375';'0.75';'0.765625';'0.78125';'0.796875';'0.8125';'0.828125';'0.84375';'0.859375';'0.875';'0.890625';'0.90625';'0.921875';'0.9375';'0.953125';'0.96875';'0.984375';'1'};

%%%%%36 SLICES%%%%%
sliceSs = round(quantile(x,[0.1 0.125 0.15 0.175 0.2 0.225 0.25 0.275 0.3 0.325 0.35 0.375 0.4 0.425 0.45 0.475 0.5 0.525 0.55 0.575 0.6 0.625 0.65 0.675 0.7 0.725 0.75 0.775 0.8 0.825 0.85 0.875 0.9 0.925 0.95 0.975]));
sliceCs = round(quantile(y,[0.1 0.125 0.15 0.175 0.2 0.225 0.25 0.275 0.3 0.325 0.35 0.375 0.4 0.425 0.45 0.475 0.5 0.525 0.55 0.575 0.6 0.625 0.65 0.675 0.7 0.725 0.75 0.775 0.8 0.825 0.85 0.875 0.9 0.925 0.95 0.975]));
sliceAs = round(quantile(z,[0.1 0.125 0.15 0.175 0.2 0.225 0.25 0.275 0.3 0.325 0.35 0.375 0.4 0.425 0.45 0.475 0.5 0.525 0.55 0.575 0.6 0.625 0.65 0.675 0.7 0.725 0.75 0.775 0.8 0.825 0.85 0.875 0.9 0.925 0.95 0.975]));
txts={'10';'12.5';'15';'17.5';'20';'22.5';'25';'27.5';'30';'32.5';'35';'37.5';'40';'42.5';'45';'47.5';'50';'52.5';'55';'57.5';'60';'62.5';'65';'67.5';'70';'72.5';'75';'77.5';'80';'82.5';'85';'87.5';'90';'92.5';'95';'97.5'};

%%%%%16 SLICES%%%%%
%sliceSs = round(quantile(x,[0 0.0625 0.125 0.1875 0.25 0.3125 0.375 0.4375 0.5 0.5625 0.625 0.6875 0.75 0.8125 0.875 0.9375 1]));
%sliceCs = round(quantile(x,[0 0.0625 0.125 0.1875 0.25 0.3125 0.375 0.4375 0.5 0.5625 0.625 0.6875 0.75 0.8125 0.875 0.9375 1]));
%sliceAs = round(quantile(x,[0 0.0625 0.125 0.1875 0.25 0.3125 0.375 0.4375 0.5 0.5625 0.625 0.6875 0.75 0.8125 0.875 0.9375 1]));
%txts={'0';'0.0625';'0.125';'0.1875';'0.25';'0.3125';'0.375';'0.4375';'0.5';'0.5625';'0.625';'0.6875';'0.75';'0.8125';'0.875';'0.9375';'1'};

%%%%%8 SLICES%%%%%
%sliceSs = round(quantile(x,[0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]));
%sliceCs = round(quantile(x,[0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]));
%sliceAs = round(quantile(x,[0 0.125 0.25 0.375 0.5 0.625 0.75 0.875 1]));
%txts={'0'; '0.125'; '0.25'; '0.375'; '0.5'; '0.625'; '0.75'; '0.875'; '1'};

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    for slice = 1:36 %changed this AFM
    sliceA=sliceAs(slice);
    sliceC=sliceCs(slice);
    sliceS=sliceSs(slice);
    txt=char(txts(slice));

    m1=64;
    m2=35;
    mask=Labels~=0;
    cmin=min(T1(:));
    cmax=max(T1(:));

    cminF=0;
    cmaxF=35;

    %%%%%%%%%%%%%%%%%
    %% coronal %%

    
    h=figure('Visible','off');
    h(2)= image(Xmax+2:-1:Xmin-2,Ymin-2:Ymax+2,transpose(T1(:,:,sliceA)));
    axis off; hold on;
    h(1)= image(Xmax+2:-1:Xmin-2,Ymin-2:Ymax+2,transpose(Labels(:,:,sliceA)));
    %set(h(2),'AlphaData',transpose(mask(:,:,sliceA)),'AlphaDataMapping','none');

    text('units','pixels','position',[3 -9],'BackgroundColor','r','fontsize',12,'string',s_name,'Interpreter','none');

    text('position',[Xmin Ymin+10],'BackgroundColor','w','fontsize',16,'string','L','Interpreter','none');
    text('position',[Xmax Ymin+10],'BackgroundColor','w','fontsize',16,'string','R','Interpreter','none');
    
    imadjust(colormap([bone(m1); FSmap]),[],[],0.2);
    %imadjust(colormap([bone(m1); FSmap]),[],[],0.0);

    C1 = min(m1,round((m1-1)*(T1(:,:,sliceA)-cmin)/(cmax-cmin))+1);
    C2 = Labels(:,:,sliceA) +m1 +1 ;
    set(h(1),'CData',C1');
    set(h(2),'CData',C2');

    
    axis off;axis image;


    imadjust(colormap([bone(m1); FSmap]),[],[],0.2);
    %imadjust(colormap([bone(m1); FSmap]),[],[],0.0);
    hold off;
    saveas(gca,char(strcat(dirOS,'Cortical_set_orig_Coronal_',txt,'.png')),'png')
    print('-dpng','-r70',char(strcat(dirOS,'Cortical_set_orig_Coronal_70_',txt,'.png')));
    close all;
    
        
    %%%%%%%%%%%%%%%%%
    %% axial %%
    h=figure('Visible','off') ;
        
    C2 = min(m1,round((m1-1)*(squeeze(T1(:,sliceC,:))-cmin)/(cmax-cmin))+1);
    C1 = squeeze(Labels(:,sliceC,:)) +m1 +1 ;
        
    h(2)=image(Xmax+2:-1:Xmin-2,Zmax+2:-1:Zmin-2,transpose(squeeze(T1(:,sliceC,:)))); hold on;axis off;
    hold on;axis off;
    set(h(2),'CData',C1');
    h(1)=image(Xmax+2:-1:Xmin-2,Zmax+2:-1:Zmin-2,transpose(squeeze(Labels(:,sliceC,:))));
    set(h(1),'AlphaData',transpose(squeeze(mask(:,sliceC,:))),'AlphaDataMapping','none');
    set(h(1),'CData',C2');
                
    %text('units','pixels','position',[4 9],'BackgroundColor','r','fontsize',12,'string',s_name,'Interpreter','none');
    text('units','pixels','position',[3 -9],'BackgroundColor','r','fontsize',12,'string',s_name,'Interpreter','none');
        text('position',[Xmin Zmin+10],'BackgroundColor','w','fontsize',16,'string','L','Interpreter','none');
        text('position',[Xmax-20 Zmin+10],'BackgroundColor','w','fontsize',16,'string','R','Interpreter','none');
        
    caxis([1 35]);
    axis off;axis image;
    colormap([bone(m1); FSmap]);
    saveas(gca,char(strcat(dirOS,'Cortical_set_orig_Axial_',txt,'.png')),'png')
    print('-dpng','-r70',char(strcat(dirOS,'Cortical_set_orig_Axial_70_',txt,'.png')));
    hold off;
    close all;
	
    
    end

end
    

        
        else
        txts={'10';'20';'40';'50';'60';'80';'85';'90'};
        %% for each slice
    
        %for slice = 1:11 %%% CHANGED THIS AFM %%%
        for slice = 1:8 %%% CHANGED THIS AFM %%%
        txt=char(txts(slice));
        
        %%%%%%%%%%%%%%%%%
        %% coronal %%
        h=figure('Visible','off');

        %text('units','pixels','position',[4 9],'BackgroundColor','r','fontsize',12,'string',s_name,'Interpreter','none');
        text('units','pixels','position',[3 -9],'BackgroundColor','r','fontsize',12,'string',s_name,'Interpreter','none');
        text('position',[0.3 0.5],'BackgroundColor','w','fontsize',16,'string','FS failed to output labels','Interpreter','none');
        axis off;
        saveas(gca,char(strcat(dirOS,'Cortical_set_Coronal_',txt,'.png')),'png')
        print('-dpng','-r70',char(strcat(dirOS,'Cortical_set_Coronal_70_',txt,'.png')));
        close all;
                
        %%%%%%%%%%%%%%%%%
        %% axial %%
        h=figure('Visible','off') ;
        %text('units','pixels','position',[4 9],'BackgroundColor','r','fontsize',12,'string',s_name,'Interpreter','none');
        text('units','pixels','position',[3 -9],'BackgroundColor','r','fontsize',12,'string',s_name,'Interpreter','none');
        text('position',[0.3 0.5],'BackgroundColor','w','fontsize',16,'string','FS failed to output labels','Interpreter','none');
        axis off;
        saveas(gca,char(strcat(dirOS,'Cortical_set_Axial_',txt,'.png')),'png')
        print('-dpng','-r70',char(strcat(dirOS,'Cortical_set_Axial_70_',txt,'.png')));
        close all;
        end
        
end

    




    


