Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB821A3986
	for <lists+linux-omap@lfdr.de>; Thu,  9 Apr 2020 20:04:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726594AbgDISEN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 9 Apr 2020 14:04:13 -0400
Received: from mga02.intel.com ([134.134.136.20]:39602 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726477AbgDISEN (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 9 Apr 2020 14:04:13 -0400
IronPort-SDR: k1Q9yiYpfvd6TMSmxREKXjoKp1X6ns9SQRXIcp+CdQCjuyhZznlE0tpw24amoOcaD0qR18lrvS
 D96pnUZCgK3Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2020 11:04:09 -0700
IronPort-SDR: LNHchKAGg03hjtMuLtMALoA21jxRu1NzkmM+/fjpmwm1HpfeDhjCXyL9qioGWT/JMbib5V1kXJ
 A6IdAOXXFVNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,363,1580803200"; 
   d="scan'208";a="270161200"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Apr 2020 11:04:08 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jMbX5-000BtG-Gp; Fri, 10 Apr 2020 02:04:07 +0800
Date:   Fri, 10 Apr 2020 02:03:50 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD SUCCESS
 4be0864a2f4a7f3c7099790d12be9f0218ba8ca1
Message-ID: <5e8f6386.g3wU8XUAiAJUMBpL%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: 4be0864a2f4a7f3c7099790d12be9f0218ba8ca1  usb: dwc3: gadget: WARN on no-resource status

Warning in current branch:

drivers/usb/dwc3/drd.c:578:11: warning: Condition 'ret<0' is always false [knownConditionTrueFalse]
drivers/usb/dwc3/dwc3-meson-g12a.c:529:11: warning: 'base' is of type 'void *'. When using void pointers in calculations, the behaviour is undefined. [arithOperationsOnVoidPointer]

Warning ids grouped by kconfigs:

recent_errors
|-- i386-allmodconfig
|   |-- drivers-usb-dwc3-drd.c:warning:Condition-ret-is-always-false-knownConditionTrueFalse
|   `-- drivers-usb-dwc3-dwc3-meson-g12a.c:warning:base-is-of-type-void-.-When-using-void-pointers-in-calculations-the-behaviour-is-undefined.-arithOperationsOnVoidPointer
`-- x86_64-allyesconfig
    |-- drivers-usb-dwc3-drd.c:warning:Condition-ret-is-always-false-knownConditionTrueFalse
    `-- drivers-usb-dwc3-dwc3-meson-g12a.c:warning:base-is-of-type-void-.-When-using-void-pointers-in-calculations-the-behaviour-is-undefined.-arithOperationsOnVoidPointer

elapsed time: 484m

configs tested: 166
configs skipped: 0

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                              allmodconfig
arm                               allnoconfig
arm                              allyesconfig
arm64                            allmodconfig
arm64                             allnoconfig
arm64                            allyesconfig
arm                           efm32_defconfig
arm                         at91_dt_defconfig
arm                        shmobile_defconfig
arm64                               defconfig
arm                          exynos_defconfig
arm                        multi_v5_defconfig
arm                           sunxi_defconfig
arm                        multi_v7_defconfig
sparc                            allyesconfig
i386                              allnoconfig
riscv                             allnoconfig
sh                            titan_defconfig
m68k                             allmodconfig
s390                          debug_defconfig
ia64                                defconfig
powerpc                             defconfig
microblaze                      mmu_defconfig
sh                               allmodconfig
i386                             allyesconfig
i386                             alldefconfig
i386                                defconfig
i386                              debian-10.3
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
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
alpha                               defconfig
h8300                     edosk2674_defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
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
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
x86_64               randconfig-a001-20200409
x86_64               randconfig-a002-20200409
x86_64               randconfig-a003-20200409
i386                 randconfig-a001-20200409
i386                 randconfig-a002-20200409
i386                 randconfig-a003-20200409
alpha                randconfig-a001-20200409
m68k                 randconfig-a001-20200409
mips                 randconfig-a001-20200409
nds32                randconfig-a001-20200409
parisc               randconfig-a001-20200409
riscv                randconfig-a001-20200409
sparc64              randconfig-a001-20200409
h8300                randconfig-a001-20200409
nios2                randconfig-a001-20200409
microblaze           randconfig-a001-20200409
c6x                  randconfig-a001-20200409
csky                 randconfig-a001-20200409
openrisc             randconfig-a001-20200409
s390                 randconfig-a001-20200409
sh                   randconfig-a001-20200409
xtensa               randconfig-a001-20200409
x86_64               randconfig-b001-20200409
x86_64               randconfig-b002-20200409
x86_64               randconfig-b003-20200409
i386                 randconfig-b001-20200409
i386                 randconfig-b002-20200409
i386                 randconfig-b003-20200409
x86_64               randconfig-c001-20200409
x86_64               randconfig-c002-20200409
x86_64               randconfig-c003-20200409
i386                 randconfig-c001-20200409
i386                 randconfig-c002-20200409
i386                 randconfig-c003-20200409
x86_64               randconfig-d001-20200409
x86_64               randconfig-d002-20200409
x86_64               randconfig-d003-20200409
i386                 randconfig-d001-20200409
i386                 randconfig-d002-20200409
i386                 randconfig-d003-20200409
x86_64               randconfig-e001-20200409
x86_64               randconfig-e002-20200409
x86_64               randconfig-e003-20200409
i386                 randconfig-e001-20200409
i386                 randconfig-e002-20200409
i386                 randconfig-e003-20200409
x86_64               randconfig-f001-20200409
x86_64               randconfig-f002-20200409
x86_64               randconfig-f003-20200409
i386                 randconfig-f001-20200409
i386                 randconfig-f002-20200409
i386                 randconfig-f003-20200409
x86_64               randconfig-g001-20200409
x86_64               randconfig-g002-20200409
x86_64               randconfig-g003-20200409
i386                 randconfig-g001-20200409
i386                 randconfig-g002-20200409
i386                 randconfig-g003-20200409
x86_64               randconfig-h001-20200409
x86_64               randconfig-h002-20200409
x86_64               randconfig-h003-20200409
i386                 randconfig-h001-20200409
i386                 randconfig-h002-20200409
i386                 randconfig-h003-20200409
arc                  randconfig-a001-20200409
arm                  randconfig-a001-20200409
arm64                randconfig-a001-20200409
ia64                 randconfig-a001-20200409
powerpc              randconfig-a001-20200409
sparc                randconfig-a001-20200409
riscv                            allmodconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
s390                              allnoconfig
s390                             allyesconfig
s390                                defconfig
s390                       zfcpdump_defconfig
sh                                allnoconfig
sh                          rsk7269_defconfig
sh                  sh7785lcr_32bit_defconfig
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
x86_64                    rhel-7.6-kselftests

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
