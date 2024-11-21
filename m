Return-Path: <linux-omap+bounces-2718-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D16879D509C
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2024 17:21:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DC4C1F21F2C
	for <lists+linux-omap@lfdr.de>; Thu, 21 Nov 2024 16:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB09176AB9;
	Thu, 21 Nov 2024 16:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="AbtmlJqI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B71315887C;
	Thu, 21 Nov 2024 16:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732206087; cv=none; b=hZKCC01pOdxXzpX7C6IB95Exvokb3vN272c297V/fwXCNL2fG73V7uADxV8M+7qWd4828eCyOWBU8tmtFnU/IEAILXNV84TeRdkYfn55SXFQ6Vu3epV7hxx5XdkfLdL31aT2C/SZupSXD4MjeLPOrC8xSG3T4EUr6+VSMN70nFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732206087; c=relaxed/simple;
	bh=dS8zJ7iQ/UYV1gaG03zDF6XXEZ1Xtpdd1Bh+TQ3XWJw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GXIDY/IB3PPq1DGB/EAl5TYDslQSl5/2kksMgA0TKjX2kSWqlN5cMH4gBPJmuYo1f8w7YzfA8pTWdZZhKjgy83oZIyhFdF7Hh57tz3k138sxtZ7mqUcRNKMl3haZ4LBJT/x2nVt3da9cdIzswq8e/ujKCG4T/qnGOxQwD88sGVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=AbtmlJqI; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NvDE7O0jjICDQ9NrhZJeIIgFCkvS28y0b4rNX6BWUCA=; b=AbtmlJqIe7tJsI5mRzO2cAJ6KV
	vJu4D40Dayz+7BGCvugfo9xRKtq/90f8bl7ws4NTXiPy6sHid8uMcqiYXqZdQqhQ99SW3nu8UiMxq
	y8MdfkoyWH7gJxLOPLGH86MXRSSlGDABmV/aLv3YLkW+C56LTMqLjEFS6C1j3mRtqDl5gDxreQD/k
	ddjPCITZynOteD/l+GZq2GJFKAGh7vynA0KwAPu/liXHVMYGnMJqsfe4YP4ytBmsfn0AwgfFiAYPW
	YbtMhwZvLCievlGjW+xQzUlcNiNP0ycclkL3aMCqsipl6tqwRyVdGFydykulkMgnFjUHcmY3XM1QN
	4+r8vDOQ==;
Date: Thu, 21 Nov 2024 17:21:19 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Unknown <devnull@uvos.xyz>
Cc: Laurent Pinchart  <laurent.pinchart@ideasonboard.com>,
 linux-omap@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>, Linux Media
 Mailing List  <linux-media@vger.kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>
Subject: Re: [PATCH] media: staging: drop omap4iss
Message-ID: <20241121172119.4b46727e@akair>
In-Reply-To: <1aa03cb201857f70bc46143a16465f0a08870401.camel@uvos.xyz>
References: <815a789d-85a5-44a1-8b9c-429ac0101e3f@xs4all.nl>
	<20241118200025.3daab676@akair>
	<20241119070222.GX31681@pendragon.ideasonboard.com>
	<20241120085406.4d864c6e@akair>
	<1aa03cb201857f70bc46143a16465f0a08870401.camel@uvos.xyz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Thu, 21 Nov 2024 12:40:37 +0100
schrieb Unknown <devnull@uvos.xyz>:

> Hi,
> 
> > BT200 has a camera without mainline sensor driver.
> > Droid4 has also a camera. What is the status of the sensor driver?
> > What about the samsung-espresso tablets? And the xyboards?  
> 
> Same as your device droid4 and xyboard handle the camera via m3
> firmware.
> The droid 4's rear camera is totaly unkown with no datasheed or open
> source driver known to exist.

that page suggests that there is an open source driver for the
rear camera:

https://elektranox.org/2018/02/0025-droid-camera/

Quoting:
https://searchcode.com/file/50297519/drivers/media/video/msm/sensors/ov8820_v4l2.c

BTW:
Bt200 has OV7692

> The front camera has avaialble datasheed and out of tree driver.
> The xyboards cary the same sensor as the d4's rear module.
> 
> We (maemo leste, a distro that has put considerable effort into
> bringing up the droid 4, droid bionic and xyboard) do hope to
> eventually bring up the front camera on the droid, as all the
> componants for this are floating around, but are currenly not working
> on this issue.
> 
So summary:
there are potential real users of omap4-iss. Apparently all of them
require besides a working a omap4-iss to work on some sensor driver to
have something useful.

If omap4-iss would be known-working there are probably better chances
that more jump in.

Regards,
Andreas

