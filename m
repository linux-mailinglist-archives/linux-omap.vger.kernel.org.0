Return-Path: <linux-omap+bounces-2603-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C39C013E
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 10:36:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE0501C211FE
	for <lists+linux-omap@lfdr.de>; Thu,  7 Nov 2024 09:36:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599981E3DCC;
	Thu,  7 Nov 2024 09:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="hdFeNR1X"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49E91E0DE8;
	Thu,  7 Nov 2024 09:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730972169; cv=none; b=kX1qJSMrJDvQLuZR3muIGNSihBX7hiqJpraS9aApWrgG561teWVrRL4OwMNL/bgfVFeS3WLArb8UXWwlszOaNDCITT3K1eXu4nsEfu5DUJ3lQJCTcOqiCd1jRpuOJ3C+mhPzRuowF+1ccQxjgL0KK8QIqvC1mIkIVd3t0Y/7d04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730972169; c=relaxed/simple;
	bh=VZvqD/3rqm30CRWbcS650csR314AAmf8WEqce0jmsKo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qtb8gkLh9/SRibMw5vMLsXWzBv1xEmdHUvLoacyDSyqbc4U16JgxV6R3a7GDQiEJ9ZI5MOV8bsYW7AkBKzk2D5iuen3QQAo67PM2lK4MBFSK6tDMP7KP2Wx4WCVCgAhXY8Y3aq9kEvhMwaxFzjrbWA6KIAbRkEiD455sM7XIbsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=hdFeNR1X; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ccsASbRCwb8II3GzvWH2KtdPgRwKffYmzn9YbOSRDZI=; b=hdFeNR1XZP5ifd9Ddr/QyILLaf
	Kg2ptPi4q7C/QiC6JW8YyZBUTezoLBcbC234684GE9AU0/XTl2UmlWmhAbo16TSgBeTjocDI5rCqI
	oI6jWO5wHLDvB/ZnfPvEUCBxccy+y8svncMgVLiiUmv/4vRjCMOn1/f9Bg2wW5tr4rUXsZf/JnQOR
	reX32IHRVdUsmabSMIu1ky56r5hp9S7keLSt4u5vjJvu1/BwI+tydfexEMwF5JpwuPb/B+R8nZZ4s
	tVXSS36fKlHmUhAI6lGDRwCfXXXl7yHycd9IsGWAOkcjviwh0pAnQMhc0Scj6einyzg1BWDgLYQgj
	a8D1wSZA==;
Date: Thu, 7 Nov 2024 10:35:52 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Tony Lindgren <tony@atomide.com>
Cc: Adam Ford <aford173@gmail.com>, bcousson@baylibre.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCH] ARM: dts: gta04: fix excess dma channel usage
Message-ID: <20241107103552.22583403@akair>
In-Reply-To: <20230122100852.32ae082c@aktux>
References: <20230113211151.2314874-1-andreas@kemnade.info>
	<CAHCN7xJH+c41Yas+xnWA57KNi9arOOJDxJ=joEDEJr2k6jrRrw@mail.gmail.com>
	<Y8VkjQ2yZQssx/wJ@atomide.com>
	<20230116173922.585904bf@aktux>
	<Y8WBuKt6mw6TN1Cp@atomide.com>
	<CAHCN7x+b2_dnpRs8RarhhgTfBrTVfGfmcQNbfHLoWBwkZ_3Puw@mail.gmail.com>
	<Y8WEoxiOXgZNB1Oc@atomide.com>
	<Y8jxjBZrPV0n363P@atomide.com>
	<20230122100852.32ae082c@aktux>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Revisiting it again...

Am Sun, 22 Jan 2023 10:08:52 +0100
schrieb Andreas Kemnade <andreas@kemnade.info>:

> On Thu, 19 Jan 2023 09:30:20 +0200
> Tony Lindgren <tony@atomide.com> wrote:
> 
> > * Tony Lindgren <tony@atomide.com> [230116 17:33]:  
> > > * Adam Ford <aford173@gmail.com> [230116 17:00]:    
> > > > Doesn't this imply the target-module stuff needs to be implemented for
> > > > the drivers?  It looks like a lot of the omap3 drivers are still using
> > > > hwmods although some have target-modules. In this case, the mcspi
> > > > drivers that Andreas is disabling don't appear to have target-module
> > > > stuff configured.    
> > > 
> > > Sorry I don't remember if omap_device.c ignores status disabled or not.
> > > But in any case, it should be trivial to update omap3.dtsi to configure
> > > some of the devices like mcspi to probe with device tree data and ti-sysc
> > > as needed.    
> > 
> > So as long as gta04 power management still behaves with this patch it
> > should good to go.
> >   
> # sleep 10 ; /usr/local/bin/idledump
>      CM_IDLEST1_CORE 00000042

RAM + SCM on, no issue, cross-checked, force-enabling mcspi brings more
activity, so this an indication thet mcspi is off.

>      CM_IDLEST3_CORE 00000000
>      CM_FCLKEN1_CORE 00000000

same here with force-enabling mcspi, brings in some bits set.

>      CM_FCLKEN3_CORE 00000002

see comments below.

>      CM_CLKSTST_CORE 00000003
>      CM_IDLEST_CKGEN 00000209

this becomes 1 without this patch.

>     CM_IDLEST2_CKGEN 00000000
>        CM_FCLKEN_DSS 00000000
>        CM_IDLEST_DSS 00000000
>        CM_FCLKEN_CAM 00000000
>        CM_IDLEST_CAM 00000000
>        CM_FCLKEN_PER 00000000
>        CM_IDLEST_PER 00000000
> 
> 
> FCLKEN3_CORE becomes 0 after unbinding the bandgap sensor.
> 
> but...
> # cat /sys/kernel/debug/pm_debug/time 
> usbhost_pwrdm (ON),OFF:830267486567,RET:0,INA:0,ON:12202880865
> sgx_pwrdm (INA),OFF:0,RET:0,INA:841224365234,ON:1245971680
> core_pwrdm (ON),OFF:0,RET:0,INA:0,ON:842470336914
> per_pwrdm (ON),OFF:520406799328,RET:30043365464,INA:0,ON:292020111087
> 
> hmmm.... 
> 
> but does not look like anything related to mcspi*.
> 
it does not look like, but it is, but how... There is something below
my radar.

Regards,
Andreas

