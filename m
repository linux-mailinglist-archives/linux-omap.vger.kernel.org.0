Return-Path: <linux-omap+bounces-2516-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7BF9B5F94
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 11:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 095311C21653
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 10:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA591E47BE;
	Wed, 30 Oct 2024 09:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="0G2ooS5b"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC381E32AD;
	Wed, 30 Oct 2024 09:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730282186; cv=none; b=muG85X6RA1ydyIWqA9jQ02tq275Pe0nWllDGQ+X5Y6arCKSl+2JGJU6KzirZkLlaJlNNRUbHtTrV73pP9FClJK4/Rvc/rWkqCm6qqjoFNdpNDcqZBbyofIRd+32tWeBYeBt9A7CIVFBShCQsBTtVF8NwAeq5uqhHxHJ3+WNmQIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730282186; c=relaxed/simple;
	bh=Fe2eG9Jmf4djeiClg4bquZ5moNufN209JDLhHiwvV20=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ptOiFDxWNb7jc8YEpAwc99ChTBQB7WpHYT+jEoCZ5A/ABsM0ZROIgtml8ZxzCHwLSsVsvqxSHiT5tGfwDANwJYJEb/mWy0aHFrr8+B8gHHAmvg18MK+MNNwvM3mvOdLWRP8UXZzGytWYmpru9l6TjM/Lxu58Ee3HlDZOIjckOgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=0G2ooS5b; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=Z+zOxK7XvoxIGG29B8Ttyc4QMy96SL01uQQpjXpelus=; b=0G2ooS5bHpykEsXEyxARrnRPu+
	zqyjILvuvdlIBAvYk5dK45nD85TQCU6B3aCw4oDgh0Fh4Dq13ESj0sqDmyXQm+UTaXEJfFz69UkSx
	69ctIu6AJo+tSHF92M9uWcOEpAMA1N9Pn8bsUBZthkF7k6W1GfvsnAQGWl0I7MxIQcSfLehB27phB
	r+bH6/yOW0CDJ8d0C4jkrFzpCcD3W3NOgAdT3pE1CPG6GGukIMNI+kklQXfanUBGDBjouVyyHUK+H
	3IrJ/9TcpWDBQhoVvSh0fjlNrIfEABZNiPX9IqG7gfNRRZBFDodB0+X+8SY7T4emtiDqmbxnjvZsf
	9OnvpOqg==;
Date: Wed, 30 Oct 2024 10:56:19 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: MightyM17 <bavishimithil@gmail.com>
Cc: bcousson@baylibre.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org, robh@kernel.org, tony@atomide.com
Subject: Re: v6.12 not booting on omap4, gpio errors
Message-ID: <20241030105619.2b156382@akair>
In-Reply-To: <20241030084919.102592-1-bavishimithil@gmail.com>
References: <20241030084919.102592-1-bavishimithil@gmail.com>
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

Am Wed, 30 Oct 2024 08:49:19 +0000
schrieb MightyM17 <bavishimithil@gmail.com>:

> Hello,
> In order to upstream my dts
> (https://gitlab.postmarketos.org/postmarketOS/pmaports/-/tree/master/device/community/linux-postmarketos-omap,
> patches 0001, 0002, 0003 and 0004), I applied it on a 6.12 tree which
> then failed to boot, with the following dmesg -
> https://pastebin.com/aEKHUjJB
> 
> It seems to be due to the gpios not being found, are there any recent
> changes that occured? Last 6.10 was working fine.
> 
hmm, it looks like you are booting into something with the pvrskm
driver included. So not mainline. Can you reproduce the issue with just
the 4 patches included?
Further I see userspace being booted:
[   31.257781] EXT4-fs (mmcblk0p2): re-mounted
cb68d54b-50cf-474d-a15c-1af846b82ff7 r/w. Quota mode: none. [
31.290374] EXT4-fs (mmcblk0p2): re-mounted
cb68d54b-50cf-474d-a15c-1af846b82ff7 r/w. Quota mode: none. [
31.335388] EXT4-fs (mmcblk0p1): re-mounted
63b9e6f7-469b-4e08-907f-429881db9ca6 r/w. Quota mode: none.

So what is the actual issue?

Regards,
Andreas

