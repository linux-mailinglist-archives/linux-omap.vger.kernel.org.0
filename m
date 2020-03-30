Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B802198123
	for <lists+linux-omap@lfdr.de>; Mon, 30 Mar 2020 18:24:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729999AbgC3QYY (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Mar 2020 12:24:24 -0400
Received: from mga04.intel.com ([192.55.52.120]:31768 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727919AbgC3QYY (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 30 Mar 2020 12:24:24 -0400
IronPort-SDR: H03sFF/sy9M6DSHmmC8n8GNwVRpxx2E0LJfQWexSIoESZFExaYFqam5Cax3AVxn+X6LlNWfoqR
 95jP5fBg0tNQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2020 09:24:24 -0700
IronPort-SDR: S/virMh686Y6eNFV0BQSJ7Er8C1mPeJL0f8zavcv/Gng3W7m9WMdRUOSO74xqZOCMxFW31INXx
 ukK4PUY2qGhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,325,1580803200"; 
   d="scan'208";a="294647223"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 30 Mar 2020 09:24:22 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jIxD3-000ECS-Qq; Tue, 31 Mar 2020 00:24:21 +0800
Date:   Tue, 31 Mar 2020 00:23:47 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD REGRESSION
 d1e82ccf2fc413beba40c1472ad33540991f567a
Message-ID: <5e821d13.gPQvbRdP/WpIPniJ%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: d1e82ccf2fc413beba40c1472ad33540991f567a  usb: dwc3: gadget: WARN on no-resource status

Regressions in current branch:

drivers/usb/gadget/udc/max3420_udc.c:1065:5-6: ERROR: invalid reference to the index variable of the iterator on line 1057
drivers/usb/gadget/udc/max3420_udc.c:570:16: sparse: sparse: incorrect type in assignment (different base types)

Error ids grouped by kconfigs:

recent_errors
|-- i386-allmodconfig
|   `-- drivers-usb-gadget-udc-max3420_udc.c:ERROR:invalid-reference-to-the-index-variable-of-the-iterator-on-line
|-- m68k-allyesconfig
|   `-- drivers-usb-gadget-udc-max3420_udc.c:ERROR:invalid-reference-to-the-index-variable-of-the-iterator-on-line
|-- sparc-allyesconfig
|   `-- drivers-usb-gadget-udc-max3420_udc.c:ERROR:invalid-reference-to-the-index-variable-of-the-iterator-on-line
|-- x86_64-allmodconfig
|   `-- drivers-usb-gadget-udc-max3420_udc.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-assigned-usertype-status-got-short-assigned-usertype-status
`-- x86_64-allyesconfig
    |-- drivers-usb-gadget-udc-max3420_udc.c:ERROR:invalid-reference-to-the-index-variable-of-the-iterator-on-line
    `-- drivers-usb-gadget-udc-max3420_udc.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-assigned-usertype-status-got-short-assigned-usertype-status

elapsed time: 483m

configs tested: 175
configs skipped: 0

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
sh                            titan_defconfig
ia64                             allmodconfig
microblaze                      mmu_defconfig
sh                                allnoconfig
riscv                               defconfig
c6x                              allyesconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             alldefconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                                defconfig
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
m68k                             allmodconfig
m68k                       m5475evb_defconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                              allyesconfig
arc                                 defconfig
microblaze                    nommu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
powerpc                          rhel-kconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                           allyesconfig
parisc                generic-32bit_defconfig
parisc                generic-64bit_defconfig
x86_64               randconfig-a003-20200330
x86_64               randconfig-a002-20200330
i386                 randconfig-a001-20200330
i386                 randconfig-a002-20200330
i386                 randconfig-a003-20200330
x86_64               randconfig-a001-20200330
nds32                randconfig-a001-20200329
mips                 randconfig-a001-20200329
parisc               randconfig-a001-20200329
m68k                 randconfig-a001-20200329
alpha                randconfig-a001-20200329
riscv                randconfig-a001-20200329
alpha                randconfig-a001-20200330
m68k                 randconfig-a001-20200330
mips                 randconfig-a001-20200330
nds32                randconfig-a001-20200330
parisc               randconfig-a001-20200330
riscv                randconfig-a001-20200330
microblaze           randconfig-a001-20200330
h8300                randconfig-a001-20200330
nios2                randconfig-a001-20200330
c6x                  randconfig-a001-20200330
sparc64              randconfig-a001-20200330
csky                 randconfig-a001-20200330
openrisc             randconfig-a001-20200330
s390                 randconfig-a001-20200330
sh                   randconfig-a001-20200330
xtensa               randconfig-a001-20200330
s390                 randconfig-a001-20200329
xtensa               randconfig-a001-20200329
csky                 randconfig-a001-20200329
openrisc             randconfig-a001-20200329
sh                   randconfig-a001-20200329
x86_64               randconfig-b003-20200330
i386                 randconfig-b003-20200330
i386                 randconfig-b002-20200330
i386                 randconfig-b001-20200330
x86_64               randconfig-b002-20200330
x86_64               randconfig-b001-20200330
i386                 randconfig-c003-20200330
x86_64               randconfig-c003-20200330
x86_64               randconfig-c002-20200330
i386                 randconfig-c002-20200330
x86_64               randconfig-c001-20200330
i386                 randconfig-c001-20200330
i386                 randconfig-d003-20200330
i386                 randconfig-d001-20200330
i386                 randconfig-d002-20200330
x86_64               randconfig-d001-20200330
x86_64               randconfig-d003-20200330
x86_64               randconfig-d002-20200330
x86_64               randconfig-e001-20200330
i386                 randconfig-e002-20200330
x86_64               randconfig-e003-20200330
i386                 randconfig-e003-20200330
x86_64               randconfig-e002-20200330
i386                 randconfig-e001-20200330
i386                 randconfig-f001-20200330
i386                 randconfig-f003-20200330
i386                 randconfig-f002-20200330
x86_64               randconfig-f002-20200330
x86_64               randconfig-f001-20200330
x86_64               randconfig-f003-20200330
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
sparc                randconfig-a001-20200330
arm64                randconfig-a001-20200330
ia64                 randconfig-a001-20200330
arc                  randconfig-a001-20200330
arm                  randconfig-a001-20200330
powerpc              randconfig-a001-20200330
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
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

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
