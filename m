Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C97FE1985E7
	for <lists+linux-omap@lfdr.de>; Mon, 30 Mar 2020 22:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728376AbgC3U7j (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Mar 2020 16:59:39 -0400
Received: from mga17.intel.com ([192.55.52.151]:64894 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728317AbgC3U7j (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Mar 2020 16:59:39 -0400
IronPort-SDR: 87RY5cMU+dKJ1aKlM/XGuYhI5XAKvg3CRUOvPOA26kMqWFd9FSRLC+lRo5FFJ73qk7joEwuu4U
 mxx2Folhf6TA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 13:59:38 -0700
IronPort-SDR: +hDKRKS+hsZFbkqS4mY0A/5hDcmEifH4meR06OmGkASluGomrQw2Lpsx0p8/gHW/PXFmCMSZxy
 GrWtv2ygp8mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; 
   d="scan'208";a="449926141"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 30 Mar 2020 13:59:36 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jJ1VQ-000EqB-99; Tue, 31 Mar 2020 04:59:36 +0800
Date:   Tue, 31 Mar 2020 04:58:59 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/fixes] BUILD SUCCESS
 69a1e68d957a0ff7ee5797bafc5b4acc1ac911fe
Message-ID: <5e825d93.Tx1xghBX5sH1Z7BQ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/fixes
branch HEAD: 69a1e68d957a0ff7ee5797bafc5b4acc1ac911fe  dt-bindings: usb: renesas,usb3-peri: add r8a77961 support

elapsed time: 755m

configs tested: 156
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
sparc                            allyesconfig
mips                              allnoconfig
c6x                              allyesconfig
parisc                generic-64bit_defconfig
i386                              allnoconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
nios2                         3c120_defconfig
nios2                         10m50_defconfig
c6x                        evmc6678_defconfig
xtensa                          iss_defconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                       h8s-sim_defconfig
h8300                     edosk2674_defconfig
m68k                       m5475evb_defconfig
m68k                             allmodconfig
h8300                    h8300h-sim_defconfig
m68k                           sun3_defconfig
m68k                          multi_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
parisc                            allnoconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a003-20200330
x86_64               randconfig-a002-20200330
i386                 randconfig-a001-20200330
i386                 randconfig-a002-20200330
i386                 randconfig-a003-20200330
x86_64               randconfig-a001-20200330
c6x                  randconfig-a001-20200330
h8300                randconfig-a001-20200330
microblaze           randconfig-a001-20200330
nios2                randconfig-a001-20200330
sparc64              randconfig-a001-20200330
s390                 randconfig-a001-20200329
xtensa               randconfig-a001-20200329
csky                 randconfig-a001-20200329
openrisc             randconfig-a001-20200329
sh                   randconfig-a001-20200329
x86_64               randconfig-b001-20200330
x86_64               randconfig-b002-20200330
x86_64               randconfig-b003-20200330
i386                 randconfig-b001-20200330
i386                 randconfig-b002-20200330
i386                 randconfig-b003-20200330
x86_64               randconfig-b001-20200331
x86_64               randconfig-b002-20200331
x86_64               randconfig-b003-20200331
i386                 randconfig-b001-20200331
i386                 randconfig-b002-20200331
i386                 randconfig-b003-20200331
i386                 randconfig-c003-20200330
x86_64               randconfig-c003-20200330
x86_64               randconfig-c002-20200330
i386                 randconfig-c002-20200330
x86_64               randconfig-c001-20200330
i386                 randconfig-c001-20200330
x86_64               randconfig-d001-20200330
x86_64               randconfig-d002-20200330
x86_64               randconfig-d003-20200330
i386                 randconfig-d001-20200330
i386                 randconfig-d002-20200330
i386                 randconfig-d003-20200330
x86_64               randconfig-e001-20200330
x86_64               randconfig-e002-20200330
x86_64               randconfig-e003-20200330
i386                 randconfig-e001-20200330
i386                 randconfig-e002-20200330
i386                 randconfig-e003-20200330
x86_64               randconfig-f001-20200330
x86_64               randconfig-f002-20200330
x86_64               randconfig-f003-20200330
i386                 randconfig-f001-20200330
i386                 randconfig-f002-20200330
i386                 randconfig-f003-20200330
x86_64               randconfig-g001-20200330
x86_64               randconfig-g002-20200330
x86_64               randconfig-g003-20200330
i386                 randconfig-g001-20200330
i386                 randconfig-g002-20200330
i386                 randconfig-g003-20200330
x86_64               randconfig-h001-20200330
x86_64               randconfig-h002-20200330
x86_64               randconfig-h003-20200330
i386                 randconfig-h001-20200330
i386                 randconfig-h002-20200330
i386                 randconfig-h003-20200330
arc                  randconfig-a001-20200330
arm                  randconfig-a001-20200330
arm64                randconfig-a001-20200330
ia64                 randconfig-a001-20200330
powerpc              randconfig-a001-20200330
sparc                randconfig-a001-20200330
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                          rsk7269_defconfig
sh                               allmodconfig
sh                            titan_defconfig
sh                  sh7785lcr_32bit_defconfig
sh                                allnoconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                           x86_64_defconfig
um                             i386_defconfig
um                                  defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
