Return-Path: <linux-omap+bounces-428-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27FF8403A9
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jan 2024 12:17:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D51A01C22A14
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jan 2024 11:17:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0BF45B20F;
	Mon, 29 Jan 2024 11:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="i2gnTnLN"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E0F55E7B
	for <linux-omap@vger.kernel.org>; Mon, 29 Jan 2024 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706527072; cv=none; b=V1Q4lpVouJseTqcAoqoj6FXWuoNS+m/ffurYecEZAx0qAFdY8OHZBP5VEgLzGV4zPAO0C81J5V9zf+unIiXVX6xPbK7ypkLu1D8/s959IOEs8vu2Z8kMkCIb/D2f6IYpxYdMl745860pq7JEhPQMPV6nXXMtOv+mrXJOXeEiGHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706527072; c=relaxed/simple;
	bh=FRAPI0OEmp8tO02zOu6mitH58chsmGjMgw6hcqIRkTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkndrzVnYvjjfm2f+4P0vow0pa284EHTl1ga5opmDnZ0FrtTyqX14+Z6HZ627Jmv8HDKSH6ehpYIMb6Y9IRig4HrRHCknkGK1hwLrMQFa/t9QWBNx7+zoSFqydU110HnLtLJQFQsDDdU1Ai7pkZO1oY3FIcrtvArzN9OTV3+iTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=i2gnTnLN; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 0BA8760531;
	Mon, 29 Jan 2024 11:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1706527062;
	bh=FRAPI0OEmp8tO02zOu6mitH58chsmGjMgw6hcqIRkTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=i2gnTnLN+0urkY4EeYslX8dPE3aLlgRazHqMk7rmvGr8L+Qu/VQImdqf4aZy5bLXl
	 ZOYHOcuZ4JLVQxiw8XZvBeGF0tq97Q/cTl8mEFrYoQmtttmjrDNMVNVtnbZHvrq2d9
	 bjU4nAnETIkPXuHhrnyHwyt5X/c+Wmvr5BKmzQY8gKzs41ILVDto7aYljfXPupnR49
	 lYhVFcglXyStkwGTkxsH9pp0YAqyd9mydI13XoBygqCPUOywNu8N2P5rUeSxS4+yfE
	 lXBxV1W2rDSUWrJbM/5bNMnxzvRruUzpBcewIvobvUD2VLZSCti5wCiDGRv4U7/nnd
	 FrNrGggRGxpqQ==
Date: Mon, 29 Jan 2024 13:17:33 +0200
From: Tony Lindgren <tony@atomide.com>
To: Romain Naour <romain.naour@smile.fr>
Cc: Linux-OMAP <linux-omap@vger.kernel.org>, Nishanth Menon <nm@ti.com>
Subject: Re: sdhci-omap: issues with PM features since 5.16
Message-ID: <20240129111733.GX5185@atomide.com>
References: <2e5f1997-564c-44e4-b357-6343e0dae7ab@smile.fr>
 <20240127044851.GW5185@atomide.com>
 <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d09925b3-83e6-4c52-878f-4c1db7670543@smile.fr>

* Romain Naour <romain.naour@smile.fr> [240129 10:11]:
> Hello,
> 
> Le 27/01/2024 à 05:48, Tony Lindgren a écrit :
> > Hi,
> > 
> > * Romain Naour <romain.naour@smile.fr> [240126 20:53]:
> >> Hello,
> >>
> >> I'm upgrading the kernel from 5.10.168 to 6.1.69 (both from TI tree) on a custom
> >> board based on a AM574x SoC and I noticed a regression on the sdhci-omap driver.
> >>
> >> The emmc was working on the 5.10 kernel using mmc-hs200 powered at 1,8v (mmc2).
> > 
> > Is this limited to emmc or does it also happen with the micro-sd or wlan possibly?
> 
> I can't test with a wlan device but I noticed the same issue on micro-sd (the
> mmc0 interface in my first post is a micro-sd)

OK

> > If the issue is emmc related, do you have mmc-pwrseq-emmc configured in the dts?
> > 
> >> I'm able to reproduce on the IDK574x evaluation board (where the emmc is powered
> >> at 3v3) with vanilla kernels.
> > 
> > OK, looks like only am5729-beagleboneai.dts has configured mmc-pwrseq-emmc.
> > 
> >> I had to revert all commits related to "PM runtime functions" [1] and "card
> >> power off and enable aggressive PM" [2] from kernel 5.16 to use the emmc again
> >> on both boards.
> > 
> > OK, this sounds like power sequence related when the emmc gets idled.
> 
> It seems mmc0 ios infos are lost at some point, just after the kernel boot they
> are correct:
> 
> cat /sys/kernel/debug/mmc0/ios
> clock:		50000000 Hz
> vdd:		21 (3.3 ~ 3.4 V)
> bus mode:	2 (push-pull)
> chip select:	0 (don't care)
> power mode:	2 (on)
> bus width:	2 (4 bits)
> timing spec:	2 (sd high-speed)
> signal voltage:	0 (3.30 V)
> driver type:	0 (driver type B)
> 
> And without notice, ios became wrong:
> 
> cat /sys/kernel/debug/mmc0/ios
> clock:		0 Hz
> vdd:		0 (invalid)
> bus mode:	2 (push-pull)
> chip select:	0 (don't care)
> power mode:	0 (off)
> bus width:	0 (1 bits)
> timing spec:	0 (legacy)
> signal voltage:	0 (3.30 V)
> driver type:	0 (driver type B)
> 
> # cat /sys/bus/mmc/devices/mmc0:1234/type
> SD

With a beagle x15, the ios values are correct after I do
something like fdisk -l /dev/mmcblk0:

# cat /sys/kernel/debug/mmc0/ios
clock:          0 Hz
vdd:            0 (invalid)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     0 (off)
bus width:      0 (1 bits)
timing spec:    0 (legacy)
signal voltage: 0 (3.30 V)
driver type:    0 (driver type B)

# fdisk -l /dev/mmcblk0
...

# cat /sys/kernel/debug/mmc0/ios
clock:          50000000 Hz
vdd:            21 (3.3 ~ 3.4 V)
bus mode:       2 (push-pull)
chip select:    0 (don't care)
power mode:     2 (on)
bus width:      2 (4 bits)
timing spec:    2 (sd high-speed)
signal voltage: 0 (3.30 V)
driver type:    0 (driver type B)

So I'm still guessing your issue is with emmc not getting reinitialized
properly as there's no mmc-pwrseq-emmc configured. Can you give it a
try? See am5729-beagleboneai.dts for an example.

Regards,

Tony

