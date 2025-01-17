% Query to identify flood level and user location during a flood
flood_response(minor, inside, Response).
flood_response(severe, inside, Response).
flood_response(minor, outside, Response).
flood_response(severe, outside, Response).

% Post-flood precautions
post_flood_precautions(Precautions).
