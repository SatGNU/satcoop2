const float PID_POOL_LEN = 4; // Limited to number of tp's in satbase

typedef struct
{
    float pid_slots[PID_POOL_LEN];
} sc_gamestate_t;

var sc_gamestate_t sc_gamestate;

class GameStateManager
{
    nonvirtual void() load;

    void() GameStateManager =
    {
        this.load();

        // Always flush player ids
        for(float i=0; i<PID_POOL_LEN; i++) {
            sc_gamestate.pid_slots[i] = 0;
            dprint("Out of bounds?? ", ftos(i), EOL);
        }
    };

    /**
     * Uses FRIK_FILE to deserialize the gamestate to disk
     */
    nonvirtual void() load =
    {
        float file = fopen("gamestate.dat", FILE_READ);
        if(file < 0) {
            return;
        }

        // Deserialize here

        fclose(file);
    };

    /**
     * Uses FRIK_FILE to serialize the gamestate to disk
     */
    nonvirtual void() save =
    {
        float file = fopen("gamestate.dat", FILE_WRITE);

        // Cereal eyes here

        fclose(file);
    };

    /**
     * Takes the next available player ID from the pool
     */
    nonvirtual float() takeNextFreePlayerId =
    {
        for(float i=0; i<PID_POOL_LEN; i++) {
            if(sc_gamestate.pid_slots[i] == 0) {
                sc_gamestate.pid_slots[i] = 1;
                return (i+1);
            }
        }

        return -1;
    };

    /**
     * This frees the given Player ID from the pool. Usually called on disconnect from cluster
     */
    nonvirtual void(float id) freePlayerId =
    {
        id--;
        if(id<0) {
            return; // Safety, but should never happen
        }

        sc_gamestate.pid_slots[id] = 0;
    };
};