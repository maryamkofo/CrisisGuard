% Query to find if a break-in occurred at home or in a vehicle
location_of_break_in(home).
location_of_break_in(vehicle).

% Query to find if the break-in was inside or outside the home
location_of_Person(home, inside).
location_of_Person(home, outside).

% Example usage for a break-in scenario
break_in_response(home_invasion, inside, Response).
break_in_response(home_invasion, outside, Response).
break_in_response(vehicle_break_in, inside, Response).
break_in_response(vehicle_break_in, outside, Response).
