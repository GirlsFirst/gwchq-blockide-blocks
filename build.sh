docker stop gwchq-blocks-build-container || true
docker rm gwchq-blocks-build-container || true

docker build --no-cache --progress=plain -t gwchq-blocks-build-image .

docker run -d --name gwchq-blocks-build-container gwchq-blocks-build-image

docker cp gwchq-blocks-build-container:/app/src/blockly_compressed_horizontal.js ./blockly_compressed_horizontal.js
docker cp gwchq-blocks-build-container:/app/src/blockly_compressed_vertical.js ./blockly_compressed_vertical.js
docker cp gwchq-blocks-build-container:/app/src/blockly_uncompressed_horizontal.js ./blockly_uncompressed_horizontal.js
docker cp gwchq-blocks-build-container:/app/src/blockly_uncompressed_vertical.js ./blockly_uncompressed_vertical.js
docker cp gwchq-blocks-build-container:/app/src/blocks_compressed.js ./blocks_compressed.js
docker cp gwchq-blocks-build-container:/app/src/blocks_compressed_horizontal.js ./blocks_compressed_horizontal.js
docker cp gwchq-blocks-build-container:/app/src/blocks_compressed_vertical.js ./blocks_compressed_vertical.js

docker cp gwchq-blocks-build-container:/app/src/package-lock.json ./package-lock.json

docker stop gwchq-blocks-build-container || true
docker rm gwchq-blocks-build-container || true
