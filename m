Return-Path: <linux-omap+bounces-192-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75AF781D6CE
	for <lists+linux-omap@lfdr.de>; Sat, 23 Dec 2023 23:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 108861F21E68
	for <lists+linux-omap@lfdr.de>; Sat, 23 Dec 2023 22:41:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 341FA18E17;
	Sat, 23 Dec 2023 22:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="tiIfKyc7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5859518B1B
	for <linux-omap@vger.kernel.org>; Sat, 23 Dec 2023 22:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/xh43mp0Y1l3Cz8eSLJlfJwIpGW3U2n5ZXxx/ngXsfc=; b=tiIfKyc7T/50PFnp9/0Q7z831a
	CIuKZIeuSjxnRK40e189/y839RD+eIg0zO9ua73CvHHXxvc6B8gWIGXFpE6arYw+pwhev5hOW3H3c
	QDDKpLg0nPkKFlkwh93cy1exsvCnm/zLzQO/FNDgBActDm+R+njVct25dPFy1jxEnFvdnfpFf2twU
	b3LVJuRKGBLevRFMkYO2IV+7343KEJkr0MGCZh6XfO6f5yB/gkY/PwsfSAY3iDhFT6BNZ1fP0dfbG
	RwZ1F4opuUarMNxzYiPYSRBHlqIDe58aFbDNm8sW09w+9yzM+jAwVjHVfM0Mfx4lDWyRpwsVTcqMJ
	6l5+H28g==;
Received: from p200301077700c3001a3da2fffebfd33a.dip0.t-ipconnect.de ([2003:107:7700:c300:1a3d:a2ff:febf:d33a] helo=aktux)
	by mail.andi.de1.cc with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <andreas@kemnade.info>)
	id 1rHAg4-007fBd-Ok; Sat, 23 Dec 2023 23:41:04 +0100
Date: Sat, 23 Dec 2023 23:41:02 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Romain Naour <romain.naour@smile.fr>
Cc: tony@atomide.com, linux-omap@vger.kernel.org, Romain Naour
 <romain.naour@skf.com>
Subject: Re: [PATCH] bus: ti-sysc: Fix error handling for
 sysc_check_active_timer() again
Message-ID: <20231223234102.556eaa07@aktux>
In-Reply-To: <20231222163710.215362-1-romain.naour@smile.fr>
References: <20231222163710.215362-1-romain.naour@smile.fr>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi,

On Fri, 22 Dec 2023 17:37:10 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> From: Romain Naour <romain.naour@skf.com>
> 
> sysc_check_active_timer() has been introduced by 6cfcd5563b4f
> ("clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 and am4")
> and initially returned -EBUSY to ignore timers tagged with no-reset
> and no-idle.
> 
> But the return code has been updated from -EBUSY to -ENXIO by
> 65fb73676112 ("bus: ti-sysc: suppress err msg for timers used as clockevent/source")
> and introduced a regression fixed by 06a089ef6449
> ("bus: ti-sysc: Fix error handling for sysc_check_active_timer()")
> since sysc_probe() was still checking for -EBUSY.
> 
> Finally the sysc_check_active_timer() return code was reverted
> back to -EBUSY by a12315d6d270
> ("bus: ti-sysc: Make omap3 gpt12 quirk handling SoC specific") except
> for SOC_3430.
> 
> Now sysc_check_active_timer() may return ENXIO for SOC_3430 and
> EBUSY for all other SoC.
> 
> But sysc_probe() still check for -ENXIO leading to the following
> errors in dmesg on AM57xx:
> 
> ti-sysc: probe of 4ae18000.target-module failed with error -16 (timer1_target)
> ti-sysc: probe of 4882c000.target-module failed with error -16 (timer15_target)
> ti-sysc: probe of 4882e000.target-module failed with error -16 (timer6_target)
> 
> Fix this by checking for both error code...
> 
Well, fix what? As long as -EBUSY comes form sysc_check_active_timer(), there
is no problem besides the noise. So clearly state what you want to fix,
so is it only the noise.
Of course I would also like the noise to be gone. I also stumbled across this.
Bringing this to discussion is of course good.

Changing it to -ENXIO has side effects as more lines are executed and the
device is touched although it might be already in use by dmtimer_systimer.

As far as I understand things: there are broken timers, timers used by clocksource
and timers generally useable. And we return -ENXIO for the broken ones... The
main issue here is that this needs more documentation/comments.
I might of course be wrong...

Regards,
Andreas

