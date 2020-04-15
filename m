Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF9271A93DE
	for <lists+linux-omap@lfdr.de>; Wed, 15 Apr 2020 09:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404578AbgDOHKL (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Apr 2020 03:10:11 -0400
Received: from mga07.intel.com ([134.134.136.100]:33423 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404013AbgDOHKK (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 15 Apr 2020 03:10:10 -0400
IronPort-SDR: rJ4/2qRFSzOaCOLQSP6C51w0mrzojJQ62716UQw2ageAlTbqgxuHa9jPvUEsaqUcJzxyKhQWVv
 v6JWDr5TsFOg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2020 00:10:08 -0700
IronPort-SDR: dr8GalqDGKM8LCHEbfa++Ues23gDpGhIpFp05FJbCHhBO7b2F1qrT4hiVFFMH9K+TxFkekVFyO
 qDZ0twHeoJ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,386,1580803200"; 
   d="scan'208";a="271646985"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 15 Apr 2020 00:10:07 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jOcBS-000IdH-Ks; Wed, 15 Apr 2020 15:10:06 +0800
Date:   Wed, 15 Apr 2020 15:09:04 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD SUCCESS
 37d27d53d32b4fd884524dfe3374d6885877b977
Message-ID: <5e96b310.8RD+oIR75QvwRxU1%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: 37d27d53d32b4fd884524dfe3374d6885877b977  usb: dwc3: gadget: WARN on no-resource status

elapsed time: 1464m

configs tested: 220
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
nds32                               defconfig
powerpc                             defconfig
riscv                               defconfig
m68k                       m5475evb_defconfig
sh                  sh7785lcr_32bit_defconfig
powerpc                       ppc64_defconfig
um                                  defconfig
ia64                                defconfig
mips                      malta_kvm_defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                              debian-10.3
i386                                defconfig
ia64                             alldefconfig
ia64                             allmodconfig
ia64                              allnoconfig
ia64                             allyesconfig
c6x                              allyesconfig
c6x                        evmc6678_defconfig
nios2                         10m50_defconfig
nios2                         3c120_defconfig
openrisc                    or1ksim_defconfig
openrisc                 simple_smp_defconfig
xtensa                       common_defconfig
xtensa                          iss_defconfig
alpha                               defconfig
csky                                defconfig
nds32                             allnoconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                      mmu_defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                          rhel-kconfig
mips                           32r2_defconfig
mips                         64r6el_defconfig
mips                             allmodconfig
mips                              allnoconfig
mips                             allyesconfig
mips                      fuloong2e_defconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a001-20200414
x86_64               randconfig-a002-20200414
x86_64               randconfig-a003-20200414
i386                 randconfig-a001-20200414
i386                 randconfig-a002-20200414
i386                 randconfig-a003-20200414
i386                 randconfig-a002-20200415
x86_64               randconfig-a001-20200415
x86_64               randconfig-a002-20200415
i386                 randconfig-a003-20200415
i386                 randconfig-a001-20200415
x86_64               randconfig-a003-20200415
alpha                randconfig-a001-20200414
m68k                 randconfig-a001-20200414
nds32                randconfig-a001-20200414
parisc               randconfig-a001-20200414
riscv                randconfig-a001-20200414
mips                 randconfig-a001-20200414
mips                 randconfig-a001-20200415
nds32                randconfig-a001-20200415
m68k                 randconfig-a001-20200415
riscv                randconfig-a001-20200415
alpha                randconfig-a001-20200415
parisc               randconfig-a001-20200415
c6x                  randconfig-a001-20200414
h8300                randconfig-a001-20200414
microblaze           randconfig-a001-20200414
nios2                randconfig-a001-20200414
sparc64              randconfig-a001-20200414
c6x                  randconfig-a001-20200415
h8300                randconfig-a001-20200415
microblaze           randconfig-a001-20200415
nios2                randconfig-a001-20200415
sparc64              randconfig-a001-20200415
csky                 randconfig-a001-20200414
openrisc             randconfig-a001-20200414
s390                 randconfig-a001-20200414
sh                   randconfig-a001-20200414
xtensa               randconfig-a001-20200414
s390                 randconfig-a001-20200415
xtensa               randconfig-a001-20200415
sh                   randconfig-a001-20200415
openrisc             randconfig-a001-20200415
csky                 randconfig-a001-20200415
x86_64               randconfig-b001-20200415
x86_64               randconfig-b002-20200415
x86_64               randconfig-b003-20200415
i386                 randconfig-b001-20200415
i386                 randconfig-b002-20200415
i386                 randconfig-b003-20200415
x86_64               randconfig-b001-20200414
x86_64               randconfig-b002-20200414
x86_64               randconfig-b003-20200414
i386                 randconfig-b001-20200414
i386                 randconfig-b002-20200414
i386                 randconfig-b003-20200414
x86_64               randconfig-c001-20200414
x86_64               randconfig-c002-20200414
x86_64               randconfig-c003-20200414
i386                 randconfig-c001-20200414
i386                 randconfig-c002-20200414
i386                 randconfig-c003-20200414
x86_64               randconfig-c003-20200415
i386                 randconfig-c003-20200415
x86_64               randconfig-c002-20200415
i386                 randconfig-c002-20200415
x86_64               randconfig-c001-20200415
i386                 randconfig-c001-20200415
i386                 randconfig-d002-20200415
x86_64               randconfig-d003-20200415
i386                 randconfig-d003-20200415
x86_64               randconfig-d001-20200415
i386                 randconfig-d001-20200415
x86_64               randconfig-d002-20200415
x86_64               randconfig-e001-20200415
x86_64               randconfig-e002-20200415
x86_64               randconfig-e003-20200415
i386                 randconfig-e001-20200415
i386                 randconfig-e002-20200415
i386                 randconfig-e003-20200415
i386                 randconfig-f003-20200415
i386                 randconfig-f002-20200415
i386                 randconfig-f001-20200415
x86_64               randconfig-f001-20200414
x86_64               randconfig-f002-20200414
x86_64               randconfig-f003-20200414
i386                 randconfig-f001-20200414
i386                 randconfig-f002-20200414
i386                 randconfig-f003-20200414
x86_64               randconfig-g001-20200414
x86_64               randconfig-g002-20200414
x86_64               randconfig-g003-20200414
i386                 randconfig-g001-20200414
i386                 randconfig-g002-20200414
i386                 randconfig-g003-20200414
x86_64               randconfig-g003-20200415
i386                 randconfig-g003-20200415
x86_64               randconfig-g001-20200415
x86_64               randconfig-g002-20200415
i386                 randconfig-g002-20200415
i386                 randconfig-g001-20200415
x86_64               randconfig-h001-20200415
i386                 randconfig-h003-20200415
i386                 randconfig-h002-20200415
i386                 randconfig-h001-20200415
x86_64               randconfig-h002-20200415
x86_64               randconfig-h001-20200414
x86_64               randconfig-h002-20200414
x86_64               randconfig-h003-20200414
i386                 randconfig-h001-20200414
i386                 randconfig-h002-20200414
i386                 randconfig-h003-20200414
arc                  randconfig-a001-20200414
arm                  randconfig-a001-20200414
arm64                randconfig-a001-20200414
ia64                 randconfig-a001-20200414
powerpc              randconfig-a001-20200414
sparc                randconfig-a001-20200414
powerpc              randconfig-a001-20200415
arm64                randconfig-a001-20200415
ia64                 randconfig-a001-20200415
arc                  randconfig-a001-20200415
arm                  randconfig-a001-20200415
sparc                randconfig-a001-20200415
riscv                            allyesconfig
riscv                    nommu_virt_defconfig
riscv                             allnoconfig
riscv                          rv32_defconfig
riscv                            allmodconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                          debug_defconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                               allmodconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                            titan_defconfig
sparc                               defconfig
sparc64                          allmodconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                             defconfig
um                             i386_defconfig
um                           x86_64_defconfig
x86_64                              fedora-25
x86_64                                  kexec
x86_64                                    lkp
x86_64                                   rhel
x86_64                         rhel-7.2-clear
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
