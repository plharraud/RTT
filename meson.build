project(
    'librtt',
    'c',
    version: '8.12f',
    license_files: 'LICENSE.md',
)

librtt_includes = include_directories(
    'Config',
    'RTT',
)

librtt_sources = files(
    'RTT/SEGGER_RTT.c',
    'RTT/SEGGER_RTT_ASM_ARMv7M.S',
    'RTT/SEGGER_RTT_printf.c',
)

librtt_args = []
librtt_link_args = []

librtt = static_library(
    'rtt',
    sources: librtt_sources,
    include_directories: librtt_includes,
)

librtt = declare_dependency(
    include_directories: librtt_includes,
    link_with: librtt,
    compile_args: librtt_args,
    link_args: librtt_link_args,
)