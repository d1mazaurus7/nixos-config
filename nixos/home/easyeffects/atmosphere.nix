{ config, ... }:
{
    xdg.dataFile."easyeffects/output/atmosphere.json".text = ''
        {
          "output": {
            "blocklist": [],
            "plugins_order": [
              "equalizer#0",
              "compressor#0",
              "limiter#0"
            ],
            "equalizer#0": {
              "balance": 0.0,
              "bypass": false,
              "input-gain": 0.0,
              "left": {
                "band0":  { "frequency": 40.0,   "gain":  2.0, "mode": "APO (BT)", "mute": false, "q": 0.70, "slope": "x4", "solo": false, "type": "Bell" },
                "band1":  { "frequency": 80.0,   "gain":  2.5, "mode": "APO (BT)", "mute": false, "q": 0.70, "slope": "x4", "solo": false, "type": "Bell" },
                "band2":  { "frequency": 160.0,  "gain":  1.0, "mode": "APO (BT)", "mute": false, "q": 0.80, "slope": "x4", "solo": false, "type": "Bell" },
                "band3":  { "frequency": 280.0,  "gain": -1.5, "mode": "APO (BT)", "mute": false, "q": 1.00, "slope": "x4", "solo": false, "type": "Bell" },
                "band4":  { "frequency": 450.0,  "gain": -2.0, "mode": "APO (BT)", "mute": false, "q": 1.00, "slope": "x4", "solo": false, "type": "Bell" },
                "band5":  { "frequency": 800.0,  "gain": -0.5, "mode": "APO (BT)", "mute": false, "q": 1.00, "slope": "x4", "solo": false, "type": "Bell" },
                "band6":  { "frequency": 1500.0, "gain":  0.5, "mode": "APO (BT)", "mute": false, "q": 1.00, "slope": "x4", "solo": false, "type": "Bell" },
                "band7":  { "frequency": 2500.0, "gain":  1.5, "mode": "APO (BT)", "mute": false, "q": 1.10, "slope": "x4", "solo": false, "type": "Bell" },
                "band8":  { "frequency": 4000.0, "gain":  1.0, "mode": "APO (BT)", "mute": false, "q": 1.00, "slope": "x4", "solo": false, "type": "Bell" },
                "band9":  { "frequency": 6000.0, "gain":  0.5, "mode": "APO (BT)", "mute": false, "q": 0.90, "slope": "x4", "solo": false, "type": "Bell" },
                "band10": { "frequency": 8500.0, "gain": -1.0, "mode": "APO (BT)", "mute": false, "q": 0.90, "slope": "x4", "solo": false, "type": "Bell" },
                "band11": { "frequency": 12000.0,"gain": -2.0, "mode": "APO (BT)", "mute": false, "q": 0.80, "slope": "x4", "solo": false, "type": "Bell" },
                "band12": { "frequency": 16000.0,"gain": -3.0, "mode": "APO (BT)", "mute": false, "q": 0.80, "slope": "x4", "solo": false, "type": "Bell" },
                "band13": { "frequency": 50.0,   "gain":  0.0, "mode": "APO (BT)", "mute": true,  "q": 4.36, "slope": "x4", "solo": false, "type": "Bell" },
                "band14": { "frequency": 100.0,  "gain":  0.0, "mode": "APO (BT)", "mute": true,  "q": 4.36, "slope": "x4", "solo": false, "type": "Bell" },
                "band15": { "frequency": 200.0,  "gain":  0.0, "mode": "APO (BT)", "mute": true,  "q": 4.36, "slope": "x4", "solo": false, "type": "Bell" },
                "band16": { "frequency": 400.0,  "gain":  0.0, "mode": "APO (BT)", "mute": true,  "q": 4.36, "slope": "x4", "solo": false, "type": "Bell" },
                "band17": { "frequency": 800.0,  "gain":  0.0, "mode": "APO (BT)", "mute": true,  "q": 4.36, "slope": "x4", "solo": false, "type": "Bell" }
              },
              "right": {
                "band0":  { "frequency": 40.0,   "gain":  2.0, "mode": "APO (BT)", "mute": false, "q": 0.70, "slope": "x4", "solo": false, "type": "Bell" },
                "band1":  { "frequency": 80.0,   "gain":  2.5, "mode": "APO (BT)", "mute": false, "q": 0.70, "slope": "x4", "solo": false, "type": "Bell" },
                "band2":  { "frequency": 160.0,  "gain":  1.0, "mode": "APO (BT)", "mute": false, "q": 0.80, "slope": "x4", "solo": false, "type": "Bell" },
                "band3":  { "frequency": 280.0,  "gain": -1.5, "mode": "APO (BT)", "mute": false, "q": 1.00, "slope": "x4", "solo": false, "type": "Bell" },
                "band4":  { "frequency": 450.0,  "gain": -2.0, "mode": "APO (BT)", "mute": false, "q": 1.00, "slope": "x4", "solo": false, "type": "Bell" },
                "band5":  { "frequency": 800.0,  "gain": -0.5, "mode": "APO (BT)", "mute": false, "q": 1.00, "slope": "x4", "solo": false, "type": "Bell" },
                "band6":  { "frequency": 1500.0, "gain":  0.5, "mode": "APO (BT)", "mute": false, "q": 1.00, "slope": "x4", "solo": false, "type": "Bell" },
                "band7":  { "frequency": 2500.0, "gain":  1.5, "mode": "APO (BT)", "mute": false, "q": 1.10, "slope": "x4", "solo": false, "type": "Bell" },
                "band8":  { "frequency": 4000.0, "gain":  1.0, "mode": "APO (BT)", "mute": false, "q": 1.00, "slope": "x4", "solo": false, "type": "Bell" },
                "band9":  { "frequency": 6000.0, "gain":  0.5, "mode": "APO (BT)", "mute": false, "q": 0.90, "slope": "x4", "solo": false, "type": "Bell" },
                "band10": { "frequency": 8500.0, "gain": -1.0, "mode": "APO (BT)", "mute": false, "q": 0.90, "slope": "x4", "solo": false, "type": "Bell" },
                "band11": { "frequency": 12000.0,"gain": -2.0, "mode": "APO (BT)", "mute": false, "q": 0.80, "slope": "x4", "solo": false, "type": "Bell" },
                "band12": { "frequency": 16000.0,"gain": -3.0, "mode": "APO (BT)", "mute": false, "q": 0.80, "slope": "x4", "solo": false, "type": "Bell" },
                "band13": { "frequency": 50.0,   "gain":  0.0, "mode": "APO (BT)", "mute": true,  "q": 4.36, "slope": "x4", "solo": false, "type": "Bell" },
                "band14": { "frequency": 100.0,  "gain":  0.0, "mode": "APO (BT)", "mute": true,  "q": 4.36, "slope": "x4", "solo": false, "type": "Bell" },
                "band15": { "frequency": 200.0,  "gain":  0.0, "mode": "APO (BT)", "mute": true,  "q": 4.36, "slope": "x4", "solo": false, "type": "Bell" },
                "band16": { "frequency": 400.0,  "gain":  0.0, "mode": "APO (BT)", "mute": true,  "q": 4.36, "slope": "x4", "solo": false, "type": "Bell" },
                "band17": { "frequency": 800.0,  "gain":  0.0, "mode": "APO (BT)", "mute": true,  "q": 4.36, "slope": "x4", "solo": false, "type": "Bell" }
              },
              "mode": "IIR",
              "num-bands": 13,
              "output-gain": -1.5,
              "pitch-left": 0.0,
              "pitch-right": 0.0,
              "split-channels": false
            },
            "compressor#0": {
              "attack": 35.0,
              "bias": 0.0,
              "bypass": false,
              "dry": -100.0,
              "hpf-frequency": 10.0,
              "hpf-mode": "off",
              "input-gain": 0.0,
              "knee": 10.0,
              "lpf-frequency": 20000.0,
              "lpf-mode": "off",
              "makeup": 1.25,
              "mode": "Downward",
              "output-gain": 0.0,
              "ratio": 1.8,
              "release": 280.0,
              "sidechain": {
                "lookahead": 0.0,
                "mode": "RMS",
                "preamp": 0.0,
                "reactivity": 10.0,
                "source": "Middle",
                "stereo-split-source": "Left/Right",
                "type": "Feed-forward"
              },
              "stereo-split": false,
              "threshold": -22.0,
              "wet": 0.0
            },
            "limiter#0": {
              "alr": false,
              "alr-attack": 5.0,
              "alr-knee": 0.0,
              "alr-release": 50.0,
              "attack": 2.0,
              "bypass": false,
              "dithering": "None",
              "external-sidechain": false,
              "gain-boost": false,
              "input-gain": 0.0,
              "lookahead": 5.0,
              "mode": "Herm Thin",
              "output-gain": 0.0,
              "oversampling": "None",
              "release": 25.0,
              "sidechain-preamp": 0.0,
              "stereo-link": 100.0,
              "threshold": -2.0
            }
          }
        }
    '';
}
