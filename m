Return-Path: <linux-omap+bounces-3474-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 12105A69EF7
	for <lists+linux-omap@lfdr.de>; Thu, 20 Mar 2025 05:14:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82D3B4214BF
	for <lists+linux-omap@lfdr.de>; Thu, 20 Mar 2025 04:14:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFCAF1E98FB;
	Thu, 20 Mar 2025 04:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="JunsH0uC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3675438F80;
	Thu, 20 Mar 2025 04:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742444087; cv=none; b=tZrm8/+hAvJvZd1/bBF3Wos3on403jSDuAjkpykkbUPIly33LRqcDGXihwnWNgilrznd+UCM6YU/U/GFs1lLMP4syNzQlABmnvb2SMznr4usYGWG0OhVmh4j2pWqwnqUeK9NQkli84pQkKZPItHddjNKz+i/Mc1Ek9e5M5XQDk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742444087; c=relaxed/simple;
	bh=nTlf8ih9/59HL1qFJaqYGHPcVbeBbSNxmXwFKCafhCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/X2VOO+KSUWpCI7jqn2RivQJ2S+JWYQ1jIYR5YPXiPCsbeIq72ivYsyEB0zovmbyj4xwe4M43GVwLGRhWuI+4iE0554wq8fW+9HoOCQKl9uYf/TwWhzEeQaPoAigRda2MRKLd9dPLYnDaYfOk0UY/s3xMLm8xnoPNpWyqfYVyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=JunsH0uC; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 4BD9060514;
	Thu, 20 Mar 2025 04:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1742444085;
	bh=nTlf8ih9/59HL1qFJaqYGHPcVbeBbSNxmXwFKCafhCU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JunsH0uCVRUsYTUbwBOdXLE8uNgbtnelR0bFbruoSfvRnvvtAjCiAzdq+YUcFaCyD
	 iQjJGpKuMrNAEyaHjS5m2/JsmnJimPIA51LhVdoztIwicKULksVrd7yxNKXyPD3PHA
	 3Mo5xToNTKgu7Wbx5w093NrFotubYJW2Ak8COukGDLi/erj1z3iaIsixsU9gTNTzWN
	 3MV+OID+3U/pb36Gfy2uHj9YhNB6kXYN9QqlXR4WLLmcv5Un+tbnuP8g+eJgj9Fv+E
	 y2JP2fEsCvzc6d1JpBL/YxaFC+4GBrchdOdAPnypO7hXY4jb+1JruZBSB3NdespWZE
	 Fhe34an4ZV4eQ==
Date: Thu, 20 Mar 2025 06:14:18 +0200
From: Tony Lindgren <tony@atomide.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Robert Nelson <robertcnelson@gmail.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Romain Naour <romain.naour@smile.fr>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Jason Kridner <jkridner@beagleboard.org>,
	"Aldea, Andrei" <a-aldea@ti.com>, David <daowens01@gmail.com>,
	linux-omap@vger.kernel.org, linux-mmc@vger.kernel.org
Subject: Re: sdhci-omap: additional PM issue since 5.16
Message-ID: <20250320041418.GE4957@atomide.com>
References: <1c5f72c4-3d55-4d62-b690-8c68b76a15d2@gmail.com>
 <f6732c49-a5b1-4a13-b9f6-c2d552b5e7e8@smile.fr>
 <31717d89-432c-4b77-a974-99f7e6b97f97@gmail.com>
 <9168d127-06a7-46e6-a7a2-f2e60032a50e@gmail.com>
 <b1a369e2-938b-49ed-b743-6562f0bb46f9@smile.fr>
 <CAOCHtYiBFNY9nFjtqsFFpqRKdxUif_fC7MVqZ7cffeD8rLSe2A@mail.gmail.com>
 <CAOCHtYiujoMoPHfSmyTrv_48wUn3TfaoiPEcMFB=V++MZXvuuQ@mail.gmail.com>
 <20250226170614.18a497f0@akair>
 <20250307042822.GE23206@atomide.com>
 <CAPDyKFo-ODVL0JUmeZj5-PgcYwT8Gab6-US9LNSOUGwn_-prPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFo-ODVL0JUmeZj5-PgcYwT8Gab6-US9LNSOUGwn_-prPQ@mail.gmail.com>

Hi,

* Ulf Hansson <ulf.hansson@linaro.org> [250312 11:56]:
> On Fri, 7 Mar 2025 at 05:28, Tony Lindgren <tony@atomide.com> wrote:
> > Based on the symptoms, it sounds like there might be a missing flush of
> > a posted write in the PM runtime suspend/resume path. This could cause
> > something in the sequence happen in the wrong order for some of the
> > related surrounding resources like power, clocks or interrupts.
> 
> SDIO is entirely different in this regard compared to eMMC/SD. So if
> there are no reports of issues I suggest we keep the SDIO part.

Hmm just wondering if you have any guesses what causes the eMMC/SD related
PM to break?

Regards,

Tony

