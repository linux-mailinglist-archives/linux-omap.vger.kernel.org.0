Return-Path: <linux-omap+bounces-5424-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C2EF8D11BD2
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 11:11:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F2C630FCC2E
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 10:06:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39C328F948;
	Mon, 12 Jan 2026 10:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="buiWGnw9"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5BE28C037;
	Mon, 12 Jan 2026 10:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768212379; cv=none; b=iQxkeUwJLL6yXfGylrYYZqwXq6guB19n/W5Wf9wZwFRyqukQdkBLqWRSujeM9MU4oiDOrcrLGEbBYqmg7nz9eok/3Kux4AE+dQejRm6h1mX6Ra4jz2E81JuR6/EfbQdEgLqWvE7/EiEjSqHNx9+vZ0G57o5oP7ASlctbbl6FY8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768212379; c=relaxed/simple;
	bh=3PW+lccnBZa1wwf7a30nZMPulFc55qZnM/4SokkMUr8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFefhKQglU7xjUWDlgNS48hHlP+tWS246ZlTeYgNwmC4YiQOEDIvS0n+ypag3u6t5xTvs7sBiGkdtCPnfrun8OI5P/1swWfyYCFtzpaPXavuaU7xFEzh+jcGuDtjZMzp+X55H29LYEpWf/vtoPRuj6EnmUXvBc38SBz4ArOTlsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=buiWGnw9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768212378; x=1799748378;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3PW+lccnBZa1wwf7a30nZMPulFc55qZnM/4SokkMUr8=;
  b=buiWGnw9QFQwAbZ32BBCqSvFXq8BxGIZVw29M+C7IuwJFTixgociIq9w
   ri6VF7Sg9vqnK2b67MzvIsOzXFpm5B9ouWjanvHvqshhaLU0l9N3bG5Eb
   RZC8EHpqOLFjTYSFlp5chDMWuUFY8FbRErcq4c8pSVIEAx18/6afUYoAF
   PKqlvC43YjTJX9WPj/iRju/e7ykwTpIeRNVmjMx3RH4GQXG1qwYdjAya9
   8KGThJczsO7S6t5uoH3oZLw6izbXAbp1pPXQP25xj6Qr2IRDeYFUNzv69
   jbgkYLL56/12QWfHGn4b3LkUk/o79tRC4ExSmLDhi/it3AA8n/6CtniHy
   g==;
X-CSE-ConnectionGUID: LAqXYovoTvmJPWZJLeUneA==
X-CSE-MsgGUID: /sd8rrndRteyRh+v1GgrIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="57034236"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="57034236"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 02:06:16 -0800
X-CSE-ConnectionGUID: JWYITz9qRL2wHgPvTI3OEA==
X-CSE-MsgGUID: Fl4ph0OrQhmwRKYcLvXrkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203264499"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Jan 2026 02:06:12 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfEoM-00000000DF6-03aY;
	Mon, 12 Jan 2026 10:06:10 +0000
Date: Mon, 12 Jan 2026 18:05:13 +0800
From: kernel test robot <lkp@intel.com>
To: Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
	gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of
 info->dev
Message-ID: <202601121705.2kgxpvsS-lkp@intel.com>
References: <20260112010740.186248-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112010740.186248-1-chintanlike@gmail.com>

Hi Chintan,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Chintan-Patel/staging-fbtft-use-dev_of_fbinfo-instead-of-info-dev/20260112-091221
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260112010740.186248-1-chintanlike%40gmail.com
patch subject: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of info->dev
config: x86_64-randconfig-005-20260112 (https://download.01.org/0day-ci/archive/20260112/202601121705.2kgxpvsS-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601121705.2kgxpvsS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601121705.2kgxpvsS-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/staging/fbtft/fbtft-core.c:367:23: error: call to undeclared function 'dev_of_fbinfo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     367 |         struct device *dev = dev_of_fbinfo(info);
         |                              ^
>> drivers/staging/fbtft/fbtft-core.c:367:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
     367 |         struct device *dev = dev_of_fbinfo(info);
         |                        ^     ~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft-core.c:393:23: error: call to undeclared function 'dev_of_fbinfo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     393 |         struct device *dev = dev_of_fbinfo(info);
         |                              ^
   drivers/staging/fbtft/fbtft-core.c:393:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
     393 |         struct device *dev = dev_of_fbinfo(info);
         |                        ^     ~~~~~~~~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft-core.c:744:23: error: call to undeclared function 'dev_of_fbinfo'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     744 |         struct device *dev = dev_of_fbinfo(fb_info);
         |                              ^
   drivers/staging/fbtft/fbtft-core.c:744:17: error: incompatible integer to pointer conversion initializing 'struct device *' with an expression of type 'int' [-Wint-conversion]
     744 |         struct device *dev = dev_of_fbinfo(fb_info);
         |                        ^     ~~~~~~~~~~~~~~~~~~~~~~
   6 errors generated.


vim +/dev_of_fbinfo +367 drivers/staging/fbtft/fbtft-core.c

   360	
   361	static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
   362				      unsigned int green, unsigned int blue,
   363				      unsigned int transp, struct fb_info *info)
   364	{
   365		unsigned int val;
   366		int ret = 1;
 > 367		struct device *dev = dev_of_fbinfo(info);
   368	
   369		dev_dbg(dev,
   370			"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
   371			__func__, regno, red, green, blue, transp);
   372	
   373		switch (info->fix.visual) {
   374		case FB_VISUAL_TRUECOLOR:
   375			if (regno < 16) {
   376				u32 *pal = info->pseudo_palette;
   377	
   378				val  = chan_to_field(red,   &info->var.red);
   379				val |= chan_to_field(green, &info->var.green);
   380				val |= chan_to_field(blue,  &info->var.blue);
   381	
   382				pal[regno] = val;
   383				ret = 0;
   384			}
   385			break;
   386		}
   387		return ret;
   388	}
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

