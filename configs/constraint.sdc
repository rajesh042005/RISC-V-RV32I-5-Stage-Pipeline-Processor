export DESIGN_NICKNAME = riscv32i_5stage
export DESIGN_NAME     = main
export PLATFORM        = nangate45

# ---------------- SYNTH ----------------
export SYNTH_HIERARCHICAL = 0
export SYNTH_MEMORY_MAX_BITS = 2048

# ---------------- FILES ----------------
export VERILOG_FILES = $(DESIGN_HOME)/nangate45/riscv32i_5stg/*.v
export SDC_FILE      = $(DESIGN_HOME)/nangate45/riscv32i_5stg/constraint.sdc

# ---------------- FLOORPLAN ----------------
export CORE_UTILIZATION = 45
export CORE_MARGIN      = 20

# ---------------- PLACEMENT ----------------
export PLACE_DENSITY_LB_ADDON = 0.05
export CELL_PAD_IN_SITES_GLOBAL_PLACEMENT = 2

#  Stable placement (no heavy optimization)
export GPL_TIMING_DRIVEN = 0
export GPL_ROUTABILITY_DRIVEN = 0
export GPL_MAX_ITERATIONS = 40

# ---------------- RESIZER ----------------
# keep minimal to avoid long runtime
export PL_RESIZER_TIMING_OPTIMIZATIONS  = 0
export GLB_RESIZER_TIMING_OPTIMIZATIONS = 0

# ---------------- CTS ----------------
export CTS_CLUSTER_SIZE = 8
export CTS_CLUSTER_DIAMETER = 40

# ---------------- ROUTING ----------------
export MIN_ROUTING_LAYER = M1
export MAX_ROUTING_LAYER = M5

export ROUTING_LAYER_ADJUSTMENT = 0.4
export GLOBAL_ROUTE_ARGS = -allow_congestion
export DETAILED_ROUTE_END_ITERATION = 10

# ---------------- TIMING ----------------
export TNS_END_PERCENT = 100
