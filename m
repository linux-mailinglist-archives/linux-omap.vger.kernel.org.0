Return-Path: <linux-omap+bounces-3138-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1321EA14BE7
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jan 2025 10:15:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4EFC91887589
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jan 2025 09:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4651F7910;
	Fri, 17 Jan 2025 09:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lpqQSg26"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5A31F8AD0;
	Fri, 17 Jan 2025 09:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737105323; cv=none; b=iFeGwsGzXd+zko+nCF/g8VyFD/QmBEsdjBotWgxua3/yygfmnRJrQM7EfSGceOdcY3wG8CBjvEicG4yzIichD4N+nyDvdKyT2/0Oqrl1+15P/c+jN0ZMo63Fda6AG2FUSBdFunqyhQ5m9If52A5q9Nx5Zl1qQSUR2HSM72n7MyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737105323; c=relaxed/simple;
	bh=2Do2mFCohhXnaRtt6zNtaBAFe8NgkA4WLuBTHq2Xfec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ROP7j+QbRhjFlDY5BJ8MQd9VLu5IrYQcK10JoJ0iyRyUIz4ph8bifo9gT1lCBfYlyi2nzI0DziSIZnB59fP+t7TafxdvgGWDCQaNl7eAJeTdxFp2OHE9zbHVWTD0wMXSYSuUL9rB0DungeOO+oB8p7PM60yDQH6BEACteoCLczA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lpqQSg26; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737105322; x=1768641322;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Do2mFCohhXnaRtt6zNtaBAFe8NgkA4WLuBTHq2Xfec=;
  b=lpqQSg26odc8iuLPu+V7518h7+B94gkiBro8Y2EmjNH75l96Fd+SLghi
   xrbSJ3jTBvaD/Ww3DkALBTprFvAGdCis36tqBJ+TDLOhE2X6vyp4rLw1P
   nsrPZI4eLFAvp5fE6F5OJRIdMsBKzfI5ngmrZqS2awwikVpXcHwUG1x+i
   gyRvvuFi+apVKxdCyPFykDItMdwD5fvuBXOfV7UCrBN0Jx528ErVRd1Q0
   yE7tWNkvyQ3kmolW9UlGp+1qqeD7WVk8DMaTu88z4HLYTbzWYyKxXp18r
   yav3pa3wdHqzVROiMPynVbkNxiXQZcIQ3mcunMiaiblDl6VozdjTL3/Cc
   w==;
X-CSE-ConnectionGUID: uuF36ZBFQsy+3ZOwAPdOrg==
X-CSE-MsgGUID: 58XSssvfRiyTo+GLTOhVng==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="40340866"
X-IronPort-AV: E=Sophos;i="6.13,211,1732608000"; 
   d="scan'208";a="40340866"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 01:15:21 -0800
X-CSE-ConnectionGUID: /fE1/x6TQN+liGstLxljYw==
X-CSE-MsgGUID: JopJEqqDS0CyGiSL4oRbHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106640060"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Jan 2025 01:15:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYiRd-000T0d-0f;
	Fri, 17 Jan 2025 09:15:13 +0000
Date: Fri, 17 Jan 2025 17:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, lgirdwood@gmail.com,
	broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, aaro.koskinen@iki.fi, andreas@kemnade.info,
	khilman@baylibre.com, rogerq@kernel.org, tony@atomide.com,
	jerome.neanne@baylibre.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, m-leonard@ti.com, praneeth@ti.com,
	christophe.jaillet@wanadoo.fr
Subject: Re: [PATCH v3 3/4] regulator: tps65215: Add support for TPS65215
 regulator resources
Message-ID: <202501171720.615uCClE-lkp@intel.com>
References: <20250113231018.125426-4-s-ramamoorthy@ti.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113231018.125426-4-s-ramamoorthy@ti.com>

Hi Shree,

kernel test robot noticed the following build errors:

