Return-Path: <linux-omap+bounces-952-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E72E088A9FD
	for <lists+linux-omap@lfdr.de>; Mon, 25 Mar 2024 17:48:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 176F41C37AFA
	for <lists+linux-omap@lfdr.de>; Mon, 25 Mar 2024 16:48:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 462FFB677;
	Mon, 25 Mar 2024 15:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbErhIOz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E23179CD;
	Mon, 25 Mar 2024 15:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711379097; cv=none; b=IZtftQXbalqVwLlQAha0AakeMW9UjJ9Iv4gJk3+/HVeL42fwJ/ff6n7f4B3cEtPtLbHRxVcQ+vXZS5ymoByQtN7J+xozmimHO5Aa4EX203qY/qGG+zS86ryJ+4rxVW+Hi3y3R9Cc/TY5kA1e1abrXJEi+Fz3OOijGCfbEuXHKvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711379097; c=relaxed/simple;
	bh=llbW1zEuQ8ZP6tzdb+lMBFGFfOB7sgRP8pFPM8tlm4k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gSugPq5vt2Z/iQBOwxQAnQRnJlA1TUQDsJmAxE8e8B9mFz0CtCqF9jg/UQWn7AVv3gjmrVE5y2D7cPMR8QQpdz5239C4eoQA84cpbRe40TyEoAf0yumudzlmIY8AU3opPR6UnVvWdeBLy8Mbb5nCR7OQ0aW47tPCXQw2+bziCs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XbErhIOz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711379094; x=1742915094;
  h=date:from:to:cc:subject:message-id;
  bh=llbW1zEuQ8ZP6tzdb+lMBFGFfOB7sgRP8pFPM8tlm4k=;
  b=XbErhIOzUIOUsvixtGLEDjpTiIZgk4F+Q5uZ7KMG5iAIWgcQzj+bkKXw
   q9ZXJSQ+EFz+NFmEnplYMu1iYPbeYOWg5qQnMj6doNdLCpavANHcjmT0X
   LZbgA1YP+30K5YiMhMyv034SevhBb0bAUA+w0ldAcgqmZVcynVQglyOKb
   oWdNnJyATyX/HFAJnpJReV43tgk6ozvX7ykp+kYx2IZiHhBVgQp91lVbl
   gyMM7dZ+833UPLNRc3ePh3ZgflRJ56VDtWrJPkRTlaqKLMaWHw3/KOmMp
   /uyDtgb3SGpn8+0xIqG1AKq66EG1HrR0lTcOImtVIUVfmJtRQAlUeF80s
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6250708"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="6250708"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 08:04:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; 
   d="scan'208";a="16043244"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Mar 2024 08:04:51 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rolsX-000MeA-1I;
	Mon, 25 Mar 2024 15:04:49 +0000
Date: Mon, 25 Mar 2024 23:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Memory Management List <linux-mm@kvack.org>,
 bpf@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org
Subject: [linux-next:master] BUILD REGRESSION
 1fdad13606e104ff103ca19d2d660830cb36d43e
Message-ID: <202403252312.IByykxpw-lkp@intel.com>
User-Agent: s-nail v14.9.24
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>

tree/branch: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
branch HEAD: 1fdad13606e104ff103ca19d2d660830cb36d43e  Add linux-next specific files for 20240325

Error/Warning reports:

https://lore.kernel.org/oe-kbuild-all/202403252127.967BczRr-lkp@intel.com

Error/Warning: (recently discovered and may have been fixed)

ERROR: modpost: "memcpy" [crypto/cmac.ko] undefined!
ERROR: modpost: "memcpy" [crypto/rsa_generic.ko] undefined!
ERROR: modpost: "memcpy" [fs/ext4/ext4.ko] undefined!
ERROR: modpost: "memcpy" [fs/f2fs/f2fs.ko] undefined!
ERROR: modpost: "memcpy" [fs/isofs/isofs.ko] undefined!
ERROR: modpost: "memcpy" [fs/jbd2/jbd2.ko] undefined!
ERROR: modpost: "memcpy" [fs/nls/nls_euc-jp.ko] undefined!
ERROR: modpost: "memcpy" [fs/xfs/xfs.ko] undefined!
ERROR: modpost: "memcpy" [mm/zsmalloc.ko] undefined!

