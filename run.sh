
rm  -r /project/train/src_repo/dataset
mkdir /project/train/src_repo/dataset
mkdir /project/train/src_repo/dataset/Annotations
mkdir /project/train/src_repo/dataset/images
mkdir /project/train/src_repo/dataset/ImageSets
mkdir /project/train/src_repo/dataset/labels
mkdir /project/train/src_repo/dataset/ImageSets/Main

cp /home/data/831/*.xml /project/train/src_repo/dataset/Annotations
cp /home/data/831/*.jpg  /project/train/src_repo/dataset/images

python /project/train/src_repo/split_train_val.py --xml_path /project/train/src_repo/dataset/Annotations  --txt_path /project/train/src_repo/dataset/ImageSets/Main
cp /project/train/src_repo/voc_label.py /project/train/src_repo/dataset
python /project/train/src_repo/dataset/voc_label.py

python /project/train/src_repo/yolov5/train.py   --data helmet.yaml --project /project/train/models/train
