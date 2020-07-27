Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A61C522F8E5
	for <lists+linux-omap@lfdr.de>; Mon, 27 Jul 2020 21:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728707AbgG0TUS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 27 Jul 2020 15:20:18 -0400
Received: from mga09.intel.com ([134.134.136.24]:41916 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728313AbgG0TUS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 27 Jul 2020 15:20:18 -0400
IronPort-SDR: xykozmDOAZLzcoAw4aS5aeaTpETcvNpN/seMAY5OVpJVvOyHq2egJJo9Om0sd2ergXVUqTCPxU
 c0cwud802jYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="152355812"
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; 
   d="scan'208";a="152355812"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2020 12:20:17 -0700
IronPort-SDR: syBvibh0/4Utybu/qmZ2/voWyFWxm4j7xCs6+5Erv3WwPQZTU021fApR/SNgZHtqG9wyuJOSri
 2l/jddvSWBSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,403,1589266800"; 
   d="scan'208";a="273344016"
Received: from lkp-server01.sh.intel.com (HELO df0563f96c37) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 27 Jul 2020 12:20:15 -0700
Received: from kbuild by df0563f96c37 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k08fW-00021U-O9; Mon, 27 Jul 2020 19:20:14 +0000
Date:   Tue, 28 Jul 2020 03:19:49 +0800
From:   kernel test robot <lkp@intel.com>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [balbi-usb:testing/next] BUILD SUCCESS WITH WARNING
 a1ff2f6769e39055e973b068070aeea0b3bcd90f
Message-ID: <5f1f28d5.uXJE2ec25rGvBP7L%lkp@intel.com>
User-Agent: Heirloom mailx 12.5 6/20/10
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git  testing/next
branch HEAD: a1ff2f6769e39055e973b068070aeea0b3bcd90f  usb: gadget: udc: Drop surplus include

Warning in current branch:

drivers/usb/dwc2/platform.c:593:1: sparse: sparse: unused label 'error_debugfs'

Warning ids grouped by kconfigs:

recent_errors
`-- h8300-randconfig-s031-20200726
    `-- drivers-usb-dwc2-platform.c:sparse:sparse:unused-label-error_debugfs

elapsed time: 3516m

configs tested: 52
configs skipped: 1

arm64                            allyesconfig
arm64                               defconfig
arm                                 defconfig
arm                              allyesconfig
arm                              allmodconfig
i386                             allyesconfig
i386                                defconfig
ia64                             allmodconfig
ia64                                defconfig
ia64                             allyesconfig
m68k                             allmodconfig
m68k                           sun3_defconfig
m68k                                defconfig
m68k                             allyesconfig
arc                              allyesconfig
nds32                             allnoconfig
nds32                               defconfig
csky                                defconfig
alpha                               defconfig
alpha                            allyesconfig
nios2                            allyesconfig
nios2                               defconfig
openrisc                            defconfig
c6x                              allyesconfig
arc                                 defconfig
sh                               allmodconfig
xtensa                           allyesconfig
h8300                            allyesconfig
xtensa                              defconfig
parisc                              defconfig
s390                             allyesconfig
parisc                           allyesconfig
s390                                defconfig
sparc                            allyesconfig
sparc                               defconfig
mips                             allyesconfig
mips                             allmodconfig
powerpc                             defconfig
powerpc                          allyesconfig
powerpc                          allmodconfig
powerpc                           allnoconfig
riscv                            allyesconfig
riscv                             allnoconfig
riscv                               defconfig
riscv                            allmodconfig
sparc64                             defconfig
x86_64                           allyesconfig
x86_64                              defconfig
x86_64                    rhel-7.6-kselftests
x86_64                               rhel-8.3
x86_64                                  kexec
x86_64                                   rhel

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
