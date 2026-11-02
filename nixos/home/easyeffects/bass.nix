{ config, ... }:
{
    xdg.dataFile."easyeffects/output/bass.json".text = ''
        {
                "output": {
                    "blocklist": [],
                    "plugins_order": [
                        "equalizer#0",
                        "bass_enhancer#0",
                        "limiter#0"
                    ],
                    "equalizer#0": {
                        "balance": 0.0,
                        "bypass": false,
                        "input-gain": -3.0,
                        "output-gain": 0.0,
                        "mode": "IIR",
                        "num-bands": 10,
                        "split-channels": false,
                        "pitch-left": 0.0,
                        "pitch-right": 0.0,
                        "left": {
                            "band0":  { "type": "Hi-pass",  "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 0.0,  "frequency": 20.0,    "q": 0.70, "width": 4.0 },
                            "band1":  { "type": "Lo-shelf", "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 5.5,  "frequency": 65.0,    "q": 0.70, "width": 4.0 },
                            "band2":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 2.0,  "frequency": 110.0,   "q": 1.20, "width": 4.0 },
                            "band3":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": -3.0, "frequency": 280.0,   "q": 1.00, "width": 4.0 },
                            "band4":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": -0.5, "frequency": 700.0,   "q": 1.00, "width": 4.0 },
                            "band5":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 1.2,  "frequency": 1800.0,  "q": 1.10, "width": 4.0 },
                            "band6":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 0.8,  "frequency": 3500.0,  "q": 1.00, "width": 4.0 },
                            "band7":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 0.0,  "frequency": 7000.0,  "q": 1.00, "width": 4.0 },
                            "band8":  { "type": "Hi-shelf", "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": -1.0, "frequency": 10000.0, "q": 0.70, "width": 4.0 },
                            "band9":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 0.0,  "frequency": 16000.0, "q": 1.00, "width": 4.0 }
                        },
                        "right": {
                            "band0":  { "type": "Hi-pass",  "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 0.0,  "frequency": 20.0,    "q": 0.70, "width": 4.0 },
                            "band1":  { "type": "Lo-shelf", "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 5.5,  "frequency": 65.0,    "q": 0.70, "width": 4.0 },
                            "band2":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 2.0,  "frequency": 110.0,   "q": 1.20, "width": 4.0 },
                            "band3":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": -3.0, "frequency": 280.0,   "q": 1.00, "width": 4.0 },
                            "band4":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": -0.5, "frequency": 700.0,   "q": 1.00, "width": 4.0 },
                            "band5":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 1.2,  "frequency": 1800.0,  "q": 1.10, "width": 4.0 },
                            "band6":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 0.8,  "frequency": 3500.0,  "q": 1.00, "width": 4.0 },
                            "band7":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 0.0,  "frequency": 7000.0,  "q": 1.00, "width": 4.0 },
                            "band8":  { "type": "Hi-shelf", "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": -1.0, "frequency": 10000.0, "q": 0.70, "width": 4.0 },
                            "band9":  { "type": "Bell",     "mode": "RLC (BT)", "slope": "x1", "solo": false, "mute": false, "gain": 0.0,  "frequency": 16000.0, "q": 1.00, "width": 4.0 }
                        }
                    },
                    "bass_enhancer#0": {
                        "bypass": false,
                        "input-gain": 0.0,
                        "output-gain": 0.0,
                        "amount": 3.5,
                        "harmonics": 8.0,
                        "scope": 120.0,
                        "floor": 20.0,
                        "floor-active": true,
                        "blend": 0.0,
                        "listen": false
                    },
                    "limiter#0": {
                        "bypass": false,
                        "input-gain": 0.0,
                        "output-gain": 0.0,
                        "threshold": -1.5,
                        "attack": 2.0,
                        "release": 8.0,
                        "lookahead": 5.0,
                        "gain-boost": true,
                        "stereo-link": 100.0,
                        "external-sidechain": false,
                        "sidechain-preamp": 0.0,
                        "alr": false,
                        "alr-attack": 5.0,
                        "alr-knee": 0.0,
                        "alr-release": 50.0,
                        "dithering": "None",
                        "mode": "Herm Ultra Fast",
                        "oversampling": "Half x2(2L)"
                    }
                }
            }
    '';
}
