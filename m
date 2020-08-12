Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A91F2430C2
	for <lists+linux-omap@lfdr.de>; Thu, 13 Aug 2020 00:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgHLWVU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Aug 2020 18:21:20 -0400
Received: from mga18.intel.com ([134.134.136.126]:50040 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726508AbgHLWVU (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 12 Aug 2020 18:21:20 -0400
IronPort-SDR: YgTOmzQ+VhkQ560RrwW5AJqws7I280NjVkQ43xBnLiQbxfuac3pW6uJ+hluAL0kjK77CM2Eihu
 fpxDeUFpHpjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9711"; a="141720610"
X-IronPort-AV: E=Sophos;i="5.76,305,1592895600"; 
   d="scan'208";a="141720610"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2020 15:21:19 -0700
IronPort-SDR: BLeH4IpuIM6UXfEfUk6fAiF2Ke6vKHTdF2j/IojmSzzCOPOQb1JL+4Y8cV2RUiwl+8FZ1QnVHn
 gIAWEuzmneXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,305,1592895600"; 
   d="scan'208";a="291189229"
Received: from lkp-server01.sh.intel.com (HELO 7f1ebb311643) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 12 Aug 2020 15:21:18 -0700
Received: from kbuild by 7f1ebb311643 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k5z7V-0000HI-TR; Wed, 12 Aug 2020 22:21:17 +0000
Date:   Thu, 13 Aug 2020 06:21:17 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <felipe.balbi@microsoft.com>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD SUCCESS
 47d08a5ced63385685fd028b45f5b6e78b656131
Message-ID: <5f346b5d.i+Not/D4HLW3Y2Ud%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: 47d08a5ced63385685fd028b45f5b6e78b656131  usb: dwc3: qcom: Add interconnect support in dwc3 driver

elapsed time: 721m

configs tested: 89
configs skipped: 5

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                            xcep_defconfig
mips                          ath25_defconfig
sh                           se7619_defconfig
powerpc                        cell_defconfig
m68k                          multi_defconfig
sh                           se7750_defconfig
m68k                         apollo_defconfig
mips                        maltaup_defconfig
powerpc                     pseries_defconfig
arc                          axs103_defconfig
arm                        clps711x_defconfig
s390                             allyesconfig
arm                         lubbock_defconfig
arm                          badge4_defconfig
mips                      maltaaprp_defconfig
powerpc                       maple_defconfig
sh                          urquell_defconfig
arc                    vdk_hs38_smp_defconfig
powerpc                         wii_defconfig
sh                         ecovec24_defconfig
sh                           se7722_defconfig
mips                           xway_defconfig
arm                        magician_defconfig
sh                           cayman_defconfig
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
x86_64               randconfig-a006-20200811
x86_64               randconfig-a001-20200811
x86_64               randconfig-a003-20200811
x86_64               randconfig-a005-20200811
x86_64               randconfig-a004-20200811
x86_64               randconfig-a002-20200811
i386                 randconfig-a005-20200812
i386                 randconfig-a001-20200812
i386                 randconfig-a002-20200812
i386                 randconfig-a003-20200812
i386                 randconfig-a006-20200812
i386                 randconfig-a004-20200812
i386                 randconfig-a016-20200812
i386                 randconfig-a011-20200812
i386                 randconfig-a013-20200812
i386                 randconfig-a015-20200812
i386                 randconfig-a012-20200812
i386                 randconfig-a014-20200812
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