Error/Warning ids grouped by kconfigs:

gcc_recent_errors
|-- alpha-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- alpha-randconfig-r022-20221031
|   |-- ERROR:memcpy-crypto-cmac.ko-undefined
|   |-- ERROR:memcpy-crypto-rsa_generic.ko-undefined
|   |-- ERROR:memcpy-fs-ext4-ext4.ko-undefined
|   |-- ERROR:memcpy-fs-f2fs-f2fs.ko-undefined
|   |-- ERROR:memcpy-fs-isofs-isofs.ko-undefined
|   |-- ERROR:memcpy-fs-jbd2-jbd2.ko-undefined
|   |-- ERROR:memcpy-fs-nls-nls_euc-jp.ko-undefined
|   |-- ERROR:memcpy-fs-xfs-xfs.ko-undefined
|   `-- ERROR:memcpy-mm-zsmalloc.ko-undefined
|-- arc-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arc-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arc-randconfig-002-20240325
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-allmodconfig
|   |-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_reset()-instead
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-allyesconfig
|   |-- arch-arm-mach-omap2-prm33xx.c:warning:expecting-prototype-for-am33xx_prm_global_warm_sw_reset().-Prototype-was-for-am33xx_prm_global_sw_reset()-instead
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-vexpress_defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm64-defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- csky-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- csky-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-randconfig-002-20240325
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-randconfig-011-20240325
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- i386-randconfig-141-20240325
|   `-- drivers-usb-typec-tcpm-tcpm.c-tcpm_pd_svdm()-error:uninitialized-symbol-modep_prime-.
|-- loongarch-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- loongarch-defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- loongarch-randconfig-002-20240325
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- m68k-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- m68k-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- microblaze-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- microblaze-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- mips-allyesconfig
|   |-- (.ref.text):relocation-truncated-to-fit:R_MIPS_26-against-start_secondary
|   |-- (.text):relocation-truncated-to-fit:R_MIPS_26-against-kernel_entry
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- nios2-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- nios2-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- openrisc-allyesconfig
|   |-- (.head.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-no-symbol
|   |-- (.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-no-symbol
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- main.c:(.text):relocation-truncated-to-fit:R_OR1K_INSN_REL_26-against-symbol-__muldi3-defined-in-.text-section-in-..-lib-gcc-or1k-linux-..-libgcc.a(_muldi3.o)
|-- parisc-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- parisc-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- powerpc-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- s390-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sh-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sh-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc64-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- sparc64-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- um-allyesconfig
|   |-- collect2:error:ld-returned-exit-status
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- um-i386_defconfig
|   `-- collect2:error:ld-returned-exit-status
|-- um-randconfig-001-20240325
|   `-- collect2:error:ld-returned-exit-status
|-- x86_64-buildonly-randconfig-004-20240325
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
`-- xtensa-randconfig-001-20240325
    `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
clang_recent_errors
|-- arm-qcom_defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- arm-randconfig-003-20240325
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- arm64-allmodconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- hexagon-allmodconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- hexagon-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- mips-loongson1b_defconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- powerpc-allyesconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- riscv-allmodconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- riscv-allyesconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- s390-allmodconfig
|   |-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- s390-defconfig
|   `-- kernel-bpf-bpf_struct_ops.c:warning:bitwise-operation-between-different-enumeration-types-(-enum-bpf_type_flag-and-enum-bpf_reg_type-)
|-- s390-randconfig-002-20240325
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
|-- x86_64-allyesconfig
|   `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead
`-- x86_64-buildonly-randconfig-001-20240325
    `-- fs-ubifs-journal.c:warning:expecting-prototype-for-wake_up_reservation().-Prototype-was-for-add_or_start_queue()-instead

elapsed time: 729m

configs tested: 164
configs skipped: 19

tested configs:
alpha                             allnoconfig   gcc  
alpha                            allyesconfig   gcc  
alpha                               defconfig   gcc  
arc                              allmodconfig   gcc  
arc                               allnoconfig   gcc  
arc                              allyesconfig   gcc  
arc                                 defconfig   gcc  
arc                   randconfig-001-20240325   gcc  
arc                   randconfig-002-20240325   gcc  
arm                              allmodconfig   gcc  
arm                               allnoconfig   clang
arm                              allyesconfig   gcc  
arm                         axm55xx_defconfig   clang
arm                            mps2_defconfig   clang
arm                            qcom_defconfig   clang
arm                   randconfig-001-20240325   clang
arm                   randconfig-002-20240325   gcc  
arm                   randconfig-003-20240325   clang
arm                        realview_defconfig   clang
arm                        vexpress_defconfig   gcc  
arm64                            allmodconfig   clang
arm64                             allnoconfig   gcc  
arm64                               defconfig   gcc  
arm64                 randconfig-004-20240325   gcc  
csky                             allmodconfig   gcc  
csky                              allnoconfig   gcc  
csky                             allyesconfig   gcc  
csky                                defconfig   gcc  
csky                  randconfig-001-20240325   gcc  
csky                  randconfig-002-20240325   gcc  
hexagon                          allmodconfig   clang
hexagon                          allyesconfig   clang
i386                             allmodconfig   gcc  
i386                              allnoconfig   gcc  
i386                             allyesconfig   gcc  
i386         buildonly-randconfig-001-20240325   clang
i386         buildonly-randconfig-002-20240325   gcc  
i386         buildonly-randconfig-003-20240325   gcc  
i386         buildonly-randconfig-004-20240325   gcc  
i386         buildonly-randconfig-005-20240325   clang
i386         buildonly-randconfig-006-20240325   clang
i386                                defconfig   clang
i386                  randconfig-001-20240325   gcc  
i386                  randconfig-002-20240325   gcc  
i386                  randconfig-003-20240325   clang
i386                  randconfig-004-20240325   gcc  
i386                  randconfig-005-20240325   gcc  
i386                  randconfig-006-20240325   clang
i386                  randconfig-011-20240325   gcc  
i386                  randconfig-012-20240325   clang
i386                  randconfig-013-20240325   clang
i386                  randconfig-014-20240325   clang
i386                  randconfig-015-20240325   gcc  
i386                  randconfig-016-20240325   gcc  
loongarch                        allmodconfig   gcc  
loongarch                         allnoconfig   gcc  
loongarch                           defconfig   gcc  
loongarch             randconfig-001-20240325   gcc  
loongarch             randconfig-002-20240325   gcc  
m68k                             allmodconfig   gcc  
m68k                              allnoconfig   gcc  
m68k                             allyesconfig   gcc  
m68k                                defconfig   gcc  
microblaze                       allmodconfig   gcc  
microblaze                        allnoconfig   gcc  
microblaze                       allyesconfig   gcc  
microblaze                          defconfig   gcc  
mips                              allnoconfig   gcc  
mips                             allyesconfig   gcc  
mips                     loongson1b_defconfig   clang
nios2                         10m50_defconfig   gcc  
nios2                            allmodconfig   gcc  
nios2                             allnoconfig   gcc  
nios2                            allyesconfig   gcc  
nios2                               defconfig   gcc  
nios2                 randconfig-001-20240325   gcc  
nios2                 randconfig-002-20240325   gcc  
openrisc                          allnoconfig   gcc  
openrisc                         allyesconfig   gcc  
openrisc                            defconfig   gcc  
parisc                           allmodconfig   gcc  
parisc                            allnoconfig   gcc  
parisc                           allyesconfig   gcc  
parisc                              defconfig   gcc  
parisc                randconfig-001-20240325   gcc  
parisc                randconfig-002-20240325   gcc  
parisc64                            defconfig   gcc  
powerpc                          allmodconfig   gcc  
powerpc                           allnoconfig   gcc  
powerpc                          allyesconfig   clang
powerpc                       ebony_defconfig   clang
powerpc                   lite5200b_defconfig   clang
powerpc               mpc834x_itxgp_defconfig   clang
powerpc                     taishan_defconfig   clang
powerpc                     tqm8541_defconfig   clang
powerpc                      walnut_defconfig   gcc  
powerpc                 xes_mpc85xx_defconfig   gcc  
riscv                            allmodconfig   clang
riscv                             allnoconfig   gcc  
riscv                            allyesconfig   clang
riscv                               defconfig   clang
riscv                 randconfig-002-20240325   gcc  
s390                             allmodconfig   clang
s390                              allnoconfig   clang
s390                             allyesconfig   gcc  
s390                                defconfig   clang
s390                  randconfig-001-20240325   gcc  
s390                  randconfig-002-20240325   clang
sh                               allmodconfig   gcc  
sh                                allnoconfig   gcc  
sh                               allyesconfig   gcc  
sh                                  defconfig   gcc  
sh                               j2_defconfig   gcc  
sh                 kfr2r09-romimage_defconfig   gcc  
sh                          lboxre2_defconfig   gcc  
sh                    randconfig-001-20240325   gcc  
sh                    randconfig-002-20240325   gcc  
sparc                            allmodconfig   gcc  
sparc                             allnoconfig   gcc  
sparc                               defconfig   gcc  
sparc64                          allmodconfig   gcc  
sparc64                          allyesconfig   gcc  
sparc64                             defconfig   gcc  
sparc64               randconfig-001-20240325   gcc  
sparc64               randconfig-002-20240325   gcc  
um                               allmodconfig   clang
um                                allnoconfig   clang
um                               allyesconfig   gcc  
um                                  defconfig   clang
um                             i386_defconfig   gcc  
um                    randconfig-001-20240325   gcc  
um                    randconfig-002-20240325   gcc  
um                           x86_64_defconfig   clang
x86_64                            allnoconfig   clang
x86_64                           allyesconfig   clang
x86_64       buildonly-randconfig-001-20240325   clang
x86_64       buildonly-randconfig-002-20240325   clang
x86_64       buildonly-randconfig-003-20240325   clang
x86_64       buildonly-randconfig-004-20240325   gcc  
x86_64       buildonly-randconfig-005-20240325   clang
x86_64       buildonly-randconfig-006-20240325   clang
x86_64                              defconfig   gcc  
x86_64                randconfig-001-20240325   clang
x86_64                randconfig-002-20240325   gcc  
x86_64                randconfig-003-20240325   gcc  
x86_64                randconfig-004-20240325   gcc  
x86_64                randconfig-005-20240325   gcc  
x86_64                randconfig-006-20240325   clang
x86_64                randconfig-011-20240325   clang
x86_64                randconfig-012-20240325   clang
x86_64                randconfig-013-20240325   gcc  
x86_64                randconfig-014-20240325   gcc  
x86_64                randconfig-015-20240325   clang
x86_64                randconfig-016-20240325   gcc  
x86_64                randconfig-071-20240325   clang
x86_64                randconfig-072-20240325   clang
x86_64                randconfig-073-20240325   gcc  
x86_64                randconfig-074-20240325   clang
x86_64                randconfig-075-20240325   clang
x86_64                randconfig-076-20240325   gcc  
x86_64                          rhel-8.3-rust   clang
xtensa                            allnoconfig   gcc  
xtensa                randconfig-001-20240325   gcc  
xtensa                randconfig-002-20240325   gcc  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

