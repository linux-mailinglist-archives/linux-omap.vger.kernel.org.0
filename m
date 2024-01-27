Return-Path: <linux-omap+bounces-421-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4992083EB13
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 05:49:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1E2FB21685
	for <lists+linux-omap@lfdr.de>; Sat, 27 Jan 2024 04:49:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3381D125B0;
	Sat, 27 Jan 2024 04:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="S971WVwo"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC544B665
	for <linux-omap@vger.kernel.org>; Sat, 27 Jan 2024 04:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706330943; cv=none; b=gHqF8xwpVugbQMpzbNvclSMunZB/IK5WNsA2N/raYYN+qG1m5pgVsnN1E3+LKEXYM4+TGwlf6LczgbphcB3lHY6S34ELY5vag8znsrqNAm9+h9VXNeRjPiR9RTTYs7gsGkP0kPAzBbyMfsfL9LlkgmrUNyNTXFER/KZMjTSkYL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706330943; c=relaxed/simple;
	bh=LrMuAxFtu4goiKX7hbf4/0cEU07l1aFmIHBOewsynFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Poe/3YLChNGZgzkyFN9IZnFojh8jy61aSnsgiX/ZCdob0OTN8S0mwxGaaXOf2k4dAJygPcnEd7/5ZLDbiCldHX/YElZWYuieWVKQ0nkY6LKCk/A1V8wq3setPODHAGLgR4lZhkCePX0E0qizTYegLGOl+KVRtJMzXj2RVYcr6C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=S971WVwo; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id EE6F1603C4;
	Sat, 27 Jan 2024 04:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1706330940;
	bh=LrMuAxFtu4goiKX7hbf4/0cEU07l1aFmIHBOewsynFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S971WVworVV85zfgS+RTaYFmJCNZQxrtNs7ZEcBB8AAYr0wDcx+ikXFFJxCRbDwUc
	 sohmlYHn2aMWbG4dswvBWiriX/nBZtTbK8GoUVcy0oxXBciNHcwMYH105yOuyjdV+n
	 oKFRkGl5iAst4+lD4acWoxwMBX5I9oRAy7HTSl/OZP4ue/+/qHrxqF+bjltT6VCunn
	 dy9EXOHd24rscPYTmMJgyg65vFz6lj1EF7W83EtGuoJgPSsfu7cdwDgH9Ioq4xorJF
	 VFoLD/vAr32lcgOrFv7+4/JiWQ1D2F4u5tI51WrMb01ZrAhwOkLrDlQgc5/hNPJJDU
	 KPf0LkYVPywrw==
Date: Sat, 27 Jan 2024 06:48:51 +0200
From: Tony Lindgren <tony@atomide.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>
Subject: Re: sdhci-omap: issues with PM features since 5.16
Message-ID: <20240127044851.GW5185@atomide.com>
References: <2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr>

Hi,

* Romain Naour <romain.naour@smile.fr> [240126 20:53]:
> Hello,
> 
> I'm upgrading the kernel from 5.10.168 to 6.1.69 (both from TI tree) on a custom
> board based on a AM574x SoC and I noticed a regression on the sdhci-omap driver.
> 
> The emmc was working on the 5.10 kernel using mmc-hs200 powered at 1,8v (mmc2).

Is this limited to emmc or does it also happen with the micro-sd or wlan possibly?

If the issue is emmc related, do you have mmc-pwrseq-emmc configured in the dts?

> I'm able to reproduce on the IDK574x evaluation board (where the emmc is powered
> at 3v3) with vanilla kernels.

OK, looks like only am5729-beagleboneai.dts has configured mmc-pwrseq-emmc.

> I had to revert all commits related to "PM runtime functions" [1] and "card
> power off and enable aggressive PM" [2] from kernel 5.16 to use the emmc again
> on both boards.

OK, this sounds like power sequence related when the emmc gets idled.

Regards,

Tony

> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=f433e8aac6b94218394c6e7b80bb89e4e79c9549
> [2]
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3edf588e7fe00e90d1dc7fb9e599861b2c2cf442


