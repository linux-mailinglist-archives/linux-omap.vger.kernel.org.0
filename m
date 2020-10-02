Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCDC6281ED8
	for <lists+linux-omap@lfdr.de>; Sat,  3 Oct 2020 01:04:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725536AbgJBXEt (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 2 Oct 2020 19:04:49 -0400
Received: from mga02.intel.com ([134.134.136.20]:31311 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725283AbgJBXEq (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 2 Oct 2020 19:04:46 -0400
IronPort-SDR: ChWwIZr8yuNpa3v9JtX9teQL9qpGfdoaSPTOQwq4+q55hciu6nLYzZtD303uBxcXkwvFyIQuQ8
 zxeBo3omMyEg==
X-IronPort-AV: E=McAfee;i="6000,8403,9762"; a="150737100"
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="150737100"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2020 16:04:45 -0700
IronPort-SDR: C3b/j8lhnc1zdjGYdA6bzqtKP8r4yyrqiWh1jGI+jQxpTavSmzkpjq6Xg5fBuipIhoekpX0kl/
 Mdlx15RBbAPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,329,1596524400"; 
   d="scan'208";a="352503857"
Received: from lkp-server02.sh.intel.com (HELO 404f47266ee4) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 02 Oct 2020 16:04:43 -0700
Received: from kbuild by 404f47266ee4 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kOU6V-00008y-0h; Fri, 02 Oct 2020 23:04:43 +0000
Date:   Sat, 03 Oct 2020 07:04:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD SUCCESS WITH WARNING
 b2c586eb07efab982419f32b7c3bd96829bc8bcd
Message-ID: <5f77b1e4.lgJe4jO3yNuNSL33%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: b2c586eb07efab982419f32b7c3bd96829bc8bcd  usb: dwc2: Fix INTR OUT transfers in DDMA mode.

Warning in current branch:

drivers/usb/cdns3/gadget.c:509:7: warning: variable 'length' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- arc-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- arm-allmodconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- arm-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- arm64-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- c6x-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- h8300-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- i386-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- m68k-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- mips-allmodconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- mips-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- parisc-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- riscv-allmodconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- riscv-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- s390-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- sparc-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
`-- xtensa-allyesconfig
    `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used

elapsed time: 721m

configs tested: 159
configs skipped: 3

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                       imx_v4_v5_defconfig
powerpc                    klondike_defconfig
mips                          malta_defconfig
arc                        nsim_700_defconfig
arm                          badge4_defconfig
powerpc                  mpc885_ads_defconfig
powerpc                 mpc834x_itx_defconfig
powerpc                      ppc6xx_defconfig
arm                         s3c2410_defconfig
arm                           viper_defconfig
um                           x86_64_defconfig
powerpc                        warp_defconfig
powerpc                         wii_defconfig
mips                        nlm_xlr_defconfig
mips                       lemote2f_defconfig
arm                         lpc18xx_defconfig
powerpc                      ep88xc_defconfig
powerpc                      ppc64e_defconfig
arm                   milbeaut_m10v_defconfig
arm                          ep93xx_defconfig
arm                         palmz72_defconfig
riscv                    nommu_k210_defconfig
sh                          rsk7203_defconfig
arm                          gemini_defconfig
powerpc                     rainier_defconfig
m68k                       m5475evb_defconfig
sh                   secureedge5410_defconfig
arm                           tegra_defconfig
sh                           se7619_defconfig
mips                 decstation_r4k_defconfig
s390                       zfcpdump_defconfig
m68k                        m5307c3_defconfig
sh                           se7724_defconfig
um                             i386_defconfig
arm                       multi_v4t_defconfig
sh                        dreamcast_defconfig
arm                            zeus_defconfig
powerpc                     tqm8555_defconfig
sh                           se7343_defconfig
powerpc                        cell_defconfig
m68k                        stmark2_defconfig
arm                         axm55xx_defconfig
powerpc                     tqm5200_defconfig
mips                     loongson1b_defconfig
sh                          sdk7786_defconfig
arm                     am200epdkit_defconfig
xtensa                generic_kc705_defconfig
alpha                            alldefconfig
powerpc                    mvme5100_defconfig
sh                            titan_defconfig
riscv                               defconfig
powerpc                     mpc512x_defconfig
arm                            lart_defconfig
mips                           jazz_defconfig
c6x                         dsk6455_defconfig
arm                        mini2440_defconfig
c6x                        evmc6474_defconfig
arm                          imote2_defconfig
sh                   sh7770_generic_defconfig
sparc                       sparc32_defconfig
mips                          ath25_defconfig
powerpc                           allnoconfig
arm                       omap2plus_defconfig
sh                          rsk7264_defconfig
mips                        bcm47xx_defconfig
powerpc                 canyonlands_defconfig
arm                        multi_v7_defconfig
powerpc                 mpc832x_mds_defconfig
sparc64                          alldefconfig
mips                      pistachio_defconfig
arm                        oxnas_v6_defconfig
mips                        bcm63xx_defconfig
arm                        spear6xx_defconfig
powerpc                          g5_defconfig
mips                         mpc30x_defconfig
arm                  colibri_pxa270_defconfig
m68k                           sun3_defconfig
sh                          lboxre2_defconfig
arm                    vt8500_v6_v7_defconfig
c6x                        evmc6678_defconfig
mips                  cavium_octeon_defconfig
s390                          debug_defconfig
sh                           se7751_defconfig
arm                        mvebu_v7_defconfig
arm                        vexpress_defconfig
parisc                              defconfig
mips                            ar7_defconfig
arm                            dove_defconfig
powerpc                     stx_gp3_defconfig
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
parisc                           allyesconfig
s390                                defconfig
s390                             allyesconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
x86_64               randconfig-a004-20201002
x86_64               randconfig-a001-20201002
x86_64               randconfig-a002-20201002
x86_64               randconfig-a005-20201002
x86_64               randconfig-a003-20201002
x86_64               randconfig-a006-20201002
i386                 randconfig-a006-20201002
i386                 randconfig-a005-20201002
i386                 randconfig-a001-20201002
i386                 randconfig-a004-20201002
i386                 randconfig-a003-20201002
i386                 randconfig-a002-20201002
i386                 randconfig-a014-20201002
i386                 randconfig-a013-20201002
i386                 randconfig-a015-20201002
i386                 randconfig-a016-20201002
i386                 randconfig-a011-20201002
i386                 randconfig-a012-20201002
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a012-20201002
x86_64               randconfig-a015-20201002
x86_64               randconfig-a014-20201002
x86_64               randconfig-a013-20201002
x86_64               randconfig-a011-20201002
x86_64               randconfig-a016-20201002

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
