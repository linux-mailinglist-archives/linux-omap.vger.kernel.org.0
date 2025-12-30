Return-Path: <linux-omap+bounces-5295-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F12BCE98C8
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 12:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 067313016EDA
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 11:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E36192E22AA;
	Tue, 30 Dec 2025 11:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0feg1sb"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36322246781;
	Tue, 30 Dec 2025 11:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767094536; cv=none; b=M0lAVR2N7AXUZZ/hiZAEb2x5yieaUvXuDu9LpfWcb6iNfVrls+nmixgtV9wTcbTXNV1N3lFe4KPu0KTvldh+mEFuZPNlqWssLnLs8i0WohPoLtmZhBTIPMceZHa2/lMjT+I3Z6Vzw57Uh4Pbj9IKou28qDetILQXgVj1mwzieAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767094536; c=relaxed/simple;
	bh=ro1fQtcdyXioOXg7UpKgX7RPE/4YeZZwie7VLIsDjB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tD9SkBVYdxTmjZ8O9FiqDWDZ2Kl8APyZ43SoEB29ygAbwjD9RlLoU7Bc/KdjW3Bc4L/+3gDb8aH/zK7OAF9Huruh1uMc9+sFcLPZR5c4lVUIOFgyqeGL7pgj334UuVMTqOVayXwxPjywHu9f96fIOshcM6arWOk2ppaDLtDqzJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0feg1sb; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767094535; x=1798630535;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ro1fQtcdyXioOXg7UpKgX7RPE/4YeZZwie7VLIsDjB0=;
  b=i0feg1sb81qikSTxMxVg370p0bk2hvH3MM2vlGTfxIJwTPNZI3KneoW4
   f7wWMMArr9CtmNWNztRc5pYkpmMmd/Cr4KCoe6GUOhFttGaA4OmmBH7g3
   2H12CyE3iqLrMFsoBjt4eMgHqGpRkxoDL42yk87prZmOWVMJMIeAYHJsY
   TEdAMlpHo1FrVAqaZ9Cm9PJguhWTZSbFeZcA97ISeaVTD77MZpG0T0Imp
   wfF32dt7n9OzfTMi9NJ6WGJXpz3s0eA9k6mhn7uh7CTbcHezmQWc6eENN
   26B3u7T0fWYvTq4aRP4vBcvqOPvGBrxNrlr7V6eVGStkX0tZLu25/QR+w
   A==;
X-CSE-ConnectionGUID: el+OEpc4TaeEsvBkH2Sh6A==
X-CSE-MsgGUID: udyfwGDFQGq75v2oeApW0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="91337873"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="91337873"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 03:35:35 -0800
X-CSE-ConnectionGUID: 99wXwo5rQ0mtNgfeKD6cPQ==
X-CSE-MsgGUID: jrRmfS8wT+G8GUxTs6KmoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="205677033"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.103])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 03:35:32 -0800
Date: Tue, 30 Dec 2025 13:35:30 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
	andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
Subject: Re: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
Message-ID: <aVO5ArzxFhS_nEWy@smile.fi.intel.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
 <20251230052827.4676-5-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230052827.4676-5-chintanlike@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 29, 2025 at 09:28:22PM -0800, Chintan Patel wrote:
> The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
> core driver does not require CONFIG_FB_DEVICE.
> 
> Make sysfs support optional by defining overlay_sysfs_groups conditionally
> using PTR_IF(). The driver always sets .dev_groups, and the kernel
> naturally skips NULL attribute groups while the code remains buildable
> and type-checked.

...

> +static const struct attribute_group *overlay_sysfs_groups[] = {
> +	PTR_IF(IS_ENABLED(CONFIG_FB_DEVICE), &overlay_sysfs_group),
> +	NULL,

Please, drop comma at the end of the terminator entry.

> +};

-- 
With Best Regards,
Andy Shevchenko



