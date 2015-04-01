opyright (C) 2013 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <errno.h>
#include <fcntl.h>
#include <healthd.h>
#include <stdio.h>
#include <unistd.h>

// from BatteryManager.java
#define BATTERY_STATUS_UNKNOWN 1
#define BATTERY_STATUS_CHARGING 2
#define BATTERY_STATUS_DISCHARGING 3
#define BATTERY_STATUS_NOT_CHARGING 4
#define BATTERY_STATUS_FULL 5

void
healthd_board_init(struct healthd_config *config)
{
    config->batteryStatusPath            = "/sys/class/power_supply/max170xx_battery/status";
    config->batteryHealthPath            = "/sys/class/power_supply/max170xx_battery/health";
    config->batteryPresentPath           = "/sys/class/power_supply/max170xx_battery/present";
    config->batteryCapacityPath          = "/sys/class/power_supply/max170xx_battery/capacity";
    config->batteryVoltagePath           = "/sys/class/power_supply/max170xx_battery/voltage_now";
    config->batteryTemperaturePath       = "/sys/class/power_supply/max170xx_battery/temp";
    config->batteryTechnologyPath        = "/sys/class/power_supply/max170xx_battery/technology";
    config->batteryCurrentNowPath        = "/sys/class/power_supply/max170xx_battery/current_now";
    config->batteryChargeCounterPath     = "/sys/class/power_supply/max170xx_battery/cycle_count";
}

int
healthd_board_battery_update(struct android::BatteryProperties *props)
{

    // To follow the AOSP battery contract, the board only should report itself
    // as pluggable when is charging or full charging
    if (props->batteryStatus != BATTERY_STATUS_CHARGING &&
        props->batteryStatus != BATTERY_STATUS_FULL) {

        props->chargerAcOnline = false;
        props->chargerUsbOnline = false;
        props->chargerWirelessOnline = false;
    }
    // return 0 to log periodic polled battery status to kernel log
    return 0;
}
