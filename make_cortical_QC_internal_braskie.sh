#Usage: bash download_CSV_Braskie.sh <output directory>
#Author - Deydeep Kothapalli

QC_directory=$1
cd $QC_directory
subject_list=`ls -d */`

#all the segmented regions
regions=("temporalpole" "frontalpole" "bankssts" "superiortemporal" "middletemporal" "precentral" "postcentral" "supramarginal" "superiorparietal" "precuneus" "cuneus" "pericalcarine" "lingual" "superiorfrontal" "rostralanteriorcingulate" "caudalanteriorcingulate" "posteriorcingulate" "isthmuscingulate" "medialorbitofrontal" "inferiortemporal" "lateraloccipital" "inferiorparietal" "caudalmiddlefrontal" "rostralmiddlefrontal" "lateralorbitofrontal" "parsorbitalis" "parstriangularis" "parsopercularis" "insula" "transversetemporal" "entorhinal" "paracentral" "fusiform" "parahippocampal")

echo "<!doctype html>  " >> corticalQC.html
echo "<html>  " >> corticalQC.html
echo "<meta name="viewport" content="width=device-width, initial-scale=1.0">" >> corticalQC.html
echo "<head></head>  " >> corticalQC.html

#grid and grid item - style settings 
echo "<style>" >> corticalQC.html
echo ".grid-container {" >> corticalQC.html
echo "  display: grid;" >> corticalQC.html
echo "  grid-template-columns: auto auto auto auto auto;" >> corticalQC.html
echo "  padding: 0px;" >> corticalQC.html
echo "}" >> corticalQC.html
echo ".grid-item {" >> corticalQC.html
echo "  border: 0px solid rgba(0, 0, 0, 0);" >> corticalQC.html
echo "  justify-content: center;" >> corticalQC.html
echo "  padding: 10px;" >> corticalQC.html
echo "  font-size: 20px;" >> corticalQC.html
echo "  font-color: white;" >> corticalQC.html
echo "}" >> corticalQC.html

echo ".card {" >> corticalQC.html
echo "        display: inline-block;" >> corticalQC.html
echo "position: relative;" >> corticalQC.html
echo "margin: 50px;" >> corticalQC.html
echo "    }" >> corticalQC.html
echo "    .card .img-top {" >> corticalQC.html
echo "        display: none;" >> corticalQC.html
echo "	position: absolute;" >> corticalQC.html
echo "top: 0;" >> corticalQC.html
echo "left: 0;" >> corticalQC.html
echo "z-index: 99;" >> corticalQC.html
echo "    }" >> corticalQC.html
echo "    .card:hover .img-top {" >> corticalQC.html
echo "        display: inline;" >> corticalQC.html
echo "    }" >> corticalQC.html

#Follow-Me Bar
echo ".sticky {" >> corticalQC.html
echo "  position: -webkit-sticky;" >> corticalQC.html
echo "  position: -moz-sticky;" >> corticalQC.html
echo "  position: -o-sticky;" >> corticalQC.html
echo "  position: -ms-sticky;" >> corticalQC.html
echo "  position: sticky;" >> corticalQC.html
echo "  top: 0;" >> corticalQC.html
echo "  left: 0;" >> corticalQC.html
echo "  right: 0;" >> corticalQC.html
echo "  display: block;" >> corticalQC.html
echo "  z-index: 1;" >> corticalQC.html
echo "  background: #000000;" >> corticalQC.html
echo "  color: #F8F4FF;" >> corticalQC.html
echo "  padding: 10px 20px;" >> corticalQC.html
echo "}" >> corticalQC.html

#button - style settings 
echo "button {" >> corticalQC.html
echo "  background: none repeat scroll 0 0 #008000;" >> corticalQC.html
echo "  border: medium none;" >> corticalQC.html
echo "  color: #FFFFFF;" >> corticalQC.html
echo "  height: 50px;" >> corticalQC.html
echo "  position: fixed;" >> corticalQC.html
echo "bottom: 10px;" >> corticalQC.html
echo "<font color=white> Right: </font> 10px;" >> corticalQC.html
echo "  width: 200px;" >> corticalQC.html
echo "font-size: 25px;" >> corticalQC.html
echo "}" >> corticalQC.html
echo "</style>" >> corticalQC.html

echo "<body style="background-color:black">" >> corticalQC.html

