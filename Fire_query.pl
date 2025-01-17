% Query to identify fire size and user location during a fire
fire_response(small, inside, Response).
fire_response(big, near_exit, Response).
fire_response(big, trapped, Response).

% Instructions for using a fire extinguisher
fire_extinguisher_instructions(Instructions).
