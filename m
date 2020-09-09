Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E7D226266B
	for <lists+linux-omap@lfdr.de>; Wed,  9 Sep 2020 06:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgIIEnR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 9 Sep 2020 00:43:17 -0400
Received: from mga05.intel.com ([192.55.52.43]:6079 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725811AbgIIEnQ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 9 Sep 2020 00:43:16 -0400
IronPort-SDR: la5aqwbYGXrIofkVI0ifI7YL9OK/Vyfv2h0yhBVdi6+85TWvcDPK2pD3b/td6eLTwKa2cceGNn
 cqKrklyHE5nQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9738"; a="243084175"
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; 
   d="scan'208";a="243084175"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2020 21:43:15 -0700
IronPort-SDR: qudUQnPsndW+/4lmp0X2l/xnS7mqJ3YCPXx/wHYzaCd0IzVPT1yErdmrl6GW8KvkStdiRV0U8W
 nfQoPVNcajQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,408,1592895600"; 
   d="scan'208";a="505319925"
Received: from lkp-server01.sh.intel.com (HELO 12ff3cf3f2e9) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 08 Sep 2020 21:43:14 -0700
Received: from kbuild by 12ff3cf3f2e9 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kFrwv-00001N-En; Wed, 09 Sep 2020 04:43:13 +0000
Date:   Wed, 09 Sep 2020 12:42:21 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/fixes] BUILD SUCCESS
 51609fba0cca69206a213171ce0cdf2dfc9cb21d
Message-ID: <5f585d2d.Ag27ON0pIxLGRQvc%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/fixes
branch HEAD: 51609fba0cca69206a213171ce0cdf2dfc9cb21d  usb: dwc3: simple: add support for Hikey 970

elapsed time: 726m

configs tested: 167
configs skipped: 17

The following configs have been built successfully.
More configs may be tested in the coming days.

gcc tested configs:
arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allmodconfig
arm                              allyesconfig
arm                       omap2plus_defconfig
powerpc                    adder875_defconfig
mips                            ar7_defconfig
arm                           omap1_defconfig
sh                           se7619_defconfig
mips                           ip28_defconfig
mips                          malta_defconfig
powerpc                       holly_defconfig
arm                        mvebu_v7_defconfig
arc                     nsimosci_hs_defconfig
sh                        sh7763rdp_defconfig
sh                          r7785rp_defconfig
mips                           rs90_defconfig
m68k                       m5275evb_defconfig
arm                          exynos_defconfig
mips                malta_kvm_guest_defconfig
m68k                        m5407c3_defconfig
c6x                              allyesconfig
mips                            gpr_defconfig
sh                           se7780_defconfig
powerpc                           allnoconfig
s390                       zfcpdump_defconfig
nios2                               defconfig
arc                        vdk_hs38_defconfig
ia64                      gensparse_defconfig
c6x                        evmc6457_defconfig
m68k                            q40_defconfig
sparc                            allyesconfig
sh                   secureedge5410_defconfig
um                            kunit_defconfig
sh                           se7721_defconfig
sh                                  defconfig
arm                              zx_defconfig
arm                  colibri_pxa270_defconfig
arm                          pxa168_defconfig
arm                        spear6xx_defconfig
ia64                          tiger_defconfig
microblaze                      mmu_defconfig
powerpc                     mpc512x_defconfig
arm                          collie_defconfig
arm                          moxart_defconfig
mips                     cu1000-neo_defconfig
arc                            hsdk_defconfig
powerpc                          allmodconfig
s390                                defconfig
arm                         hackkit_defconfig
powerpc                 linkstation_defconfig
arm                      footbridge_defconfig
xtensa                              defconfig
c6x                         dsk6455_defconfig
h8300                            alldefconfig
sh                        sh7785lcr_defconfig
arc                          axs103_defconfig
mips                         rt305x_defconfig
arm                         s3c2410_defconfig
riscv                            allmodconfig
m68k                        stmark2_defconfig
powerpc                         ps3_defconfig
arm                        trizeps4_defconfig
powerpc                  mpc885_ads_defconfig
sh                         apsh4a3a_defconfig
mips                         tb0287_defconfig
arc                          axs101_defconfig
sh                        apsh4ad0a_defconfig
arm                            zeus_defconfig
c6x                        evmc6472_defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
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
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
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
i386                 randconfig-a004-20200909
i386                 randconfig-a005-20200909
i386                 randconfig-a006-20200909
i386                 randconfig-a002-20200909
i386                 randconfig-a001-20200909
i386                 randconfig-a003-20200909
x86_64               randconfig-a013-20200908
x86_64               randconfig-a016-20200908
x86_64               randconfig-a011-20200908
x86_64               randconfig-a012-20200908
x86_64               randconfig-a015-20200908
x86_64               randconfig-a014-20200908
i386                 randconfig-a016-20200907
i386                 randconfig-a015-20200907
i386                 randconfig-a011-20200907
i386                 randconfig-a013-20200907
i386                 randconfig-a014-20200907
i386                 randconfig-a012-20200907
i386                 randconfig-a016-20200908
i386                 randconfig-a015-20200908
i386                 randconfig-a011-20200908
i386                 randconfig-a013-20200908
i386                 randconfig-a014-20200908
i386                 randconfig-a012-20200908
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
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
x86_64               randconfig-a013-20200909
x86_64               randconfig-a016-20200909
x86_64               randconfig-a011-20200909
x86_64               randconfig-a012-20200909
x86_64               randconfig-a015-20200909
x86_64               randconfig-a014-20200909

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
