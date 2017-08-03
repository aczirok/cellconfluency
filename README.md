# cellconfluency

## dependencies:
	python-skimage
	python-opencv

## usage:
### to test/visualize threshold of standard deviation of local brightness

```
	segment.py -i image.jpg -S threshold -test test.jpg
```
	
### to calculate confluency

```
	area.sh -S threshold img1_001.jpg img2_002.jpg ....
```
	
### to process time lapse experiment
edit area.make, then 
```
	make -f area.make AREA	
```
See example folder:
* AF-GAMMA: images to be analyzed
* makefiles: location of area.make
* image_proc: output
* segment_thr: standard deviation threshold
* to run:
```
cd example
rm -rf image_proc segment_thr
cd makefiles
make AREA
```
