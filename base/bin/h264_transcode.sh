
INPUT=$1
OUTPUT=$2

ffmpeg -i "$INPUT" \
	-preset veryslow \
	-c:v libx264 \
	-profile:v high \
	-level 4.1 \
	-tune animation \
	-crf 18 \
	-c:a flac \
	-c:s copy \
	"$OUTPUT"
