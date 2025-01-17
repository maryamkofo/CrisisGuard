% Facts: Defining where the break-in took place (home / vehicle)
break_in(home).
break_in(vehicle).

% Facts: If the break-in was at home, was the PERSON inside OR outside
break_spec(home, inside).
break_spec(home, outside).

% Facts: If the break-in was in a vehicle, was the person inside?
break_spec(vehicle, inside).

% Rules: Checking the location (home / vehicle) of the break-in
location_of_break_in(Place) :-
    break_in(Place).

% Rules: Checking the location (inside / outside) of the PERSON IF it was a home break-in
location_of_Person(home, Location) :-
    break_spec(home, Location).

% Recommendation: If the break-in occurred at home AND the PERSON was inside:
recommendation(home, inside) :- 
    write('If the break-in occurred at home and the person was inside, consider the following: '), nl,
    write('1. Securing inside a room.'), nl, 
    write('2. Hiding, and turning off the lights.'), nl,
    write('3. Call 911.'), nl,
    write('Preventive Measures: '), nl,
    write('- Install motion detectors and security cameras.'), nl,
    write('- Reinforce doors and locks.'), nl,
    write('- Trim shrubs and bushes outside to reduce hiding spots.'), nl,
    write('- Notify Neighbours without revealing personal details.'), nl.

% Recommendation: If the break-in occurred at home AND the PERSON was outside
recommendation(home, outside) :-
    write('If the break-in occurred at home and the person was outside, consider the following: '), nl,
    write('1. Go to the nearest police station or safe spot and call for help.'), nl,
    write('2. Avoid returning home until the police arrive.'), nl.

% Recommendation: If the break-in was in a vehicle and the person was inside
recommendation(vehicle, inside) :-
    write('If the break-in occurred in a vehicle and the person was inside, consider the following: '), nl,
    write('1. Stay calm and do not confront the intruder if they are armed.'), nl,
    write('2. Lock the doors and roll up the windows.'), nl,
    write('3. If the intruder has not entered, call 911 immediately.'), nl,
    write('4. Provide your location and situation to the dispatcher.'), nl,
    write('Preventive Measures for Vehicle: '), nl,
    write('- Always keep doors and windows locked at all times.'), nl,
    write('- Install a car alarm system.'), nl,
    write('- Always park in well-lit and secure areas.'), nl.

% Recommendation: If the break-in was in a vehicle and the person was not inside
recommendation(vehicle, outside) :-
    write('If the break-in occurred in a vehicle and the person was not inside, consider the following: '), nl,
    write('1. Move to a safe location and call 911 immediately.'), nl,
    write('2. File a police report and document any damage or stolen items.'), nl,
    write('Preventive Measures for Vehicle: '), nl,
    write('- Always keep doors and windows locked at all times.'), nl,
    write('- Install a car alarm system.'), nl,
    write('- Always park in well-lit and secure areas.'), nl.

% Break-in Scenario (break_in_response/3)
break_in_response(Type, Location, Response) :-
    Type = home_invasion,
    Location = inside,
    Response = "Secure yourself in a room, turn off the lights, and call 911.".

break_in_response(Type, Location, Response) :-
    Type = home_invasion,
    Location = outside,
    Response = "Go to the nearest police station or safe place and call 911. Do not return until police arrive.".

break_in_response(Type, Location, Response) :-
    Type = vehicle_break_in,
    Location = inside,
    Response = "Stay calm, do not confront the intruder. Lock doors, call 911, and use horn and lights to alert others.".

break_in_response(Type, Location, Response) :-
    Type = vehicle_break_in,
    Location = outside,
    Response = "Move to a safe location, call 911, and file a report. Contact insurance and report stolen items.".

% Preventative Measures for Break-ins (preventative_measures/2)
preventative_measures(home_invasion, Measures) :-
    Measures = "Install cameras, reinforce doors, use motion detectors, and trim shrubs outside your home.".

preventative_measures(vehicle_break_in, Measures) :-
    Measures = "Always lock doors, park in well-lit areas, install alarms, and use a steering wheel lock.".

% Define facts for environmental conditions and user status
is_power_outage_detected(true).
outage_duration(short_term).  % Could also be extended
is_user_in_room(true).
is_user_in_dark(false).
is_user_in_trouble(false).
is_user_safe(true).
is_weather_extreme(false).
is_flashlight_available(true).
is_generator_available(true).
is_battery_pack_available(true).
is_user_in_medical_need(false).  % e.g., ventilator, oxygen supply
is_user_at_home(true).
is_communication_device_available(true).
is_fridge_powered(true).
is_food_spoiled(false).
is_power_restored(false).

