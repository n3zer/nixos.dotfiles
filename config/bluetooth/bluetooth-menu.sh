

# Получаем список известных устройств
DEVICES=$(bluetoothctl devices | awk '{print $2 " " $3}')

# Если нет устройств
if [[ -z "$DEVICES" ]]; then
    notify-send "Bluetooth" "Нет устройств"
    exit 0
fi

# Показываем меню через rofi
CHOICE=$(echo "$DEVICES" | rofi -dmenu -p "BT devices:")

# Если пользователь ничего не выбрал
[[ -z "$CHOICE" ]] && exit 0

# Берём только MAC адрес
MAC=$(echo "$CHOICE" | awk '{print $1}')

# Проверяем подключено ли устройство
STATE=$(bluetoothctl info "$MAC" | grep "Connected: yes")

if [[ -z "$STATE" ]]; then
    # Подключаем
    bluetoothctl connect "$MAC"
    notify-send "Bluetooth" "Подключено $CHOICE"
else
    # Отключаем
    bluetoothctl disconnect "$MAC"
    notify-send "Bluetooth" "Отключено $CHOICE"
fi