Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF9C21AD98
	for <lists+linux-omap@lfdr.de>; Fri, 10 Jul 2020 05:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgGJDkw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Jul 2020 23:40:52 -0400
Received: from mga03.intel.com ([134.134.136.65]:12605 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726509AbgGJDkv (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 9 Jul 2020 23:40:51 -0400
IronPort-SDR: 9AGpKEsApofNRE72yZ0y+QfFpgto+MvuIwcHiH+r2Ci8nKfniheD2Fx6frbAOLCtXXa0URUUQz
 F8JWF08EDLZw==
X-IronPort-AV: E=McAfee;i="6000,8403,9677"; a="148134691"
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; 
   d="scan'208";a="148134691"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2020 20:40:50 -0700
IronPort-SDR: W5o4jXi7DNh6igZu6MYsy9UklhwKSOi/TJ1u/3Hxpc1nP4LTq5YhT3VNu39s+3XVJ5IhomzpSu
 MRdkr8OuVZ5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,334,1589266800"; 
   d="scan'208";a="484038611"
Received: from lkp-server02.sh.intel.com (HELO d197edaadf32) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 09 Jul 2020 20:40:49 -0700
Received: from kbuild by d197edaadf32 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1jtju4-00002j-OA; Fri, 10 Jul 2020 03:40:48 +0000
Date:   Fri, 10 Jul 2020 11:40:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/fixes] BUILD SUCCESS
 8778eb0927ddcd3f431805c37b78fa56481aeed9
Message-ID: <5f07e325.mM6Q2bIAlbjG6bCk%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/fixes
branch HEAD: 8778eb0927ddcd3f431805c37b78fa56481aeed9  usb: gadget: function: fix missing spinlock in f_uac1_legacy

elapsed time: 721m

configs tested: 125
configs skipped: 8

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                               defconfig
mips                         rt305x_defconfig
sh                                  defconfig
nios2                            alldefconfig
m68k                         apollo_defconfig
mips                        omega2p_defconfig
powerpc                     mpc512x_defconfig
s390                          debug_defconfig
csky                             allyesconfig
m68k                          amiga_defconfig
powerpc                     ep8248e_defconfig
arm                   milbeaut_m10v_defconfig
mips                       rbtx49xx_defconfig
arm                        spear6xx_defconfig
m68k                       m5249evb_defconfig
arm                        multi_v7_defconfig
powerpc                       holly_defconfig
x86_64                              defconfig
arm                         ebsa110_defconfig
ia64                                defconfig
csky                                defconfig
powerpc                      tqm8xx_defconfig
powerpc                      ep88xc_defconfig
arm                         at91_dt_defconfig
m68k                          hp300_defconfig
powerpc                  mpc866_ads_defconfig
powerpc64                           defconfig
um                             i386_defconfig
openrisc                         allyesconfig
sh                        edosk7705_defconfig
m68k                          atari_defconfig
sh                             espt_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
nds32                               defconfig
nds32                             allnoconfig
alpha                               defconfig
alpha                            allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200709
i386                 randconfig-a001-20200709
i386                 randconfig-a006-20200709
i386                 randconfig-a005-20200709
i386                 randconfig-a004-20200709
i386                 randconfig-a003-20200709
x86_64               randconfig-a012-20200709
x86_64               randconfig-a016-20200709
x86_64               randconfig-a011-20200709
x86_64               randconfig-a014-20200709
x86_64               randconfig-a013-20200709
x86_64               randconfig-a015-20200709
i386                 randconfig-a011-20200709
i386                 randconfig-a015-20200709
i386                 randconfig-a014-20200709
i386                 randconfig-a016-20200709
i386                 randconfig-a012-20200709
i386                 randconfig-a013-20200709
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                                allnoconfig
um                                  defconfig
um                               allyesconfig
um                               allmodconfig
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
