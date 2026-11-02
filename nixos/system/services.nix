{ ... }: 
{

# GPU and CPU
hardware.graphics.enable = true;
hardware.graphics.enable32Bit = true;
hardware.cpu.amd.updateMicrocode = true;
boot.kernelParams = [ "amd_pstate=active" ];

# bluetooth
hardware.bluetooth.enable = true;
hardware.bluetooth.powerOnBoot = true;

environment.sessionVariables = {
    XDG_CURRENT_DESKTOP = "niri";
    XDG_SESSION_TYPE = "wayland";
  };

# power daemon
services.power-profiles-daemon.enable = true;

# shell
programs.zsh.enable = true;

# udev-правила для adb и группа adbusers (есть в extraGroups у devastator)
programs.adb.enable = true;

# sound
security.rtkit.enable = true;
services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    wireplumber.enable = true;
    };
}
