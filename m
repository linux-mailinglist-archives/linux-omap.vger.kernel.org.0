Return-Path: <linux-omap+bounces-5294-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D9828CE98B3
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 12:34:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0403230222C6
	for <lists+linux-omap@lfdr.de>; Tue, 30 Dec 2025 11:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552F12DAFA5;
	Tue, 30 Dec 2025 11:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xrr47NvY"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415F32DA74C;
	Tue, 30 Dec 2025 11:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767094446; cv=none; b=sKZfDU2kBPsdsicUxAc4srShPa6U4Ic7I4V/5MzZwHdC8iRp4UKmbDO+FwHw66N01w7cp/qQebO5C7mLQycsPV711IUeP01O8WKBhwlxmH5Dk9Ee8PdbU/XnrIhzPf0EdytrbxLJxWIjDhcfnLsQAZKrYhme43f2XO5b4Z4Ruio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767094446; c=relaxed/simple;
	bh=Cbe+8bPo4xtiKIpnJiQxtHfRAryAeLaAaMe/2CqZYlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lJxlF4tLjLW6O1EvDmnrbMJrNQgnVgJbmaHy8Nrn00+0XEXY2f0Uv54ErwLr28lJND4q7LPo1ofE0mc/x72k2rxlc2lKvvyMlSXExuTGRH2u4lrRaw3L5K7emski2S2j/UtYzVNHWk9GaQqAA+W08/sK0c1bGiCNlPcw9eCZt1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xrr47NvY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767094444; x=1798630444;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Cbe+8bPo4xtiKIpnJiQxtHfRAryAeLaAaMe/2CqZYlc=;
  b=Xrr47NvYUl9wCBUFTszzY6PyD+J4L99ypiXRuGdZItoT9BFSkukQFek2
   okHfzHibJ1njuuune3cNHcvbP0PNVjb3hOy3RyoL5A3bt8X/bAFMAmrKy
   uEigd9zAZGo8elG8rrev111oU05SLUBGKxBzsC78+h4cMubfnN5i8+vPm
   8ZU2iLnrEkOi7zcw7GcmwDKjCBHdN0FQVP9yAf2IM1tKsxPtchrqB8HUN
   37lxLUJzNao698W2ie1e/B0/OLS3Ixz3fkPZiKKayk+HIBZq/e0vEuTXU
   Iv+vEk4PwQMtLzNn1vE0MWo8nojBKN3HtXs0VLMoojcJ/jZLm9g1Ti0R5
   w==;
X-CSE-ConnectionGUID: ucVrHYJrQGuc2lq+2kfa5g==
X-CSE-MsgGUID: EfqUsjGZR0abKip+3kZF6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11656"; a="80134433"
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="80134433"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 03:34:03 -0800
X-CSE-ConnectionGUID: ygyrfsbRQA+ybPTCbdlPSg==
X-CSE-MsgGUID: GL0VmTBwQJexoBqoyHeidA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,188,1763452800"; 
   d="scan'208";a="205676780"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.245.103])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 03:34:00 -0800
Date: Tue, 30 Dec 2025 13:33:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
	andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
Subject: Re: [PATCH v3 0/4] fbdev: Make CONFIG_FB_DEVICE optional for drivers
Message-ID: <aVO4pslXIvnc00J3@smile.fi.intel.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251230052827.4676-1-chintanlike@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Dec 29, 2025 at 09:28:18PM -0800, Chintan Patel wrote:
> This series makes CONFIG_FB_DEVICE optional for fbdev drivers that use
> it only for sysfs interfaces, addressing Thomas Zimmermann’s TODO to
> remove hard FB_DEVICE dependencies.
> 
> The series introduces a small helper, dev_of_fbinfo(), which returns
> NULL when CONFIG_FB_DEVICE=n. This allows sysfs code paths to be skipped
> via runtime checks, avoids #ifdef CONFIG_FB_DEVICE clutter, and keeps
> full compile-time syntax checking.

> Signed-off-by: Chintan Patel <chintanlike@gmail.com>
> ---
> Changes in v3:
> - Use PTR_IF() to conditionally include overlay_sysfs_group in 
>   overlay_sysfs_groups
> - Decouple variable definition and assignment in fbtft_sysfs_init/exit

Any particular reasons you ignored my tag from v2?

-- 
With Best Regards,
Andy Shevchenko



