#!/bin/bash
sudo sed -i.bak '/policy domain="coder" rights="read|write" pattern="PDF"/d' /etc/ImageMagick-6/policy.xml
sudo apt install rename 
cd $HOME/clone
mkdir $HOME/clone/mghwork
mv *.zip $HOME/clone/mghwork/brochure.zip
cd mghwork
zip --delete brochure.zip "__MACOSX/*"
unzip brochure.zip
x=$(find . -name "*.pdf");
y=${x##*/}
mghref=${y//.pdf/""}
echo ${mghref}
mkdir brochure
mkdir big-images
rename 's/\.JPG$/\.jpg/' *.JPG
cp *.jpg big-images
cp *.jpg brochure
cp *.pdf brochure
rm *.jpg
rm *.pdf
rm *.zip
cd big-images
#inside big-images
ls
python $HOME/clone/rename.py
mogrify -interlace plane *.jpg
cp *.jpg ../
ls ../
# finish big-images
#Start Brochure
cd $HOME/clone/mghwork/brochure
mv *.pdf brochure.pdf
mogrify -resize 890 *.jpg
python $HOME/clone/rename.py
for x in *.jpg; do convert "$x" '-background' 'transparent' '-fill' 'rgba(255,255,255,0.4)' '-pointsize' '50' '-size' '640x160' '-gravity' 'center' '-annotate' '+0+0' 'm a x g o l d h o u s e' "$x"; done;
convert $HOME/clone/Front.jpg brochure.pdf *.jpg $HOME/clone/Back.jpg  "$mghref.pdf"
cp "$mghref.pdf" ../
#rm -r big-images
#rm -r brochure
echo "${GSUTIL_KEY}" > "$HOME/clone/gsutil-key.json"
gsutil -m -o Credentials:gs_service_key_file=$HOME/clone/gsutil-key.json cp $HOME/clone/mghwork/*.* "gs://xousian.appspot.com/$mghref"
gsutil -o Credentials:gs_service_key_file=$HOME/clone/gsutil-key.json acl ch -u AllUsers:R "gs://xousian.appspot.com/$mghref/$mghref.pdf"
#
sleep 25s
wget "https://xousian.appspot.com/listbucket/$mghref?a=renew"
# --skip-ci
