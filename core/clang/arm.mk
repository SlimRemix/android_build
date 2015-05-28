# Clang flags for arm arch, target or host.

CLANG_CONFIG_arm_EXTRA_ASFLAGS := \
  -no-integrated-as

CLANG_CONFIG_arm_EXTRA_CFLAGS := \
  -no-integrated-as

CLANG_CONFIG_arm_EXTRA_CPPFLAGS := \
  -no-integrated-as

CLANG_CONFIG_arm_EXTRA_LDFLAGS := \
  -no-integrated-as

# Include common unknown flags
CLANG_CONFIG_arm_UNKNOWN_CFLAGS := \
  $(CLANG_CONFIG_UNKNOWN_CFLAGS) \
  -mthumb-interwork \
  -fgcse-after-reload \
  -frerun-cse-after-loop \
  -frename-registers \
  -fno-builtin-sin \
  -fno-strict-volatile-bitfields \
  -fno-align-jumps \
  -Wa,--noexecstack \
  -mfpu=neon-vfpv4 \
  -Wno-unused-local-typedefs \
  -fpredictive-commoning \
  -ftree-loop-distribute-patterns \
  -fvect-cost-model \
  -ftree-partial-pre \
  -fipa-cp-clone \
  -mvectorize-with-neon-quad \
  -fno-if-conversion

CLANG_QCOM_CONFIG_arm_UNKNOWN_CFLAGS := \
-fipa-pta \
-fsection-anchors \
-ftree-loop-im \
-ftree-loop-ivcanon \
-fno-canonical-system-headers \
-frerun-cse-after-loop \
-fgcse-las \
-fgcse-sm \
-fivopts \
-frename-registers \
-ftracer \
-funsafe-loop-optimizations \
-funswitch-loops \
-fweb \
-fgcse-after-reload \
-frename-registers \
-finline-functions \
-fno-strict-volatile-bitfields \
-fno-unswitch-loops

define subst-clang-incompatible-arm-flags
  $(subst -march=armv5te,-march=armv5t,\
  $(subst -march=armv5e,-march=armv5,\
  $(subst -mcpu=cortex-a15,-march=armv7-a,\
  $(1))))
endef

#CLANG QCOM
define subst-clang-qcom-incompatible-arm-ldflags
  $(subst -mfpu=neon,-mfpu=neon-vfpv4,\
  $(1))
endef

define subst-clang-qcom-incompatible-arm-ldflags
  $(1)
endef

define subst-clang-qcom-incompatible-arm-flags
  $(subst -march=armv5te,-mcpu=krait,\
  $(subst -march=armv5e,-mcpu=krait,\
  $(subst -march=armv7,-mcpu=krait,\
  $(subst -march=armv7-a,-mcpu=krait,\
  $(subst -mcpu=cortex-a15,-mcpu=krait,\
  $(subst -mfpu=cortex-a8,-mcpu=scorpion,\
  $(subst -O3,-Ofast -fno-fast-math,\
  $(subst -Os ,-Os -falign-os ,\
  $(1)))))))))
endef

define subst-clang-qcom-O-flags
  $(subst -O3,-Ofast -fno-fast-math,\
  $(1))
endef

define subst-clang-qcom-parallel-flags
  $(subst -O2,-O2 -fparallel,\
  $(subst -O3,-O3 -fparallel,\
  $(subst -Ofast,-Ofast -fparallel,\
  $(1))))
endef
