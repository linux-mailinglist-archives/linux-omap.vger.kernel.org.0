Return-Path: <linux-omap+bounces-5427-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D16A9D14635
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 18:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4C04302426A
	for <lists+linux-omap@lfdr.de>; Mon, 12 Jan 2026 17:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 803F237E307;
	Mon, 12 Jan 2026 17:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AO7cGcsP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52223378D8B;
	Mon, 12 Jan 2026 17:32:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768239170; cv=none; b=Wj0aNRLeFB//TDMvpdT0R5s80icRFfUdbD7hUur+LjLn94HEzQDC71pjZuQ/1Pxk4OKHsnGfaZ1jeryn5SvKRk69VHKRK71K03/Dn1/m0alrnuuXGoxRsyiGZRzLnff/+Qn/X4/BpvqxwNZCpAwtNlPUrDEKPKonZJdAIxLIg14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768239170; c=relaxed/simple;
	bh=OR/IteiQnlHXasGusgNXutT+OFGgvrqsqPj9gtcQV6w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S621mur6Lsil2RXtBV/IGgaGl7/eEmcVTKTzf8SXEm9J6O9hJYzvPbFUXTD2eLmWPT52CMWggvlW7+QRnOJCErMzNem8FulIAE0dM5XlraPoxyiw4EfQeAvP7nGy9WMJsCA5bklspDWzWElODpIJp/Jrpla8PeAx6sQUdT8Nq7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AO7cGcsP; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768239168; x=1799775168;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OR/IteiQnlHXasGusgNXutT+OFGgvrqsqPj9gtcQV6w=;
  b=AO7cGcsP55YEgI2MOMnyyZXhrucqvf7Mhyesg5YIQnP2JjzMX+YE0+ah
   doui6maWY7cWFql3qoe0Aegq6XNlCmIkAWd4xPO0W9aaw5uXnClotf4+k
   lCz07DTAB/5h6NFkAnnHbjEM8o5pNkiTe7LeYtyHWc3i+RGdC+F+oWOGe
   54juC1pBcEYGHP48jQyV0Huxj3nkm8ncK4clOK/4+vHPBGFd1huVpdkHc
   jgWWT6xQ0ier0xR5VkYATMpFppD+P+exXr8U2l8C1PlAh9ENpSecgK5aL
   m+RnQDh/mZIA626hrdjvUoBiOBW0n9q1a9/OKY90pyJgFyRtNsFmuRi12
   A==;
X-CSE-ConnectionGUID: 4fNECDlPTsOY9lCvV/m0AQ==
X-CSE-MsgGUID: F5jPsA7CRu2kLoGtE0KAyA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="68522604"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="68522604"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 09:32:46 -0800
X-CSE-ConnectionGUID: cmPI29FYT3yFlVjLv98KUQ==
X-CSE-MsgGUID: cgkz92DXRRCWb3hgnntwEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="208662251"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 12 Jan 2026 09:32:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfLmR-00000000Dg2-2mFw;
	Mon, 12 Jan 2026 17:32:39 +0000
Date: Tue, 13 Jan 2026 01:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: Chintan Patel <chintanlike@gmail.com>, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-omap@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
	andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org,
	Chintan Patel <chintanlike@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of
 info->dev
Message-ID: <202601130026.1M3d4LWk-lkp@intel.com>
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

kernel test robot noticed the following build warnings:

[auto build test WARNING on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Chintan-Patel/staging-fbtft-use-dev_of_fbinfo-instead-of-info-dev/20260112-091221
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260112010740.186248-1-chintanlike%40gmail.com
patch subject: [PATCH v5] staging: fbtft: use dev_of_fbinfo() instead of info->dev
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260113/202601130026.1M3d4LWk-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601130026.1M3d4LWk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601130026.1M3d4LWk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/staging/fbtft/fbtft-core.c: In function 'fbtft_fb_setcolreg':
   drivers/staging/fbtft/fbtft-core.c:367:30: error: implicit declaration of function 'dev_of_fbinfo'; did you mean 'dev_info'? [-Werror=implicit-function-declaration]
     367 |         struct device *dev = dev_of_fbinfo(info);
         |                              ^~~~~~~~~~~~~
         |                              dev_info
>> drivers/staging/fbtft/fbtft-core.c:367:30: warning: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   drivers/staging/fbtft/fbtft-core.c: In function 'fbtft_fb_blank':
   drivers/staging/fbtft/fbtft-core.c:393:30: warning: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     393 |         struct device *dev = dev_of_fbinfo(info);
         |                              ^~~~~~~~~~~~~
   drivers/staging/fbtft/fbtft-core.c: In function 'fbtft_register_framebuffer':
   drivers/staging/fbtft/fbtft-core.c:744:30: warning: initialization of 'struct device *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     744 |         struct device *dev = dev_of_fbinfo(fb_info);
         |                              ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +367 drivers/staging/fbtft/fbtft-core.c

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

