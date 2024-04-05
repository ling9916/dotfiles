#!/bin/bash

DEST_DIR=$HOME/.config
SCRIPT_DIR=$(cd $(dirname $0); pwd)   # 获取当前执行的脚本文件所在的目录

# 检查 $DEST_DIR 是否存在。
if [[ ! -d "$DEST_DIR" ]]; then
  set flag
  echo "install.sh: < ${DEST_DIR} > not exist."
  echo "auto create it? [Y/n]?  (dafulf=Y) ";  read flag
  if [[ ${flag,,} = "y" ]] || [[ -z ${flag} ]]; then
    mkdir $DEST_DIR
  else
    echo "推出脚本"
    exit 1
  fi
  unset flag
fi

# 遍历当前文件，并在$HOME/.config下建立对应软连接
for name in `ls ${SCRIPT_DIR}`; do
  if [[ ! -d "${SCRIPT_DIR}/${name}" ]]; then
    continue
  fi

  ln -sf ${SCRIPT_DIR}/${name} $DEST_DIR
done


if [[ -f $HOME/.config/zsh/zshrc ]]; then
  echo "[[ -f $HOME/.config/zsh/zshrc ]] && source $HOME/.config/zsh/zshrc" >> $HOME/.zshrc
fi 


cat > $SCRIPT_DIR/vim << EOF
#!/bin/bash
main() {
  if which nvim >/dev/null; then
    command nvim "\$@"
  else
    command /usr/bin/vim "\$@"
  fi
}
main "\$@"
EOF

if [[ ! -d /usr/local/bin ]]; then
  sudo mkdir /usr/local/bin
fi 

chmod 755 $SCRIPT_DIR/vim && sudo mv $SCRIPT_DIR/vim /usr/local/bin/vim



