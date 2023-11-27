Return-Path: <linux-omap+bounces-31-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7177F968A
	for <lists+linux-omap@lfdr.de>; Mon, 27 Nov 2023 00:32:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4433B280E37
	for <lists+linux-omap@lfdr.de>; Sun, 26 Nov 2023 23:32:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 157AB1774C;
	Sun, 26 Nov 2023 23:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZBEQUFjO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB71AE4;
	Sun, 26 Nov 2023 15:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701041540; x=1732577540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DL1UZC6QXeMznGYKv4T6wrrF7fnm2ErIt+iYauhRjkk=;
  b=ZBEQUFjOfZgdej31Mtys8xUCWR0hd3qNvn00Xu8la2+Ps20Ncmn4xqRD
   5o6ONr3bBFS5+XDWKVZx/kJvPxIJCYsteWvnqOagHmRmTBr5F0CL08vQH
   TB4koUfuaJ50npN48jQApLfopOdYB16BrG17yBJZwlSMxIDjeOe6aYp4u
   pd6PUubXajuF15VGWPwgbyRhXvfW+R0Rks1+H8tkcO0ktQMX+0UxUZUk7
   b1F6ZnsKNBo8FpldoTVi0GLP1rnWkwjdLxrG5Yrv6YbHlCMZGGKssHV/5
   zCqetYZwixELWv4SuJNA/eUt3KbTT/g8OQhsYRbM3y1zkqROtq5Y9MylM
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="372768311"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="372768311"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 15:32:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="858862273"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="858862273"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Nov 2023 15:32:17 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Obn-0005dB-1V;
	Sun, 26 Nov 2023 23:32:15 +0000
Date: Mon, 27 Nov 2023 07:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Kemnade <andreas@kemnade.info>, lee@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/6] twl-core: add power off implementation for twl603x
Message-ID: <202311270558.j38P20an-lkp@intel.com>
References: <20231125092938.16535-3-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231125092938.16535-3-andreas@kemnade.info>

Hi Andreas,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on lee-mfd/for-mfd-next linus/master v6.7-rc2 next-20231124]
[cannot apply to tmlind-omap/for-next lee-mfd/for-mfd-fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Kemnade/dt-bindings-mfd-ti-twl-Document-system-power-controller/20231125-173426
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231125092938.16535-3-andreas%40kemnade.info
patch subject: [PATCH 2/6] twl-core: add power off implementation for twl603x
config: x86_64-randconfig-122-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270558.j38P20an-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231127/202311270558.j38P20an-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311270558.j38P20an-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/twl-core.c:690:6: sparse: sparse: symbol 'twl6030_power_off' was not declared. Should it be static?

vim +/twl6030_power_off +690 drivers/mfd/twl-core.c

   689	
 > 690	void twl6030_power_off(void)
   691	{
   692	#define APP_DEVOFF      (1<<0)
   693	#define CON_DEVOFF      (1<<1)
   694	#define MOD_DEVOFF      (1<<2)
   695	
   696		int err;
   697		u8 val;
   698	
   699		err = twl_i2c_read_u8(TWL_MODULE_PM_MASTER, &val,
   700				      TWL6030_PHOENIX_DEV_ON);
   701		if (err) {
   702			pr_err("I2C error %d reading PHOENIX_DEV_ON\n", err);
   703			return;
   704		}
   705	
   706		val |= APP_DEVOFF | CON_DEVOFF | MOD_DEVOFF;
   707	
   708		err = twl_i2c_write_u8(TWL_MODULE_PM_MASTER, val,
   709				       TWL6030_PHOENIX_DEV_ON);
   710		if (err)
   711			pr_err("TWL6030 Unable to power off\n");
   712	}
   713	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