% Recommendations based on outage duration (short-term or extended)
recommendation(prepare_for_extended_outage) :- outage_duration(extended), is_power_outage_detected(true), is_power_restored = false.
recommendation(prepare_for_short_outage) :- outage_duration(short_term), is_power_outage_detected(true), is_power_restored = false.

% If the user relies on medical devices, advise using backup power sources
recommendation(use_backup_power_for_medical_devices) :- is_power_outage_detected(true), is_user_in_medical_need(true), is_generator_available(true).
recommendation(switch_to_battery_pack) :- is_power_outage_detected(true), is_user_in_medical_need(true), is_battery_pack_available(true).

% If the user has access to a generator or battery packs, advise using them
recommendation(use_generator) :- is_power_outage_detected(true), is_generator_available(true), is_user_in_medical_need = false.
recommendation(use_battery_pack) :- is_power_outage_detected(true), is_battery_pack_available(true), is_user_in_medical_need = false.

% Lighting advice (candles, torches)
recommendation(use_candles) :- is_power_outage_detected(true), is_user_in_dark(true), is_flashlight_available = false.
recommendation(use_torch) :- is_power_outage_detected(true), is_user_in_dark(true), is_flashlight_available(true).

% Saving battery advice (on phone or communication devices)
recommendation(save_phone_battery) :- is_power_outage_detected(true), is_communication_device_available(true), is_user_in_room(true).

% Suggesting local areas with power availability for charging
recommendation(look_for_charging_station) :- is_power_outage_detected(true), is_communication_device_available(true), is_power_restored = false.

% If extreme weather conditions are present, advise staying safe
recommendation(stay_warm) :- is_power_outage_detected(true), is_weather_extreme(true), is_power_restored = false.
recommendation(stay_cool) :- is_power_outage_detected(true), is_weather_extreme(true), is_power_restored = false.

% Encourage the user to preserve food and water
recommendation(preserve_food) :- is_power_outage_detected(true), is_fridge_powered(true), is_user_in_room(true).
recommendation(throw_away_spoiled_food) :- is_power_outage_detected(true), is_food_spoiled(true), is_user_in_room(true).

% Adaptive actions based on the outage duration and available resources
adaptation(preserve_battery) :- outage_duration(extended), is_power_outage_detected(true), is_communication_device_available(true).
adaptation(switch_to_backup_power) :- outage_duration(extended), is_power_outage_detected(true), is_generator_available(true).
adaptation(seek_shelter) :- is_power_outage_detected(true), is_weather_extreme(true), is_power_restored = false.

% Post-outage advice: Check food spoilage and damages
action(check_home_for_damage) :- is_power_outage_detected(true), is_power_restored(true), is_user_at_home(true).
action(dispose_of_spoiled_food) :- is_power_outage_detected(true), is_food_spoiled(true), is_user_at_home(true).

% Fire Scenario (fire_response/3)
fire_response(FireSize, UserLocation, Response) :-
    FireSize = small,
    UserLocation = inside,
    Response = "Use a blanket to cut off oxygen, or a fire extinguisher. Turn off power if safe. If uncontrollable, exit and call for help.".

fire_response(FireSize, UserLocation, Response) :-
    FireSize = big,
    UserLocation = near_exit,
    Response = "Exit the building safely and call 911.".

fire_response(FireSize, UserLocation, Response) :-
    FireSize = big,
    UserLocation = trapped,
    Response = "Stay low to the ground, cover mouth with cloth, and signal for help.".

% Instructions for using a fire extinguisher (fire_extinguisher_instructions/1)
fire_extinguisher_instructions(Instructions) :-
    Instructions = "Pull the pin, aim the nozzle at the base of the fire, squeeze the handle, and sweep back and forth.".

% Flood Scenario (flood_response/3)
flood_response(FloodLevel, UserLocation, Response) :-
    FloodLevel = minor,
    UserLocation = inside,
    Response = "Move to higher ground, unplug electronics, and gather important documents.".

flood_response(FloodLevel, UserLocation, Response) :-
    FloodLevel = severe,
    UserLocation = inside,
    Response = "Move to the rooftop and call for help. Avoid windows and elevators.".

flood_response(FloodLevel, UserLocation, Response) :-
    FloodLevel = minor,
    UserLocation = outside,
    Response = "Move to higher ground away from water sources. Avoid walking or driving through flooded areas.".

flood_response(FloodLevel, UserLocation, Response) :-
    FloodLevel = severe,
    UserLocation = outside,
    Response = "Find the highest ground available. Avoid roads and floodwaters, and wait for emergency services.".

% Post-flood precautions (post_flood_precautions/1)
post_flood_precautions(Precautions) :-
    Precautions = "Do not use floodwater for cooking or drinking. Boil water for at least 1 minute. Check for gas leaks and damaged wiring. Inspect walls for cracks, and discard spoiled food.".
