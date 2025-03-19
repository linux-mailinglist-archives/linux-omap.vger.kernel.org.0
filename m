Return-Path: <linux-omap+bounces-3439-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D88A6840E
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 05:02:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 16A7C42369C
	for <lists+linux-omap@lfdr.de>; Wed, 19 Mar 2025 04:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95418206F18;
	Wed, 19 Mar 2025 04:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="qf36ci9E"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD92021364;
	Wed, 19 Mar 2025 04:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742356928; cv=none; b=X6o7igM25eHdgcTWVTJeHsIFAeR/dEVVz2NcIDpd9m4G3bOeka5NHilpDxS7Ht8LdkLDnUzHpUbumxP4JW9M/0T5FpZK0WW2Ye9SO/m2spT3FipwNOYoQRiICyCoKDV7Iv0H/VKsRQhKnae5Kwrwuf/FXYOSjmPFFdDoU+fbqd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742356928; c=relaxed/simple;
	bh=fOrPNVam1pp2mboD70Wkd2CrOQySoRKMMq8x7u6IPK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kouKerBNCMMkg7pKbYapg9zropF/zbuvpapcMtZljXDYiurhS5+KzWF8n/zJXNKuBNqQittbvc5R+mRRMB0bnZvn641oL44Cce2CGRJZ6zvsa60EFNAW8xshCLyHLuHXwH3+GFKUBsgt1GyoEVmR2dWdRMKjBtZd/UL7jvw2Ngs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=qf36ci9E; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 900B1603CF;
	Wed, 19 Mar 2025 03:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1742356583;
	bh=fOrPNVam1pp2mboD70Wkd2CrOQySoRKMMq8x7u6IPK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qf36ci9EzYJE6tcSpFViXgI2QU7/8ccXVLc+6cChOv/w5B7lY1c0QCOW/Dg9husNa
	 YavYJAxvYZufubUMwbWrIfFLXS+DvIjOTuHuJ+2lMpHNt6NuUnkpu3RNwySD6YSKmN
	 Y0sQBDTec3G+KDU/nqSxPMHOt8MNrSBs5jjM3V3eMIK8qNgpIi4GM3H6XIwUruf5JZ
	 Z2NRpSzpBX/5j/TJguCt3h8WJAo5wBfjDQRuODPRB6s0rSGyszlgyZcdt3X2y+BVaz
	 5Uqy/bO+37Dn6n1zl0WS2HqwN73T8qVHfd1qopIZQSyqVVkVzNQkSNNHQyzyKVhULN
	 kIocipDvHBY+w==
Date: Wed, 19 Mar 2025 05:56:06 +0200
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
Message-ID: <20250319035606.GA4957@atomide.com>
References: <20250313094708.1003092-1-alexander.sverdlin@siemens.com>
 <20250313202129.0dcfc44e@akair>
 <6348326299702a12ed4faa6ea25ee8bbe5e232aa.camel@siemens.com>
 <20250313230148.792f224b@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250313230148.792f224b@akair>

* Andreas Kemnade <andreas@kemnade.info> [250313 22:01]:
> Am Thu, 13 Mar 2025 20:42:23 +0000
> schrieb "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>:
> 
> > Hi Andreas!
> > 
> > On Thu, 2025-03-13 at 20:21 +0100, Andreas Kemnade wrote:
> > > > This reverts commit 4700a00755fb5a4bb5109128297d6fd2d1272ee6.
> > > > 
> > > > It brakes target-module@2b300050 ("ti,sysc-omap2") probe on AM62x in a case
> > > > when minimally-configured system tries to network-boot:
> > > >   
> > > brakes or breaks? To unterstand the severity of the issue...  
> > 
> > Thanks for the correction, it should have been "breaks"...
> > 
> > > > [    6.888776] probe of 2b300050.target-module returned 517 after 258 usecs
> > > > [   17.129637] probe of 2b300050.target-module returned 517 after 708 usecs
> > > > [   17.137397] platform 2b300050.target-module: deferred probe pending: (reason unknown)
> > > > [   26.878471] Waiting up to 100 more seconds for network.
> > > > 
> > > > Arbitrary 10 deferrals is really not a solution to any problem.  
> > > 
> > > So there is a point where no more probe of anything pending are
> > > triggered and therefore things are not probed?  
> > 
> > Because there is a point indeed (if we configure quite minimal set of drivers just
> > enough to mount NFS) when deferred probes are not triggered any longer.
> > 
> > > > Stable mmc enumeration can be achiever by filling /aliases node properly
> > > > (4700a00755fb commit's rationale).
> > > >   
> > > yes, it does not look like a clean solution. And we have the
> > > proper aliases node in many places. What I am a bit wondering about is
> > > what kind of sleeping dogs we are going to wake up by this revert. So I
> > > think this should be tested a lot esp. about possible pm issues.
> > > 
> > > Not every dependency in the sysc probe area is properly defined.  
> > 
> > But the patch I propose to revert is really not a solution for missing
> > dependencies on syscons. I'm fine with not propagating this to stable,
> > but reverting in master should give enough time for older SoCs to test,
> > WDYT?
> >
> I am not against your revert proposal and not against propagating it
> to stable, I would just like to see some Tested-Bys before it gets
> applied to anything. If anything nasty pops up, it should be solved in a
> cleaner way then with the offending patch.

Sounds like for the AM62x problem there is simply some resource missing
that needs to be configured. Did you track down which resource is causing
the deferred probe without the revert?

Reverting the commit does not really fix the root cause. It just ignores
the problem of the hierarchy of the interconnect instances. Some of the
interconnect instances are always-on, and contain devices providing
resources for the other interconnect devices. So I would not consider
patching MMC aliases all over the place as an alternative to fixing the
real problem :)

Regards,

Tony

