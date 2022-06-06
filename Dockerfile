FROM	 testcab/yay

RUN	sudo pacman -Syu --noconfirm



RUN yay -S android-ndk powershell --noconfirm 

RUN sudo pacman -S llvm clang ninja wget unzip zsh --noconfirm

RUN mkdir custBin && cd custBin && wget https://nightly.link/RedBrumbler/QuestPackageManager-Rust/workflows/cargo-build/main/linux-qpm-rust.zip && unzip linux-qpm-rust.zip && rm linux-qpm-rust.zip && sudo chmod +x qpm-rust


# Add bin directory to PATH
ENV PATH=$PATH:/home/makepkg/custBin

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN echo "Android NDK path is /opt/android-ndk"

CMD ["/bin/zsh"]