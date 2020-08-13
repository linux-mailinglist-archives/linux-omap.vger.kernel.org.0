Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002BE243EDF
	for <lists+linux-omap@lfdr.de>; Thu, 13 Aug 2020 20:32:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726253AbgHMScE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 13 Aug 2020 14:32:04 -0400
Received: from mga06.intel.com ([134.134.136.31]:15640 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726167AbgHMScE (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 13 Aug 2020 14:32:04 -0400
IronPort-SDR: kNi7fCUnkyOeloST1a2X053odI7SYETc2jnl9VaK9h9cSd6UZSQHcMOgU110ixNzheZvUCPuCD
 a9i7yg7oNhHg==
X-IronPort-AV: E=McAfee;i="6000,8403,9712"; a="215831378"
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; 
   d="scan'208";a="215831378"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2020 11:32:03 -0700
IronPort-SDR: PD2+65sKrCyy/+k2R8E/lIo7nO6JxKw2UB/i0o6Jf8CjxilbjUbzbRyaqukdCvirflQDKo0WVL
 OwYpPnBOwmkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,309,1592895600"; 
   d="scan'208";a="291483158"
Received: from lkp-server01.sh.intel.com (HELO 7f1ebb311643) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Aug 2020 11:32:02 -0700
Received: from kbuild by 7f1ebb311643 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k6I1B-0000kQ-A9; Thu, 13 Aug 2020 18:32:01 +0000
Date:   Fri, 14 Aug 2020 02:31:07 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD SUCCESS
 44d7a212181a33226ac3938f2eb8ec3a01995d58
Message-ID: <5f3586eb.VqwdmzbdunhXBdSs%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: 44d7a212181a33226ac3938f2eb8ec3a01995d58  dwc3: debugfs: fix checkpatch warnings

elapsed time: 723m

configs tested: 124
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                           corgi_defconfig
arm                   milbeaut_m10v_defconfig
arm                            dove_defconfig
openrisc                    or1ksim_defconfig
powerpc                           allnoconfig
sh                           se7750_defconfig
m68k                         apollo_defconfig
mips                        maltaup_defconfig
powerpc                     pseries_defconfig
arc                          axs103_defconfig
xtensa                    xip_kc705_defconfig
csky                             alldefconfig
m68k                       bvme6000_defconfig
arm                            lart_defconfig
sh                            migor_defconfig
sh                        sh7785lcr_defconfig
powerpc64                           defconfig
sh                          sdk7780_defconfig
sh                          sdk7786_defconfig
powerpc                          g5_defconfig
microblaze                      mmu_defconfig
mips                        vocore2_defconfig
nds32                            alldefconfig
sh                                  defconfig
mips                      fuloong2e_defconfig
mips                malta_qemu_32r6_defconfig
mips                            e55_defconfig
arm                           stm32_defconfig
arm                            xcep_defconfig
arc                             nps_defconfig
arm                     am200epdkit_defconfig
arm                          collie_defconfig
arm                     eseries_pxa_defconfig
arc                    vdk_hs38_smp_defconfig
arm                            hisi_defconfig
xtensa                          iss_defconfig
h8300                     edosk2674_defconfig
mips                     decstation_defconfig
sh                             sh03_defconfig
powerpc                     mpc512x_defconfig
sh                          lboxre2_defconfig
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
x86_64               randconfig-a006-20200811
x86_64               randconfig-a001-20200811
x86_64               randconfig-a003-20200811
x86_64               randconfig-a005-20200811
x86_64               randconfig-a004-20200811
x86_64               randconfig-a002-20200811
i386                 randconfig-a005-20200813
i386                 randconfig-a001-20200813
i386                 randconfig-a002-20200813
i386                 randconfig-a003-20200813
i386                 randconfig-a006-20200813
i386                 randconfig-a004-20200813
i386                 randconfig-a005-20200812
i386                 randconfig-a001-20200812
i386                 randconfig-a002-20200812
i386                 randconfig-a003-20200812
i386                 randconfig-a006-20200812
i386                 randconfig-a004-20200812
i386                 randconfig-a005-20200811
i386                 randconfig-a001-20200811
i386                 randconfig-a002-20200811
i386                 randconfig-a003-20200811
i386                 randconfig-a006-20200811
i386                 randconfig-a004-20200811
i386                 randconfig-a016-20200813
i386                 randconfig-a011-20200813
i386                 randconfig-a013-20200813
i386                 randconfig-a015-20200813
i386                 randconfig-a012-20200813
i386                 randconfig-a014-20200813
x86_64               randconfig-a006-20200813
x86_64               randconfig-a001-20200813
x86_64               randconfig-a005-20200813
x86_64               randconfig-a003-20200813
x86_64               randconfig-a004-20200813
x86_64               randconfig-a002-20200813
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
