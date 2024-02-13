Return-Path: <linux-omap+bounces-552-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D01B285288F
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 07:06:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8591B283EF7
	for <lists+linux-omap@lfdr.de>; Tue, 13 Feb 2024 06:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED504182BE;
	Tue, 13 Feb 2024 06:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="ZfvZqNxQ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A1518036;
	Tue, 13 Feb 2024 06:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707804209; cv=none; b=ruX5GLR7p4JuiVGOtAhwyAaY9/LV8+blgFJtykMQZsltwv0f2bB2ff0f0d0Joc7edp1Mm03JkwSu1C+HjPkJFeVhZlG/BEl1bR+M3zquz4PV257BSKBdxtQ2ge2H3Qb6cK7iZfGTACst2zo/BQsfZXlEZoC0rLkUrhWMt9dG+J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707804209; c=relaxed/simple;
	bh=OiS2IPxQFNkY8zYNftEbydTubsO3JFN4sLAsFKq9wK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JejUx8U1RODRul6MPRiLYg866/GsSWoLUOke2KWKxAiHQbi5COinv6pHRemAEuuqAXtfWyHyGtK6juIUXiYJ+N4nurB6K/7v5vkTuIf29X00KC5LTCfW67xmWBq5pL8DE3OpItjWAGutkAS521TnhmDLIsm4RBDWLIUk67Z+sDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=ZfvZqNxQ; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id CDEB060505;
	Tue, 13 Feb 2024 06:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707804200;
	bh=OiS2IPxQFNkY8zYNftEbydTubsO3JFN4sLAsFKq9wK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZfvZqNxQMF7uwaCVe7wTrc4cGM+LDoeiXSOch8nctjtkWXtsR9dbRUyWT/8AgMT40
	 95aLFG/oiNcxiA/ZVwLid8xmqAcgA/xZ+S5H6/d++s+g44fCQ2JhNSZvha969AAdi4
	 yNxMRoeakL2TOqR8maBeOBvJPEy+fw4FzHDXh4LDJi5oKHsLEMEQVH5DuV8RLc5L7J
	 QqctupxGzRFAiX7C7ZJYtkLl7K2qBGwycYwN56aIcCe2hdwreUcSNG2bQesqW049mK
	 qf452WAIcVkxFSAc7M9+eopidgFadcLEV+nX8DoAt0N6D3mchQISoNI4hUwIVBKM9E
	 OvrTjuY0PumfQ==
Date: Tue, 13 Feb 2024 08:03:02 +0200
From: Tony Lindgren <tony@atomide.com>
To: Adam Ford <aford173@gmail.com>
Cc: Romain Naour <romain.naour@smile.fr>,
	Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
	linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: sdhci-omap: issues with PM features since 5.16
Message-ID: <20240213060302.GD52537@atomide.com>
References: <20240129111733.GX5185@atomide.com>
 <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
 <7d72f3ee-bcfe-4197-b492-857dc49b2788@smile.fr>
 <20240131103050.GZ5185@atomide.com>
 <519f7e2e-4df2-4b3c-90e2-2383b6b34562@smile.fr>
 <20240202043601.GA5185@atomide.com>
 <6eced20a-6454-4824-a149-ee331ebb7eec@smile.fr>
 <CAHCN7xLUH7Qj_djEuMDAx2nNVqtS5WyoM_DN4zarCbmKh=te4Q@mail.gmail.com>
 <20240212072740.GC52537@atomide.com>
 <CAHCN7xJZXVXxiwBXgGKhGmBQhCAFfa4Tn=tJcGLX3N==tgvFzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHCN7xJZXVXxiwBXgGKhGmBQhCAFfa4Tn=tJcGLX3N==tgvFzQ@mail.gmail.com>

* Adam Ford <aford173@gmail.com> [240212 13:24]:
> On Mon, Feb 12, 2024 at 1:28 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Adam Ford <aford173@gmail.com> [240208 12:57]:
> > > I was testing the newer MMC driver on an AM3517 a few months ago, and
> > > I noticed that SD cards were returning weird or empty data after some
> > > indeterminate amount of time.  If I read the IOS file immediately
> > > after boot, it worked.  If I forced some sort of file IO, it might
> > > work, but after it went idle, it appeared to have strange data.  I
> > > don't think this bug is limited to one platform.
> >
> > OK interesting. So the zero values for ios are expected when the card
> > is idle. What do you mean by weird values when idle?
> 
> I meant zero-values when I said weird.  It's weird to me, because
> other platforms don't return zero.
> If tha's normal, I'll likely submit an update to omap3.dtsi to migrate
> the MMC driver to the newer one.
> I'd been meaning to do that for a while, but this threw me off, then i
> forgot about it until I saw this thread.

Yes I'd like to enable sdhci-omap and deprecate omap_hsmmc too.

Assuming no issues and if the hs200 issue is a separate issue, maybe
post the patches and then let's get some Tested-by for them before we
put them into Linux next.

> > Can you please try catch the weird values or a failure maybe with
> > something like:
> >
> > while true; do
> >       cat /sys/kernel/debug/mmc0/ios
> >       fdisk -l /dev/mmcblk0
> >       cat /sys/kernel/debug/mmc0/ios
> >       sleep 20
> > done
> 
> It appears the first time, that runs after fdisk, the values seems
> reasonable, but subsequent iterations, the values are zero again:

Seems expected to me. Before fdisk -l the mmc controller may have
autoidled showing mostly zero values, and after any access to the mmc
card the card is enabled and the values are the normal enabled values.

If, however, fdisk -l does not work, or the values right after fdisk -l
are mostly zero, then that would indicate a problem. I guess leaving
out the reading of ios before fdisk -l would make it easier to see.

Regards,

Tony

