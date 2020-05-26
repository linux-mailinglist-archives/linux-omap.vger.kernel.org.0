Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA621E33D9
	for <lists+linux-omap@lfdr.de>; Wed, 27 May 2020 01:44:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726326AbgEZXob (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 26 May 2020 19:44:31 -0400
Received: from mga12.intel.com ([192.55.52.136]:25293 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725857AbgEZXoa (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 26 May 2020 19:44:30 -0400
IronPort-SDR: zqCauGUTgQTbyfXBieJSzxMHvB5DgYJkH5bzepRG5kd/Ru6dtffYNs9e+iBMfcvC7m/B0xmgFY
 URa69k9fMDpg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2020 16:44:30 -0700
IronPort-SDR: TE4jGjOSMNn8yha01lbdYX7u5g+M2yqGhkpQJMEY49R02mQ/Tf1NIGgiRW+T4RGE5J9c7MY71k
 tCXa8C4CqcTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,439,1583222400"; 
   d="scan'208";a="345344456"
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 26 May 2020 16:44:28 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1jdjFD-000CMk-Qj; Wed, 27 May 2020 07:44:27 +0800
Date:   Wed, 27 May 2020 07:43:34 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD REGRESSION
 1c11e74e9079289d8aaccc34b74cbf6463c0b791
Message-ID: <5ecda9a6.BAzBYazdXVCiiSLt%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: 1c11e74e9079289d8aaccc34b74cbf6463c0b791  usb: dwc3: keystone: Turn on USB3 PHY before controller

Error/Warning in current branch:

Error: arch/arm64/boot/dts/qcom/sc7180.dtsi:1450.33-34 syntax error
drivers/usb/dwc3/core.h:1428:17: warning: comparison of unsigned expression >= 0 is always true [-Wtype-limits]
drivers/usb/dwc3/gadget.c:1939:7: note: in expansion of macro 'DWC3_VER_IS_WITHIN'

Error/Warning ids grouped by kconfigs:

recent_errors
|-- alpha-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- arm-allmodconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- arm-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- arm-defconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- arm64-allmodconfig
|   |-- Error:arch-arm64-boot-dts-qcom-sc7180.dtsi.-syntax-error
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- arm64-allyesconfig
|   |-- Error:arch-arm64-boot-dts-qcom-sc7180.dtsi.-syntax-error
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- arm64-defconfig
|   |-- Error:arch-arm64-boot-dts-qcom-sc7180.dtsi.-syntax-error
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- arm64-randconfig-c021-20200526
|   |-- Error:arch-arm64-boot-dts-qcom-sc7180.dtsi.-syntax-error
|   `-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|-- c6x-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- h8300-allmodconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- h8300-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- i386-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- i386-randconfig-a003-20200526
|   `-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|-- i386-randconfig-a006-20200526
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- i386-randconfig-c001-20200526
|   `-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|-- i386-randconfig-m021-20200526
|   `-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|-- i386-randconfig-s001-20200526
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- ia64-allmodconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- ia64-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- ia64-randconfig-r005-20200526
|   `-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|-- m68k-allmodconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- m68k-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- mips-allmodconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- mips-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- mips-randconfig-c024-20200526
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- mips-randconfig-r006-20200526
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- nios2-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- openrisc-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- parisc-allmodconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- parisc-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- powerpc-allmodconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- powerpc-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- powerpc-randconfig-r023-20200526
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- riscv-allmodconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- riscv-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- s390-allmodconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- s390-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- sh-allmodconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- sparc-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- sparc64-allmodconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- sparc64-allyesconfig
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- sparc64-randconfig-r026-20200526
|   `-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|-- x86_64-randconfig-c002-20200526
|   `-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|-- x86_64-randconfig-c023-20200526
|   `-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|-- x86_64-rhel
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
|-- x86_64-rhel-7.2-clear
|   |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
|   `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN
`-- xtensa-allyesconfig
    |-- drivers-usb-dwc3-core.h:warning:comparison-of-unsigned-expression-is-always-true
    `-- drivers-usb-dwc3-gadget.c:note:in-expansion-of-macro-DWC3_VER_IS_WITHIN


i386-tinyconfig vmlinux size:

+-------+-----------------------------------+---------------------------------------------------------------------------+
| DELTA |              SYMBOL               |                                  COMMIT                                   |
+-------+-----------------------------------+---------------------------------------------------------------------------+
|   +98 | TOTAL                             | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
|   +96 | TEXT                              | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
| +1355 | balance_dirty_pages()             | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
|  +615 | __setup_rt_frame()                | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
|  +113 | klist_release()                   | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
|   +93 | change_clocksource()              | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
|   +86 | release_bdi()                     | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
|   +84 | kobject_release()                 | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
|   -68 | bdi_put()                         | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
|   -77 | kobject_put()                     | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
|   -79 | timekeeping_notify()              | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
|   -99 | klist_dec_and_del()               | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
|  -555 | do_signal()                       | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
| -1383 | balance_dirty_pages_ratelimited() | 2e75973832ab USB: gadget: Use the correct style for SPDX License Identifi |
+-------+-----------------------------------+---------------------------------------------------------------------------+

elapsed time: 2371m

configs tested: 85
configs skipped: 1

arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
arm                               allnoconfig
arm64                            allyesconfig
arm64                               defconfig
arm64                            allmodconfig
arm64                             allnoconfig
i386                             allyesconfig
i386                                defconfig
i386                              debian-10.3
i386                              allnoconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                              allnoconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                              allnoconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
nds32                               defconfig
nds32                             allnoconfig
csky                             allyesconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                               defconfig
nios2                            allyesconfig
openrisc                            defconfig
c6x                              allyesconfig
c6x                               allnoconfig
openrisc                         allyesconfig
xtensa                           allyesconfig
h8300                            allyesconfig
h8300                            allmodconfig
xtensa                              defconfig
arc                                 defconfig
arc                              allyesconfig
sh                               allmodconfig
sh                                allnoconfig
microblaze                        allnoconfig
mips                             allyesconfig
mips                              allnoconfig
mips                             allmodconfig
parisc                            allnoconfig
parisc                              defconfig
parisc                           allyesconfig
parisc                           allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          rhel-kconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
i386                 randconfig-a001-20200526
i386                 randconfig-a004-20200526
i386                 randconfig-a003-20200526
i386                 randconfig-a006-20200526
i386                 randconfig-a002-20200526
i386                 randconfig-a005-20200526
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
s390                             allyesconfig
s390                              allnoconfig
s390                             allmodconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
sparc64                             defconfig
sparc64                           allnoconfig
sparc64                          allyesconfig
sparc64                          allmodconfig
um                               allmodconfig
um                                allnoconfig
um                               allyesconfig
um                                  defconfig
x86_64                                   rhel
x86_64                               rhel-7.6
x86_64                    rhel-7.6-kselftests
x86_64                         rhel-7.2-clear
x86_64                                    lkp
x86_64                              fedora-25
x86_64                                  kexec

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
