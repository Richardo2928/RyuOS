# Use:
#   niri-pill.sh text  <prev|focus|next>   -> prints the label for that slot
#   niri-pill.sh click <prev|focus|next>   -> focus the window of that slot
#
# Dependencies: niri, jq


MAX_LEN_NEIGHBOR=14   # máx. characters for prev/next
MAX_LEN_FOCUS=22      # máx. characters for the focused window

# Ventanas del workspace actual, ordenadas por posición de columna en el strip
get_state() {
  local focused_ws
  focused_ws=$(niri msg -j focused-window 2>/dev/null | jq -r '.workspace_id // empty')

  if [ -z "$focused_ws" ]; then
    echo "[]"
    return
  fi

  niri msg -j windows | jq --argjson ws "$focused_ws" '
    map(select(.workspace_id == $ws))
    | sort_by(.layout.pos_in_scrolling_layout[0])
  '
}

truncate() {
  local text="$1" max="$2"
  if [ "${#text}" -gt "$max" ]; then
    printf '%s…' "${text:0:$((max - 1))}"
  else
    printf '%s' "$text"
  fi
}

label_for() {
  jq -r '.app_id // .title // "?"'
}

# Devuelve el objeto JSON de la ventana en ese slot, o "" si no existe
slot_window() {
  local slot="$1" state="$2"
  local focused_idx
  focused_idx=$(echo "$state" | jq 'map(.is_focused) | index(true)')

  if [ "$focused_idx" = "null" ]; then
    echo ""
    return
  fi

  case "$slot" in
    focus) echo "$state" | jq -c ".[$focused_idx]" ;;
    prev)  echo "$state" | jq -c ".[$((focused_idx - 1))] // empty" ;;
    next)  echo "$state" | jq -c ".[$((focused_idx + 1))] // empty" ;;
    *) echo "slot inválido: $slot" >&2; exit 1 ;;
  esac
}

cmd="${1:-}"
slot="${2:-}"

if [ -z "$cmd" ] || [ -z "$slot" ]; then
  echo "uso: $0 {text|click} {prev|focus|next}" >&2
  exit 1
fi

state=$(get_state)
win=$(slot_window "$slot" "$state")

case "$cmd" in
  text)
    if [ -z "$win" ]; then
      # Sin vecino en ese lado: el ícono lo pone format-icons via "alt",
      # aquí solo mandamos el tooltip
      jq -nc --arg tooltip "¡Miau!" '{text: "", tooltip: $tooltip, alt: "empty"}'
      exit 0
    fi

    label=$(echo "$win" | label_for)
    title_full=$(echo "$win" | jq -r '.title // .app_id // "?"')

    if [ "$slot" = "focus" ]; then
      display_text=$(truncate "$label" "$MAX_LEN_FOCUS")
    else
      display_text=$(truncate "$label" "$MAX_LEN_NEIGHBOR")
    fi

    jq -nc --arg text "$display_text" --arg tooltip "$title_full" \
      '{text: $text, tooltip: $tooltip, alt: "window"}'
    ;;
  click)
    if [ -z "$win" ]; then
      exit 0
    fi
    id=$(echo "$win" | jq -r '.id')
    niri msg action focus-window --id "$id"
    ;;
  *)
    echo "comando inválido: $cmd" >&2
    exit 1
    ;;
esac
