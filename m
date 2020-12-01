Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 215512CB088
	for <lists+linux-omap@lfdr.de>; Tue,  1 Dec 2020 23:57:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726578AbgLAW4K (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Dec 2020 17:56:10 -0500
Received: from mga07.intel.com ([134.134.136.100]:47695 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbgLAW4K (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Dec 2020 17:56:10 -0500
IronPort-SDR: eMQeD4t/Jk32RioF8ioNuDJG91PWiMH81+aJfcKAJakKF9L1NDW0MacsXudLuu8NvmSFN9xp1M
 wLphkvo6077Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="237049596"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="237049596"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 14:55:27 -0800
IronPort-SDR: lATKgK9CJ9ACrKURG842XEhHL6+ycmHvsPGGLz1BFImjPV8OEWlwa36UVVrnEAJGgspxLrdhQ8
 0YElryqfawdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="330203026"
Received: from lkp-server01.sh.intel.com (HELO cb91f3174bdd) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Dec 2020 14:55:25 -0800
Received: from kbuild by cb91f3174bdd with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kkEYO-0000AZ-Vt; Tue, 01 Dec 2020 22:55:24 +0000
Date:   Wed, 02 Dec 2020 06:55:22 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD SUCCESS
 1080ed2a6cc53a07afdb1cd3f3968e808b714bbb
Message-ID: <5fc6c9da.z2DFiQcnHxojqXci%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: 1080ed2a6cc53a07afdb1cd3f3968e808b714bbb  arm64: dts: rockchip: enable rk3328-rock64 usb3 nodes

elapsed time: 722m

configs tested: 138
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                            xcep_defconfig
sh                   sh7770_generic_defconfig
powerpc                     mpc83xx_defconfig
mips                      pistachio_defconfig
xtensa                       common_defconfig
arc                        nsimosci_defconfig
openrisc                         alldefconfig
sh                               j2_defconfig
mips                       capcella_defconfig
arm                           viper_defconfig
c6x                        evmc6474_defconfig
c6x                        evmc6457_defconfig
mips                           ip27_defconfig
sh                        sh7763rdp_defconfig
arm                       multi_v4t_defconfig
powerpc                 xes_mpc85xx_defconfig
arc                 nsimosci_hs_smp_defconfig
powerpc                     sequoia_defconfig
arm                      pxa255-idp_defconfig
arm                          ep93xx_defconfig
arm                          lpd270_defconfig
mips                           gcw0_defconfig
xtensa                         virt_defconfig
c6x                        evmc6678_defconfig
sh                             shx3_defconfig
nios2                         3c120_defconfig
powerpc                        warp_defconfig
mips                        vocore2_defconfig
sparc                               defconfig
arm                          pcm027_defconfig
ia64                        generic_defconfig
sh                        dreamcast_defconfig
arm                            mps2_defconfig
mips                  cavium_octeon_defconfig
arm                             mxs_defconfig
mips                           rs90_defconfig
arm                         palmz72_defconfig
powerpc                 mpc85xx_cds_defconfig
sh                           se7722_defconfig
um                             i386_defconfig
openrisc                    or1ksim_defconfig
arm                     davinci_all_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                    mvme5100_defconfig
sh                        apsh4ad0a_defconfig
sh                  sh7785lcr_32bit_defconfig
arm                          imote2_defconfig
arm                          pxa3xx_defconfig
powerpc                      cm5200_defconfig
powerpc                     pseries_defconfig
mips                            e55_defconfig
m68k                            q40_defconfig
powerpc                 linkstation_defconfig
ia64                          tiger_defconfig
powerpc                         wii_defconfig
s390                             alldefconfig
powerpc                  mpc885_ads_defconfig
nios2                            alldefconfig
mips                         tb0219_defconfig
powerpc                 mpc832x_rdb_defconfig
mips                           mtx1_defconfig
powerpc                      pasemi_defconfig
powerpc                  storcenter_defconfig
parisc                generic-32bit_defconfig
mips                    maltaup_xpa_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
arc                                 defconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a004-20201201
i386                 randconfig-a005-20201201
i386                 randconfig-a001-20201201
i386                 randconfig-a002-20201201
i386                 randconfig-a006-20201201
i386                 randconfig-a003-20201201
x86_64               randconfig-a016-20201201
x86_64               randconfig-a012-20201201
x86_64               randconfig-a014-20201201
x86_64               randconfig-a013-20201201
x86_64               randconfig-a015-20201201
x86_64               randconfig-a011-20201201
i386                 randconfig-a014-20201201
i386                 randconfig-a013-20201201
i386                 randconfig-a011-20201201
i386                 randconfig-a015-20201201
i386                 randconfig-a012-20201201
i386                 randconfig-a016-20201201
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20201201
x86_64               randconfig-a006-20201201
x86_64               randconfig-a001-20201201
x86_64               randconfig-a002-20201201
x86_64               randconfig-a005-20201201
x86_64               randconfig-a003-20201201

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
