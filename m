Return-Path: <linux-omap+bounces-30-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC907F8E4D
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 21:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 366691C20CCE
	for <lists+linux-omap@lfdr.de>; Sat, 25 Nov 2023 20:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47B6C30653;
	Sat, 25 Nov 2023 20:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AsrbbsiN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10BEFDB;
	Sat, 25 Nov 2023 12:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700942450; x=1732478450;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pBwkxZKKmc1jzdpGVqMyMI3A8HSNgPT6E/hBVhjViao=;
  b=AsrbbsiNs9056WXTIpH60Nnzotg8cdmcYkarLZQyz5zFnK2T4ULYGSo7
   c8GIlWz9HB9ldyZnMko1Nqc1qjJ8JiuYvu9Guf1IDOWCgqi3Rm7IyRPZw
   6HDEfT2jDGLK8b/BiJ49FTb0jXUpw8rs1G4G5S17Md47VzaUCPwORyc7v
   9pmoc0CLcKwJT2PeyAOC8EosGGyccaN/kW7AM1L5YCqQvju9LTqNVx7Io
   SLcVFiZFMqrVdQr+VWJVwglUP5ExJOzoIrhz7NE43Y/0AAfSN9dGcZ48X
   b0qHuZIstaHFaaBDAFLsa40GrsKZMz+emZBpfr/TvCywb92cqPu5s7KGK
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="391398650"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="391398650"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 12:00:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="891332351"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="891332351"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Nov 2023 12:00:46 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6ypX-0004MY-2K;
	Sat, 25 Nov 2023 20:00:43 +0000
Date: Sun, 26 Nov 2023 04:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Kemnade <andreas@kemnade.info>, lee@kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, bcousson@baylibre.com, tony@atomide.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 2/6] twl-core: add power off implementation for twl603x
Message-ID: <202311260213.vq3gMAgF-lkp@intel.com>
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
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20231126/202311260213.vq3gMAgF-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260213.vq3gMAgF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260213.vq3gMAgF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mfd/twl-core.c:690:6: warning: no previous prototype for function 'twl6030_power_off' [-Wmissing-prototypes]
   void twl6030_power_off(void)
        ^
   drivers/mfd/twl-core.c:690:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   void twl6030_power_off(void)
   ^
   static 
   1 warning generated.


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

