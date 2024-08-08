Return-Path: <linux-omap+bounces-1873-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C213594BADC
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2024 12:25:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F19EC1C22069
	for <lists+linux-omap@lfdr.de>; Thu,  8 Aug 2024 10:25:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167C718A93E;
	Thu,  8 Aug 2024 10:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BnXv3khZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C423C189F56;
	Thu,  8 Aug 2024 10:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723112725; cv=none; b=eo559+QwOHGN6BReJwykoq0HONiZrQSSJDT6mYJ976/UU5vLO16T7ELWeYiiWKHMGH32GcTQJK8l4feG4F3bBzKOrS8sMTrqjcQl/omDIWhbqsnuGdkT/lkrhkcZi3GxuklMSYhp8L26jru7l/D/66Kh1UCKoyOYkZIQuQ9FjLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723112725; c=relaxed/simple;
	bh=fZP8HxgFzg8Q/VBokT/unDJoCN9dymrjvbxzxf0FNFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HA8PPVAsuYN87QCR2QWpKB08CVx0ptN/VJizBFs3YVZ+o8tLx8aksY0sHwO2zMu9PMpjdfLwbVX+JQoodGAoPD8QSpGUCXhBYtoVqX06I5LpLfrZurN3lBu/xrDmyOCe6rFIv5ECi2oAZ6lRx1fR7uMVJG+QFs7qm4glrhg4yrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BnXv3khZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723112724; x=1754648724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fZP8HxgFzg8Q/VBokT/unDJoCN9dymrjvbxzxf0FNFY=;
  b=BnXv3khZNeNfHNOiYhhhhBaO1g9TuXtaJjOAkyQT0b7uxvy01oqCh13Y
   ru6n5ngeteZplVzAz7TooDeQBjteIceOGSpHFedy/Ox8wWHVdx387ZFI8
   xU501ygVaKlgn1B8Y3WcRiRtpajrFT9xHVzmP0P8ArsxJhy2Bo6dlpiOB
   OU2HYfXedFIkYYzKnZvm8R3DJ+RHyaWrGf7hSsdCbDCpBrQA2mbta8Wh9
   tfWrlR9A0hRH2L8sOIW3e4bQeA4tOJPitL+H9qFyOo6C3jbHDpKXdNhBF
   SBndLpha8uKCbtUvCKAp9r3BWo/GJ30yx6jkF9sgSWFZncYUnuqQZGCsR
   Q==;
X-CSE-ConnectionGUID: XeQABdknTEOk4j0Q/TmBmQ==
X-CSE-MsgGUID: ewA+kMXNQwq3Xgbz3IMG4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="43749108"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="43749108"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 03:25:23 -0700
X-CSE-ConnectionGUID: e7YznkWoQMuCjEYa1nZS7Q==
X-CSE-MsgGUID: 1nbyhsx0QneJSAGsF9GiDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="57731589"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO intel.com) ([10.245.245.71])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 03:25:19 -0700
Date: Thu, 8 Aug 2024 11:25:14 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: omapfb: panel-sony-acx565akm: Simplify
 show_cabc_available_modes()
Message-ID: <ZrSdCtS2okz9ivBW@ashyti-mobl2.lan>
References: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91fc9049558a4865d441930c8f4732461f478eca.1723110340.git.christophe.jaillet@wanadoo.fr>

Hi Christophe,

On Thu, Aug 08, 2024 at 11:46:11AM +0200, Christophe JAILLET wrote:
> Use sysfs_emit_at() instead of snprintf() + custom logic.
> Using sysfs_emit_at() is much more simple.
> 
> Also, sysfs_emit() is already used in this function, so using
> sysfs_emit_at() is more consistent.
> 
> Also simplify the logic:
>   - always add a space after an entry
>   - change the last space into a '\n'
> 
> Finally it is easy to see that, given the size of cabc_modes, PAGE_SIZE
> can not be reached.
> So better keep everything simple (and correct).
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

neat!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi

