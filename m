Return-Path: <linux-omap+bounces-2969-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F03FA013C7
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 10:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB3E03A3E60
	for <lists+linux-omap@lfdr.de>; Sat,  4 Jan 2025 09:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F34519004A;
	Sat,  4 Jan 2025 09:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lqhZ94fg"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09435189B84;
	Sat,  4 Jan 2025 09:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735984410; cv=none; b=mKSL8ayfBFCaX0TYn/nyT+HKlhDEbrQOhxevsNahyRbH45JcuQMR2JKUe2kOdE0y7G1VToGScvVbZHQx09LgoR6QH4xy3DsPUolz4qeJbJPl4sgMshowq1YwHmeFssEzVTb3lPXn8ujdZmd+ZXVdxX60u4QZZRv/FpT5y1/u7iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735984410; c=relaxed/simple;
	bh=b5NdL24kxs9OzB9ynQRuWiuoyZsaL2pQwHwCs/fqGh0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yr0Fh6ejsr8Z+t4Q4ccUFS+8Sj2HMppnhvqSaju/sC0AXDackUunM7qBkl8+ZanZYiH3iWz22hZbXG85h5xhhBMEA1Hgz6TsLrNh9lc2CfqDTF0KhOJAuT0AYjrrlxwGdEELMWpCRqhDjOE9hj0IEoaoj3L45Tf9nxln15oZefo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lqhZ94fg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735984409; x=1767520409;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=b5NdL24kxs9OzB9ynQRuWiuoyZsaL2pQwHwCs/fqGh0=;
  b=lqhZ94fg452hw/wrBA5DzrEPN8+/6ufPfMxvwn8h1NO4fm2YWbp+T2eT
   U97Ajows/qxQOqDcQJj3m4N9ha7y2CLiljbSbAy2aAnU6hxmqJ3+jPKTF
   1o6sn4Uh+jIytlB+U9oOhMNLdt13YZ78tWdt1qR2TyjgoRwGb5rGzK393
   rtnALqDThuiP1WWrs1jWx6VM+F5AajcP0SZ7h9iSKJ9Y5qU2ONyGX6fl8
   qWihwob8jMBA1Nw70RByNgQ4dCtdyPnEgbf6NZe1vZRigVQae6L6QiABW
   5o7gDSEQL2lWz20GLlli2VXLop51O0qIKGakmbSZycsFBqHqCkwqmp+hI
   g==;
X-CSE-ConnectionGUID: 94DJPf/QQDGKFkz5XxKxjQ==
X-CSE-MsgGUID: L19lZDMqTGC8/HE3uZPbug==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="35910080"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="35910080"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 01:53:28 -0800
X-CSE-ConnectionGUID: YU/bp2OdTU2XRo0D1PMinQ==
X-CSE-MsgGUID: 6rXyuzj0T8yrqP+9otizMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106028907"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jan 2025 01:53:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU0qP-000Anr-2i;
	Sat, 04 Jan 2025 09:53:21 +0000
Date: Sat, 4 Jan 2025 17:53:09 +0800
From: kernel test robot <lkp@intel.com>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, lgirdwood@gmail.com,
	broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
	jerome.neanne@baylibre.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, m-leonard@ti.com, praneeth@ti.com,
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v2 4/7] regulator: tps65215: Add chip_data struct for
 multi-PMIC support
