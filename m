Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DE3EA26235D
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 01:05:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgIHXFz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Sep 2020 19:05:55 -0400
Received: from mga06.intel.com ([134.134.136.31]:3675 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726657AbgIHXFy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Sep 2020 19:05:54 -0400
IronPort-SDR: sqePyzWwRtXyBSq4EzYdokjaCzeV3O9XmHF0CMRaRXxhpBewX1p9OvifqHOmTUTfyyP51Iw7ZV
 9m8czciZcczA==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="219797020"
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; 
   d="scan'208";a="219797020"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 16:05:42 -0700
IronPort-SDR: Xv+yBSlKq4QLKUgK5cBPgpbc+GifsUloqjohvyMn0CYCUwpX1uqULUtb8edQ9VXlA3MFxxYqQq
 9OhVk3WF5/Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,407,1592895600"; 
   d="scan'208";a="343696973"
Received: from lkp-server01.sh.intel.com (HELO fc0154cbc871) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 08 Sep 2020 16:05:41 -0700
Received: from kbuild by fc0154cbc871 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kFmgG-0000Fz-IR; Tue, 08 Sep 2020 23:05:40 +0000
Date:   Wed, 09 Sep 2020 07:05:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD REGRESSION
 3c9722514c3fb74bbe0af87c20bc6b4c47121287
Message-ID: <5f580e1d.DexYB40yBbPBm9uF%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: 3c9722514c3fb74bbe0af87c20bc6b4c47121287  dt-bindings: usb: renesas,usb-xhci: Document r8a774e1 support

Error/Warning in current branch:

arceb-elf-ld: drd.c:(.text+0x1c0): undefined reference to `usb_role_switch_register'
arceb-elf-ld: drd.c:(.text+0x2c4): undefined reference to `usb_role_switch_unregister'
arceb-elf-ld: drd.c:(.text+0x82): undefined reference to `usb_role_switch_get_drvdata'
drd.c:(.text+0x1c0): undefined reference to `usb_role_switch_register'
drd.c:(.text+0x2c4): undefined reference to `usb_role_switch_unregister'
drd.c:(.text+0x82): undefined reference to `usb_role_switch_get_drvdata'

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
`-- arc-randconfig-r016-20200908
    |-- arceb-elf-ld:drd.c:(.text):undefined-reference-to-usb_role_switch_get_drvdata
    |-- arceb-elf-ld:drd.c:(.text):undefined-reference-to-usb_role_switch_register
    |-- arceb-elf-ld:drd.c:(.text):undefined-reference-to-usb_role_switch_unregister
    |-- drd.c:(.text):undefined-reference-to-usb_role_switch_get_drvdata
    |-- drd.c:(.text):undefined-reference-to-usb_role_switch_register
    `-- drd.c:(.text):undefined-reference-to-usb_role_switch_unregister

elapsed time: 725m

configs tested: 143
configs skipped: 10

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
xtensa                    xip_kc705_defconfig
arm                          iop32x_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
powerpc                      pasemi_defconfig
sh                   secureedge5410_defconfig
sh                        sh7757lcr_defconfig
microblaze                    nommu_defconfig
mips                           ip27_defconfig
arm                   milbeaut_m10v_defconfig
alpha                               defconfig
arc                              alldefconfig
m68k                        m5272c3_defconfig
mips                 decstation_r4k_defconfig
mips                malta_qemu_32r6_defconfig
powerpc                     ep8248e_defconfig
xtensa                              defconfig
arm                          pxa910_defconfig
arm                        spear3xx_defconfig
c6x                        evmc6457_defconfig
arc                              allyesconfig
sh                   sh7724_generic_defconfig
mips                          ath79_defconfig
sh                          lboxre2_defconfig
nios2                               defconfig
arm                      pxa255-idp_defconfig
arm                  colibri_pxa270_defconfig
powerpc                     powernv_defconfig
arm                            lart_defconfig
csky                             alldefconfig
arm                         lubbock_defconfig
arm                          badge4_defconfig
arm                         hackkit_defconfig
powerpc                 linkstation_defconfig
arm                      footbridge_defconfig
arm                         cm_x300_defconfig
arm                         lpc32xx_defconfig
riscv                             allnoconfig
sh                            hp6xx_defconfig
openrisc                    or1ksim_defconfig
arm                           spitz_defconfig
arm                          ep93xx_defconfig
arm                       versatile_defconfig
sh                          r7785rp_defconfig
openrisc                 simple_smp_defconfig
riscv                          rv32_defconfig
s390                       zfcpdump_defconfig
arm                       mainstone_defconfig
powerpc                      ppc64e_defconfig
sh                            shmin_defconfig
mips                           ci20_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                             allnoconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
x86_64               randconfig-a006-20200907
x86_64               randconfig-a004-20200907
x86_64               randconfig-a003-20200907
x86_64               randconfig-a005-20200907
x86_64               randconfig-a001-20200907
x86_64               randconfig-a002-20200907
i386                 randconfig-a004-20200908
i386                 randconfig-a005-20200908
i386                 randconfig-a006-20200908
i386                 randconfig-a002-20200908
i386                 randconfig-a001-20200908
i386                 randconfig-a003-20200908
i386                 randconfig-a004-20200907
i386                 randconfig-a005-20200907
i386                 randconfig-a006-20200907
i386                 randconfig-a002-20200907
i386                 randconfig-a003-20200907
i386                 randconfig-a001-20200907
x86_64               randconfig-a013-20200908
x86_64               randconfig-a016-20200908
x86_64               randconfig-a011-20200908
x86_64               randconfig-a012-20200908
x86_64               randconfig-a015-20200908
x86_64               randconfig-a014-20200908
i386                 randconfig-a016-20200908
i386                 randconfig-a015-20200908
i386                 randconfig-a011-20200908
i386                 randconfig-a013-20200908
i386                 randconfig-a014-20200908
i386                 randconfig-a012-20200908
i386                 randconfig-a016-20200907
i386                 randconfig-a015-20200907
i386                 randconfig-a011-20200907
i386                 randconfig-a013-20200907
i386                 randconfig-a014-20200907
i386                 randconfig-a012-20200907
riscv                            allyesconfig
riscv                               defconfig
riscv                            allmodconfig
x86_64                                   rhel
x86_64                           allyesconfig
x86_64                    rhel-7.6-kselftests
x86_64                              defconfig
x86_64                               rhel-8.3
x86_64                                  kexec

clang tested configs:
x86_64               randconfig-a004-20200908
x86_64               randconfig-a006-20200908
x86_64               randconfig-a003-20200908
x86_64               randconfig-a001-20200908
x86_64               randconfig-a005-20200908
x86_64               randconfig-a002-20200908
x86_64               randconfig-a013-20200907
x86_64               randconfig-a011-20200907
x86_64               randconfig-a016-20200907
x86_64               randconfig-a012-20200907
x86_64               randconfig-a015-20200907
x86_64               randconfig-a014-20200907

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
