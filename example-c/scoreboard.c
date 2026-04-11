#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* A compact C example with enums, structs, qsort, and formatted output. */
#define ARRAY_LEN(array) (sizeof(array) / sizeof((array)[0]))

typedef enum {
    SORT_BY_POINTS,
    SORT_BY_NAME,
} SortMode;

typedef struct {
    const char *name;
    unsigned wins;
    unsigned draws;
    unsigned losses;
    int bonus;
} Player;

static unsigned
games_played(const Player *player)
{
    return player->wins + player->draws + player->losses;
}

static int
points(const Player *player)
{
    return (int)(player->wins * 3u + player->draws) + player->bonus;
}

static double
win_rate(const Player *player)
{
    const unsigned games = games_played(player);

    return games == 0u ? 0.0 : (100.0 * (double)player->wins) / (double)games;
}

static const char *
tier_label(const Player *player)
{
    const int total = points(player);

    if (total >= 30) {
        return "elite";
    }
    if (total >= 24) {
        return "contender";
    }
    return "rising";
}

static int
compare_players_by_points(const void *lhs, const void *rhs)
{
    const Player *left = lhs;
    const Player *right = rhs;
    const int left_points = points(left);
    const int right_points = points(right);

    if (left_points != right_points) {
        return right_points - left_points;
    }
    if (left->wins != right->wins) {
        return right->wins > left->wins ? 1 : -1;
    }
    return strcmp(left->name, right->name);
}

static int
compare_players_by_name(const void *lhs, const void *rhs)
{
    const Player *left = lhs;
    const Player *right = rhs;

    return strcmp(left->name, right->name);
}

static void
print_scoreboard(const Player *players, size_t count)
{
    puts("#  Name       W  D  L  Pts  Win%   Tier");
    puts("-----------------------------------------");

    for (size_t index = 0; index < count; ++index) {
        const Player *player = &players[index];
        const bool unbeaten = player->losses == 0u;

        printf("%zu. %-10s %2u %2u %2u %4d %6.1f  %s%s\n",
            index + 1,
            player->name,
            player->wins,
            player->draws,
            player->losses,
            points(player),
            win_rate(player),
            tier_label(player),
            unbeaten ? " *" : "");
    }
}

static void
print_summary(const Player *players, size_t count)
{
    unsigned total_games = 0;

    for (size_t index = 0; index < count; ++index) {
        total_games += games_played(&players[index]);
    }

    printf("\nLeader: %s with %d points\n", players[0].name, points(&players[0]));
    printf("Tracked matches: %u\n", total_games);
    puts("* unbeaten season");
}

int
main(void)
{
    Player players[] = {
        {.name = "Aster", .wins = 10, .draws = 2, .losses = 1, .bonus = 1},
        {.name = "Lyra", .wins = 9, .draws = 4, .losses = 0, .bonus = 0},
        {.name = "Nova", .wins = 8, .draws = 3, .losses = 2, .bonus = 2},
        {.name = "Rune", .wins = 9, .draws = 1, .losses = 3, .bonus = 1},
        {.name = "Mira", .wins = 7, .draws = 5, .losses = 1, .bonus = 0},
    };
    const SortMode mode = SORT_BY_POINTS;

    qsort(players,
        ARRAY_LEN(players),
        sizeof(players[0]),
        mode == SORT_BY_POINTS ? compare_players_by_points : compare_players_by_name);

    print_scoreboard(players, ARRAY_LEN(players));
    print_summary(players, ARRAY_LEN(players));
    return EXIT_SUCCESS;
}
