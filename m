Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16B4E277BB5
	for <lists+linux-omap@lfdr.de>; Fri, 25 Sep 2020 00:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726650AbgIXWn3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 24 Sep 2020 18:43:29 -0400
Received: from mga06.intel.com ([134.134.136.31]:49798 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726448AbgIXWn2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 24 Sep 2020 18:43:28 -0400
IronPort-SDR: 110aLQT/s3a/MvlOiKNiaJ04C7GLfaUF7FM1YIoARl5t9LZb9LA8kBeZ0rgHeUdV8UkxkNaOp5
 ersoxchFdMDA==
X-IronPort-AV: E=McAfee;i="6000,8403,9754"; a="222957475"
X-IronPort-AV: E=Sophos;i="5.77,299,1596524400"; 
   d="scan'208";a="222957475"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2020 15:43:28 -0700
IronPort-SDR: r6WtI3ZWVWtkhW+J6yFHctzWlDmm7ZEejZbpDuH/+Xr8/XF9R1hXx8ZcxcSFdWSyhFP8UsqHIG
 63gXLIAvhGUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,299,1596524400"; 
   d="scan'208";a="348018944"
Received: from lkp-server01.sh.intel.com (HELO d1a6b931d9c6) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Sep 2020 15:43:26 -0700
Received: from kbuild by d1a6b931d9c6 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kLZxW-00009w-0h; Thu, 24 Sep 2020 22:43:26 +0000
Date:   Fri, 25 Sep 2020 06:43:01 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD SUCCESS
 1b28687a9c679499ddaa46dac6ca3660e46801c5
Message-ID: <5f6d20f5.c/siK4iQCHRzQPcN%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: 1b28687a9c679499ddaa46dac6ca3660e46801c5  usb: dwc3: gadget: Rename misleading function names

elapsed time: 724m

configs tested: 130
configs skipped: 3

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                    sam440ep_defconfig
sh                      rts7751r2d1_defconfig
powerpc                    klondike_defconfig
arm                       imx_v6_v7_defconfig
sh                        sh7757lcr_defconfig
mips                  maltasmvp_eva_defconfig
m68k                         apollo_defconfig
mips                      bmips_stb_defconfig
arc                     nsimosci_hs_defconfig
i386                             alldefconfig
arm                        mini2440_defconfig
mips                         tb0226_defconfig
m68k                           sun3_defconfig
microblaze                          defconfig
s390                                defconfig
mips                         rt305x_defconfig
arm                       mainstone_defconfig
powerpc64                           defconfig
xtensa                              defconfig
m68k                        stmark2_defconfig
sh                          rsk7264_defconfig
arm                        neponset_defconfig
powerpc                      makalu_defconfig
powerpc                      cm5200_defconfig
arm                           h5000_defconfig
m68k                        mvme147_defconfig
powerpc                     tqm8560_defconfig
powerpc                     kmeter1_defconfig
arc                      axs103_smp_defconfig
powerpc                 linkstation_defconfig
arm                     am200epdkit_defconfig
ia64                      gensparse_defconfig
powerpc                      pcm030_defconfig
parisc                           alldefconfig
mips                          malta_defconfig
powerpc                     sbc8548_defconfig
arc                             nps_defconfig
h8300                    h8300h-sim_defconfig
sh                           se7705_defconfig
powerpc                    amigaone_defconfig
arc                        nsim_700_defconfig
c6x                              allyesconfig
arm                         axm55xx_defconfig
sh                          polaris_defconfig
sh                ecovec24-romimage_defconfig
csky                                defconfig
sh                          lboxre2_defconfig
nds32                             allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
nios2                               defconfig
arc                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
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
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200924
i386                 randconfig-a006-20200924
i386                 randconfig-a003-20200924
i386                 randconfig-a004-20200924
i386                 randconfig-a005-20200924
i386                 randconfig-a001-20200924
i386                 randconfig-a002-20200923
i386                 randconfig-a006-20200923
i386                 randconfig-a003-20200923
i386                 randconfig-a004-20200923
i386                 randconfig-a005-20200923
i386                 randconfig-a001-20200923
x86_64               randconfig-a011-20200923
x86_64               randconfig-a013-20200923
x86_64               randconfig-a014-20200923
x86_64               randconfig-a015-20200923
x86_64               randconfig-a012-20200923
x86_64               randconfig-a016-20200923
i386                 randconfig-a012-20200923
i386                 randconfig-a014-20200923
i386                 randconfig-a016-20200923
i386                 randconfig-a013-20200923
i386                 randconfig-a011-20200923
i386                 randconfig-a015-20200923
i386                 randconfig-a012-20200924
i386                 randconfig-a014-20200924
i386                 randconfig-a016-20200924
i386                 randconfig-a013-20200924
i386                 randconfig-a011-20200924
i386                 randconfig-a015-20200924
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
x86_64               randconfig-a006-20200923
x86_64               randconfig-a005-20200923
x86_64               randconfig-a003-20200923
x86_64               randconfig-a004-20200923
x86_64               randconfig-a002-20200923
x86_64               randconfig-a001-20200923

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
