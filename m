Return-Path: <linux-omap+bounces-1496-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F8DD8FF567
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 21:43:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0692B234AF
	for <lists+linux-omap@lfdr.de>; Thu,  6 Jun 2024 19:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6729761FE3;
	Thu,  6 Jun 2024 19:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lLlq5pID"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67678821;
	Thu,  6 Jun 2024 19:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717702994; cv=none; b=egX6VQg+vYo/z/ShjaR74rV/d+uo51JkypPTL4gjJMZ0c3J6Q1AvOt3a4QZ56d6aKyabqzUJ3xjI3jFmp0e5n6i7CbC4ecA30rhi4vqVyrjHQbxCDZ41zsFUTUi0W4KQqCVx7KETReH4FkkruwC3MxfUSTUHQPYvUdkIcifyVLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717702994; c=relaxed/simple;
	bh=iJ3PfJIIVmISWOs3yDhd5uulGCXgxOcN7cbPaPCX9fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B18rynBsyqYyjZ4JIb9T68X7UspsTSWGP3ReV7tA/e78Xpwd1OzKV1n45qbFnlBruG8H3P7w2BKBmjLmYuT1T6S7+LPWci3pfyLVTUdBQiGQ7z5KpKgc096I5aDdXWOF/XYfqMopNOihvRCJt+17W0PHJFKVEL+hvkkVqCORHFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lLlq5pID; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717702993; x=1749238993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=iJ3PfJIIVmISWOs3yDhd5uulGCXgxOcN7cbPaPCX9fg=;
  b=lLlq5pIDLjuc++Mxa+wn/aLjn4eEFuUb79LiGpPEG0QpSQrKF2EeSGSL
   xTp/EkASxpGtTe148fXVEAeS+fSvDUGQiSbohWGGc2Y/slUXLG6XefJQR
   kSI9TUVVJ0YLj3phbj/s8bG94qBDVenjpIcCHXVKWezylseq+4vOqA9fc
   wMFa1zCgCS9fdaAv926RsaC0ilfXMMCIWq+L4QIxmAuI7clUccBSHMZMw
   q31171+35C9mG77VG0PVedseL85RxZWgUfjzTJZe5KpZMq9AlBNdGB1JN
   iuuOU86xpextcEtDyX+nyJZegWvFKQBSdfBWIu39qUJz6fbi1XnmqNpLl
   w==;
X-CSE-ConnectionGUID: LNxkU18MRqGbYT+KC5NP6w==
X-CSE-MsgGUID: 9vaT3FQDQvaLST+GxubIng==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="18190218"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="18190218"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 12:43:13 -0700
X-CSE-ConnectionGUID: UCStVhN/SO2DSJLGK0L4cA==
X-CSE-MsgGUID: KIifYad2QW+Pi4FxVy2Pyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="68868902"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 12:43:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1sFJ0u-0000000EIca-0z55;
	Thu, 06 Jun 2024 22:43:08 +0300
Date: Thu, 6 Jun 2024 22:43:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Subject: Re: [PATCH v1 1/1] ARM: omap2: Switch to use kmemdup_array()
Message-ID: <ZmIRS8HTar7iKQo7@smile.fi.intel.com>
References: <20240606165104.3031737-1-andriy.shevchenko@linux.intel.com>
 <20240606193202.GD9487@darkstar.musicnaut.iki.fi>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606193202.GD9487@darkstar.musicnaut.iki.fi>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Thu, Jun 06, 2024 at 10:32:02PM +0300, Aaro Koskinen wrote:
> On Thu, Jun 06, 2024 at 07:51:04PM +0300, Andy Shevchenko wrote:
> > Let the kememdup_array() take care about multiplication and possible
> 
>           ^^^^^
>           Typo.

Aha, thanks!

> > overflows.

...

> > -	hwmods = kmemdup(ohs, sizeof(struct omap_hwmod *) * oh_cnt, GFP_KERNEL);
> > +	hwmods = kmemdup_array(ohs, oh_cnt, sizeof(*hwmods), GFP_KERNEL);
> 
> Maybe same result, but I guess the 3rd parameter should be count?

Actually it is going to be changed to follow kcalloc().
https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?id=0ee14725471c

-- 
With Best Regards,
Andy Shevchenko



