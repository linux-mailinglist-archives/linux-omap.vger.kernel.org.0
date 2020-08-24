Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EDD5250A5A
	for <lists+linux-omap@lfdr.de>; Mon, 24 Aug 2020 22:56:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgHXU4w (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Aug 2020 16:56:52 -0400
Received: from mga11.intel.com ([192.55.52.93]:11969 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726051AbgHXU4v (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 24 Aug 2020 16:56:51 -0400
IronPort-SDR: 7svKFMh+L5HXla2eRcb4c9YVkrfCNzAAEWR/rb32nW8IYrPONOdRKJ1nmWXWrGsplOTjMPYOTP
 +WgWgq5YSVeg==
X-IronPort-AV: E=McAfee;i="6000,8403,9723"; a="153566288"
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; 
   d="scan'208";a="153566288"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2020 13:56:50 -0700
IronPort-SDR: 4NPByA73rfZoRpO9RibkGcKPWkKPIlPN6ZZZq/q5BXD28AGLPLJUnl8IKRS5gYzn4KoGqIWfMY
 Ty/vY6EOkVCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,349,1592895600"; 
   d="scan'208";a="338568656"
Received: from lkp-server01.sh.intel.com (HELO c420d4f0765f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 24 Aug 2020 13:56:49 -0700
Received: from kbuild by c420d4f0765f with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kAJWK-0000TO-KH; Mon, 24 Aug 2020 20:56:48 +0000
Date:   Tue, 25 Aug 2020 04:56:08 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD SUCCESS WITH WARNING
 53b3ae5a08ffcd07d627baeddd00ae63f973513b
Message-ID: <5f442968.WEdAgLMYVLYcPzdY%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: 53b3ae5a08ffcd07d627baeddd00ae63f973513b  dwc3: debugfs: fix checkpatch warnings

Warning in current branch:

drivers/usb/dwc2/platform.c:593:1: warning: unused label 'error_debugfs' [-Wunused-label]

Warning ids grouped by kconfigs:

clang_recent_errors
|-- arm-randconfig-r012-20200824
|   `-- drivers-usb-dwc2-platform.c:warning:unused-label-error_debugfs
`-- mips-randconfig-r013-20200824
    `-- drivers-usb-dwc2-platform.c:warning:unused-label-error_debugfs

elapsed time: 724m

configs tested: 97
configs skipped: 6

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
powerpc                      tqm8xx_defconfig
nios2                         10m50_defconfig
m68k                        m5407c3_defconfig
powerpc                          g5_defconfig
mips                           jazz_defconfig
c6x                         dsk6455_defconfig
arm                         lpc32xx_defconfig
arm                      integrator_defconfig
arm                           sunxi_defconfig
sh                          landisk_defconfig
powerpc                     ep8248e_defconfig
mips                       rbtx49xx_defconfig
m68k                           sun3_defconfig
sh                   rts7751r2dplus_defconfig
arm                            zeus_defconfig
arm                              zx_defconfig
arc                              alldefconfig
arm                          badge4_defconfig
sh                          sdk7780_defconfig
sh                          r7785rp_defconfig
arm                             rpc_defconfig
h8300                    h8300h-sim_defconfig
powerpc                         ps3_defconfig
riscv                    nommu_k210_defconfig
arc                        nsimosci_defconfig
sh                           se7721_defconfig
m68k                            q40_defconfig
mips                     loongson1b_defconfig
arm                           stm32_defconfig
x86_64                           alldefconfig
sparc                       sparc64_defconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a002-20200824
i386                 randconfig-a004-20200824
i386                 randconfig-a005-20200824
i386                 randconfig-a003-20200824
i386                 randconfig-a006-20200824
i386                 randconfig-a001-20200824
x86_64               randconfig-a015-20200824
x86_64               randconfig-a016-20200824
x86_64               randconfig-a012-20200824
x86_64               randconfig-a014-20200824
x86_64               randconfig-a011-20200824
x86_64               randconfig-a013-20200824
i386                 randconfig-a013-20200824
i386                 randconfig-a012-20200824
i386                 randconfig-a011-20200824
i386                 randconfig-a016-20200824
i386                 randconfig-a015-20200824
i386                 randconfig-a014-20200824
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
