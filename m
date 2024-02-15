Return-Path: <linux-omap+bounces-604-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B55F855E7A
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 10:47:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B743E1F22AA8
	for <lists+linux-omap@lfdr.de>; Thu, 15 Feb 2024 09:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E27C11183;
	Thu, 15 Feb 2024 09:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="YbF/JFBU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ADF19A
	for <linux-omap@vger.kernel.org>; Thu, 15 Feb 2024 09:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707990423; cv=none; b=pBjeIA89oWgsga3hFImK9e33PWczhCdPmZdObQ1kFL0QzvhhAH9seugwEh5VQJ62jsEq5JLu1YkCfr3CvU3fCXrzpXJmVkUdY4iHC0vJ/hv/pyCZg8lHl2q51+AgRrklHehrIh2hoHYc2u1ohZK7/Ab2sGvbf/t2zpqzmfVXC3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707990423; c=relaxed/simple;
	bh=VUSabbVlezJPL4VM+uGmTR+tds97FDgAdgk3FXX64+8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBBd6sBqVbneU30aatfBO31kBraRBIcPK+ISOw7ON0bxP92ePfOwuMQFmWIrRk2G3JchsyJeHmliZhZWxMb4ytpm+njCFfCSEA6DQmy+zE8M2Yrxy8A/PR2dC2vMeXKL10vn1+3jYJzWwI6gWKizb9IsWNarQSWSAn09QKNrkew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=YbF/JFBU; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 5D366603EE;
	Thu, 15 Feb 2024 09:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707990414;
	bh=VUSabbVlezJPL4VM+uGmTR+tds97FDgAdgk3FXX64+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YbF/JFBUJVPAWavHokSDrSfTBbRGP+uTaqrelkveX67PIshldZMKbP2brqO6zbIQr
	 vKf1v8c9/1gYZw2poGXMIsZGYFUzZ4RD2Ll67FT6XjkbxLvhSrq1GAH/YYuMSKtjW4
	 MZS0ioXZ0XB8CLXlxiqy/RhtQbz1ACqUdIiCW4BubtV6eJO9QpKFhuN33YHsBkBJD2
	 p77njnAPTZFmojJprc+RTt0eYDkmA5jsclh8bX8EsqaqsLmAH2E1VPOWU68NylqxP8
	 l08CNTUoA6ZRDK8NLrLNmeJzEulMNzdxIN6ABfhC6lz0XZy3HDWIklWwYPfZRTJc9m
	 1P+mc/F50x6bg==
Date: Thu, 15 Feb 2024 11:46:40 +0200
From: Tony Lindgren <tony@atomide.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Andreas Schwab <schwab@suse.de>, linux-arm-kernel@lists.infradead.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: 6.7 regression: platform 4809c000.mmc: deferred probe pending
Message-ID: <20240215094640.GS52537@atomide.com>
References: <mvmcyt13idm.fsf@suse.de>
 <c92385d2-1909-43a8-aea8-cd9a8687a898@leemhuis.info>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c92385d2-1909-43a8-aea8-cd9a8687a898@leemhuis.info>

* Linux regression tracking (Thorsten Leemhuis) <regressions@leemhuis.info> [240214 14:01]:
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
> 
> Hi, Thorsten here, the Linux kernel's regression tracker.
> 
> Thanks for the report.Added the omap list and the omap mmc maintainer;
> the root of the problem might be somewhere else, but maybe we get some
> help from there.
> 
> On 12.02.24 14:46, Andreas Schwab wrote:
> > I'm getting these messages on the PandaBoard since 6.7:
> > 
> > [   29.285522][  T156] platform 4809c000.mmc: deferred probe pending
> > [   29.291748][  T156] platform 4a0ab000.usb_otg_hs: deferred probe pending
> > [   29.298522][  T156] platform 58005000.encoder: deferred probe pending
> > [   29.305053][  T156] platform 58006000.encoder: deferred probe pending
> > [   29.305145][  T156] i2c 0-004b: deferred probe pending
> > [   29.316772][  T156] platform 40132000.target-module: deferred probe pending
> > [   37.382110][  T156] pbias_mmc_omap4: disabling
> > 
> > As a result, the SD card is not found.
> > Any idea what's going on here?
> 
> Haven't heard of anything like that. Unless some developer replies with
> some idea in a day or two I guess you will have to bisect the problem.

There was a regression recently with the PMIC which would cause NFSroot
on devices to keep working but may have affected MMC. Please check that
commit 7a29fa05aeca ("mfd: twl6030-irq: Revert to use of_match_device()")
is applied. If that does not help, then git bisect is the way to go.

Regards,

Tony

