Return-Path: <linux-omap+bounces-5559-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E78D3A04A
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 08:45:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F0C5530B9BA5
	for <lists+linux-omap@lfdr.de>; Mon, 19 Jan 2026 07:41:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0D393376A1;
	Mon, 19 Jan 2026 07:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EDtythUk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DC2933067F;
	Mon, 19 Jan 2026 07:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768808464; cv=none; b=GCGHkdo+e8hA4BqmwP+K8eO6aY2JCY43hQhQvny5tFu+qKL82+MfXemX0sgigkreUkUI78QQsDpZW6bLmYcn6VwhbFg9recFBu+7/aURWgPvL19RKGwTYHeaXO+SXCVI+k+yqedLDczo5VAYD7GI4/AmcikUZ9kFZSgvNsAoZQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768808464; c=relaxed/simple;
	bh=bFWKE0b6TgWpxQaPcHV9jdPULRgjopCFZs9cpiPFIK4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V/TuxCgqBeDikLBx/Iz130WhdzudPa2HSTocXTDbswidBWTgdHvtAI18eZYuamkjzso2tPJhDC4rvzlp4rO+8/tvjKZXCAUJr1pH41BuwZSpGuqPQ63GkK4neW11jwzZvi3LZlutX/Cc3nX6e4Re5rfvIxPWEV80EuKj7dmjoDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EDtythUk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768808463; x=1800344463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bFWKE0b6TgWpxQaPcHV9jdPULRgjopCFZs9cpiPFIK4=;
  b=EDtythUkWQFAOpL2FT5uzd8JMxpL4EVEFZ6902GB3H/1zi3eyP/4Pq9w
   amefhEAb6rngj48H55VSkBXz0YOpZCpztSFQcn0IZzSohqjt/4Mcr8Fr5
   EGCY/Qq33JFniKp/SsMi6h1VeeVyepZv/Cj5O3ksOZ6tcXXsO6/XjinWG
   QoieXfPW/oYosxGkvcl1DRI1s5AuebkoEC3Vz5SqREiDRVbuNtdZ4fFbq
   y1r63d55N32FEIcBXaH/wxIaNTy6dTR1VkvyWEmHeVp4WGa5YfNEr5faM
   p8fI6S6k+04oD4QTHHqt04mPanAtnHp1pkFeOSVZwpwL0ZP9LaLXIwGNw
   g==;
X-CSE-ConnectionGUID: 9+1R7ZlfS+m1q7Qo+GvC5Q==
X-CSE-MsgGUID: IchuiEZ2RceEiZi2zOUGFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="70102067"
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="70102067"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 23:41:02 -0800
X-CSE-ConnectionGUID: H6vVu2ItTcWjpYo924LUfg==
X-CSE-MsgGUID: 1y62ggCuQImIvwNJV84elg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,237,1763452800"; 
   d="scan'208";a="237078527"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost) ([10.245.244.37])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 23:41:00 -0800
Date: Mon, 19 Jan 2026 09:40:58 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Chintan Patel <chintanlike@gmail.com>
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
	andy@kernel.org, deller@gmx.de, gregkh@linuxfoundation.org
Subject: Re: [PATCH v7 2/2] staging: fbtft: Make framebuffer registration
 message debug-only
Message-ID: <aW3gCgB1YAsjuOZ7@smile.fi.intel.com>
References: <20260117042931.6088-1-chintanlike@gmail.com>
 <20260117042931.6088-2-chintanlike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117042931.6088-2-chintanlike@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Jan 16, 2026 at 08:29:31PM -0800, Chintan Patel wrote:
> The framebuffer registration message is informational only and not
> useful during normal operation. Convert it to debug-level logging to
> keep the driver quiet when working correctly.

Suggested-by: Greg ...?

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko



