Return-Path: <linux-omap+bounces-2968-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFECA0134F
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 09:39:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 218A81884A19
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 08:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A349916ABC6;
	Sat,  4 Jan 2025 08:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAFRsc/3"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD75156F2B;
	Sat,  4 Jan 2025 08:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735979965; cv=none; b=Co+B21eh+kCWwLVSSOcHpCplQCTBoITfZ8SlZy554YnkYdQjNk6AXzp6WSpIM0KXzxeqTaBLb6/FAEO5wrVON6Wha25lKOQNsoGCycCNkb3QzqZktBGGDOnVE0JB+jb2wGw6h5nFRd44gMtfoZXSi+nvtzqJZnJZHiOnlYFQWuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735979965; c=relaxed/simple;
	bh=rFBnzSQ4rK5w/x0CPH/EAzDZ6VubNpuVUGmGvhtpRtg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eytq8QMFSTgzFHrj5JM67ME7qkU4PsktGXNvpilHykCLUaqhMK7PFHzuW/uofoKVi8HDRiFvbnqs9b8+S7kDNNEsvA64R8ZmjzlDq8vxUw6w7xmqx5gBevJ/HYJUo2VtU5ZKyi+4QOsapjQaii/H4aNK9NvEMqdFd31Lu389iXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAFRsc/3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735979963; x=1767515963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rFBnzSQ4rK5w/x0CPH/EAzDZ6VubNpuVUGmGvhtpRtg=;
  b=SAFRsc/3nPmfkIxK5ij2QTitWlHSHRutVawZun3hdE/4V0YtnC3PoDOy
   l4sgqeLqqrDh3LAG9yAF/ttiDV5f6Aen7N9sill3vEVm1Ct7KgfgtI/7N
   nND5zhSMZT1MXkM12Qop76QJuNx+WTK8JzVD0O1FZIGabvxuwTbX0uc9g
   nfJOanc+cGJvQF8XX3wfcG+XfpBCISFLjNPbMe+Kur3b0QVuV4Oqp+YR2
   1ji0isL1qt4nQgVinJd9fCeARqYY+ovJ4/uQDX5vfcxsdD77EaI4ZGLZE
   V9EN53zXzN0NANw+vkQjT98syKxHDVsbsEjfA3Om0/NYxTHuu13wCx+gm
   A==;
X-CSE-ConnectionGUID: 2EepHB9AQsOApIdogaN4Uw==
X-CSE-MsgGUID: XO+eU/1+RvCwXYZUITOnlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36109713"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="36109713"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 00:39:22 -0800
X-CSE-ConnectionGUID: Tnk0+16tTl2lpglMqFg4xA==
X-CSE-MsgGUID: FMDfiChcSbSzsT9k1Mcndw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="102491781"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Jan 2025 00:39:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTzgi-000Alz-0m;
	Sat, 04 Jan 2025 08:39:16 +0000
Date: Sat, 4 Jan 2025 16:38:41 +0800
From: kernel test robot <lkp@intel.com>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, lgirdwood@gmail.com,
	broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
	jerome.neanne@baylibre.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, m-leonard@ti.com, praneeth@ti.com,
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v2 2/7] regulator: tps65215: Update function & struct
 names
Message-ID: <202501041639.sIGy7REE-lkp@intel.com>
References: <20250103230446.197597-3-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103230446.197597-3-s-ramamoorthy@ti.com>

Hi Shree,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on next-20241220]
[cannot apply to robh/for-next tmlind-omap/for-next linus/master v6.13-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shree-Ramamoorthy/regulator-dt-bindings-Add-TI-TPS65215-PMIC-bindings/20250104-070914
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250103230446.197597-3-s-ramamoorthy%40ti.com
patch subject: [PATCH v2 2/7] regulator: tps65215: Update function & struct names
config: i386-buildonly-randconfig-004-20250104 (https://download.01.org/0day-ci/archive/20250104/202501041639.sIGy7REE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041639.sIGy7REE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041639.sIGy7REE-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/regulator/tps65219-regulator.c:261:44: error: 'TPS65215_LDO_2' undeclared here (not in a function); did you mean 'TPS65219_LDO_2'?
     261 |         TPS65219_REGULATOR("LDO2", "ldo2", TPS65215_LDO_2,
         |                                            ^~~~~~~~~~~~~~
   drivers/regulator/tps65219-regulator.c:99:43: note: in definition of macro 'TPS65219_REGULATOR'
      99 |                 .id                     = _id,                          \
         |                                           ^~~
>> drivers/regulator/tps65219-regulator.c:263:28: error: 'TPS65215_REG_LDO2_VOUT' undeclared here (not in a function); did you mean 'TPS65219_REG_LDO2_VOUT'?
     263 |                            TPS65215_REG_LDO2_VOUT,
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/tps65219-regulator.c:104:43: note: in definition of macro 'TPS65219_REGULATOR'
     104 |                 .vsel_reg               = _vr,                          \
         |                                           ^~~
>> drivers/regulator/tps65219-regulator.c:266:28: error: 'TPS65215_ENABLE_LDO2_EN_MASK' undeclared here (not in a function); did you mean 'TPS65219_ENABLE_LDO2_EN_MASK'?
     266 |                            TPS65215_ENABLE_LDO2_EN_MASK, 0, 0, tps65215_ldo_2_range,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/tps65219-regulator.c:111:43: note: in definition of macro 'TPS65219_REGULATOR'
     111 |                 .enable_mask            = _em,                          \
         |                                           ^~~
   In file included from include/linux/kernel.h:16,
                    from drivers/regulator/tps65219-regulator.c:12:
   drivers/regulator/tps65219-regulator.c: In function 'tps65219_regulator_probe':
   drivers/regulator/tps65219-regulator.c:328:36: error: 'regulators' undeclared (first use in this function); did you mean 'regulator'?
     328 |         for (i = 0; i < ARRAY_SIZE(regulators); i++) {
         |                                    ^~~~~~~~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   drivers/regulator/tps65219-regulator.c:328:36: note: each undeclared identifier is reported only once for each function it appears in
     328 |         for (i = 0; i < ARRAY_SIZE(regulators); i++) {
         |                                    ^~~~~~~~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   In file included from include/linux/array_size.h:5:
   include/linux/compiler.h:245:77: error: expression in static assertion is not an integer
     245 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg) ((int)sizeof(struct {_Static_assert(!(e), msg);}))
         |                                                                             ^
   include/linux/compiler.h:249:33: note: in expansion of macro '__BUILD_BUG_ON_ZERO_MSG'
     249 | #define __must_be_array(a)      __BUILD_BUG_ON_ZERO_MSG(__same_type((a), &(a)[0]), "must be array")
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   drivers/regulator/tps65219-regulator.c:328:25: note: in expansion of macro 'ARRAY_SIZE'
     328 |         for (i = 0; i < ARRAY_SIZE(regulators); i++) {
         |                         ^~~~~~~~~~
   drivers/regulator/tps65219-regulator.c: At top level:
   drivers/regulator/tps65219-regulator.c:270:36: warning: 'tps65219_regs' defined but not used [-Wunused-const-variable=]
     270 | static const struct regulator_desc tps65219_regs[] = {
         |                                    ^~~~~~~~~~~~~
   drivers/regulator/tps65219-regulator.c:259:36: warning: 'tps65215_regs' defined but not used [-Wunused-const-variable=]
     259 | static const struct regulator_desc tps65215_regs[] = {
         |                                    ^~~~~~~~~~~~~
   drivers/regulator/tps65219-regulator.c:228:36: warning: 'common_regs' defined but not used [-Wunused-const-variable=]
     228 | static const struct regulator_desc common_regs[] = {
         |                                    ^~~~~~~~~~~


vim +261 drivers/regulator/tps65219-regulator.c

   258	
   259	static const struct regulator_desc tps65215_regs[] = {
   260		// TPS65215's LDO2 is the same as TPS65219's LDO3
 > 261		TPS65219_REGULATOR("LDO2", "ldo2", TPS65215_LDO_2,
   262				   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
 > 263				   TPS65215_REG_LDO2_VOUT,
   264				   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
   265				   TPS65219_REG_ENABLE_CTRL,
 > 266				   TPS65215_ENABLE_LDO2_EN_MASK, 0, 0, tps65215_ldo_2_range,
   267				   3, 0, 0, NULL, 0, 0),
   268	};
   269	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

