Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12FE3196F4F
	for <lists+linux-omap@lfdr.de>; Sun, 29 Mar 2020 20:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728258AbgC2Sld (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 29 Mar 2020 14:41:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:54387 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727506AbgC2Sld (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 29 Mar 2020 14:41:33 -0400
IronPort-SDR: 2nxf4pUJdLAH6Llf8ba5/hxPXK4MK79H3CTSzyNMsqX1KIekmLC1duBRvgDP3PqZzTq6cTxvN9
 +OFtuXt+GI6A==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2020 11:41:32 -0700
IronPort-SDR: Pppmqd+3yollSNstoRpTe8Jw6THquLoqJRK+tsE49UKyJDon0VrTZITplUXh/DjAWbMwtVknQp
 efOU9F2BDaAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,321,1580803200"; 
   d="scan'208";a="266727300"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 29 Mar 2020 11:41:30 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jIcsD-0008J4-O9; Mon, 30 Mar 2020 02:41:29 +0800
Date:   Mon, 30 Mar 2020 02:40:39 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD REGRESSION
 bbb96bcdc97cbb4f6bc423ef8090a4bc761a651e
Message-ID: <5e80eba7.WwxkYqQV6+lyyEcy%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: bbb96bcdc97cbb4f6bc423ef8090a4bc761a651e  usb: dwc3: meson-g12a: refactor usb2 phy init

Regressions in current branch:

addr = spi_rd8_ack(udc, MAX3420_REG_FNADDR, 1);
base + (i * U2P_REG_SIZE),
base + G12A_GLUE_OFFSET,
const char *phy_name;
data = memdup_user(ptr + sizeof(*io), io->length);
drivers/usb/dwc3/drd.c:556:9: note: Assignment 'ret=0', assigned value is 0
drivers/usb/dwc3/drd.c:557:11: note: Condition 'ret<0' is always false
drivers/usb/dwc3/drd.c:557:11: warning: Condition 'ret<0' is always false [knownConditionTrueFalse]
drivers/usb/dwc3/dwc3-meson-g12a.c:315:14: warning: The scope of the variable 'phy_name' can be reduced. [variableScope]
drivers/usb/dwc3/dwc3-meson-g12a.c:415:11: warning: The scope of the variable 'irq' can be reduced. [variableScope]
drivers/usb/dwc3/dwc3-meson-g12a.c:495:11: warning: 'base' is of type 'void *'. When using void pointers in calculations, the behaviour is undefined. [arithOperationsOnVoidPointer]
drivers/usb/dwc3/gadget.c:1605:25: warning: The scope of the variable 'req' can be reduced. [variableScope]
drivers/usb/gadget/legacy/raw_gadget.c:214:16: warning: The scope of the variable 'flags' can be reduced. [variableScope]
drivers/usb/gadget/legacy/raw_gadget.c:554:26: warning: 'ptr' is of type 'void *'. When using void pointers in calculations, the behaviour is undefined. [arithOperationsOnVoidPointer]
drivers/usb/gadget/udc/aspeed-vhub/hub.c:313:29: warning: The scope of the variable 'lang_str' can be reduced. [variableScope]
drivers/usb/gadget/udc/max3420_udc.c:1065:5-6: ERROR: invalid reference to the index variable of the iterator on line 1057
drivers/usb/gadget/udc/max3420_udc.c:570:16: sparse: sparse: incorrect type in assignment (different base types)
drivers/usb/gadget/udc/max3420_udc.c:650:8: warning: Variable 'addr' is assigned a value that is never used. [unreadVariable]
ret = dwc3_setup_role_switch(dwc);
struct dwc3_request   *req;
struct dwc3_request   *tmp;
struct usb_gadget_strings *lang_str;

Error ids grouped by kconfigs:

recent_errors
|-- i386-allmodconfig
|   |-- data-memdup_user(ptr-sizeof(-io)-io-length)
|   |-- drivers-usb-gadget-legacy-raw_gadget.c:warning:The-scope-of-the-variable-flags-can-be-reduced.-variableScope
|   |-- drivers-usb-gadget-legacy-raw_gadget.c:warning:ptr-is-of-type-void-.-When-using-void-pointers-in-calculations-the-behaviour-is-undefined.-arithOperationsOnVoidPointer
|   `-- drivers-usb-gadget-udc-max3420_udc.c:ERROR:invalid-reference-to-the-index-variable-of-the-iterator-on-line
|-- m68k-allyesconfig
|   `-- drivers-usb-gadget-udc-max3420_udc.c:ERROR:invalid-reference-to-the-index-variable-of-the-iterator-on-line
|-- sparc-allyesconfig
|   `-- drivers-usb-gadget-udc-max3420_udc.c:ERROR:invalid-reference-to-the-index-variable-of-the-iterator-on-line
|-- x86_64-allmodconfig
|   `-- drivers-usb-gadget-udc-max3420_udc.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-assigned-usertype-status-got-short-assigned-usertype-status
`-- x86_64-allyesconfig
    |-- addr-spi_rd8_ack(udc-MAX3420_REG_FNADDR-)
    |-- base-(i-U2P_REG_SIZE)
    |-- base-G12A_GLUE_OFFSET
    |-- const-char-phy_name
    |-- drivers-usb-dwc3-drd.c:note:Assignment-ret-assigned-value-is
    |-- drivers-usb-dwc3-drd.c:note:Condition-ret-is-always-false
    |-- drivers-usb-dwc3-drd.c:warning:Condition-ret-is-always-false-knownConditionTrueFalse
    |-- drivers-usb-dwc3-dwc3-meson-g12a.c:warning:The-scope-of-the-variable-irq-can-be-reduced.-variableScope
    |-- drivers-usb-dwc3-dwc3-meson-g12a.c:warning:The-scope-of-the-variable-phy_name-can-be-reduced.-variableScope
    |-- drivers-usb-dwc3-dwc3-meson-g12a.c:warning:base-is-of-type-void-.-When-using-void-pointers-in-calculations-the-behaviour-is-undefined.-arithOperationsOnVoidPointer
    |-- drivers-usb-dwc3-gadget.c:warning:The-scope-of-the-variable-req-can-be-reduced.-variableScope
    |-- drivers-usb-gadget-udc-aspeed-vhub-hub.c:warning:The-scope-of-the-variable-lang_str-can-be-reduced.-variableScope
    |-- drivers-usb-gadget-udc-max3420_udc.c:ERROR:invalid-reference-to-the-index-variable-of-the-iterator-on-line
    |-- drivers-usb-gadget-udc-max3420_udc.c:sparse:sparse:incorrect-type-in-assignment-(different-base-types)-expected-unsigned-short-assigned-usertype-status-got-short-assigned-usertype-status
    |-- drivers-usb-gadget-udc-max3420_udc.c:warning:Variable-addr-is-assigned-a-value-that-is-never-used.-unreadVariable
    |-- ret-dwc3_setup_role_switch(dwc)
    |-- struct-dwc3_request-req
    |-- struct-dwc3_request-tmp
    `-- struct-usb_gadget_strings-lang_str

elapsed time: 480m

configs tested: 156
configs skipped: 0

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
microblaze                    nommu_defconfig
nios2                         10m50_defconfig
m68k                       m5475evb_defconfig
xtensa                          iss_defconfig
h8300                     edosk2674_defconfig
s390                              allnoconfig
alpha                               defconfig
i386                              allnoconfig
i386                             alldefconfig
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
ia64                             alldefconfig
nios2                         3c120_defconfig
c6x                        evmc6678_defconfig
c6x                              allyesconfig
xtensa                       common_defconfig
openrisc                 simple_smp_defconfig
openrisc                    or1ksim_defconfig
nds32                               defconfig
nds32                             allnoconfig
csky                                defconfig
h8300                    h8300h-sim_defconfig
h8300                       h8s-sim_defconfig
m68k                             allmodconfig
m68k                          multi_defconfig
m68k                           sun3_defconfig
arc                                 defconfig
arc                              allyesconfig
powerpc                          rhel-kconfig
microblaze                      mmu_defconfig
powerpc                           allnoconfig
powerpc                             defconfig
powerpc                       ppc64_defconfig
mips                      fuloong2e_defconfig
mips                      malta_kvm_defconfig
mips                             allyesconfig
mips                         64r6el_defconfig
mips                              allnoconfig
mips                           32r2_defconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                generic-64bit_defconfig
parisc                generic-32bit_defconfig
parisc                           allyesconfig
i386                 randconfig-a002-20200329
x86_64               randconfig-a001-20200329
i386                 randconfig-a001-20200329
i386                 randconfig-a003-20200329
alpha                randconfig-a001-20200329
m68k                 randconfig-a001-20200329
mips                 randconfig-a001-20200329
nds32                randconfig-a001-20200329
parisc               randconfig-a001-20200329
riscv                randconfig-a001-20200329
c6x                  randconfig-a001-20200329
h8300                randconfig-a001-20200329
microblaze           randconfig-a001-20200329
nios2                randconfig-a001-20200329
sparc64              randconfig-a001-20200329
csky                 randconfig-a001-20200329
openrisc             randconfig-a001-20200329
s390                 randconfig-a001-20200329
sh                   randconfig-a001-20200329
xtensa               randconfig-a001-20200329
x86_64               randconfig-b001-20200329
x86_64               randconfig-b002-20200329
x86_64               randconfig-b003-20200329
i386                 randconfig-b001-20200329
i386                 randconfig-b002-20200329
i386                 randconfig-b003-20200329
x86_64               randconfig-c001-20200329
x86_64               randconfig-c002-20200329
x86_64               randconfig-c003-20200329
i386                 randconfig-c001-20200329
i386                 randconfig-c002-20200329
i386                 randconfig-c003-20200329
x86_64               randconfig-d001-20200329
x86_64               randconfig-d002-20200329
x86_64               randconfig-d003-20200329
i386                 randconfig-d001-20200329
i386                 randconfig-d002-20200329
i386                 randconfig-d003-20200329
x86_64               randconfig-e001-20200329
x86_64               randconfig-e002-20200329
x86_64               randconfig-e003-20200329
i386                 randconfig-e001-20200329
i386                 randconfig-e002-20200329
i386                 randconfig-e003-20200329
i386                 randconfig-f001-20200329
i386                 randconfig-g003-20200329
x86_64               randconfig-g002-20200329
i386                 randconfig-g002-20200329
i386                 randconfig-g001-20200329
x86_64               randconfig-g001-20200329
x86_64               randconfig-h002-20200329
x86_64               randconfig-h003-20200329
i386                 randconfig-h003-20200329
x86_64               randconfig-h001-20200329
i386                 randconfig-h001-20200329
i386                 randconfig-h002-20200329
arc                  randconfig-a001-20200329
arm                  randconfig-a001-20200329
arm64                randconfig-a001-20200329
ia64                 randconfig-a001-20200329
powerpc              randconfig-a001-20200329
sparc                randconfig-a001-20200329
riscv                            allmodconfig
riscv                             allnoconfig
riscv                            allyesconfig
riscv                               defconfig
riscv                    nommu_virt_defconfig
riscv                          rv32_defconfig
s390                             alldefconfig
s390                             allmodconfig
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
