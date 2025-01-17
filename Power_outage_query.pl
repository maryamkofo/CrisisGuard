% Query to detect if there is a power outage
is_power_outage_detected(true).

% Query to determine the outage duration (short-term or extended)
outage_duration(short_term).
outage_duration(extended).

% Query to determine user status during a power outage
is_user_in_room(true).
is_user_in_dark(true).
is_user_in_trouble(true).
is_user_safe(true).
is_weather_extreme(true).
is_flashlight_available(true).
is_generator_available(true).
is_battery_pack_available(true).
is_user_in_medical_need(true).
is_user_at_home(true).
is_communication_device_available(true).
is_fridge_powered(true).
is_food_spoiled(true).
is_power_restored(false).

% Example usage for power outage recommendations
recommendation(prepare_for_extended_outage).
recommendation(prepare_for_short_outage).
recommendation(use_backup_power_for_medical_devices).
recommendation(switch_to_battery_pack).
recommendation(use_generator).
recommendation(use_battery_pack).
recommendation(use_candles).
recommendation(use_torch).
recommendation(save_phone_battery).
recommendation(look_for_charging_station).
recommendation(stay_warm).
recommendation(stay_cool).
recommendation(preserve_food).
recommendation(throw_away_spoiled_food).
adaptation(preserve_battery).
adaptation(switch_to_backup_power).
adaptation(seek_shelter).
action(check_home_for_damage).
action(dispose_of_spoiled_food).
