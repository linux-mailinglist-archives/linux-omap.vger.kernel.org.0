Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA82E27D707
	for <lists+linux-omap@lfdr.de>; Tue, 29 Sep 2020 21:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbgI2Thm (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 29 Sep 2020 15:37:42 -0400
Received: from mga02.intel.com ([134.134.136.20]:53021 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727740AbgI2Thl (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 29 Sep 2020 15:37:41 -0400
IronPort-SDR: DY1HlspdtdOfyrrRYLKeXWN/oVLtfzCyhP3iLxgUFoKiODpTu+bnZfoC4nodjuKkV3Om2w9QoG
 CIdyBryY8YPQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9759"; a="149930980"
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; 
   d="scan'208";a="149930980"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2020 12:37:38 -0700
IronPort-SDR: 4vnLNO6Wk6kogUEtdUzpbo/W1IaKimgKQmmOpx6dx0OiMdQcZ81KLC5gRYes+ARYznm8cnY/NL
 aPJxuIljRS6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,319,1596524400"; 
   d="scan'208";a="493134248"
Received: from lkp-server02.sh.intel.com (HELO 10ae44db8633) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 29 Sep 2020 12:37:38 -0700
Received: from kbuild by 10ae44db8633 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kNLRR-0000GE-GQ; Tue, 29 Sep 2020 19:37:37 +0000
Date:   Wed, 30 Sep 2020 03:37:28 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD SUCCESS WITH WARNING
 8e9f3908b995a33443821dc3a977277f69a4adc3
Message-ID: <5f738cf8.voQWTbhK9hBhwjyh%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: 8e9f3908b995a33443821dc3a977277f69a4adc3  usb: dwc3: gadget: Allow restarting a transfer

Warning in current branch:

drivers/usb/cdns3/gadget.c:509:7: warning: variable 'length' set but not used [-Wunused-but-set-variable]

Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allmodconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- arc-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- c6x-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- c6x-randconfig-r003-20200929
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- h8300-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- i386-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- i386-randconfig-a006-20200929
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- i386-randconfig-s001-20200929
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- ia64-allmodconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- ia64-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- m68k-allmodconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- m68k-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- mips-allmodconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- nios2-randconfig-r011-20200929
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- parisc-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- powerpc-allmodconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- powerpc-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- riscv-allmodconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- riscv-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- s390-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- sparc-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- x86_64-allmodconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
|-- x86_64-allyesconfig
|   `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used
`-- xtensa-allyesconfig
    `-- drivers-usb-cdns3-gadget.c:warning:variable-length-set-but-not-used

elapsed time: 725m

configs tested: 155
configs skipped: 2

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                    vt8500_v6_v7_defconfig
m68k                        m5407c3_defconfig
mips                         db1xxx_defconfig
powerpc                      cm5200_defconfig
arm                        keystone_defconfig
arm                        multi_v5_defconfig
powerpc                 mpc8540_ads_defconfig
arm                        mvebu_v7_defconfig
arm                        spear3xx_defconfig
s390                       zfcpdump_defconfig
ia64                        generic_defconfig
mips                      pistachio_defconfig
ia64                            zx1_defconfig
arm                           efm32_defconfig
arm                         cm_x300_defconfig
sh                         apsh4a3a_defconfig
um                             i386_defconfig
arm                             ezx_defconfig
powerpc64                           defconfig
powerpc                    ge_imp3a_defconfig
powerpc                      pasemi_defconfig
powerpc                     sequoia_defconfig
mips                           ip32_defconfig
powerpc                  mpc866_ads_defconfig
nios2                         3c120_defconfig
powerpc                 mpc832x_mds_defconfig
mips                             allmodconfig
sh                        sh7757lcr_defconfig
powerpc                  mpc885_ads_defconfig
arm                             pxa_defconfig
sh                           se7722_defconfig
riscv                    nommu_virt_defconfig
mips                      loongson3_defconfig
arm                       spear13xx_defconfig
powerpc                     tqm8541_defconfig
m68k                        mvme16x_defconfig
powerpc                 mpc8560_ads_defconfig
s390                                defconfig
powerpc                 mpc837x_rdb_defconfig
sh                          polaris_defconfig
sh                          urquell_defconfig
arm                           sama5_defconfig
arc                             nps_defconfig
arm                          exynos_defconfig
um                            kunit_defconfig
arm                          gemini_defconfig
powerpc                 mpc8313_rdb_defconfig
powerpc                        fsp2_defconfig
arm                           sunxi_defconfig
sh                           se7206_defconfig
powerpc                      katmai_defconfig
powerpc                     tqm8560_defconfig
microblaze                    nommu_defconfig
powerpc                     akebono_defconfig
c6x                        evmc6457_defconfig
ia64                      gensparse_defconfig
powerpc                     ppa8548_defconfig
powerpc                    socrates_defconfig
arm                              zx_defconfig
c6x                         dsk6455_defconfig
arm                         at91_dt_defconfig
sh                          sdk7780_defconfig
powerpc                     tqm8555_defconfig
mips                         mpc30x_defconfig
powerpc                      ppc6xx_defconfig
arm                      pxa255-idp_defconfig
mips                        nlm_xlr_defconfig
powerpc                 mpc836x_mds_defconfig
arc                        vdk_hs38_defconfig
xtensa                    smp_lx200_defconfig
arm                           u8500_defconfig
mips                           ci20_defconfig
powerpc                 mpc836x_rdk_defconfig
arm                       aspeed_g5_defconfig
sparc                            alldefconfig
sh                         ecovec24_defconfig
riscv                          rv32_defconfig
mips                        bcm63xx_defconfig
arm                         hackkit_defconfig
sh                   sh7724_generic_defconfig
powerpc64                        alldefconfig
arm                            mps2_defconfig
mips                       capcella_defconfig
powerpc                     mpc83xx_defconfig
openrisc                    or1ksim_defconfig
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
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a006-20200929
i386                 randconfig-a002-20200929
i386                 randconfig-a003-20200929
i386                 randconfig-a004-20200929
i386                 randconfig-a005-20200929
i386                 randconfig-a001-20200929
x86_64               randconfig-a011-20200929
x86_64               randconfig-a013-20200929
x86_64               randconfig-a015-20200929
x86_64               randconfig-a014-20200929
x86_64               randconfig-a016-20200929
x86_64               randconfig-a012-20200929
i386                 randconfig-a012-20200929
i386                 randconfig-a016-20200929
i386                 randconfig-a014-20200929
i386                 randconfig-a013-20200929
i386                 randconfig-a015-20200929
i386                 randconfig-a011-20200929
riscv                    nommu_k210_defconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a005-20200929
x86_64               randconfig-a003-20200929
x86_64               randconfig-a004-20200929
x86_64               randconfig-a002-20200929
x86_64               randconfig-a006-20200929
x86_64               randconfig-a001-20200929

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
