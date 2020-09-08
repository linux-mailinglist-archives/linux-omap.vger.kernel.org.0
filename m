Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C8DF260AB4
	for <lists+linux-omap@lfdr.de>; Tue,  8 Sep 2020 08:17:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728775AbgIHGRU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 8 Sep 2020 02:17:20 -0400
Received: from mga06.intel.com ([134.134.136.31]:54276 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728654AbgIHGRS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 8 Sep 2020 02:17:18 -0400
IronPort-SDR: tRFDSKCJQs9CFpxcU3vVbsyDoNltwRZ8Xd75ChhxBw+alGB+AKF4hXykl8rI//+mKqkc6tI1i+
 mbVsYjGz245w==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="219638206"
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; 
   d="scan'208";a="219638206"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2020 23:17:17 -0700
IronPort-SDR: 92zilP2LfCgGVHhtvUNt0q/BhH/ZsI8U51UIaL8jEMgPvo3gspjw0PjZs60OmEgunH3k3tAL6E
 2P26Eq9oI/Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,404,1592895600"; 
   d="scan'208";a="343430299"
Received: from lkp-server01.sh.intel.com (HELO c2729d4f3f0b) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 07 Sep 2020 23:17:16 -0700
Received: from kbuild by c2729d4f3f0b with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kFWwN-00003n-K6; Tue, 08 Sep 2020 06:17:15 +0000
Date:   Tue, 08 Sep 2020 14:16:40 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD SUCCESS
 19a42ddbea1fb6ce8d9006a3ffe3b47bbdb6520e
Message-ID: <5f5721c8.uLQHuFR0Mw0nJgDM%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: 19a42ddbea1fb6ce8d9006a3ffe3b47bbdb6520e  usb: mtu3: Remove unsused inline function is_first_entry

elapsed time: 727m

configs tested: 141
configs skipped: 11

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
mips                         bigsur_defconfig
x86_64                           alldefconfig
h8300                               defconfig
mips                      maltasmvp_defconfig
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
powerpc                      tqm8xx_defconfig
mips                           rs90_defconfig
xtensa                       common_defconfig
arm                            u300_defconfig
powerpc                     powernv_defconfig
arc                         haps_hs_defconfig
arm                       netwinder_defconfig
mips                           ci20_defconfig
c6x                        evmc6457_defconfig
sh                   sh7724_generic_defconfig
mips                          ath79_defconfig
sh                          lboxre2_defconfig
powerpc                      ppc64e_defconfig
mips                       capcella_defconfig
arm                         assabet_defconfig
riscv                          rv32_defconfig
arm                         nhk8815_defconfig
arm                           corgi_defconfig
arm                          gemini_defconfig
ia64                                defconfig
mips                     cu1000-neo_defconfig
powerpc                      ppc6xx_defconfig
mips                             allyesconfig
sh                          sdk7786_defconfig
arm                             ezx_defconfig
mips                       lemote2f_defconfig
arm                           spitz_defconfig
arm                          ep93xx_defconfig
arm                       versatile_defconfig
sh                          r7785rp_defconfig
openrisc                 simple_smp_defconfig
s390                       zfcpdump_defconfig
arm                       mainstone_defconfig
sh                            shmin_defconfig
ia64                             allmodconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
powerpc                             defconfig
x86_64               randconfig-a006-20200907
x86_64               randconfig-a004-20200907
x86_64               randconfig-a005-20200907
x86_64               randconfig-a001-20200907
x86_64               randconfig-a002-20200907
x86_64               randconfig-a003-20200907
i386                 randconfig-a004-20200908
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
i386                 randconfig-a005-20200908
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
x86_64               randconfig-a013-20200907
x86_64               randconfig-a011-20200907
x86_64               randconfig-a016-20200907
x86_64               randconfig-a012-20200907
x86_64               randconfig-a015-20200907
x86_64               randconfig-a014-20200907

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
