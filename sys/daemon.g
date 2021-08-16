if exists(global.heatsoak_daemon) && (global.heatsoak_daemon == 1)
  if (global.heatsoak_timeout < state.upTime)
    M292