jQuery(function ($) {
    "use strict";
    $("#hsimp-password").hsimp({
        calculationsPerSecond: 10e9, // 10 billones
        good: 31557600e9, // 1 billon de años
        ok: 31557600e2  // 100 años
    });
});