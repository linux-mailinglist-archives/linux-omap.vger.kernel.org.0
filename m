Return-Path: <linux-omap+bounces-591-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1307854AFD
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 15:01:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCE021F2998D
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 14:01:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB36657311;
	Wed, 14 Feb 2024 14:00:56 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [80.237.130.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BDB157304;
	Wed, 14 Feb 2024 14:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.237.130.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707919256; cv=none; b=XnzIPkmKKdFHASLOzt4yFZASQwrjwF2zOA7nvVgU3I8o22831IXinYOJ1H8c4tv8I3pxWQuCjk4rBoMIna6T9UlD0uD0Cmbql0dQ3O39oqfXjuXUy70GneZ16IwzApsjnnlZ2xdapYPH5pwQMufR/Fzpc17kzN/OYC2oRc/xg3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707919256; c=relaxed/simple;
	bh=NmYsbagODPMJoiLF+Ib06mloJNrwkK9PuGDNa6gDdcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=FzcanK2EzcCWW86Zo1A/R+VQJGyQm4MFWmhrZrB6+T1Qo+L0TtSaWhJF39k/qUkjwhGay9sg3+GHH22c0r5pUM+/rWG1VQIOiltN+4KbXkd0xm+l1/mlpAjhEHhWsnRDCjx6yLcLOsXu1AeyKP0E0YIjMlEdzo5XiuYJX874n0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info; spf=pass smtp.mailfrom=leemhuis.info; arc=none smtp.client-ip=80.237.130.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leemhuis.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leemhuis.info
Received: from [2a02:8108:8980:2478:8cde:aa2c:f324:937e]; authenticated
	by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	id 1raFoe-0000RG-IY; Wed, 14 Feb 2024 15:00:48 +0100
Message-ID: <c92385d2-1909-43a8-aea8-cd9a8687a898@leemhuis.info>
Date: Wed, 14 Feb 2024 15:00:47 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: 6.7 regression: platform 4809c000.mmc: deferred probe pending
Content-Language: en-US, de-DE
To: Andreas Schwab <schwab@suse.de>, linux-arm-kernel@lists.infradead.org
References: <mvmcyt13idm.fsf@suse.de>
From: "Linux regression tracking (Thorsten Leemhuis)"
 <regressions@leemhuis.info>
Reply-To: Linux regressions mailing list <regressions@lists.linux.dev>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux kernel regressions list <regressions@lists.linux.dev>
In-Reply-To: <mvmcyt13idm.fsf@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1707919254;b0b03551;
X-HE-SMSGID: 1raFoe-0000RG-IY

[CCing the regression list, as it should be in the loop for regressions:
https://docs.kernel.org/admin-guide/reporting-regressions.html]

Hi, Thorsten here, the Linux kernel's regression tracker.

Thanks for the report.Added the omap list and the omap mmc maintainer;
the root of the problem might be somewhere else, but maybe we get some
help from there.

On 12.02.24 14:46, Andreas Schwab wrote:
> I'm getting these messages on the PandaBoard since 6.7:
> 
> [   29.285522][  T156] platform 4809c000.mmc: deferred probe pending
> [   29.291748][  T156] platform 4a0ab000.usb_otg_hs: deferred probe pending
> [   29.298522][  T156] platform 58005000.encoder: deferred probe pending
> [   29.305053][  T156] platform 58006000.encoder: deferred probe pending
> [   29.305145][  T156] i2c 0-004b: deferred probe pending
> [   29.316772][  T156] platform 40132000.target-module: deferred probe pending
> [   37.382110][  T156] pbias_mmc_omap4: disabling
> 
> As a result, the SD card is not found.
> Any idea what's going on here?

Haven't heard of anything like that. Unless some developer replies with
some idea in a day or two I guess you will have to bisect the problem.

[TLDR: I'm adding this report to the list of tracked Linux kernel
regressions; the text you find below is based on a few templates
paragraphs you might have encountered already in similar form.
See link in footer if these mails annoy you.]

Anyway, to be sure the issue doesn't fall through the cracks unnoticed,
I'm adding it to regzbot, the Linux kernel regression tracking bot:

#regzbot ^introduced v6.6..v6.7
#regzbot title arm: omap: platform 4809c000.mmc: deferred probe pending
#regzbot ignore-activity

This isn't a regression? This issue or a fix for it are already
discussed somewhere else? It was fixed already? You want to clarify when
the regression started to happen? Or point out I got the title or
something else totally wrong? Then just reply and tell me -- ideally
while also telling regzbot about it, as explained by the page listed in
the footer of this mail.

Developers: When fixing the issue, remember to add 'Link:' tags pointing
to the report (the parent of this mail). See page linked in footer for
details.

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)
--
Everything you wanna know about Linux kernel regression tracking:
https://linux-regtracking.leemhuis.info/about/#tldr
That page also explains what to do if mails like this annoy you.


