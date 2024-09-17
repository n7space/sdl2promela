from enum import Enum


class SystemCapability(Enum):
    """System capability required by generated promela."""

    SYSTEM_CAPABILITY_POWER_INT = 1
    """Capability provides an inline sys_cap_power_int, required when SDL uses 'power' function"""
