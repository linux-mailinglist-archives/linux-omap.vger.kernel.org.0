Return-Path: <linux-omap+bounces-2809-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 390609ED8E5
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2024 22:44:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8482283C99
	for <lists+linux-omap@lfdr.de>; Wed, 11 Dec 2024 21:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F2661DC9AB;
	Wed, 11 Dec 2024 21:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="CvdvOtc8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831941D31B5;
	Wed, 11 Dec 2024 21:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733953446; cv=none; b=e2C5fLHeRDi6VsB+lC6u29VCfhBz2E4q9CI00avWQ+0xJteRvQIIlTfsPqFTmUrzABoKVpPhkVU/F/KA06FBZKolZWBgRuAbpQrFGHnsivpr0yFLBafy+cXLw+J2ShxEZqBTnYxei8ogc7pozPmS3QFc4CDYSTMwGCu9mArGPeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733953446; c=relaxed/simple;
	bh=5U2ASdnepTwaFLctQvB/+gwnMmMlZoNUvW0ixyaRRwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oINL2O0sYSBsmCfL+iO/jFHIXKQ77sG5jQyUhIKS23wZ6Ek7FVNtDBMyFos/Wh5KOFz2Ywp0LjspSDNSiQRXFCGlHLopDUcaIilyeppM1IRjnPBlEbFv01p1gE02xBDYqVtfYH1v/YBJeun2Um5RTMWx5AdkCR7/aLsROYcHo6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=CvdvOtc8; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=SH2ZF9/CPWAZaJVDW9f7/B3MNvwfJzYb5XVZa+4d5is=; b=CvdvOtc8y8uYK6ff
	H3D9KMk/yfsVIFtRLSEB4A7S33DVtiTd2bfRtEBHM8tF7jIUZF9lYkd1FAX9k0Ud/duHDBca2AJUp
	KBwe7aGb3iiaCuP5sZ3f6pzH38JxznmMrkCOVcEeIG4JqgJ41a4hMR39+uRGUhRr4cV4eLlOb6syR
	vVpnH56vmFjlF4dvY2I5eXeFDQTeKrgnzNmhPXphOa0UINvtR06qpCDLkX+q9exiV2yg/7QHwyRi8
	xSXQ2erftN6nVvfW30rGxHf7m9Rlzgmwqp24OYHvrTkvtdRh6ASG1b6JceGspM+UHGDeJAgYj9PZW
	rPNOS43gKk58eEaZXQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1tLUUy-004rVE-04;
	Wed, 11 Dec 2024 21:44:00 +0000
Date: Wed, 11 Dec 2024 21:43:59 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: rogerq@kernel.org, tony@atomide.com, krzk@kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: omap-gpmc: deadcode a pair of functions
Message-ID: <Z1oHn6D2PuJGV-3y@gallifrey>
References: <20241210220628.237604-1-linux@treblig.org>
 <202412111932.lp8jHbeT-lkp@intel.com>
 <Z1l_85Cq10KbRWl2@gallifrey>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <Z1l_85Cq10KbRWl2@gallifrey>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 21:43:18 up 217 days,  8:57,  1 user,  load average: 0.00, 0.02,
 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Dr. David Alan Gilbert (linux@treblig.org) wrote:
> * kernel test robot (lkp@intel.com) wrote:
> > Hi,
> > 
> > kernel test robot noticed the following build warnings:
> 
> Good bot!
> 
> > [auto build test WARNING on krzk-mem-ctrl/for-next]
> > [also build test WARNING on linus/master v6.13-rc2 next-20241211]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/linux-treblig-org/memory-omap-gpmc-deadcode-a-pair-of-functions/20241211-062027
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
> > patch link:    https://lore.kernel.org/r/20241210220628.237604-1-linux%40treblig.org
> > patch subject: [PATCH] memory: omap-gpmc: deadcode a pair of functions
> > config: i386-buildonly-randconfig-002-20241211 (https://download.01.org/0day-ci/archive/20241211/202412111932.lp8jHbeT-lkp@intel.com/config)
> > compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241211/202412111932.lp8jHbeT-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202412111932.lp8jHbeT-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/memory/omap-gpmc.c:361:21: warning: 'gpmc_clk_ticks_to_ns' defined but not used [-Wunused-function]
> >      361 | static unsigned int gpmc_clk_ticks_to_ns(unsigned int ticks, int cs,
> >          |                     ^~~~~~~~~~~~~~~~~~~~
> 
> Ooh, right, I'll clean that out as well and send a v2.

OK, slightly more complicated, I've posted it as 20241211214227.107980-1-linux@treblig.org
gpmc_clk_ticks_to_ns is still used, but only inside a function which is ifdef'd, so I've
moved it inside the ifdef.

Dave

> Dave
> 
> > 
> > 
> > vim +/gpmc_clk_ticks_to_ns +361 drivers/memory/omap-gpmc.c
> > 
> > a3551f5b0c3ca7a arch/arm/mach-omap2/gpmc.c Adrian Hunter 2010-12-09  360  
> > 3950fffdf0c088d drivers/memory/omap-gpmc.c Baoyou Xie    2016-08-28 @361  static unsigned int gpmc_clk_ticks_to_ns(unsigned int ticks, int cs,
> > 7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  362  					 enum gpmc_clk_domain cd)
> > 7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  363  {
> > 7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  364  	return ticks * gpmc_get_clk_period(cs, cd) / 1000;
> > 7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  365  }
> > 7f2e8c58ae9e352 drivers/memory/omap-gpmc.c Robert ABEL   2015-02-27  366  
> > 
> > -- 
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> -- 
>  -----Open up your eyes, open up your mind, open up your code -------   
> / Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
> \        dave @ treblig.org |                               | In Hex /
>  \ _________________________|_____ http://www.treblig.org   |_______/
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

