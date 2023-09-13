docker run --rm -it \
    -v "$(pwd)":/home/rust/src \
    -v "${HOME}/.cargo/registry":/root/.cargo/registry \
    -v "${HOME}/.cargo/git":/root/.cargo/git \
    -e CARGO_HOME=/home/rust/src \
    ekidd/rust-musl-builder cargo build --release

cp target/x86_64-unknown-linux-musl/release/custom_rt_rust bootstrap
zip -9 -r -q lambda.zip ./bootstrap
cp lambda.zip ~/Desktop/lambda.zip
rm lambda.zip bootstrap