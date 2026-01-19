delete_orphans(){
  orphans=$(pacman -Qdtq)

  if [ -z "$orphans" ]; then
    echo "No orphan packages found."
  else
    if [[ "$deleteOrphans" = "y" || "$deleteOrphans" = "Y" ]]; then 
      sudo pacman -Rns $orphans
    fi
  fi
}

echo "1: Update system packages"
echo "2: Manage orphan packages"

read -p "Option: " option

case "$option" in 
  1)
    sudo pacman -Syu
    ;;
  2)
    delete_orphans
  ;;
esac
