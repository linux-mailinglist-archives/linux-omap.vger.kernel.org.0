Return-Path: <linux-omap+bounces-3472-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5A5A69EEF
	for <lists+linux-omap@lfdr.de>; Thu, 20 Mar 2025 05:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0AF6642734A
	for <lists+linux-omap@lfdr.de>; Thu, 20 Mar 2025 04:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBFBE1D88A4;
	Thu, 20 Mar 2025 04:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="TOMReOUU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B728F6F;
	Thu, 20 Mar 2025 04:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742443266; cv=none; b=DYJgFRb+ZeSq2psJ5gHz4PP/Uo3f+M7bqja9Z1vo7SL6jRD6PbSWE2u+vFk5H/CDbT5125P/1TBNtK7O+tirquBJ7zpjyIGTUJ/vbSJm0FhayxV/jckTL395sjXLpZjhwYYzL7mw5Ulmt0CFqoM3DwbLmgFi5QoW7fCvjJtBdOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742443266; c=relaxed/simple;
	bh=CyIOZ3WGD0cVnpAjBLwyMToXcKD0BlSyUbpI4js/7mY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gxz+tJuqql64QGNFlRFOvdK9Bxms9iG1BqF8aaDCHN/SlhwelnurrnLQ7rDuUQdeIR6UWyCL1jXD+EnFb//nU2sEP71LmcAMoEkEs1ULiQ/p3QmeWJSDPKfG0hRe2IhIuAHChh2KSJ75Jn+M5CQRNy1MElagscN0UlRdFXDHg7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=TOMReOUU; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 662E060514;
	Thu, 20 Mar 2025 04:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1742443254;
	bh=CyIOZ3WGD0cVnpAjBLwyMToXcKD0BlSyUbpI4js/7mY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TOMReOUUFhuTqP1JOLmqgkaFKTxR8OeYGxda5VPKJ7OUBZ/iRpL7zeNrHw404ETfl
	 N5R/NryUMe7NVj37bmjNSy4dXJ4ub333AqFMEE1FV0nUMYnqTVdt1hKhPq6YePyMkK
	 mBt3wN8zQT9N3VEqoDS1g99XkDWs98MKkqp2XuOAkNMs1lAhn+6hwqKcO101/NExDs
	 l03NkRNdnk5tTqAmWOKT49lK9yhhin3eg/MVCYvfx1XxPCH4rcOw2EV2QcWbLBGDKi
	 QyI3u2CzwGrkGfRTFjtb1qec4iHyE+4ujVvdEUdemPJXlTHbduQhEn+Vdx5ZmmVyN0
	 pbX4TT+gvXrrw==
Date: Thu, 20 Mar 2025 06:00:36 +0200
From: Tony Lindgren <tony@atomide.com>
To: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
Cc: "andreas@kemnade.info" <andreas@kemnade.info>,
	"rogerq@kernel.org" <rogerq@kernel.org>,
	"aaro.koskinen@iki.fi" <aaro.koskinen@iki.fi>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"khilman@baylibre.com" <khilman@baylibre.com>
Subject: Re: [PATCH] Revert "bus: ti-sysc: Probe for l4_wkup and l4_cfg
 interconnect devices first"
Message-ID: <20250320040036.GC4957@atomide.com>
References: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
 <20250313202129.0dcfc44e@akair>
 <6348326299702a12ed4faa6ea25ee8bbe5e232aa.camel@siemens.com>
 <20250313230148.792f224b@akair>
 <20250319035606.GA4957@atomide.com>
 <f53e999648997121fb6079b7baad56acd6c0016e.camel@siemens.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f53e999648997121fb6079b7baad56acd6c0016e.camel@siemens.com>

* Sverdlin, Alexander <alexander.sverdlin@siemens.com> [250319 07:39]:
> Hi Tony,
> 
> On Wed, 2025-03-19 at 05:56 +0200, Tony Lindgren wrote:
> > > > > > This reverts commit 4700a00755fb5a4bb5109128297d6fd2d1272ee6.
> > > > > > 
> > > > > > It brakes target-module@2b300050 ("ti,sysc-omap2") probe on AM62x in a case
>                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> [1]
> 
> > > > > > when minimally-configured system tries to network-boot:
> > > > > >    
> > > > > brakes or breaks? To unterstand the severity of the issue...  
> > > > 
> > > > Thanks for the correction, it should have been "breaks"...
> > > > 
> > > > > > [    6.888776] probe of 2b300050.target-module returned 517 after 258 usecs
> > > > > > [   17.129637] probe of 2b300050.target-module returned 517 after 708 usecs
> > > > > > [   17.137397] platform 2b300050.target-module: deferred probe pending: (reason unknown)
>                                   ^^^^^^^^^^^^^^^^^^^^^^
> 
> [2]
> 
> > > > > > [   26.878471] Waiting up to 100 more seconds for network.
> > > > > > 
> > > > > > Arbitrary 10 deferrals is really not a solution to any problem.  
> > > > > 
> > > > > So there is a point where no more probe of anything pending are
> > > > > triggered and therefore things are not probed?  
> > > > 
> > > > Because there is a point indeed (if we configure quite minimal set of drivers just
> > > > enough to mount NFS) when deferred probes are not triggered any longer.
> > > > 
> > > > > > Stable mmc enumeration can be achiever by filling /aliases node properly
> > > > > > (4700a00755fb commit's rationale).
> > > > > >    
> > > > > yes, it does not look like a clean solution. And we have the
> > > > > proper aliases node in many places. What I am a bit wondering about is
> > > > > what kind of sleeping dogs we are going to wake up by this revert. So I
> > > > > think this should be tested a lot esp. about possible pm issues.
> > > > > 
> > > > > Not every dependency in the sysc probe area is properly defined.  
> > > > 
> > > > But the patch I propose to revert is really not a solution for missing
> > > > dependencies on syscons. I'm fine with not propagating this to stable,
> > > > but reverting in master should give enough time for older SoCs to test,
> > > > WDYT?
> > > > 
> > > I am not against your revert proposal and not against propagating it
> > > to stable, I would just like to see some Tested-Bys before it gets
> > > applied to anything. If anything nasty pops up, it should be solved in a
> > > cleaner way then with the offending patch.
> > 
> > Sounds like for the AM62x problem there is simply some resource missing
> > that needs to be configured. Did you track down which resource is causing
> > the deferred probe without the revert?
> 
> This "missing" resource is pointed out above in [1] and [2].
> And it's missing only because of the arbitrary 10 deferrals, which simply
> do not happen on all systems if you'd configure less drivers or they are
> ordered in a way that 10 deferrals are not necessary in the DT.

Oh OK, sorry I misunderstood your problem. I thought you're missing some
resources like clocks or regulators. I did not realize this issue can
trigger on any system with just a few devices configured.

> If your patch is "fixing the root cause", could you please elaborate the
> number "10"? Why is it 10 and not 11 or 11000000?
> Could it be "2" or "1" as well?

Heh a random number enough to quiet down things was the original idea :)
Does not exactly always work as you pointed out.

Regards,

Tony

