var float current_xhair = 0;

vector con_size;

// Packet handler function definitions, they're only here so that we can call them
// in CSQC_Parse_Event without spamming the prototype declarations at top of file
void() packet_xhair;