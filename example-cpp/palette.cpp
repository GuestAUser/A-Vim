#include <algorithm>
#include <array>
#include <iomanip>
#include <iostream>
#include <numeric>
#include <sstream>
#include <string>
#include <string_view>
#include <vector>

// Small modern C++ example for A-Vim: enum class, lambdas, iostream formatting.
namespace demo {

enum class Tone {
    Warm,
    Cool,
    Neutral,
};

struct Swatch {
    std::string name;
    std::array<int, 3> rgb {};
    Tone tone = Tone::Neutral;
    bool accent = false;
};

constexpr int brightness(const Swatch& swatch) noexcept {
    return swatch.rgb[0] + swatch.rgb[1] + swatch.rgb[2];
}

std::string_view tone_name(Tone tone) noexcept {
    switch (tone) {
    case Tone::Warm:
        return "warm";
    case Tone::Cool:
        return "cool";
    case Tone::Neutral:
        return "neutral";
    }

    return "unknown";
}

std::string to_hex(const Swatch& swatch) {
    std::ostringstream out;

    out << '#'
        << std::uppercase << std::hex << std::setfill('0')
        << std::setw(2) << swatch.rgb[0]
        << std::setw(2) << swatch.rgb[1]
        << std::setw(2) << swatch.rgb[2];
    return out.str();
}

} // namespace demo

int main() {
    using demo::Swatch;
    using demo::Tone;
    using demo::brightness;
    using demo::to_hex;
    using demo::tone_name;

    std::vector<Swatch> palette = {
        {"amber", {255, 191, 0}, Tone::Warm, true},
        {"violet", {138, 43, 226}, Tone::Cool, true},
        {"teal", {0, 128, 128}, Tone::Cool, false},
        {"coral", {255, 127, 80}, Tone::Warm, true},
        {"stone", {112, 128, 144}, Tone::Neutral, false},
    };

    std::stable_sort(palette.begin(), palette.end(), [](const Swatch& left, const Swatch& right) {
        if (brightness(left) != brightness(right)) {
            return brightness(left) > brightness(right);
        }
        return left.name < right.name;
    });

    const auto accent_count = std::count_if(palette.begin(), palette.end(), [](const Swatch& swatch) {
        return swatch.accent;
    });
    const auto total_brightness = std::accumulate(
        palette.begin(),
        palette.end(),
        0,
        [](int sum, const Swatch& swatch) {
            return sum + brightness(swatch);
        }
    );
    const double average_brightness =
        palette.empty() ? 0.0 : static_cast<double>(total_brightness) / palette.size();

    std::cout << "name      hex       tone      accent  brightness\n";
    std::cout << "------------------------------------------------\n";

    for (const auto& swatch : palette) {
        std::cout << std::left
                  << std::setw(9) << swatch.name
                  << std::setw(10) << to_hex(swatch)
                  << std::setw(10) << tone_name(swatch.tone)
                  << std::setw(8) << (swatch.accent ? "yes" : "no")
                  << brightness(swatch) << '\n';
    }

    std::cout << "\nAccent colors: " << accent_count << '\n';
    std::cout << std::fixed << std::setprecision(1)
              << "Average brightness: " << average_brightness << '\n';
    return 0;
}
