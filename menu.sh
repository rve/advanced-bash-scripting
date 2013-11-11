#/bin/bash
PS3='Choose: '
echo
function choice_of()
{
    select table in "cpu info" "mem info" "exit"
    do
        case "$table" in
            "cpu info" )
                cpu
                ;;
            "mem info" )
                mem
                ;;
            "exit" )
                exit 0
                ;;
            * )
                choice_of
                ;;
        esac
    break
    done
}
function cpu()
{
    select tab in "date" "cpu load" "main menu" "exit"
    do
        case "$tab" in
            "date" )
                date
                cpu
                ;;
            "cpu load" )
                top -bn1 | grep "Cpu"
                cpu
                ;;
            "main menu" )
                choice_of
                ;;
            "exit" )
                exit 0
                ;;
            *)
                cpu
                ;;
        esac
        break
    done
}
function mem()
{
    select tab in "free mem" "free swap" "main menu" "exit"
    do
        case "$tab" in
            "free mem" )
                cat /proc/meminfo | grep "MemFree" | awk '{print $2,$3}'
                mem
                ;;
            "free swap" )
                cat /proc/meminfo | grep "SwapFree" | awk '{print $2,$3}'
                mem
                ;;
            "main menu" )
                choice_of
                ;;
            "exit" )
                exit 0
                ;;
            *)
                mem
                ;;
        esac
        break
    done
}
choice_of
exit 0
