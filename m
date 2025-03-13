Return-Path: <linux-omap+bounces-3388-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CC2A600F3
	for <lists+linux-omap@lfdr.de>; Thu, 13 Mar 2025 20:21:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 49947177204
	for <lists+linux-omap@lfdr.de>; Thu, 13 Mar 2025 19:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D831F2B87;
	Thu, 13 Mar 2025 19:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="yv+MFX5+"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F8E1F12F9;
	Thu, 13 Mar 2025 19:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741893701; cv=none; b=Lf5yKcSx9+aHgevz0OKDOv7g1K6HTkpo3/ZQNLHjZ5a0D42l3uUikl+cdQH7EeHRRb2sjyGhAQvm9qviu+kKczDNjH9pnFaE5UL9bpX3AQVyMGIwbwBwOZvXjxpbQ7sdnfNW+6xDVg4Rqm9NoJbjEoriAIfNQ+cy9ChfkdbgLNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741893701; c=relaxed/simple;
	bh=L0AvhxZ12qI07UjqeOh7oV2Gu8FLAZOgK1oLVO31CRI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWjWMygQ5y6ttRGjRuhmiy4r6VxrQzPdJZXfwehkQZ1wy5bhWcU3pan5Vv1PgHgfOpZ5m6XEvilwivuIlFZ+APBtFnOWuuznwk0v/Jb7Y4EfevCILVNqUX28SoRRyveBzrBdC0pVGLnQJTZVBLg7oPUuM/nI5E/5yNa6ttFRnpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=yv+MFX5+; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CgU6TUOIPlDMD+REA5JKB0zRv3EEjrSx/AftiArfusE=; b=yv+MFX5+sCF3LhBRXp3kWnvmOb
	MqNT+NXLVk754rUoHAl95u7xiaXBC+clKlyfoIgHvQAXa0yiegFnpbK0ZzLvk1fctJ/1h/ULiuxiG
	+ll83Ad/TV9oLExhxYCI8j8i2Rw1hzGbEaFOZh39mr5C+PlYp2Xck62WPzlZwVkB7Y3cX1E4DNgqu
	QCj1bHHIDVNjEQBtr+JD0yy8QvhiS9sLRdOzlV+NFGksojV5waRhK77DVAovEuEi/g3FhpYN7TTLr
	3X+pD5j5Ungbg0MoVWt/nPldD4dU9gXHS7FQicnys7aNaVxR60XAtvRS1w1Y3t89YrKk1fw/ufSoZ
	utS4OT5g==;
Date: Thu, 13 Mar 2025 20:21:29 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger
 Quadros <rogerq@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Message-ID: <20250313202129.0dcfc44e@akair>
In-Reply-To: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
References: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Alexander,

Am Thu, 13 Mar 2025 10:47:06 +0100
schrieb "A. Sverdlin" <alexander.sverdlin@siemens.com>:

> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> 
> This reverts commit 4700a00755fb5a4bb5109128297d6fd2d1272ee6.
> 
> It brakes target-module@2b300050 ("ti,sysc-omap2") probe on AM62x in a case
> when minimally-configured system tries to network-boot:
> 
brakes or breaks? To unterstand the severity of the issue...

> [    6.888776] probe of 2b300050.target-module returned 517 after 258 usecs
> [   17.129637] probe of 2b300050.target-module returned 517 after 708 usecs
> [   17.137397] platform 2b300050.target-module: deferred probe pending: (reason unknown)
> [   26.878471] Waiting up to 100 more seconds for network.
> 
> Arbitrary 10 deferrals is really not a solution to any problem.

So there is a point where no more probe of anything pending are
triggered and therefore things are not probed?

> Stable mmc enumeration can be achiever by filling /aliases node properly
> (4700a00755fb commit's rationale).
>
yes, it does not look like a clean solution. And we have the
proper aliases node in many places. What I am a bit wondering about is
what kind of sleeping dogs we are going to wake up by this revert. So I
think this should be tested a lot esp. about possible pm issues.

Not every dependency in the sysc probe area is properly defined.

Regards,
Andreas

