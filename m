Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85999258482
	for <lists+linux-omap@lfdr.de>; Tue,  1 Sep 2020 01:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgHaXtV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 31 Aug 2020 19:49:21 -0400
Received: from mga07.intel.com ([134.134.136.100]:43648 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725814AbgHaXtV (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 31 Aug 2020 19:49:21 -0400
IronPort-SDR: 0UDm4p20O4xB6M0TghLI/vOcuzr1xggNLVETxDAyYHV9VsXwpdr09WgVbLPRlkmjZvGvzeO6vH
 +XTWbp0EM4SQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="221307985"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="221307985"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2020 16:49:19 -0700
IronPort-SDR: 0JZz9idJRCbTDoyttg4HwJ29GsU0CGlRswmMCAz/yEx0Q1PRS2u4n0trjWptdLwwpgbj4RzYd6
 6OwIvvunY96A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; 
   d="scan'208";a="476952032"
Received: from lkp-server02.sh.intel.com (HELO 713faec3b0e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 31 Aug 2020 16:49:18 -0700
Received: from kbuild by 713faec3b0e5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1kCtY5-0000F7-JN; Mon, 31 Aug 2020 23:49:17 +0000
Date:   Tue, 01 Sep 2020 07:48:47 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD SUCCESS
 8bc2602e7a402664131d79251d59b262b896ca37
Message-ID: <5f4d8c5f.qbAyn7EM0uErNdP3%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: 8bc2602e7a402664131d79251d59b262b896ca37  MAINTAINERS: Add entry for Broadcom BDC driver

elapsed time: 725m

configs tested: 86
configs skipped: 6

The following configs have been built successfully.
More configs may be tested in the coming days.

arm                                 defconfig
arm64                            allyesconfig
arm64                               defconfig
arm                              allyesconfig
arm                              allmodconfig
m68k                            q40_defconfig
arm                       cns3420vb_defconfig
alpha                            allyesconfig
sh                           se7751_defconfig
arm                           u8500_defconfig
parisc                generic-32bit_defconfig
m68k                        mvme147_defconfig
powerpc                          allmodconfig
arc                                 defconfig
m68k                          sun3x_defconfig
arm                            u300_defconfig
powerpc                      pmac32_defconfig
parisc                           allyesconfig
arm                             pxa_defconfig
arm                           omap1_defconfig
arm                         mv78xx0_defconfig
mips                         tb0287_defconfig
arm                         socfpga_defconfig
um                             i386_defconfig
m68k                        stmark2_defconfig
m68k                             allyesconfig
arm                        clps711x_defconfig
nds32                             allnoconfig
parisc                generic-64bit_defconfig
xtensa                              defconfig
arm                              alldefconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                                defconfig
nios2                               defconfig
arc                              allyesconfig
c6x                              allyesconfig
nds32                               defconfig
nios2                            allyesconfig
csky                                defconfig
alpha                               defconfig
xtensa                           allyesconfig
h8300                            allyesconfig
sh                               allmodconfig
parisc                              defconfig
s390                             allyesconfig
s390                                defconfig
i386                             allyesconfig
sparc                            allyesconfig
sparc                               defconfig
i386                                defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                          allyesconfig
powerpc                           allnoconfig
powerpc                             defconfig
i386                 randconfig-a001-20200831
i386                 randconfig-a002-20200831
i386                 randconfig-a004-20200831
i386                 randconfig-a006-20200831
i386                 randconfig-a005-20200831
i386                 randconfig-a003-20200831
x86_64               randconfig-a012-20200831
x86_64               randconfig-a015-20200831
x86_64               randconfig-a014-20200831
x86_64               randconfig-a011-20200831
x86_64               randconfig-a016-20200831
x86_64               randconfig-a013-20200831
i386                 randconfig-a013-20200831
i386                 randconfig-a011-20200831
i386                 randconfig-a012-20200831
i386                 randconfig-a015-20200831
i386                 randconfig-a016-20200831
i386                 randconfig-a014-20200831
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
