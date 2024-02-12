Return-Path: <linux-omap+bounces-549-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4FD850E02
	for <lists+linux-omap@lfdr.de>; Mon, 12 Feb 2024 08:28:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E0E0A1F27E67
	for <lists+linux-omap@lfdr.de>; Mon, 12 Feb 2024 07:28:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC20DDB1;
	Mon, 12 Feb 2024 07:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="TBMUu/EV"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B7C3C8FF;
	Mon, 12 Feb 2024 07:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707722880; cv=none; b=alAnHgdIzWmKFqAC18pJovBh+7924QHAS71598va3ol2etj2BRRlidgsf0J8bWK6Nscus4fx13xEt9TfvTUP/Wsi6P7F107Farp2m84lDqtuBwsMdI+WwxVQOcbMUK44pejQGHspXGAMlO9SnPpPlvzOTBAM0/V6r2RQQHZ+zRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707722880; c=relaxed/simple;
	bh=Tc010E4x7XXx94nau3OGETTxuD/03Hnk8S4WG3XmrD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T7u6GV26BzsBUqMBOjT+CH946J54GGUUcfBNOzASobSFM1XoYLU0y/9n72Ifacyne9tMIpxFgr4ZnebVsZB/HP4Yzgpf9zBFZ+/ulUU3wBQQYfKX4lIjPVSGfTGiFQimjLzchs9V8PFjpLafMlmLIHKI0r8MFOeU9VB5ulrGNbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=TBMUu/EV; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id E2D6C603D2;
	Mon, 12 Feb 2024 07:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707722877;
	bh=Tc010E4x7XXx94nau3OGETTxuD/03Hnk8S4WG3XmrD8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TBMUu/EVowKs1ICTuajeMKg/Y0dkVy/6dLWfvbxyxyZ3UOrKPntdACEwdSeopJvOo
	 kdiLaQItWy0MBouY2/wbxtFmu5RqbeSvBZIq/6tgDpCCVMEqCq9gvJK1L/tjECVojY
	 sdfN8f5vqxYOQ0lhbEMdb/EyzifQX4LoQl50sUFs85BheNvWF+Xi2Yhj93iDMSfjCP
	 AGy+beYBt7zlIyyk4yJOvUbvA+CJyaDBrPZ2a1jlodSZjM/yBbXWHNXIM8E2BdgfR9
	 fKczgBFJaIohW1KaSzd6ZVtYH8B3ALRcdPMLLX5xzWCctT46AXwMu3amoOpH61QefA
	 VsHPb87m/6m8A==
Date: Mon, 12 Feb 2024 09:27:40 +0200
From: Tony Lindgren <tony@atomide.com>
To: Adam Ford <aford173@gmail.com>
Cc: Romain Naour <romain.naour@smile.fr>,
	Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
	linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
	Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: sdhci-omap: issues with PM features since 5.16
Message-ID: <20240212072740.GC52537@atomide.com>
References: <20240127044851.GW5185@atomide.com>
 <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>
 <20240129111733.GX5185@atomide.com>
 <f80b5390-8bfa-43d8-80ce-70b069aef947@smile.fr>
 <7d72f3ee-bcfe-4197-b492-857dc49b2788@smile.fr>
 <20240131103050.GZ5185@atomide.com>
 <519f7e2e-4df2-4b3c-90e2-2383b6b34562@smile.fr>
 <20240202043601.GA5185@atomide.com>
 <6eced20a-6454-4824-a149-ee331ebb7eec@smile.fr>
 <CAHCN7xLUH7Qj_djEuMDAx2nNVqtS5WyoM_DN4zarCbmKh=te4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLUH7Qj_djEuMDAx2nNVqtS5WyoM_DN4zarCbmKh=te4Q@mail.gmail.com>

* Adam Ford <aford173@gmail.com> [240208 12:57]:
> I was testing the newer MMC driver on an AM3517 a few months ago, and
> I noticed that SD cards were returning weird or empty data after some
> indeterminate amount of time.  If I read the IOS file immediately
> after boot, it worked.  If I forced some sort of file IO, it might
> work, but after it went idle, it appeared to have strange data.  I
> don't think this bug is limited to one platform.

OK interesting. So the zero values for ios are expected when the card
is idle. What do you mean by weird values when idle?

Can you please try catch the weird values or a failure maybe with
something like:

while true; do
      cat /sys/kernel/debug/mmc0/ios
      fdisk -l /dev/mmcblk0
      cat /sys/kernel/debug/mmc0/ios
      sleep 20
done

Regards,

Tony