result=${PWD##*/}_corticalQCresults.csv

echo "<a href='#'onclick='downloadCSV({ filename: \"$result\" });'>" >> corticalQC.html
echo "<button type=\"button\">Download .csv</button>" >> corticalQC.html
echo "</a>" >> corticalQC.html
echo "</form><p><FONT COLOR=WHITE FACE=\"Geneva, Arial\" SIZE=10> QC Performed By: </FONT></p><textarea id="rater_name" rows="3" cols="30" form="usrform"></textarea>" >> corticalQC.html

for sub in ${subject_list};
do

echo "<div data-lorem='H1'>" >> corticalQC.html
echo "  <span class="sticky">
<FONT COLOR=WHITE FACE=\"Geneva, Arial\" SIZE=10> ${sub%/} </FONT> 
</span>" >> corticalQC.html
echo "  <div class="grid-container">" >> corticalQC.html
echo "  <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_10.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_10.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_10.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_10.png';\" width=\"100%\" ></a></div>" >> corticalQC.html
echo "  <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_12.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_12.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_12.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_12.5.png';\" width=\"100%\" ></a></div>" >> corticalQC.html
echo "  <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_15.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_15.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_15.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_15.png';\" width=\"100%\" ></a></div>" >> corticalQC.html
echo "  <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_17.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_17.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_17.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_17.5.png';\" width=\"100%\" ></a></div>" >> corticalQC.html
echo "  <div class="grid-item">
<table bgcolor="#13B38B"><tr><td><font color=white> superiorparietal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="superiorparietalleft_${sub%/}" > <font color=white> Right: </font> <input type="checkbox" id="superiorparietalright_${sub%/}"></form><br>
<table bgcolor="#DC3CDC"><tr><td><font color=white> inferiorparietal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="inferiorparietalleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="inferiorparietalright_${sub%/}"></form><br>
<table bgcolor="#DC1464"><tr><td><font color=white> cuneus </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="cuneusleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="cuneusright_${sub%/}"></form><br>
<table bgcolor="#78643C"><tr><td><font color=white> pericalcarine </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="pericalcarineleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="pericalcarineright_${sub%/}"></form><br>
</div>" >> corticalQC.html

echo "  <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_20.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_20.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_20.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_20.png';\" width=\"100%\" ></a></div>" >> corticalQC.html
echo "  <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_22.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_22.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_22.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_22.5.png';\" width=\"100%\" ></a></div>" >> corticalQC.html
echo "  <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_25.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_25.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_25.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_25.png';\" width=\"100%\" ></a></div>  " >> corticalQC.html
echo "  <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_27.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_27.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_27.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_27.5.png';\" width=\"100%\" ></a></div>" >> corticalQC.html
echo "  <div class="grid-item">
<table bgcolor="#A08CB4"><tr><td><font color=white> precuneus </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="precuneusleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="precuneusright_${sub%/}"></form><br>
<table bgcolor="#E18C8C"><tr><td><font color=white> lingual </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="lingualleft_${sub%/}" > <font color=white> Right: </font> <input type="checkbox" id="lingualright_${sub%/}"></form><br>
<table bgcolor="#141E8C"><tr><td><font color=white> lateraloccipital </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="lateraloccipitalleft_${sub%/}" > <font color=white> Right: </font> <input type="checkbox" id="lateraloccipitalright_${sub%/}"></form><br>
<table bgcolor="#B3DB8B"><tr><td><font color=white> fusiform </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="fusiformleft_${sub%/}" > <font color=white> Right: </font> <input type="checkbox" id="fusiformright_${sub%/}"></form><br>
</div>" >> corticalQC.html

echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_30.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_30.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_30.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_30.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_32.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_32.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_32.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_32.5.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_35.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_35.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_35.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_35.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_37.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_37.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_37.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_37.5.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo "  <div class="grid-item">
<table bgcolor="#3CDC3C"><tr><td><font color=white> paracentral </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="paracentralleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="paracentralright_${sub%/}"></form><br>
<table bgcolor="#8C148C"><tr><td><font color=white> isthmuscingulate </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="isthmuscingulateleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="isthmuscingulateright_${sub%/}"></form><br>
<table bgcolor="#A06432"><tr><td><font color=white> middletemporal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="middletemporalleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="middletemporalright_${sub%/}"></form><br>
<table bgcolor="#B42878"><tr><td><font color=white> inferiortemporal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="inferiortemporalleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="inferiortemporalright_${sub%/}"></form><br>
</div>" >> corticalQC.html

echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_40.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_40.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_40.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_40.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_45.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_42.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_42.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_42.5.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_42.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_45.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_45.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_45.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_47.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_47.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_47.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_47.5.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo "  <div class="grid-item">
<table bgcolor="#3C14DC"><tr><td><font color=white> precentral </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="precentralleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="precentralright_${sub%/}"></form><br>
<table bgcolor="#DC1414"><tr><td><font color=white> postcentral </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="postcentralleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="postcentralright_${sub%/}"></form><br>
<table bgcolor="#50A014"><tr><td><font color=white> supramarginal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="supramarginalleft_${sub%/}"><font color=white> Right: </font> <input type="checkbox" id="supramarginalright_${sub%/}"></form><br>
<table bgcolor="#196428"><tr><td><font color=white> bankssts </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="banksstsleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="banksstsright_${sub%/}"></form><br>
</div>" >> corticalQC.html

echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_50.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_50.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_50.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_50.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_52.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_52.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_52.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_52.5.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_55.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_55.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_55.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_55.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_57.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_57.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_57.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_57.5.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo "  <div class="grid-item">
<table bgcolor="#14DCA0"><tr><td><font color=white> superiorfrontal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="superiorfrontalleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="superiorfrontalright_${sub%/}"></form><br>
<table bgcolor="#8CDCDC"><tr><td><font color=white> superiortemporal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="superiortemporalleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="superiortemporalright_${sub%/}"></form><br>
<table bgcolor="#14DC3C"><tr><td><font color=white> parahippocampal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="parahippocampalleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="parahippocampalright_${sub%/}"><br>
<table bgcolor="#9696C8"><tr><td><font color=white> transversetemporal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="transversetemporalleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="transversetemporalright_${sub%/}"></form><br>
</div>" >> corticalQC.html

echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_60.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_60.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_60.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_60.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_62.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_62.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_62.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_62.5.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_65.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_65.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_65.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_65.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_67.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_67.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_67.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_67.5.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo "  <div class="grid-item">
<table bgcolor="#641900"><tr><td><font color=white> caudalmiddlefrontal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="caudalmiddlefrontalleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="caudalmiddlefrontalright_${sub%/}"></form><br>
<table bgcolor="#FFC020"><tr><td><font color=white> insula </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="insulaleft_${sub%/}" > <font color=white> Right: </font> <input type="checkbox" id="insularight_${sub%/}"></form><br>
</div>" >> corticalQC.html

echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_70.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_70.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_70.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_70.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_72.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_72.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_72.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_72.5.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_75.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_75.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_75.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_75.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_77.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_77.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_77.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_77.5.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo "  <div class="grid-item">
<table bgcolor="#DCB48C"><tr><td><font color=white> parsopercularis </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="parsopercularisleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="parsopercularisright_${sub%/}"></form><br>
<table bgcolor="#7C639F"><tr><td><font color=white> caudalanteriorcingulate </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="caudalanteriorcingulateleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="caudalanteriorcingulateright_${sub%/}"></form><br>
<table bgcolor="#DC140A"><tr><td><font color=white> entorhinal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="entorhinalleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="entorhinalright_${sub%/}"></form><br>
</div>" >> corticalQC.html

echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_80.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_80.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_80.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_80.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_82.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_82.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_82.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_82.5.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_85.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_85.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_85.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_85.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Coronal_87.5.png\"><img src=\""${sub%/}"/Cortical_set_Coronal_70_87.5.png\" onmouseout=\"this.src='"${sub%/}"/Cortical_set_Coronal_70_87.5.png';\" onmouseover=\"this.src='"${sub%/}"/Cortical_set_orig_Coronal_70_87.5.png';\" width=\"100%\" ></a></div>">> corticalQC.html
echo "  <div class="grid-item">
<table bgcolor="#4B327D"><tr><td><font color=white> rostralmiddlefrontal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="rostralmiddlefrontalleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="rostralmiddlefrontalright_${sub%/}"></form><br>
<table bgcolor="#DC3C14"><tr><td><font color=white> parstriangularis </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="parstriangularisleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="parstriangularisright_${sub%/}"></form><br>
<table bgcolor="#234632"><tr><td><font color=white> lateralorbitofrontal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="lateralorbitofrontalleft_${sub%/}" > <font color=white> Right: </font> <input type="checkbox" id="lateralorbitofrontalright_${sub%/}"></form><br>
<table bgcolor="#C8234B"><tr><td><font color=white> medialorbitofrontal </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="medialorbitofrontalleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="medialorbitofrontalright_${sub%/}"></form><br>
</div>" >> corticalQC.html

echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Axial_72.5png\"><img src=\""${sub%/}"/Cortical_set_Axial_70_72.5.png\" onmouseover=\"rollover(this)\" onmouseout=\"mouseaway(this)\"width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Axial_77.5.png\"><img src=\""${sub%/}"/Cortical_set_Axial_70_77.5.png\" onmouseover=\"rollover(this)\" onmouseout=\"mouseaway(this)\"width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Axial_82.5.png\"><img src=\""${sub%/}"/Cortical_set_Axial_70_82.5.png\" onmouseover=\"rollover(this)\" onmouseout=\"mouseaway(this)\"width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Axial_87.5.png\"><img src=\""${sub%/}"/Cortical_set_Axial_70_87.5.png\" onmouseover=\"rollover(this)\" onmouseout=\"mouseaway(this)\"width=\"100%\" ></a></div>">> corticalQC.html
echo "  <div class="grid-item">
<table bgcolor="#146432"><tr><td><font color=white> parsorbitalis </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="parsorbitalisleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="parsorbitalisright_${sub%/}"></form><br>
<table bgcolor="#464646"><tr><td><font color=white> temporalpole </font></td></tr></table> <font color=white> Left: </font> <input type="checkbox" id="temporalpoleleft_${sub%/}"><font color=white> Right: </font> <input type="checkbox" id="temporalpoleright_${sub%/}"><br>
</div>" >> corticalQC.html

echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Axial_32.5.png\"><img src=\""${sub%/}"/Cortical_set_Axial_70_32.5.png\" onmouseover=\"rollover(this)\" onmouseout=\"mouseaway(this)\"width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Axial_37.5.png\"><img src=\""${sub%/}"/Cortical_set_Axial_70_37.5.png\" onmouseover=\"rollover(this)\" onmouseout=\"mouseaway(this)\"width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Axial_42.5.png\"><img src=\""${sub%/}"/Cortical_set_Axial_70_42.5.png\" onmouseover=\"rollover(this)\" onmouseout=\"mouseaway(this)\"width=\"100%\" ></a></div>">> corticalQC.html
echo " <div class="grid-item"><a href=\"file:"${sub%/}"/Cortical_set_Axial_47.5.png\"><img src=\""${sub%/}"/Cortical_set_Axial_70_47.5.png\" onmouseover=\"rollover(this)\" onmouseout=\"mouseaway(this)\"width=\"100%\" ></a></div>">> corticalQC.html
echo "  <div class="grid-item">
<table bgcolor="#640064"><tr><td><font color=white> frontalpole </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="frontalpoleleft_${sub%/}"><font color=white> Right: </font> <input type="checkbox" id="frontalpoleright_${sub%/}"></form><br>
<table bgcolor="#50148C"><tr><td><font color=white> rostralanteriorcingulate </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="rostralanteriorcingulateleft_${sub%/}"> <font color=white> Right: </font> <input type="checkbox" id="rostralanteriorcingulateright_${sub%/}"></form><br>
<table bgcolor="#DCB4DC"><tr><td><font color=white> posteriorcingulate </font></td></tr></table><form><font color=white> Left: </font> <input type="checkbox" id="posteriorcingulateleft_${sub%/}" > <font color=white> Right: </font> <input type="checkbox" id="posteriorcingulateright_${sub%/}"></form>
</form><p><font color=white>Additional Notes:</font></p><textarea id="notes_${sub%/}" rows="4" cols="30" form="usrform"></textarea>
</div>" >> corticalQC.html

echo "</div>" >> corticalQC.html
echo "</div>" >> corticalQC.html
echo "</div>" >> corticalQC.html

done;

echo "<script type=\"text/javascript\">  " >> corticalQC.html

#convert the array to a csv
echo "function convertArrayOfObjectsToCSV(args) {" >> corticalQC.html
echo "        var result, ctr, keys, columnDelimiter, lineDelimiter, data;" >> corticalQC.html
echo "        data = args.data || null;" >> corticalQC.html
echo "        if (data == null || !data.length) {" >> corticalQC.html
echo "            return null;" >> corticalQC.html
echo "        }" >> corticalQC.html

echo "        columnDelimiter = args.columnDelimiter || ',';" >> corticalQC.html
echo "        lineDelimiter = args.lineDelimiter || '\n';" >> corticalQC.html
echo "        keys = Object.keys(data[0]);" >> corticalQC.html
echo "        result = '';" >> corticalQC.html
echo "        result += keys.join(columnDelimiter);" >> corticalQC.html
echo "        result += lineDelimiter;" >> corticalQC.html
echo "        data.forEach(function(item) {" >> corticalQC.html
echo "            ctr = 0;" >> corticalQC.html
echo "            keys.forEach(function(key) {" >> corticalQC.html
echo "                if (ctr > 0) result += columnDelimiter;" >> corticalQC.html
echo "                result += item[key];" >> corticalQC.html
echo "                ctr++;" >> corticalQC.html
echo "            });" >> corticalQC.html
echo "            result += lineDelimiter;" >> corticalQC.html
echo "        });" >> corticalQC.html
echo "        return result;" >> corticalQC.html
echo "    }" >> corticalQC.html


#called when the "Download .csv" button is pressed
echo "function downloadCSV(args) {" >> corticalQC.html
echo "var rater_name = document.getElementById(\"rater_name\").value" >> corticalQC.html

for sub in ${subject_list};
do
#get the notes for each subject, set default to pass

echo "var text_${sub%/} = document.getElementById(\"notes_${sub%/}\").value;" >> corticalQC.html
echo "var pass_${sub%/} = \"pass\"" >> corticalQC.html

#logic for printing R/L, L, R or nothing
for region in "${regions[@]}"
do
echo "var ${region}_${sub%/} = \"\"" >> corticalQC.html
echo "if (document.getElementById(\"${region}left_${sub%/}\").checked && document.getElementById(\"${region}right_${sub%/}\").checked) {" >> corticalQC.html
echo "    ${region}_${sub%/} = \"R\\\L\";" >> corticalQC.html
echo "    pass_${sub%/} = \"moderate\";" >> corticalQC.html
echo '}' >> corticalQC.html
echo "else if (document.getElementById(\"${region}left_${sub%/}\").checked){" >> corticalQC.html
echo "    ${region}_${sub%/} = \"L\";" >> corticalQC.html
echo "    pass_${sub%/} = \"moderate\";" >> corticalQC.html
echo '}' >> corticalQC.html
echo "else if (document.getElementById(\"${region}right_${sub%/}\").checked){" >> corticalQC.html
echo "    ${region}_${sub%/} = \"R\";" >> corticalQC.html
echo "    pass_${sub%/} = \"moderate\";" >> corticalQC.html
echo '}' >> corticalQC.html
done
done

echo "var corticalQCResults = [" >> corticalQC.html
for sub in ${subject_list};
do
echo "        {" >> corticalQC.html
echo "Subject: \"${sub%/}\"," >> corticalQC.html
echo "Rater: rater_name," >> corticalQC.html
echo "Internal_QC: pass_${sub%/}," >> corticalQC.html
echo "Notes_Questions: text_${sub%/}," >> corticalQC.html
for region in "${regions[@]}"
do
echo "${region}: ${region}_${sub%/}," >> corticalQC.html	
done
echo "        }," >> corticalQC.html
done
echo "    ];" >> corticalQC.html

echo "var data, filename, link;" >> corticalQC.html
echo "var csv = convertArrayOfObjectsToCSV({" >> corticalQC.html
echo "data: corticalQCResults" >> corticalQC.html
echo "});" >> corticalQC.html
echo "if (csv == null) return;" >> corticalQC.html
echo "filename = args.filename || 'export.csv';" >> corticalQC.html
echo "if (!csv.match(/^data:text\/csv/i)) {" >> corticalQC.html
echo "    csv = 'data:text/csv;charset=utf-8,' + csv;" >> corticalQC.html
echo "}" >> corticalQC.html
echo "data = encodeURI(csv);" >> corticalQC.html
echo "link = document.createElement('a');" >> corticalQC.html
echo "link.setAttribute('href', data);" >> corticalQC.html
echo "link.setAttribute('download', filename);" >> corticalQC.html
echo "link.click();" >> corticalQC.html
echo "}" >> corticalQC.html
echo "</script>  " >> corticalQC.html

echo "</body>  " >> corticalQC.html
echo "</html> " >> corticalQC.html