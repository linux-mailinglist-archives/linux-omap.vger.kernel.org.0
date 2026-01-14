Return-Path: <linux-omap+bounces-5466-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AC8D1CC91
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 08:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 107BA30563C9
	for <lists+linux-omap@lfdr.de>; Wed, 14 Jan 2026 07:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9648378D8A;
	Wed, 14 Jan 2026 07:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxdO8vco"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3377336BCF8;
	Wed, 14 Jan 2026 07:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768374945; cv=none; b=WggrcW5BMbWbo/pLbkJ5jY9fwBBMLOuFZWsSuJdGAzHx3AqxGtaHzNZWg0IgmsVPnSNi8hpUI3h/yhXurt/RxlaKa/0VpO9BVnPb53iRwFVsVMel4dfaP2ullcEh9+F4YmEAMNx8PRAxmbQq94JBfeUcmYn7LCenwS8YhRq1Qq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768374945; c=relaxed/simple;
	bh=VA9a9AXvtKiBXo9K3S8LA7RsTwJ5v/VjkAbf2RrgN2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PqyXslRlD2t6Ee57rEMoGwJ64oO4NiyKmgeW7GD1vDi/eEveQSk56EY+DBX5dSleeYjWXVJ3qTXu4slKl+DVM53HQ7nVreWVmZ03oeNG5YxVfdy0sgOsVagPdCBMwuZRePVXoVrIXIr3/54vE7lSCksyxozQlkraxsJrLbxAD3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxdO8vco; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768374940; x=1799910940;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=VA9a9AXvtKiBXo9K3S8LA7RsTwJ5v/VjkAbf2RrgN2w=;
  b=cxdO8vcoD87PGZR95EERve6eBLwcY2X9KS0coNy2m1SPy5szMc4t4D1z
   id+IpLOpiDjjUNJLrNie76ufNwr4JvZqRMTROsXevjrMc58lC4z0eUPrb
   T7KePjqY9VXBI12+xW0ypC0MEFFnSMGmjurWciMuZiNrpNTNqrCssUYDl
   1bSh+57u6YVevfuUpSxBoBM1OZqEgJuwEat+fd6+9TbX3MKIz+MgJr3xe
   PFQ/3AGuvFY4tcKIbUaWEHqAe7uCPcQtcEfmYN6S0E1rH867kzpQhOCTD
   PFFvMw44IijeXU2oIhukTDH5qlQufA2c8p+BMkoDeb/bxIuYYidYWsxqZ
   g==;
X-CSE-ConnectionGUID: XCDOnRthS72KTZv7j1t9Og==
X-CSE-MsgGUID: nCreN38LRCOa58gS2nNE+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69588483"
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="69588483"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:15:33 -0800
X-CSE-ConnectionGUID: BRCY7p9xTYmfuVsllxvXpQ==
X-CSE-MsgGUID: 6GpVhYH1TXubYBdtY+OV9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,225,1763452800"; 
   d="scan'208";a="209448783"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.83])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 23:15:30 -0800
Date: Wed, 14 Jan 2026 09:15:27 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v6] staging: fbtft: Use fbdev logging helpers when
 FB_DEVICE is disabled
Message-ID: <aWdCj9FPfOaLNf8L@smile.fi.intel.com>
References: <20260113045909.336931-1-chintanlike@gmail.com>
 <2026011341-chomp-protegee-6be5@gregkh>
 <0a90bd0a-cb74-43a3-a50b-4c83bc086556@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0a90bd0a-cb74-43a3-a50b-4c83bc086556@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jan 13, 2026 at 08:47:54PM -0800, Chintan Patel wrote:
> On 1/12/26 22:16, Greg KH wrote:
> > On Mon, Jan 12, 2026 at 08:59:09PM -0800, Chintan Patel wrote:
> > > Replace direct accesses to info->dev with fb_dbg() and fb_info()
> > > helpers to avoid build failures when CONFIG_FB_DEVICE=n.
> > 
> > Why is there a fb_* specific logging helper?  dev_info() and dev_dbg()
> > should be used instead.
> 
> You’re correct that dev_dbg()/dev_info() are the standard logging APIs.
> 
> The reason I switched to fb_dbg()/fb_info() is not stylistic: direct
> dereferences of info->dev / fb_info->dev are invalid when
> CONFIG_FB_DEVICE=n, which causes compile-time errors.
> 
> fb_dbg() and fb_info() are framebuffer-specific helpers that handle
> this case correctly, allowing logging without touching info->dev.
> 
> > > Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
> > 
> > Is this really a bug?
> 
> The build failure occurs when CONFIG_FB_DEVICE=n, where direct
> dereferences of info->dev / fb_info->dev are not valid. This was reported by
> the kernel test robot.
> 
> That said, I’m fine dropping the Fixes tag if you don’t consider this a
> regression.

I believe the point Greg made is that: If it's a bug, state it more clearly in
the commit message. The summary of the above sounds to me like a good enough
justification to leave Fixes tag as is.

...

> Same reason: dereferencing info->dev is invalid when CONFIG_FB_DEVICE=n.
> fb_dbg() handles this correctly without needing info->dev.

Similar comment here, make it more clearly, e.g. by adding more details in the
commit message, like explaining that there is no such a field to access when it
goes under some circumstances.

...

> > > +	fb_info(fb_info,
> > > +		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
> > > +		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
> > > +		fb_info->fix.smem_len >> 10, text1,
> > > +		HZ / fb_info->fbdefio->delay, text2);
> > 
> > When drivers work properly, they are quiet.  Why is this needed at all
> > except as a debug message?
> 
> Agreed. The informational message during framebuffer registration is not
> necessary. I will either remove it entirely or convert it to a debug-only
> message.
> 
> I’ll rework the patch accordingly and resend.

If you go this direction, I would do it in two stages (first is a direct
fix for a compilation issue and second one is switching to dbg level, each
with the respective commit message), but I leave it up to you and Greg.

-- 
With Best Regards,
Andy Shevchenko



