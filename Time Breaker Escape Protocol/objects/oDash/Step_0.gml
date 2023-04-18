if (cooldown_active) {
    cooldown_progress = (current_time - cooldown_start_time) / cooldown_length;
    if (cooldown_progress >= 1) {
        cooldown_active = false;
    }
}

cooldown_active = true;
cooldown_start_time = current_time;