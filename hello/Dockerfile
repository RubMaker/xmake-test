# 使用 CentOS Stream 9 作为基础镜像
FROM rockylinux:9

# 安装 RPM 打包所需的所有工具
RUN dnf install -y 'dnf-command(config-manager)' \
    && dnf config-manager --set-enabled crb \
    && dnf install -y rpm-build git make gcc gcc-c++ procps-ng -y \
    && rm -rf /var/cache/yum/*

# 安装一个可被 dnf 感知的 xmake 版本
# 这样可以满足 .spec 文件中的 BuildRequires 依赖
RUN bash <(curl -fsSL https://xmake.io/shget.sh)

# 设置工作目录并创建一个非 root 用户
RUN useradd -m builder
USER builder
WORKDIR /home/builder