[auto build test ERROR on broonie-regulator/for-next]
[also build test ERROR on next-20250117]
[cannot apply to robh/for-next tmlind-omap/for-next linus/master v6.13-rc7]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shree-Ramamoorthy/regulator-tps65215-Update-struct-names/20250114-071259
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next
patch link:    https://lore.kernel.org/r/20250113231018.125426-4-s-ramamoorthy%40ti.com
patch subject: [PATCH v3 3/4] regulator: tps65215: Add support for TPS65215 regulator resources
config: x86_64-randconfig-123-20250116 (https://download.01.org/0day-ci/archive/20250117/202501171720.615uCClE-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501171720.615uCClE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501171720.615uCClE-lkp@intel.com/

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
>> drivers/regulator/tps65219-regulator.c:323:17: error: invalid application of 'sizeof' to an incomplete type 'const struct regulator_desc[]'
     323 |                 .rdesc_size = ARRAY_SIZE(tps65215_regs),
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/array_size.h:11:32: note: expanded from macro 'ARRAY_SIZE'
      11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                ^~~~~
>> drivers/regulator/tps65219-regulator.c:348:15: error: variable has incomplete type 'enum pmic_id'
     348 |         enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
         |                      ^
   drivers/regulator/tps65219-regulator.c:348:7: note: forward declaration of 'enum pmic_id'
     348 |         enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
         |              ^
>> drivers/regulator/tps65219-regulator.c:406:26: error: use of undeclared identifier 'TPS65215'
     406 |         { "tps65215-regulator", TPS65215 },
         |                                 ^
>> drivers/regulator/tps65219-regulator.c:410:1: error: definition of variable with array type needs an explicit size or an initializer
     410 | MODULE_DEVICE_TABLE(platform, tps65219_regulator_id_table);
         | ^
   include/linux/module.h:250:21: note: expanded from macro 'MODULE_DEVICE_TABLE'
     250 | extern typeof(name) __mod_device_table__##type##__##name                \
         |                     ^
   <scratch space>:180:1: note: expanded from here
     180 | __mod_device_table__platform__tps65219_regulator_id_table
         | ^
   drivers/regulator/tps65219-regulator.c:321:3: error: use of undeclared identifier 'TPS65215'
     321 |         [TPS65215] = {
         |          ^
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
   270	static const struct regulator_desc tps65219_regs[] = {
   271		TPS65219_REGULATOR("LDO2", "ldo2", TPS65219_LDO_2,
   272				   REGULATOR_VOLTAGE, ldos_1_2_ops, 64,
   273				   TPS65219_REG_LDO2_VOUT,
   274				   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
   275				   TPS65219_REG_ENABLE_CTRL,
   276				   TPS65219_ENABLE_LDO2_EN_MASK, 0, 0, tps65219_ldo_2_range,
   277				   2, 0, 0, NULL, 0, TPS65219_LDOS_BYP_CONFIG_MASK),
   278		TPS65219_REGULATOR("LDO3", "ldo3", TPS65219_LDO_3,
   279				   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
   280				   TPS65219_REG_LDO3_VOUT,
   281				   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
   282				   TPS65219_REG_ENABLE_CTRL,
   283				   TPS65219_ENABLE_LDO3_EN_MASK, 0, 0, tps65219_ldos_3_4_range,
   284				   3, 0, 0, NULL, 0, 0),
   285		TPS65219_REGULATOR("LDO4", "ldo4", TPS65219_LDO_4,
   286				   REGULATOR_VOLTAGE, ldos_3_4_ops, 64,
   287				   TPS65219_REG_LDO4_VOUT,
   288				   TPS65219_BUCKS_LDOS_VOUT_VSET_MASK,
   289				   TPS65219_REG_ENABLE_CTRL,
   290				   TPS65219_ENABLE_LDO4_EN_MASK, 0, 0, tps65219_ldos_3_4_range,
   291				   3, 0, 0, NULL, 0, 0),
   292	};
   293	
   294	static irqreturn_t tps65219_regulator_irq_handler(int irq, void *data)
   295	{
   296		struct tps65219_regulator_irq_data *irq_data = data;
   297	
   298		if (irq_data->type->event_name[0] == '\0') {
   299			/* This is the timeout interrupt no specific regulator */
   300			dev_err(irq_data->dev,
   301				"System was put in shutdown due to timeout during an active or standby transition.\n");
   302			return IRQ_HANDLED;
   303		}
   304	
   305		regulator_notifier_call_chain(irq_data->rdev,
   306					      irq_data->type->event, NULL);
   307	
   308		dev_err(irq_data->dev, "Error IRQ trap %s for %s\n",
   309			irq_data->type->event_name, irq_data->type->regulator_name);
   310		return IRQ_HANDLED;
   311	}
   312	
   313	struct tps65219_chip_data {
   314		size_t rdesc_size;
   315		size_t common_rdesc_size;
   316		const struct regulator_desc *rdesc;
   317		const struct regulator_desc *common_rdesc;
   318	};
   319	
   320	static struct tps65219_chip_data chip_info_table[] = {
   321		[TPS65215] = {
   322			.rdesc = tps65215_regs,
 > 323			.rdesc_size = ARRAY_SIZE(tps65215_regs),
   324			.common_rdesc = common_regs,
   325			.common_rdesc_size = ARRAY_SIZE(common_regs),
   326		},
   327		[TPS65219] = {
   328			.rdesc = tps65219_regs,
   329			.rdesc_size = ARRAY_SIZE(tps65219_regs),
   330			.common_rdesc = common_regs,
   331			.common_rdesc_size = ARRAY_SIZE(common_regs),
   332		},
   333	};
   334	
   335	static int tps65219_regulator_probe(struct platform_device *pdev)
   336	{
   337		struct tps65219_regulator_irq_data *irq_data;
   338		struct tps65219_regulator_irq_type *irq_type;
   339	
   340		struct tps65219_chip_data *pmic;
   341		struct regulator_dev *rdev;
   342		int error;
   343		int irq;
   344		int i;
   345	
   346		struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
   347		struct regulator_config config = { };
 > 348		enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
   349		pmic = &chip_info_table[chip];
   350	
   351		config.dev = tps->dev;
   352		config.driver_data = tps;
   353		config.regmap = tps->regmap;
   354	
   355		for (i = 0; i <  pmic->common_rdesc_size; i++) {
   356			rdev = devm_regulator_register(&pdev->dev, &pmic->common_rdesc[i],
   357						       &config);
   358			if (IS_ERR(rdev))
   359				 return dev_err_probe(tps->dev, PTR_ERR(rdev),
   360						      "Failed to register %s regulator\n",
   361						      pmic->common_rdesc[i].name);
   362		}
   363	
   364		for (i = 0; i <  pmic->rdesc_size; i++) {
   365			rdev = devm_regulator_register(&pdev->dev, &pmic->rdesc[i],
   366						       &config);
   367			if (IS_ERR(rdev))
   368				return dev_err_probe(tps->dev, PTR_ERR(rdev),
   369						     "Failed to register %s regulator\n",
   370						     pmic->rdesc[i].name);
   371		}
   372	
   373		irq_data = devm_kmalloc(tps->dev,
   374					ARRAY_SIZE(tps65219_regulator_irq_types) *
   375					sizeof(struct tps65219_regulator_irq_data),
   376					GFP_KERNEL);
   377		if (!irq_data)
   378			return -ENOMEM;
   379	
   380		for (i = 0; i < ARRAY_SIZE(tps65219_regulator_irq_types); ++i) {
   381			irq_type = &tps65219_regulator_irq_types[i];
   382	
   383			irq = platform_get_irq_byname(pdev, irq_type->irq_name);
   384			if (irq < 0)
   385				return -EINVAL;
   386	
   387			irq_data[i].dev = tps->dev;
   388			irq_data[i].type = irq_type;
   389	
   390			error = devm_request_threaded_irq(tps->dev, irq, NULL,
   391							  tps65219_regulator_irq_handler,
   392							  IRQF_ONESHOT,
   393							  irq_type->irq_name,
   394							  &irq_data[i]);
   395			if (error) {
   396				dev_err(tps->dev, "failed to request %s IRQ %d: %d\n",
   397					irq_type->irq_name, irq, error);
   398				return error;
   399			}
   400		}
   401	
   402		return 0;
   403	}
   404	
   405	static const struct platform_device_id tps65219_regulator_id_table[] = {
 > 406		{ "tps65215-regulator", TPS65215 },
   407		{ "tps65219-regulator", TPS65219 },
   408		{ /* sentinel */ }
   409	};
 > 410	MODULE_DEVICE_TABLE(platform, tps65219_regulator_id_table);
   411	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

