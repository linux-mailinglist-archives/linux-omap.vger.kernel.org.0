Return-Path: <linux-omap+bounces-5296-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA365CE98E3
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 12:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4AC863019570
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 11:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53D382E8B80;
	Tue, 30 Dec 2025 11:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AV/gYb1e"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE182D94AB;
	Tue, 30 Dec 2025 11:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767094630; cv=none; b=Os6NXGnpoQejcSsya9Y6dzXzKwotHvypHLV+zb0L0ALuVtUVZYsO3mOFLJIN1JhZvfn8FUxGqGMt2b9X2n5SeyIOs1B4N8GN2o8DoFQvE03uIgnbjvinzAf52wLRCJNEV48gnkR5KcC+DwUJe7d4xeeoLdZLp+cy7LGPBAX2Qd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767094630; c=relaxed/simple;
	bh=1cd3v+rlDtb3b738kGiokap/SmqxKi+AyboVksECoTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlybbphJ5LRer2b948Qo/VWbD3S4L5ewNpBOC70E8ABqc2kvEDGEvSgDfCyq/6EhOzxxFLzBif2Crrb2DV9EPDcSeH+/oDMEjgmlJpbjU/rd7jGdbC3nZxFF16YOXBVBTCki0HwjSbugTu5urWy62TQn5gD7VvAOrEdcJtXEYJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AV/gYb1e; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767094629; x=1798630629;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1cd3v+rlDtb3b738kGiokap/SmqxKi+AyboVksECoTM=;
  b=AV/gYb1eYraGoCLYJVSKDfiDvbqnLFDydBxecNcIcZ34xubXrxVeb7rk
   9cn8V1ikVQ+2b5AacD6SngVwa2pm7tjSzhaoIeywM5oPFo4WdVYMQJZNv
   gytFmP9ArAn4QjSjI5JXjOPR7BnNtILNaj2rlro+eiK2PcI9yK05s+LgQ
   osnQoD2VK5uhCsFMTumQXlZkUajoBjQteYWfFBgP3R1XzBSolOg4lLOz2
   NX9wzgREl8wtbrefmiY9dttn6Qbdj7CYNxkWeouYbgJIa/b3CK4XhFJui
   d9nztYXkh159OcOPLTRPY/OkxJjulDROV0wPBwv+V74WQYiklNAt6au07
   w==;
X-CSE-ConnectionGUID: unpUkb5XSdmlYaoC0SBksg==
X-CSE-MsgGUID: 25oYp1DUQXag1xPheOjWYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="91337993"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="91337993"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 03:37:09 -0800
X-CSE-ConnectionGUID: /buD84sWQG6BnGPL+NoV2g==
X-CSE-MsgGUID: CcTFjQpzQ/qUEbbNX46BYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="201457503"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.103])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 03:37:06 -0800
Date: Tue, 30 Dec 2025 13:37:03 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
	andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
Subject: Re: [PATCH v3 3/4] fbdev: omapfb: Make FB_DEVICE dependency optional
Message-ID: <aVO5X0NKSdkH6Ab5@smile.fi.intel.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-4-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230052827.4676-4-chintanlike@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 29, 2025 at 09:28:21PM -0800, Chintan Patel wrote:
> omapfb provides several sysfs interfaces for framebuffer configuration
> and debugging, but these are not required for the core driver.
> 
> Remove the hard dependency on CONFIG_FB_DEVICE and make sysfs support
> optional by using dev_of_fbinfo() to obtain the backing device at runtime.
> When FB_DEVICE is disabled, sysfs operations are skipped while the code
> still builds and is type-checked.

...

> +		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);

Still the same issue I pointed out in v2 review.

>  		int t;
> +
> +		if (!dev)
> +			continue;

...

> +		struct device *dev = dev_of_fbinfo(fbdev->fbs[i]);
> +
> +		if (!dev)
> +			continue;

Ditto.

-- 
With Best Regards,
Andy Shevchenko



