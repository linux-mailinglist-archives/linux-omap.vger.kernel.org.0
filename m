Return-Path: <linux-omap+bounces-5308-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7E1CF000C
	for <lists+linux-omap@lfdr.de>; Sat, 03 Jan 2026 14:17:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A98BD3031373
	for <lists+linux-omap@lfdr.de>; Sat,  3 Jan 2026 13:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD7321CA02;
	Sat,  3 Jan 2026 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqxIX5o/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E54914884C;
	Sat,  3 Jan 2026 13:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767446160; cv=none; b=gvz3zF5NnVz5aJuSc1ZhkPeqVX2bn6GpILGYvZvZwp2vl7GpARcmp6zHLJ1B3B8hCPBf7Hbr2qfj8591/E6bb6u9982x0o3MJiWJwt21bzuhvHUR7WDFZ0d/4zaX7yPF8565f0lBLhCQNdW5Gt3YGPHc09mg+3BAEaZICcE1EYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767446160; c=relaxed/simple;
	bh=T1meHIE3kNQ1z03ZzqxoD5qsWYeE0kujZCxSwuYVgbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skSMjIvzmk2CMlcmUaw7QWd6Wt9YCr+iziEfWyG/Nyq8ZUQy+bC6tDRCx/ihmHuVKKZkPbtHnZAlo49juyWvHf0Qz/9Yxb6jd9aeY741Ayaq0EAAg6KsOlwJUCkZs4zjz9HJMZ/e4m3i2XH7ldbalWnhgTk2fpKSZA7RBD2oIZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqxIX5o/; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767446159; x=1798982159;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=T1meHIE3kNQ1z03ZzqxoD5qsWYeE0kujZCxSwuYVgbA=;
  b=VqxIX5o/C3YyuMRgF2hGYQx+0kEd1dQFyX+KiZMDTFH97AUqo3N/Hztx
   sSjQ74WR9NZ5OVvVc/WNoIrJvZhEYWV5oHzYXOrUqGOg/yUB9h7Sux+0O
   vNm1HOvEIqwhJ+OejzOhOAJw+dVaFhi+dg5Zf3EtHdt7oZPckDX/QGcjd
   xQH+xlJ+PkYCmTJtPsoQeNs5twwlcJ21no4EwS1iDPxmn+jPXDswKA7jI
   OE9Y4MRRWLqXrx5ebRJxOlLH444f0Fk1z4otXF0UDbrHdRxxgwLJRw2c7
   ret7jwXDcrTvpRtL0rOvlYC0I3vmLod5VZEzi3kNnnblixyoPf4l8P58l
   g==;
X-CSE-ConnectionGUID: cnA5If30RiKuk3raO6eLwA==
X-CSE-MsgGUID: UWr86gPvRTCH8MeHCSJ8Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="79618391"
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="79618391"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 05:15:58 -0800
X-CSE-ConnectionGUID: SXduwwDzS2ymGuu/a19Lsw==
X-CSE-MsgGUID: tTYV2PBmQGGnZKJ37j/26A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,198,1763452800"; 
   d="scan'208";a="201636735"
Received: from dhhellew-desk2.ger.corp.intel.com (HELO localhost) ([10.245.244.75])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2026 05:15:56 -0800
Date: Sat, 3 Jan 2026 15:15:54 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: Chintan Patel <chintanlike@gmail.com>, Helge Deller <deller@kernel.org>,
	andy <andy@kernel.org>, linux-fbdev@vger.kernel.org,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
Message-ID: <aVkWigAQWC1dZBAv@smile.fi.intel.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-5-chintanlike@gmail.com>
 <aVOJovo-k6-0KnVg@carbonx1>
 <aa2b08f8-e6c3-4768-bce9-e36ad9d1e74b@gmail.com>
 <73007a0a-dd96-43eb-be2e-ccbf8b19cd79@gmx.de>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73007a0a-dd96-43eb-be2e-ccbf8b19cd79@gmx.de>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Jan 03, 2026 at 10:59:44AM +0100, Helge Deller wrote:
> On 12/30/25 19:25, Chintan Patel wrote:
> > On 12/30/25 00:13, Helge Deller wrote:

...

> > > > -ATTRIBUTE_GROUPS(overlay_sysfs);
> > > 
> > > Instead of replacing the ^ ATTRIBUTE_GROUPS() by the code below,
> > > isn't it possible to just mark the overlay_sysfs_attrs[] array
> > > _maybe_unused, and just do:
> > > + #ifdef CONFIG_FB_DEVICE
> > > + ATTRIBUTE_GROUPS(overlay_sysfs);
> > > + #endif
> > > 
> > > ?
> > 
> > Yes, the __maybe_unused + #ifdef ATTRIBUTE_GROUPS() approach would work.
> > 
> > I went with the PTR_IF(IS_ENABLED()) pattern because Andy suggested
> > using PTR_IF() to conditionally include overlay_sysfs_group in
> > overlay_sysfs_groups, and to keep .dev_groups always populated while
> > letting the device core skip NULL groups. This avoids conditional
> > wiring via #ifdef and keeps the code type-checked without
> > CONFIG_FB_DEVICE.
> > If you still prefer the simpler #ifdef ATTRIBUTE_GROUPS() approach
> > for this driver, I can switch to that, but I wanted to follow Andy’s
> > guidance here.
> 
> I assume Andy will agree to my suggested approach, as it's cleaner
> and avoids code bloat/duplication. Maybe you send out a v4 with my
> suggested approach, then it's easier to judge... ?

I'm also fine with original code. But a suggested approach would work as well
(at least like it sounds from the above description). Ideally would be nice to
get rid of ifdeffery completely (that's why we have PTR_IF() for), although
it might be not so readable. TL;DR: the most readable solution is the winner.

-- 
With Best Regards,
Andy Shevchenko



