
/**
 * CSQC Entrypoint, called when the server sends a multicast packet
 */
void() CSQC_Parse_Event =
{
    float packet_type = readbyte();

    switch(packet_type)
    {
        case PACKET_SC_XHAIR: packet_xhair(); break;
        default: error(strcat("CSQC_Parse_Event Unexpected packet_type: ", ftos(packet_type), EOL));
    }
}


/* ============================ */
/* = Packet Handler Functions = */
/* ============================ */
/* Ideally these should be moved to other files, later */

void() packet_xhair =
{
    float xhair_type = readbyte();
    current_xhair = xhair_type; // Set global

    // Set crosshair color based on crosshair type
    string xhair_color = "255 255 255";
    switch(current_xhair) {
        case CROSSHAIR_INTERACT: xhair_color = "0 255 0"; break;
        case CROSSHAIR_TEAM: xhair_color = "0 255 0"; break;
        case CROSSHAIR_ENEMY: xhair_color = "255 0 0"; break;
    }

    cvar_set("crosshair", ftos(current_xhair+1));
    cvar_set("crosshaircolor", xhair_color);
}