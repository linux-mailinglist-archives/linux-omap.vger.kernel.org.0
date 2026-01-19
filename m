Return-Path: <linux-omap+bounces-5558-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0FDD3A03B
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 08:44:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2C346304639A
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 07:40:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6216F3375D5;
	Mon, 19 Jan 2026 07:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OAb8EDlP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C0BF26FA5B;
	Mon, 19 Jan 2026 07:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768808409; cv=none; b=fauKfGLjN7LjKpmg/s8dR4wPLKfQaxS5RCRUmjXHI4b6TT3i+htoh0aEpqgeZaiS+gg3rsVEYwoHC7TCEVovk2fMf7p7MepzB8ZPh+JsdwK+XM0shoxQNQ46r6A3rXI6zi/NLyjt6LF6+2AuVrS3I9L4dLyfC1DLBxnayCyfNP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768808409; c=relaxed/simple;
	bh=FEF46I4aDVNF7PSwzPPe2285i3zXrTuHK+VlQ38y0yQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CBXWFim9u5MUMebEjjVyrn2sPygsQsfAHrPXf8s76pyx0/mKMrhO2d1DzP2g+If0OMcE3hpY/Bzpu7/RAxOJ8NYKFi8EyOe5cT5pU6fbfNCVQGRxyU2U7/AAf3pu3cGvPuXFQJVIVosWECMyUOx2iWQLOn221iS/vlGk3oQi2oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OAb8EDlP; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768808407; x=1800344407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FEF46I4aDVNF7PSwzPPe2285i3zXrTuHK+VlQ38y0yQ=;
  b=OAb8EDlPMcugNhaEJhpwbde9sM42MM9rJ+McH7imVZp/gaFtny8XEiSU
   n8CTb68/UGiq3hIXTXr4RDHy3EfK+3gXU/5QK/aVOZ8wKFjPLy8cVozwF
   QI9uSed9GjWy41CVRRnMYBsh/g5EeeWies00DS8baQe+UNXDa3bj1eiyK
   G7MffVLqeOK9sqXOGgzNJ8kHdbB8GTj8pfdmzV9HjWgWoD5/P5rXdcdgs
   z01SaDIYjJgg6eXMb66eV53uh3J+8fIZKq+iRYeDPRkptY4N27oaMdLCK
   aSO8S/uJsCLME+bgrIe59TQlJ+2j2y+OqQ8WV+kI+zwX3FXuLzdKVQqvn
   A==;
X-CSE-ConnectionGUID: js49Lh3NSEqallY3w9Ctvw==
X-CSE-MsgGUID: 9iNpcPuZQV+KT9s6tkFPtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="87592124"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="87592124"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 23:40:07 -0800
X-CSE-ConnectionGUID: ckz6wRWATlmv6uEVbo9SXQ==
X-CSE-MsgGUID: CbpLF8SjS8WWBpOdV93D2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="243365109"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.37])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 23:40:04 -0800
Date: Mon, 19 Jan 2026 09:40:00 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
	andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v7 1/2] staging: fbtft: Fix build failure when
 CONFIG_FB_DEVICE=n
Message-ID: <aW3f0L_B_UIbaNj_@smile.fi.intel.com>
References: <20260117042931.6088-1-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117042931.6088-1-chintanlike@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jan 16, 2026 at 08:29:30PM -0800, Chintan Patel wrote:
> When CONFIG_FB_DEVICE is disabled, struct fb_info does
> not provide a valid dev pointer. Direct dereferences of
> fb_info->dev therefore result in build failures.
> 
> Fix this by avoiding direct accesses to fb_info->dev and
> switching the affected debug logging to framebuffer helpers
> that do not rely on a device pointer.
> 
> This fixes the following build failure reported by the
> kernel test robot.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



