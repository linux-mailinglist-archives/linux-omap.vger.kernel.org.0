Return-Path: <linux-omap+bounces-2805-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6AF9ECB25
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2024 12:28:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 63D6F165B0C
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2024 11:27:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 464B7238E13;
	Wed, 11 Dec 2024 11:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQvA1hC/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06044238E0A;
	Wed, 11 Dec 2024 11:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733916476; cv=none; b=fbPk9ypKDjD6+oZiHgiZy2QlfKRdGV0OLpyKK5ERkunuZ7BDDCOnaQByxNIFB2Am88ZvFwTiHANFmGN/zXvy79mzvrd+xFoJIyJfGHWSo5XTvfuKQfjKcXUQzfD7ZuUVfe2Sh77tMYAVF0z8L0vkngXLUPL0PJow4jsdy6P7dDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733916476; c=relaxed/simple;
	bh=2Us4bfzXojhF/mgxJqkNu/slsDJ35ZxLUJBErG+LNGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUbf8eXLGXZCn3Oez+Un+QauQJnwT57T4XKjnEOSuZU2QbgqlsEQeEzsNfy0RCgB6kgIyzuS/T7OL/BAeQv/Pcgi3+JH8xylRU7tFWbPN1tb0TSZI05AejV6lwoQhvFtUJPIaUKnxU/8tLtsbXM9XsldaH7aoQXCLQDLuKtsU4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQvA1hC/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733916475; x=1765452475;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2Us4bfzXojhF/mgxJqkNu/slsDJ35ZxLUJBErG+LNGc=;
  b=hQvA1hC/LZV8NJTnSDaOaXe5m3iIIjuYC21eI6IdkTwO+ZgbKSARhPG9
   GQR2lXkXNxGBem2N4VTUIM4vY8waHuxkFyljVUmF4MMctxb20dqtU13hI
   kbJfJNd9kxAw6yO07mBQWPsn34NmQEV1j5/S+2OEFwYgXqU9eONMZdEaV
   63/lx6m/hgE45Mhe7Y5kF4a5fSNG5KHqMwhuGpnyqBk1Sn2QRclhtig8o
   UhTOKOpDlcPO7zWLEPykfhW5SDLU2Vqd6GzDSaQnSkuG7rmljogP9CBwI
   u3CVXTXKfSftjnwRz1XKM7oBIaOmLAT0li5Go4EpAI9CL7e0neYLR0krT
   Q==;
X-CSE-ConnectionGUID: jrEsPT7GTuOrWBV8YxYP3g==
X-CSE-MsgGUID: VpUICRRCTW+lmWjl9QG+aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="37978594"
X-IronPort-AV: E=Sophos;i="6.12,225,1728975600"; 
   d="scan'208";a="37978594"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2024 03:27:55 -0800
X-CSE-ConnectionGUID: HBhJwqgPSC+bcp6DswDgZw==
X-CSE-MsgGUID: Y9GNGIj1RuSv2t7nsGCMDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100716109"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 11 Dec 2024 03:27:53 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLKsg-0006av-0a;
	Wed, 11 Dec 2024 11:27:50 +0000
Date: Wed, 11 Dec 2024 19:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: linux@treblig.org, rogerq@kernel.org, tony@atomide.com, krzk@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: Re: [PATCH] memory: omap-gpmc: deadcode a pair of functions
Message-ID: <202412111932.lp8jHbeT-lkp@intel.com>
References: <20241210220628.237604-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210220628.237604-1-linux@treblig.org>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk-mem-ctrl/for-next]
[also build test WARNING on linus/master v6.13-rc2 next-20241211]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/linux-treblig-org/memory-omap-gpmc-deadcode-a-pair-of-functions/20241211-062027
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
patch link:    https://lore.kernel.org/r/20241210220628.237604-1-linux%40treblig.org
patch subject: [PATCH] memory: omap-gpmc: deadcode a pair of functions
config: i386-buildonly-randconfig-002-20241211 (https://download.01.org/0day-ci/archive/20241211/202412111932.lp8jHbeT-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412111932.lp8jHbeT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412111932.lp8jHbeT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/memory/omap-gpmc.c:361:21: warning: 'gpmc_clk_ticks_to_ns' defined but not used [-Wunused-function]
     361 | static unsigned int gpmc_clk_ticks_to_ns(unsigned int ticks, int cs,
         |                     ^~~~~~~~~~~~~~~~~~~~


vim +/gpmc_clk_ticks_to_ns +361 drivers/memory/omap-gpmc.c

a3551f5b0c3ca7a arch/arm/mach-omap2/gpmc.c Adrian Hunter 2010-12-09  360  
3950fffdf0c088d drivers/memory/omap-gpmc.c Baoyou Xie    2016-08-28 @361  static unsigned int gpmc_clk_ticks_to_ns(unsigned int ticks, int cs,
7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  362  					 enum gpmc_clk_domain cd)
7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  363  {
7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  364  	return ticks * gpmc_get_clk_period(cs, cd) / 1000;
7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  365  }
7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  366  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

