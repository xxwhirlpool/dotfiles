until gotify-desktop; do
    echo "'gotify' crashed with exit code $?.  Respawning.." >&2
    sleep 1
done
