/*
 * Copyright 2021 elementary, Inc.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

[DBus (name = "io.elementary.InstallerDaemon")]
public class InstallerDaemon.NoneBackend : GLib.Object {
    public signal void on_log_message (InstallerDaemon.LogLevel level, string message);
    public signal void on_status (InstallerDaemon.Status status);
    public signal void on_error (InstallerDaemon.Error error);

    public InstallerDaemon.PartitionTable bootloader_detect () throws GLib.Error {
        return InstallerDaemon.PartitionTable.NONE;
    }

    public DiskInfo get_disks (bool get_partitions = false) throws GLib.Error {
        return DiskInfo () {
            physical_disks = {},
            logical_disks = {}
        };
    }

    public int decrypt_partition (string path, string pv, string password) throws GLib.Error {
        return 0;
    }

    public Disk get_logical_device (string pv) throws GLib.Error {
        throw new GLib.IOError.NOT_FOUND ("Couldn't find a logical device with that name");
    }

    public void install_with_default_disk_layout (InstallConfig config, string disk, bool encrypt, string encryption_password) throws GLib.Error {
    }

    public void install_with_custom_disk_layout (InstallConfig config, Mount[] disk_config, LuksCredentials[] credentials) throws GLib.Error {
    }

    public void set_demo_mode_locale (string locale) throws GLib.Error {
    }

    public void trigger_demo_mode () throws GLib.Error {
    }
}
