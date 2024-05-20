Return-Path: <linux-omap+bounces-1391-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A0E8C9935
	for <lists+linux-omap@lfdr.de>; Mon, 20 May 2024 09:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC84EB215E8
	for <lists+linux-omap@lfdr.de>; Mon, 20 May 2024 07:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF6F1B978;
	Mon, 20 May 2024 07:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ET+R8R74"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ECF17C6C
	for <linux-omap@vger.kernel.org>; Mon, 20 May 2024 07:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716189561; cv=none; b=A97oi85DZZCFGImX5IEPsaD9l6IM7MfmTqdOBTpedP57OgHi/89yip53loRjTsgPUu5dEHMEKcJ3ngVgF6UhW+p+OeYi3ypDyXl4cA5xIrJK9nm383Cfr4Lw+ByPkr8Ak2S56XQKANX54J/Yzr3yqvGne7gogyQQCDkLSRdXibI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716189561; c=relaxed/simple;
	bh=TtXBp/y1GJ993Y2IImPK83yaJTrKtBSiVf0gbVNi4Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7eZhi/2gE0l6nc4H1oMWxG7g7YcAR4OGqgjkDIPKpntktvbvMKOea+vRnw22qLO/V7wkYS3N5U5bPydFvVVq8GISLGCSkoEhVQF4ym1kQVeqFH8+amDyBBDD9IXeuBOj+6kE1ataJyUQqNvSz4mNKUlEUqkU0oz2z5FRLtjeHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ET+R8R74; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1ee42b97b32so66280975ad.2
        for <linux-omap@vger.kernel.org>; Mon, 20 May 2024 00:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716189558; x=1716794358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8y4kuhNsW46WW9yuHhh+VXBJRBrezkcZVwyuntDPHmY=;
        b=ET+R8R74FHqdMda7gwL2lzdL5rjR1XdF5H+ewKW9umw4Wl3P6Xp+gHwA7b/EmkE1Cd
         fDFKZcVuInB09b9qm2lo9k5TRoKnVkWuKGibSvX3c1+UN4KzoBjF6N9+7gxfOj+wO1W2
         66eaRrr6O7nP7n4RwHAWJDTUWtYxp43eQ51nm+EZikab6y6fCLWwrcEIuI1eU/3m94BQ
         siNXzXrUAdzN5J0gpQ5JfhwYWo8kqq3I3nWgc/Aoah9rYjdq62HZS86P+aOl+RPfGaLH
         b2qpZTjsfPdYSsx8ccwnvjSD99VQ+poop4OjYAXJHHvtzbcaGUPSnKXGnKQgCDhJdK86
         LmAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716189558; x=1716794358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8y4kuhNsW46WW9yuHhh+VXBJRBrezkcZVwyuntDPHmY=;
        b=CeHmnp6CV3vVg5NI1E2u1MEzz9O5QROgFr/hqLMtLP1p1xqUrI4nXUamvzjpyODQuB
         A+PL2g/9AHf/PNTLvsYxFUrFGCFlMs3TX1/aX/J2xr+MrKNNYDTJkjcz0Ljaac3sLB73
         d4+CGPqrB8FqzUsBoNxn1kWac/6sqU4fD00T/WslxV7fbDIQlPeRZ9HsWokuH101r1zS
         cj+5Fa/moGHz0llPjmi4mzXnvO9RE4gSI059Tdzd78v/jfH/qD3NO3hX3cdv3fYHKJWz
         wQQzkdqxKS8Dh98ycfmcPU2bRkubTe9RTpGV/A5MdvzCH0zi/WvxJzf35nv2C8hOJqN+
         xawQ==
X-Gm-Message-State: AOJu0YworIimiQGDghrc81YC3dSsATsqB4kfL/PBTPnHaL6l2eOFEW4G
	tJ5BziAEUWpuM1hroYMKBlXlAjHd6Y4ZtI60OpvBBgOaVJHK1d/L6ktex3SWXME=
X-Google-Smtp-Source: AGHT+IEEFl66WKoPGpgvD+Rqu7WM6o+8q8tAnwmX9Dq9HIkUrcJTIhG1B4gLnlTZWm0iYncA4fOuZA==
X-Received: by 2002:a17:90a:e7ce:b0:2bd:820b:7863 with SMTP id 98e67ed59e1d1-2bd820b7aa8mr1147725a91.18.1716189557840;
        Mon, 20 May 2024 00:19:17 -0700 (PDT)
Received: from localhost ([122.172.82.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2b62884b837sm21341342a91.20.2024.05.20.00.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 00:19:17 -0700 (PDT)
Date: Mon, 20 May 2024 12:49:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Merlijn Wajer <merlijn@wizzup.org>
Cc: linux-omap <linux-omap@vger.kernel.org>, rafael@kernel.org,
	zhipeng.wang_1@nxp.com, Tony Lindgren <tony@atomide.com>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Carl Philipp Klemm <philipp@uvos.xyz>,
	"Sicelo A . Mhlongo" <absicsz@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-pm@vger.kernel.org
Subject: Re: No cpufreq entries with omap2plus_defconfig since "cpufreq:
 dt-platdev: Support building as module" (commit 3b062a08)
Message-ID: <20240520071915.knnmxkjtajbnw7sp@vireshk-i7>
References: <657f402f-3c22-48bb-8102-ab35a74444c1@wizzup.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <657f402f-3c22-48bb-8102-ab35a74444c1@wizzup.org>

On 02-05-24, 13:04, Merlijn Wajer wrote:
> Hi,
> 
> I was looking at switching my Motorola Droid 4 phone from Linux 6.1 to Linux
> 6.6, and it no longer gets any cpufreq entries on boot, and I found
> cpufreq_dt was no longer loaded. I tried to force the issue by modprobe it,
> but to no avail. The same issue occurs on the latest 6.9.
> 
> After a bit of digging it looks like the problem is that cpufreq-dt-platdev
> can be built as a module and when this the case (apparently the default),
> cpufreq_dt doesn't work. With the omap2plus_defconfig,
> CONFIG_CPUFREQ_DT_PLATDEV is indeed set to module.
> 
> When I manually probe cpufreq-dt-platdev and cpufreq_dt, I get the
> cpufreq_entries back.
> 
> Searching around I found this debian bug report [1] which just flips the
> CONFIG_CPUFREQ_DT_PLATDEV back to '=y', but I think there might be a deeper
> issue here.
> 
> Is there a way to define this relationship/dependency for cpufreq-dt, so
> that it will automatically load this module?

Does this fix it for you ?

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 100760259f70..bb48b674be5e 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -233,4 +233,5 @@ static int __init cpufreq_dt_platdev_init(void)
                               sizeof(struct cpufreq_dt_platform_data)));
 }
 core_initcall(cpufreq_dt_platdev_init);
+MODULE_ALIAS("platform:cpufreq-dt");
 MODULE_LICENSE("GPL");

-- 
viresh

