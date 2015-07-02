batt=$(LC_ALL=C acpi -b)

case $batt in
*Discharging*)
    batt="${batt#* * * }"
    batt="${batt%%, *} "
    ;;
*)
    batt=""
    ;;
esac

xsetroot -name "$batt$(date +%R)"

sleep 5 && exec $0
