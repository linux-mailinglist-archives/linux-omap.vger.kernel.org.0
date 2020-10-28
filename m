Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 772E829CD05
	for <lists+linux-omap@lfdr.de>; Wed, 28 Oct 2020 02:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726228AbgJ1Biq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 27 Oct 2020 21:38:46 -0400
Received: from mga14.intel.com ([192.55.52.115]:2647 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1833075AbgJ1AGr (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 27 Oct 2020 20:06:47 -0400
IronPort-SDR: QcQWVDAYGAvoqZgR1/rKJUrlEEiauCiTkCcP12p9rg3Eo1yoCZpSShjMPIC6fVgf7FfqZ8WSK7
 YcYXiNFM6jSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9787"; a="167402967"
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; 
   d="scan'208";a="167402967"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2020 17:06:46 -0700
IronPort-SDR: OsytROqFrVeMucgFcgfIxookGDhid8idIYsj3OeoM6oyws86ndlqAw2sE2C6bFFyUB3+Zqc4G4
 EnStm5Qy5I+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,424,1596524400"; 
   d="scan'208";a="424570877"
Received: from lkp-server02.sh.intel.com (HELO 74b0a1e0e619) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 27 Oct 2020 17:06:45 -0700
Received: from kbuild by 74b0a1e0e619 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kXYzE-0000A8-Om; Wed, 28 Oct 2020 00:06:44 +0000
Date:   Wed, 28 Oct 2020 08:06:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/fixes] BUILD SUCCESS
 129aa9734559a17990ee933351c7b6956f1dba62
Message-ID: <5f98b604.nenjxQSnViVvInAV%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/fixes
branch HEAD: 129aa9734559a17990ee933351c7b6956f1dba62  usb: raw-gadget: fix memory leak in gadget_setup

elapsed time: 725m

configs tested: 230
configs skipped: 2

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                               defconfig
arm64                            allyesconfig
arm                              allyesconfig
arm                              allmodconfig
arm                            zeus_defconfig
arm                         ebsa110_defconfig
arm                        shmobile_defconfig
sparc                            allyesconfig
powerpc                     sequoia_defconfig
c6x                        evmc6457_defconfig
sh                            titan_defconfig
powerpc                     tqm8548_defconfig
arm                          pxa168_defconfig
mips                           ip22_defconfig
arm                     davinci_all_defconfig
powerpc                       maple_defconfig
arm                           omap1_defconfig
powerpc                       holly_defconfig
m68k                        mvme147_defconfig
powerpc                     mpc83xx_defconfig
powerpc                      tqm8xx_defconfig
powerpc                     pseries_defconfig
powerpc                     tqm8560_defconfig
sh                             sh03_defconfig
ia64                             alldefconfig
arm                           sunxi_defconfig
powerpc                        icon_defconfig
sh                     magicpanelr2_defconfig
arm                  colibri_pxa300_defconfig
arm                          pxa3xx_defconfig
powerpc                    mvme5100_defconfig
riscv                    nommu_virt_defconfig
arm                            mps2_defconfig
mips                         tb0219_defconfig
sh                          landisk_defconfig
arm                             mxs_defconfig
ia64                             allyesconfig
arm                          pxa910_defconfig
powerpc                     tqm8541_defconfig
parisc                           alldefconfig
arm                        spear6xx_defconfig
sh                   secureedge5410_defconfig
mips                       rbtx49xx_defconfig
sh                     sh7710voipgw_defconfig
powerpc                 mpc85xx_cds_defconfig
arc                      axs103_smp_defconfig
arm                       cns3420vb_defconfig
arc                              alldefconfig
arm                            dove_defconfig
m68k                                defconfig
mips                           xway_defconfig
powerpc                     kmeter1_defconfig
openrisc                    or1ksim_defconfig
arm                    vt8500_v6_v7_defconfig
powerpc                  mpc866_ads_defconfig
powerpc                 mpc834x_itx_defconfig
sh                          polaris_defconfig
mips                      malta_kvm_defconfig
mips                      bmips_stb_defconfig
arc                     haps_hs_smp_defconfig
arm                      pxa255-idp_defconfig
arm                        neponset_defconfig
xtensa                  nommu_kc705_defconfig
sh                      rts7751r2d1_defconfig
arm                         assabet_defconfig
sh                           se7343_defconfig
powerpc                    adder875_defconfig
m68k                       m5208evb_defconfig
arm                     am200epdkit_defconfig
arm                          lpd270_defconfig
xtensa                         virt_defconfig
powerpc                 linkstation_defconfig
parisc                generic-32bit_defconfig
arm                      integrator_defconfig
arm                          simpad_defconfig
sh                               allmodconfig
powerpc                      bamboo_defconfig
c6x                        evmc6474_defconfig
powerpc                  iss476-smp_defconfig
arc                          axs103_defconfig
arm                     eseries_pxa_defconfig
sh                          r7785rp_defconfig
c6x                         dsk6455_defconfig
arc                            hsdk_defconfig
m68k                          sun3x_defconfig
powerpc                       ppc64_defconfig
powerpc                        warp_defconfig
arm                             ezx_defconfig
mips                     cu1000-neo_defconfig
mips                     loongson1c_defconfig
powerpc                         wii_defconfig
arm                           h5000_defconfig
h8300                            allyesconfig
powerpc                      walnut_defconfig
c6x                        evmc6472_defconfig
mips                        nlm_xlp_defconfig
arc                        nsimosci_defconfig
sh                           se7780_defconfig
powerpc                 mpc8313_rdb_defconfig
ia64                        generic_defconfig
m68k                       m5275evb_defconfig
m68k                        m5272c3_defconfig
powerpc                          allyesconfig
arm                          moxart_defconfig
arm                      footbridge_defconfig
arm                  colibri_pxa270_defconfig
powerpc                   motionpro_defconfig
mips                           gcw0_defconfig
powerpc                 mpc8272_ads_defconfig
sh                          r7780mp_defconfig
mips                            ar7_defconfig
s390                       zfcpdump_defconfig
sh                           se7705_defconfig
mips                        qi_lb60_defconfig
h8300                       h8s-sim_defconfig
powerpc                      pasemi_defconfig
mips                         bigsur_defconfig
xtensa                    smp_lx200_defconfig
arm                          exynos_defconfig
mips                malta_kvm_guest_defconfig
sh                           se7750_defconfig
powerpc                   bluestone_defconfig
powerpc                   lite5200b_defconfig
arm                         mv78xx0_defconfig
xtensa                              defconfig
mips                      fuloong2e_defconfig
mips                           mtx1_defconfig
m68k                            mac_defconfig
sh                        dreamcast_defconfig
powerpc                     ppa8548_defconfig
powerpc                 mpc836x_mds_defconfig
arm                       imx_v6_v7_defconfig
arm                           u8500_defconfig
mips                             allmodconfig
powerpc                           allnoconfig
powerpc                      chrp32_defconfig
mips                        maltaup_defconfig
mips                         mpc30x_defconfig
sh                          lboxre2_defconfig
mips                           ip28_defconfig
mips                             allyesconfig
arm                           spitz_defconfig
mips                          rb532_defconfig
arm                           stm32_defconfig
powerpc                    gamecube_defconfig
mips                      pistachio_defconfig
ia64                             allmodconfig
ia64                                defconfig
m68k                             allmodconfig
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
arc                                 defconfig
xtensa                           allyesconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                               defconfig
i386                                defconfig
powerpc                          allmodconfig
i386                 randconfig-a002-20201026
i386                 randconfig-a003-20201026
i386                 randconfig-a005-20201026
i386                 randconfig-a001-20201026
i386                 randconfig-a006-20201026
i386                 randconfig-a004-20201026
i386                 randconfig-a002-20201027
i386                 randconfig-a003-20201027
i386                 randconfig-a005-20201027
i386                 randconfig-a001-20201027
i386                 randconfig-a006-20201027
i386                 randconfig-a004-20201027
x86_64               randconfig-a011-20201026
x86_64               randconfig-a013-20201026
x86_64               randconfig-a016-20201026
x86_64               randconfig-a015-20201026
x86_64               randconfig-a012-20201026
x86_64               randconfig-a014-20201026
i386                 randconfig-a016-20201027
i386                 randconfig-a015-20201027
i386                 randconfig-a014-20201027
i386                 randconfig-a012-20201027
i386                 randconfig-a013-20201027
i386                 randconfig-a011-20201027
i386                 randconfig-a016-20201026
i386                 randconfig-a015-20201026
i386                 randconfig-a014-20201026
i386                 randconfig-a012-20201026
i386                 randconfig-a013-20201026
i386                 randconfig-a011-20201026
x86_64               randconfig-a001-20201027
x86_64               randconfig-a003-20201027
x86_64               randconfig-a002-20201027
x86_64               randconfig-a006-20201027
x86_64               randconfig-a004-20201027
x86_64               randconfig-a005-20201027
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
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
x86_64               randconfig-a001-20201026
x86_64               randconfig-a003-20201026
x86_64               randconfig-a002-20201026
x86_64               randconfig-a006-20201026
x86_64               randconfig-a004-20201026
x86_64               randconfig-a005-20201026
x86_64               randconfig-a011-20201027
x86_64               randconfig-a013-20201027
x86_64               randconfig-a016-20201027
x86_64               randconfig-a015-20201027
x86_64               randconfig-a012-20201027
x86_64               randconfig-a014-20201027

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
