Return-Path: <linux-omap+bounces-2806-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6D29ECBB8
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2024 13:05:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D1E116834E
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2024 12:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3434A2163A7;
	Wed, 11 Dec 2024 12:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="LcijISB4"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26490238E2A;
	Wed, 11 Dec 2024 12:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733918715; cv=none; b=Nv1lwIjWSkhOo2DP9fOF6fldWeQBc24OfKGUgBDcArPxzjyrvrgrf1ARgil+wbICOVR5QyZGMQHXknHDW+8gL+Sc+O/bUVG/SpeO2Bpy/2k189KBQtwUGlY3I8kUhQxpvuts9nBM9gZx3uhmyU95WWCjI4Zya9AKGi1o4UxyXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733918715; c=relaxed/simple;
	bh=u4XWX926mDyaQJxp4ycS42AhC/tMjf4h0McUvfYw+GQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DjJVH2FRwZ6m2Iqe157D5Ilg98ZQk6QhWO+XfpWqRUONL2tCnAZ/sLTzr32VxPsDake50q8ir6DNRB3ZDmV4aNMtLNUbxcFjsKXVamhRIHYtBe8Dhk5I8kQVtEKuzffS8c10NFAOQwPz5PHnXGK2X9ZzXDgwQesGFx23Pi3frYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=LcijISB4; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=2pRZ/eXShbUq1MO5oovE7csxNQQTAqDIDmPLX+j1Ssk=; b=LcijISB4joU+uEFF
	66gZmz/W13GKmAnDF30NXP7irkoyxCrALJtUK6FBaEVQC73liZR2rokWB+0swelpTGErRYdq59r9S
	DKbdOPR6a3uuf7+9lFoTj7MEkKjEZkR9SZSRJvkbOewCaWnntVVbMNKgDn5nxQ/W1Ic0+EV/fms+i
	+L6daAOrQM7zcJbkiwbr0kFgndyDh3QozgprqoiD2TZaBzrF8QclH5sijmTmrZqEv3MMXlqKoFDme
	gRmwcqRvItnl/shOG4PPPXnau9+c4On15jQUUSMsK0+9W4jDnctgtG5O7Uh6t7DFbjeW5TIv7KBtp
	fkMVd9hwuqAgWPhjHA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tLLSl-004jUW-2W;
	Wed, 11 Dec 2024 12:05:07 +0000
Date: Wed, 11 Dec 2024 12:05:07 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: rogerq@kernel.org, tony@atomide.com, krzk@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: omap-gpmc: deadcode a pair of functions
Message-ID: <Z1l_85Cq10KbRWl2@gallifrey>
References: <20241210220628.237604-1-linux@treblig.org>
 <202412111932.lp8jHbeT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <202412111932.lp8jHbeT-lkp@intel.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 12:04:29 up 216 days, 23:18,  1 user,  load average: 0.02, 0.02,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* kernel test robot (lkp@intel.com) wrote:
> Hi,
> 
> kernel test robot noticed the following build warnings:

Good bot!

> [auto build test WARNING on krzk-mem-ctrl/for-next]
> [also build test WARNING on linus/master v6.13-rc2 next-20241211]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/linux-treblig-org/memory-omap-gpmc-deadcode-a-pair-of-functions/20241211-062027
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
> patch link:    https://lore.kernel.org/r/20241210220628.237604-1-linux%40treblig.org
> patch subject: [PATCH] memory: omap-gpmc: deadcode a pair of functions
> config: i386-buildonly-randconfig-002-20241211 (https://download.01.org/0day-ci/archive/20241211/202412111932.lp8jHbeT-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412111932.lp8jHbeT-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412111932.lp8jHbeT-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/memory/omap-gpmc.c:361:21: warning: 'gpmc_clk_ticks_to_ns' defined but not used [-Wunused-function]
>      361 | static unsigned int gpmc_clk_ticks_to_ns(unsigned int ticks, int cs,
>          |                     ^~~~~~~~~~~~~~~~~~~~

Ooh, right, I'll clean that out as well and send a v2.

Dave

> 
> 
> vim +/gpmc_clk_ticks_to_ns +361 drivers/memory/omap-gpmc.c
> 
> a3551f5b0c3ca7a arch/arm/mach-omap2/gpmc.c Adrian Hunter 2010-12-09  360  
> 3950fffdf0c088d drivers/memory/omap-gpmc.c Baoyou Xie    2016-08-28 @361  static unsigned int gpmc_clk_ticks_to_ns(unsigned int ticks, int cs,
> 7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  362  					 enum gpmc_clk_domain cd)
> 7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  363  {
> 7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  364  	return ticks * gpmc_get_clk_period(cs, cd) / 1000;
> 7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  365  }
> 7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  366  
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

