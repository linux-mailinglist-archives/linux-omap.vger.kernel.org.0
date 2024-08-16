Return-Path: <linux-omap+bounces-1918-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F28A9543B7
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2024 10:12:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5C111F22528
	for <lists+linux-omap@lfdr.de>; Fri, 16 Aug 2024 08:12:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1AF984A22;
	Fri, 16 Aug 2024 08:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsY50GMA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F07E1D69E;
	Fri, 16 Aug 2024 08:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723795921; cv=none; b=oVmYhGVErXQo3XG+1EmwAPG3Kx0SGUI/DPNtuof80ycIKUiXvgk7g7boG/FaSPuLjNqBlmgyCmtFLf51HdEnxeMQDQIqWjtYTUqW+He5Z9OjiJBUlgbHyOlVFT0Z8klYCxc5PKwcqnUsPq29bKp284eXVVaJwMUegb08paSVku8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723795921; c=relaxed/simple;
	bh=B6ijVtvq333790x5NOOPZFYqaLuciwlR5s0fwIqohdM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=spfXm3/0K7FncoqA5zN9gY6adTclHnVJ4PEFEr+ZA9U0nAK5YBc26X7AiLiIImS7jv4/wA4U8tVkIqB3OTOzCHnHRqADUdgsa5Q1fzNggXtn2JQOahU57DYdEj5vVpUq7uW8OjMX8/k54xgDC2Qp4BoN9Ivv73kNA3MPp6XDcRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsY50GMA; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723795919; x=1755331919;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=B6ijVtvq333790x5NOOPZFYqaLuciwlR5s0fwIqohdM=;
  b=TsY50GMAEC69Tyx6dgmKvFzAUJYX8H3JndquPCiIVUf/lFawEAKY5JER
   LZzn90r4F6B4VeYHNqzRMDRg7OYngTgxUiQ6Wpr8Rs9QfBG1lu5P9KzHv
   011iSAbCTMaeoDnw8/fG0fO3TuN0sOV/NGjYd9hAyRJUkeoBcSlQDssKY
   tqVYx64nuc6hqz9J8SimJYwVPGxnI4c4GPk3b+/EwLQlLObtZP1QzWr/K
   nwNstLGksGKqn7wH28GCw/zpxanGbrFjyTSOues9NE1jd2RLaUg7Nx7mG
   dZQkb5eOJpzjaqq2RGvl99EYfeZzCczUdZ1Q6wMLAprC+ceY6AJvktGql
   g==;
X-CSE-ConnectionGUID: n+FzWTHZRiufjBQC5pm7jA==
X-CSE-MsgGUID: ozbInlxBTqK5keHxmdygTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="39598412"
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="39598412"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 01:11:58 -0700
X-CSE-ConnectionGUID: RJ7TxJhlSvCs824BjS/Dkg==
X-CSE-MsgGUID: c1Npsl40TTqgIy3fypTYew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,151,1719903600"; 
   d="scan'208";a="59620945"
Received: from cpetruta-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.246.214])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 01:11:56 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 0/9] fbdev: Use backlight power constants
In-Reply-To: <dfa6d633-1825-4bc3-bca2-326ed18e34b9@suse.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240731123502.1145082-1-tzimmermann@suse.de>
 <dfa6d633-1825-4bc3-bca2-326ed18e34b9@suse.de>
Date: Fri, 16 Aug 2024 11:11:50 +0300
Message-ID: <87ttfk7upl.fsf@intel.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, 16 Aug 2024, Thomas Zimmermann <tzimmermann@suse.de> wrote:
> Ping for review

On the series,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>



>
> Am 31.07.24 um 14:33 schrieb Thomas Zimmermann:
>> Commit a1cacb8a8e70 ("backlight: Add BACKLIGHT_POWER_ constants for
>> power states") introduced dedicated constants for backlight power states.
>> Convert fbdev drivers to the new constants.
>>
>> The new constants replace the fbdev constants. This is part of a larger
>> effort to make kernel subsystems more independent from fbdev code and
>> headers.
>>
>> Thomas Zimmermann (9):
>>    fbdev: atmel_lcdfb: Use backlight power constants
>>    fbdev: aty128fb: Use backlight power constants
>>    fbdev: atyfb: Use backlight power constants
>>    fbdev: chipsfb: Use backlight power constants
>>    fbdev: nvidiafb: Use backlight power constants
>>    fbdev: omapfb: Use backlight power constants
>>    fbdev: radeonfb: Use backlight power constants
>>    fbdev: rivafb: Use backlight power constants
>>    fbdev: sh_mobile_lcdc_fb: Use backlight power constants
>>
>>   drivers/video/fbdev/atmel_lcdfb.c                           | 4 ++--
>>   drivers/video/fbdev/aty/aty128fb.c                          | 6 +++---
>>   drivers/video/fbdev/aty/atyfb_base.c                        | 2 +-
>>   drivers/video/fbdev/aty/radeon_backlight.c                  | 2 +-
>>   drivers/video/fbdev/chipsfb.c                               | 2 +-
>>   drivers/video/fbdev/nvidia/nv_backlight.c                   | 2 +-
>>   drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c    | 4 ++--
>>   .../fbdev/omap2/omapfb/displays/panel-sony-acx565akm.c      | 2 +-
>>   drivers/video/fbdev/riva/fbdev.c                            | 2 +-
>>   drivers/video/fbdev/sh_mobile_lcdcfb.c                      | 6 +++---
>>   10 files changed, 16 insertions(+), 16 deletions(-)
>>

-- 
Jani Nikula, Intel

