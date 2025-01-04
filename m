Return-Path: <linux-omap+bounces-2972-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7D3A013FF
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 11:37:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 125091633FB
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 10:37:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B1719922A;
	Sat,  4 Jan 2025 10:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rq3ww49D"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B91F17BA3;
	Sat,  4 Jan 2025 10:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735987054; cv=none; b=PIMiKGdUSVVhJaUtFvuKXPQOY7Z0Kz9qYV4L+5P77SP6ENtoaopmcdlYTIOQ+P7LZXEHpnTUQcoFOjxEHBX8docf3p9oeMz8nH/AWbBfQ/gcbJ/BXmpyZaT8Gpl9GH1nUzzXPUjltbrLmqKShJyIlxndv7Y5nOcAJqAytU67SJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735987054; c=relaxed/simple;
	bh=bjPDqVZBaZJzcmurYGsIsen5k1kKSiXYFmFIjS5sDFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODbvLVgJjTKfMuYFCt0N5paTyt7Qb9lZnXOYpi7zujFM9is/16Y97IelY+UlGUzdTwOA1dDcUzxoQJfHkzsOoVNy/zke3VW5XZ41v5e8mD5n0Yt8V547Bc/kredWKWJBI8W3Pf2mKiAF9MMD9uzxmrmpn0GZd/+6Fk2vTHvbtvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rq3ww49D; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735987052; x=1767523052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bjPDqVZBaZJzcmurYGsIsen5k1kKSiXYFmFIjS5sDFE=;
  b=Rq3ww49DxJ/JhtGDTFqRMbcFE1fBWafcHZ+opd8yvUIrlolct+rgobSE
   FPEIeyILPPynYcxqVy8AXB9C+aYejI6b5CunLj1ISbM5/bi/admPH/XcZ
   Kv7UvyY+Q+Y0sLjo1/Ur8nnZwMw2jJVY/fKQJjtXnphxhCB4uqDwdzePJ
   gVgSQbEXvOsiBKfLoRkQ/2uM9HUWzu+xEAZfyB0UrfR7sdULMoiUOWaOU
   v3PBu341WviEH/MBKMlyUxW0u6+kGMZ0vpR0mLSt/1A4at1ScicldzJnC
   ofUwVltVdMd13BjeDLznKrCSH94QD3nkzhwamsN/hz42XSRklzRHrTO2U
   w==;
X-CSE-ConnectionGUID: 87Uw/es8SrmdsGDVWNB74g==
X-CSE-MsgGUID: 5UEm28CFTPy99kZXVvGOlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="46790716"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="46790716"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 02:37:32 -0800
X-CSE-ConnectionGUID: giedkJldRWmQ+Hfh73aEnQ==
X-CSE-MsgGUID: 4YzrNCnhQRe/rf1ByjSbCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="132911756"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jan 2025 02:37:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU1X3-000Apb-2E;
	Sat, 04 Jan 2025 10:37:25 +0000
Date: Sat, 4 Jan 2025 18:37:05 +0800
From: kernel test robot <lkp@intel.com>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, lgirdwood@gmail.com,
	broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
	jerome.neanne@baylibre.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, m-leonard@ti.com,
	praneeth@ti.com, christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v2 2/7] regulator: tps65215: Update function & struct
 names
Message-ID: <202501041857.Nm1l2pdj-lkp@intel.com>
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
config: i386-buildonly-randconfig-001-20250104 (https://download.01.org/0day-ci/archive/20250104/202501041857.Nm1l2pdj-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041857.Nm1l2pdj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041857.Nm1l2pdj-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/regulator/tps65219-regulator.c:21:
   In file included from include/linux/regulator/driver.h:18:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2223:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/regulator/tps65219-regulator.c:261:37: error: use of undeclared identifier 'TPS65215_LDO_2'; did you mean 'TPS65219_LDO_2'?
     261 |         TPS65219_REGULATOR("LDO2", "ldo2", TPS65215_LDO_2,
         |                                            ^~~~~~~~~~~~~~
         |                                            TPS65219_LDO_2
   drivers/regulator/tps65219-regulator.c:99:11: note: expanded from macro 'TPS65219_REGULATOR'
      99 |                 .id                     = _id,                          \
         |                                           ^
   include/linux/mfd/tps65219.h:302:2: note: 'TPS65219_LDO_2' declared here
     302 |         TPS65219_LDO_2,
         |         ^
>> drivers/regulator/tps65219-regulator.c:263:7: error: use of undeclared identifier 'TPS65215_REG_LDO2_VOUT'
     263 |                            TPS65215_REG_LDO2_VOUT,
         |                            ^
>> drivers/regulator/tps65219-regulator.c:266:7: error: use of undeclared identifier 'TPS65215_ENABLE_LDO2_EN_MASK'
     266 |                            TPS65215_ENABLE_LDO2_EN_MASK, 0, 0, tps65215_ldo_2_range,
         |                            ^
>> drivers/regulator/tps65219-regulator.c:263:7: error: use of undeclared identifier 'TPS65215_REG_LDO2_VOUT'
     263 |                            TPS65215_REG_LDO2_VOUT,
         |                            ^
   drivers/regulator/tps65219-regulator.c:328:29: error: use of undeclared identifier 'regulators'
     328 |         for (i = 0; i < ARRAY_SIZE(regulators); i++) {
         |                                    ^
   drivers/regulator/tps65219-regulator.c:328:29: error: use of undeclared identifier 'regulators'
   drivers/regulator/tps65219-regulator.c:328:29: error: use of undeclared identifier 'regulators'
   drivers/regulator/tps65219-regulator.c:329:47: error: use of undeclared identifier 'regulators'
     329 |                 rdev = devm_regulator_register(&pdev->dev, &regulators[i],
         |                                                             ^
   drivers/regulator/tps65219-regulator.c:334:6: error: use of undeclared identifier 'regulators'
     334 |                                         regulators[i].name);
         |                                         ^
   1 warning and 9 errors generated.


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

