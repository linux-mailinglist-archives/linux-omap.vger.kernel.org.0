Return-Path: <linux-omap+bounces-3473-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98194A69EF2
	for <lists+linux-omap@lfdr.de>; Thu, 20 Mar 2025 05:10:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC4EF1895560
	for <lists+linux-omap@lfdr.de>; Thu, 20 Mar 2025 04:10:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E9A1D88A4;
	Thu, 20 Mar 2025 04:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="hO178hi5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E7748F6F;
	Thu, 20 Mar 2025 04:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742443814; cv=none; b=ZXJOr0j2V/wg7S0rimBkoe8zMoY258h4RVj99O9hwUvYmL+H6vv68RfSrfpO/nl5acpZ8f3sNOFpGEsYO2/+IGJl8pX01l/foE3sCKJZTZ3nOlEiAqKE0w6XNZtulPwfIOUDzZ8a6oW7GTzujwZH66Xsp8I06XAeZ5cHHMpcwRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742443814; c=relaxed/simple;
	bh=zChLSRwGHXJvhMo/zpgYYk2S51h9VHm5ZgJloPpkU3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JW5d07aWFPRj5kK4/9IlEfWOD8Jj3qljVPP8gEszLjnj3JAhbWF94TIGcSomQJkXFV44c+ezo+nnbZCJ9pszZS3oSixiCKtn2666t6jPY7iP1gNMfI6D+ncFyr2cjRFVuljwNGfauiP8Co9rTupaUi1kLTsjD9gVntyxB1mG5qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=hO178hi5; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id AA2A460858;
	Thu, 20 Mar 2025 04:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1742443812;
	bh=zChLSRwGHXJvhMo/zpgYYk2S51h9VHm5ZgJloPpkU3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hO178hi5o56tSgQdOqkEFEABKTG9d84KbkFAVYQ1Z273B5Txt8pgrMPquU0rncMmS
	 7GA9SRu0EmapoQamQ0p+JgNbbohrB9ZJi7yfYQ6Fb4UjdbWPD9Qm4hlT6iJV1N+2kE
	 gDP0iigeyidWpyM6n4p/dSsp4ALOO903r9tNyMOrCwttPBZdrXPjPULbyS9f8tR5Ig
	 zX9/tuoB48l+Kt+wTLvakEwDZeqP2JZLOMnOpfDD93fav5sCpJI42xdM0VvZ+j+EgA
	 h8aGaO7cxPOqiUDYj/iA52lvD+EGCEO61jbzsqoCFjcUv4XG3vmj2TEhHNhwCVTp22
	 8exftENVnf5zw==
Date: Thu, 20 Mar 2025 06:09:55 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
	"rogerq@kernel.org" <rogerq@kernel.org>,
	"aaro.koskinen@iki.fi" <aaro.koskinen@iki.fi>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>
Subject: Re: [PATCH] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Message-ID: <20250320040955.GD4957@atomide.com>
References: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
 <20250313202129.0dcfc44e@akair>
 <6348326299702a12ed4faa6ea25ee8bbe5e232aa.camel@siemens.com>
 <20250313230148.792f224b@akair>
 <20250319035606.GA4957@atomide.com>
 <20250319091741.5488592b@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319091741.5488592b@akair>

* Andreas Kemnade <andreas@kemnade.info> [250319 08:17]:
> Am Wed, 19 Mar 2025 05:56:06 +0200
> schrieb Tony Lindgren <tony@atomide.com>:
> > Sounds like for the AM62x problem there is simply some resource missing
> > that needs to be configured. Did you track down which resource is causing
> > the deferred probe without the revert?
> > 
> I think you have not understand the real problem here. I guess, that
> problem can be provoked on other systems, too, if you just limit the
> devices to the absolute minimum required.

OK yup sorry I misunderstood the problem.

> The problem is as far as I understand a bit different. The problem is
> not a resource is missing totally, it is just the artificial deferral
> here. If there are just a minimum devices configured, you can come to a
> point where there is nothing to trigger a loop through all the deferred
> devices causing them to never probe.
> An arbitary, unrelated device with a driver popping up would unstall
> that deferral. 

Thanks for clarifying, yes that is broken.

> I will just play around with the systems I have access to and if nothing
> pops up, I will add a Tested-By/Reviewed-By. If more serious problems
> pops up (I do not think so), another clean fix should get in before
> getting this reverted.

Agreed now that I understand the probem :) Best to revert if no other
issues are found except for increased deferred probe.

> > Reverting the commit does not really fix the root cause. It just ignores
> > the problem of the hierarchy of the interconnect instances. Some of the
> > interconnect instances are always-on, and contain devices providing
> > resources for the other interconnect devices. So I would not consider
> > patching MMC aliases all over the place as an alternative to fixing the
> > real problem :)
> >
> So what is the real problem you wanted to fix? MMC aliases are there at
> many places already. So is there anything besides MMC order?

The "real problem" is that the probe order should consider the always-on
interconnect instances first. They provide resources for the other
interconnect instances. Ideally there would be a proper bus driver to take
care of that instead of relying on deferred probe.

Regards,

Tony

