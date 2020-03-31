Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5547A19A0F0
	for <lists+linux-omap@lfdr.de>; Tue, 31 Mar 2020 23:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728245AbgCaVku (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 31 Mar 2020 17:40:50 -0400
Received: from mga04.intel.com ([192.55.52.120]:12791 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727955AbgCaVku (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 31 Mar 2020 17:40:50 -0400
IronPort-SDR: Ws5NbSe0JIEWA9+2FjVunw4AHsD0GfCghAE0sa9RzbwuKoYKZvB6UFxC1CVAEXzRZVEmEpyW6M
 H5ZVr9NlrblA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 14:40:50 -0700
IronPort-SDR: +VKqiltRYa52XGaIfet3Pts/jcZR+Ern8Tu7xxwB1IA0u4gstNI2X9yz/94v+8RDd8PpMEfcYD
 H0jXLhQzw6WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,329,1580803200"; 
   d="scan'208";a="450309191"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Mar 2020 14:40:48 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jJOcq-000GuV-2u; Wed, 01 Apr 2020 05:40:48 +0800
Date:   Wed, 01 Apr 2020 05:40:21 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/fixes] BUILD SUCCESS
 b89027b115e5bd1b530a29e5919692fd84fa356b
Message-ID: <5e83b8c5.3aAopIcZx0yUNkJP%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/fixes
branch HEAD: b89027b115e5bd1b530a29e5919692fd84fa356b  usb: dwc3: gadget: Do link recovery for SS and SSP

elapsed time: 805m

configs tested: 175
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                         at91_dt_defconfig
arm                           efm32_defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                        multi_v7_defconfig
arm                        shmobile_defconfig
arm                           sunxi_defconfig
arm64                               defconfig
sparc                            allyesconfig
ia64                              allnoconfig
s390                              allnoconfig
nios2                         10m50_defconfig
sparc64                          allmodconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                             allyesconfig
ia64                                defconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
nds32                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200401
x86_64               randconfig-a002-20200401
x86_64               randconfig-a003-20200401
i386                 randconfig-a001-20200401
i386                 randconfig-a002-20200401
i386                 randconfig-a003-20200401
x86_64               randconfig-a003-20200331
x86_64               randconfig-a002-20200331
i386                 randconfig-a001-20200331
i386                 randconfig-a002-20200331
i386                 randconfig-a003-20200331
x86_64               randconfig-a001-20200331
alpha                randconfig-a001-20200331
m68k                 randconfig-a001-20200331
mips                 randconfig-a001-20200331
nds32                randconfig-a001-20200331
parisc               randconfig-a001-20200331
c6x                  randconfig-a001-20200331
h8300                randconfig-a001-20200331
microblaze           randconfig-a001-20200331
nios2                randconfig-a001-20200331
sparc64              randconfig-a001-20200331
csky                 randconfig-a001-20200331
openrisc             randconfig-a001-20200331
s390                 randconfig-a001-20200331
sh                   randconfig-a001-20200331
xtensa               randconfig-a001-20200331
x86_64               randconfig-b001-20200331
x86_64               randconfig-b002-20200331
x86_64               randconfig-b003-20200331
i386                 randconfig-b001-20200331
i386                 randconfig-b002-20200331
i386                 randconfig-b003-20200331
x86_64               randconfig-c001-20200331
x86_64               randconfig-c002-20200331
x86_64               randconfig-c003-20200331
i386                 randconfig-c001-20200331
i386                 randconfig-c002-20200331
i386                 randconfig-c003-20200331
x86_64               randconfig-d001-20200331
x86_64               randconfig-d002-20200331
x86_64               randconfig-d003-20200331
i386                 randconfig-d001-20200331
i386                 randconfig-d002-20200331
i386                 randconfig-d003-20200331
x86_64               randconfig-e001-20200331
x86_64               randconfig-e002-20200331
x86_64               randconfig-e003-20200331
i386                 randconfig-e001-20200331
i386                 randconfig-e002-20200331
i386                 randconfig-e003-20200331
x86_64               randconfig-f001-20200331
x86_64               randconfig-f002-20200331
x86_64               randconfig-f003-20200331
i386                 randconfig-f001-20200331
i386                 randconfig-f002-20200331
i386                 randconfig-f003-20200331
x86_64               randconfig-g001-20200331
x86_64               randconfig-g002-20200331
x86_64               randconfig-g003-20200331
i386                 randconfig-g001-20200331
i386                 randconfig-g002-20200331
i386                 randconfig-g003-20200331
x86_64               randconfig-h001-20200331
x86_64               randconfig-h002-20200331
x86_64               randconfig-h003-20200331
i386                 randconfig-h001-20200331
i386                 randconfig-h002-20200331
i386                 randconfig-h003-20200331
arc                  randconfig-a001-20200331
arm                  randconfig-a001-20200331
arm64                randconfig-a001-20200331
ia64                 randconfig-a001-20200331
powerpc              randconfig-a001-20200331
sparc                randconfig-a001-20200331
arc                  randconfig-a001-20200401
arm                  randconfig-a001-20200401
arm64                randconfig-a001-20200401
ia64                 randconfig-a001-20200401
powerpc              randconfig-a001-20200401
sparc                randconfig-a001-20200401
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                             alldefconfig
s390                             allmodconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                                  defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
