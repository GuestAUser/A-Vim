"""Small agenda builder used as a richer Python example for A-Vim."""

from __future__ import annotations

from collections import defaultdict
from dataclasses import dataclass
from datetime import datetime, timedelta


@dataclass(frozen=True)
class Session:
    title: str
    speaker: str
    minutes: int
    room: str
    tags: tuple[str, ...] = ()

    @property
    def badge(self) -> str:
        if "keynote" in self.tags:
            return "★ keynote"
        if "workshop" in self.tags:
            return "◆ workshop"
        return "• session"


def build_agenda(
    day: datetime,
    start_hour: int,
    sessions: list[Session],
    *,
    gap_minutes: int = 10,
) -> list[tuple[datetime, datetime, Session]]:
    if gap_minutes < 0:
        raise ValueError("gap_minutes must be non-negative")

    cursor = day.replace(hour=start_hour, minute=0, second=0, microsecond=0)
    agenda: list[tuple[datetime, datetime, Session]] = []

    for session in sessions:
        end = cursor + timedelta(minutes=session.minutes)
        agenda.append((cursor, end, session))
        cursor = end + timedelta(minutes=gap_minutes)

    return agenda


def group_by_room(
    agenda: list[tuple[datetime, datetime, Session]],
) -> dict[str, list[str]]:
    grouped: defaultdict[str, list[str]] = defaultdict(list)

    for start, _, session in agenda:
        grouped[session.room].append(f"{start:%H:%M} {session.title}")

    return dict(sorted(grouped.items()))


def render_agenda(agenda: list[tuple[datetime, datetime, Session]]) -> str:
    lines = ["# Saturday schedule", ""]

    for start, end, session in agenda:
        lines.append(
            f"{session.badge:10} {start:%H:%M}-{end:%H:%M}  "
            f"{session.title:<18} {session.room:<8} {session.speaker}"
        )

    return "\n".join(lines)


def summarize(agenda: list[tuple[datetime, datetime, Session]]) -> str:
    total_minutes = sum(session.minutes for _, _, session in agenda)
    longest = max(agenda, key=lambda item: item[2].minutes)
    rooms = group_by_room(agenda)
    room_summary = ", ".join(f"{room}={len(entries)}" for room, entries in rooms.items())

    return (
        f"\nTotal minutes: {total_minutes}\n"
        f"Longest slot: {longest[2].title} ({longest[2].minutes} min)\n"
        f"Rooms: {room_summary}"
    )


def main() -> None:
    # Ordered input keeps screenshots and manual tests stable.
    sessions = [
        Session("Opening notes", "Mira", 20, "Main", ("intro",)),
        Session("Fast feedback", "Rune", 45, "Main", ("keynote",)),
        Session("Editor macros", "Lyra", 50, "Lab A", ("workshop", "tools")),
        Session("Testing flows", "Aster", 35, "Lab B", ("qa",)),
    ]
    agenda = build_agenda(datetime(2026, 4, 11), 9, sessions, gap_minutes=5)

    print(render_agenda(agenda))
    print(summarize(agenda))


if __name__ == "__main__":
    main()