Message-ID: <202501041724.qQwuHm5z-lkp@intel.com>
References: <20250103230446.197597-5-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250103230446.197597-5-s-ramamoorthy@ti.com>

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
patch link:    https://lore.kernel.org/r/20250103230446.197597-5-s-ramamoorthy%40ti.com
patch subject: [PATCH v2 4/7] regulator: tps65215: Add chip_data struct for multi-PMIC support
config: i386-buildonly-randconfig-004-20250104 (https://download.01.org/0day-ci/archive/20250104/202501041724.qQwuHm5z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501041724.qQwuHm5z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501041724.qQwuHm5z-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/regulator/tps65219-regulator.c:266:44: error: 'TPS65215_LDO_2' undeclared here (not in a function); did you mean 'TPS65219_LDO_2'?
     266 |         TPS65219_REGULATOR("LDO2", "ldo2", TPS65215_LDO_2,
         |                                            ^~~~~~~~~~~~~~
   drivers/regulator/tps65219-regulator.c:104:43: note: in definition of macro 'TPS65219_REGULATOR'
     104 |                 .id                     = _id,                          \
         |                                           ^~~
   drivers/regulator/tps65219-regulator.c:268:28: error: 'TPS65215_REG_LDO2_VOUT' undeclared here (not in a function); did you mean 'TPS65219_REG_LDO2_VOUT'?
     268 |                            TPS65215_REG_LDO2_VOUT,
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/tps65219-regulator.c:109:43: note: in definition of macro 'TPS65219_REGULATOR'
     109 |                 .vsel_reg               = _vr,                          \
         |                                           ^~~
   drivers/regulator/tps65219-regulator.c:271:28: error: 'TPS65215_ENABLE_LDO2_EN_MASK' undeclared here (not in a function); did you mean 'TPS65219_ENABLE_LDO2_EN_MASK'?
     271 |                            TPS65215_ENABLE_LDO2_EN_MASK, 0, 0, tps65215_ldo_2_range,
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/regulator/tps65219-regulator.c:116:43: note: in definition of macro 'TPS65219_REGULATOR'
     116 |                 .enable_mask            = _em,                          \
         |                                           ^~~
>> drivers/regulator/tps65219-regulator.c:330:10: error: 'TPS65215' undeclared here (not in a function); did you mean 'TPS65219'?
     330 |         [TPS65215] = {
         |          ^~~~~~~~
         |          TPS65219
>> drivers/regulator/tps65219-regulator.c:330:10: error: array index in initializer not of integer type
   drivers/regulator/tps65219-regulator.c:330:10: note: (near initialization for 'chip_info_table')
   In file included from include/linux/kernel.h:16,
                    from drivers/regulator/tps65219-regulator.c:13:
   drivers/regulator/tps65219-regulator.c: In function 'tps65219_regulator_probe':
   drivers/regulator/tps65219-regulator.c:365:36: error: 'regulators' undeclared (first use in this function); did you mean 'regulator'?
     365 |         for (i = 0; i < ARRAY_SIZE(regulators); i++) {
         |                                    ^~~~~~~~~~
   include/linux/array_size.h:11:33: note: in definition of macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                 ^~~
   drivers/regulator/tps65219-regulator.c:365:36: note: each undeclared identifier is reported only once for each function it appears in
     365 |         for (i = 0; i < ARRAY_SIZE(regulators); i++) {
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
   drivers/regulator/tps65219-regulator.c:365:25: note: in expansion of macro 'ARRAY_SIZE'
     365 |         for (i = 0; i < ARRAY_SIZE(regulators); i++) {
         |                         ^~~~~~~~~~
   drivers/regulator/tps65219-regulator.c: At top level:
   drivers/regulator/tps65219-regulator.c:329:34: warning: 'chip_info_table' defined but not used [-Wunused-variable]
     329 | static struct tps65219_chip_data chip_info_table[] = {
         |                                  ^~~~~~~~~~~~~~~


vim +330 drivers/regulator/tps65219-regulator.c

   328	
   329	static struct tps65219_chip_data chip_info_table[] = {
 > 330		[TPS65215] = {
   331			.rdesc = tps65215_regs,
   332			.rdesc_size = ARRAY_SIZE(tps65215_regs),
   333			.common_rdesc = common_regs,
   334			.common_rdesc_size = ARRAY_SIZE(common_regs),
   335			.common_irq_types = common_regulator_irq_types,
   336			.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
   337		},
   338		[TPS65219] = {
   339			.rdesc = tps65219_regs,
   340			.rdesc_size = ARRAY_SIZE(tps65219_regs),
   341			.common_rdesc = common_regs,
   342			.common_rdesc_size = ARRAY_SIZE(common_regs),
   343			.common_irq_types = common_regulator_irq_types,
   344			.common_irq_size = ARRAY_SIZE(common_regulator_irq_types),
   345			.irq_types = tps65219_regulator_irq_types,
   346			.dev_irq_size = ARRAY_SIZE(tps65219_regulator_irq_types),
   347		},
   348	};
   349	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

