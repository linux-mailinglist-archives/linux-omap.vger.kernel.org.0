Return-Path: <linux-omap+bounces-2097-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD2596A637
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 20:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA523284BB8
	for <lists+linux-omap@lfdr.de>; Tue,  3 Sep 2024 18:10:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9062319005E;
	Tue,  3 Sep 2024 18:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="kA3mvLLq"
X-Original-To: linux-omap@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68A30F9DF;
	Tue,  3 Sep 2024 18:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725387018; cv=none; b=YLwQIMT/uF1XFULa0meaKqgQUtk9hpr5GQgAzFOPJI534DXf1A6dJBfQeZa6ai5SzsKhZsBi+yTXRYqM/KooQ0w40NE564S5MVMik6UyGzaEcJFVQ76HbHO54ncHj76bdi7vl3xxwz1AR/hYOnC/f4YU2n9v8f5brHEUQ/UTvKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725387018; c=relaxed/simple;
	bh=zVAUhXRHGgf2Ifhv4b5o/0Gn9PNneUNRm6sBJpLkmec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XdqdanMiv5NmgvbqAvMX6DZRMFOCgiJYf/0ekKEmH9yvAXM0xQ4bxXbV4Z2bppTowGHWELpyK62fiBjJzR1dh4lvtFiZ14BAtnCcbdTcL5eoQ0gUnEdIcTxG/Yg06VeNkxvEbyEeM0HcjYJ6ZdI7rhCVRU64AVxUdXImaNSRhWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=kA3mvLLq; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gRkEDbrL97a7XWyV1vQZFD5kTUiM/mZOT/r7ZhvOvyk=; b=kA3mvLLqv6Efq84zwZ11En9y50
	kwKh1AougOvAhA6RWsLL+PYXuu6Q7UkoP4gjmqGI08SU6Li0WcGfAbD5gSGneBncCsu0h1YeNGKOF
	jElUo78bPWG5TgLK89eRcyJ1HmDwGIf+o6X6FOq0czmSEMGZrAitVYr0FRrLtLSg7pHkTfoDB3IN0
	H8abBmjd/3AvhUUwrpO4RkCS8feXywkofa+aUiMh6bm34Q/g0IhLvfBDfpPOQhVjHmDJ8dP7oAgG8
	i2tFc2mgoGPfUeMirGwc0K5Dr1Qc6gmOVIGEQECFBx0nge7GxNkTFOF5VU7XUrz2lJM2wYuhIFoYO
	9Sfn39yQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:52434)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1slXyd-0007vM-2x;
	Tue, 03 Sep 2024 19:10:03 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1slXya-0002uf-1L;
	Tue, 03 Sep 2024 19:10:00 +0100
Date: Tue, 3 Sep 2024 19:10:00 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-omap@vger.kernel.org,
	linux-clk@vger.kernel.org, Paul Walmsley <paul@pwsan.com>,
	Tony Lindgren <tony@atomide.com>
Subject: Re: clk mess on omap4460 with mpu clock
Message-ID: <ZtdQ+Ay9DKAooahN@shell.armlinux.org.uk>
References: <20240603234139.280629b2@aktux>
 <CAMuHMdWU74DsWEZtZQJctQQog=9UCG_1LZu5yWvyxx0Zw4LQow@mail.gmail.com>
 <20240903143357.2532258b@akair>
 <CAMuHMdWF4G5Uon1=6TMzBogN2CX8EuiVBMuCPtAAMPNa-DtiOw@mail.gmail.com>
 <20240903192203.1dddbf0d@akair>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240903192203.1dddbf0d@akair>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Tue, Sep 03, 2024 at 07:22:03PM +0200, Andreas Kemnade wrote:
> Am Tue, 3 Sep 2024 14:36:05 +0200
> schrieb Geert Uytterhoeven <geert@linux-m68k.org>:
> 
> > Hi Andreas,
> > 
> > On Tue, Sep 3, 2024 at 2:34 PM Andreas Kemnade <andreas@kemnade.info>
> > wrote:
> > > Am Mon, 2 Sep 2024 15:53:07 +0200
> > > schrieb Geert Uytterhoeven <geert@linux-m68k.org>:  
> > > > On Mon, Jun 3, 2024 at 11:41 PM Andreas Kemnade
> > > > <andreas@kemnade.info> wrote:  
> > > > > just stumbled across this on 6.10-rc1:
> > > > >
> > > > > [    1.475830] ocp:target-module@48210000:mpu:fck: device ID is
> > > > > greater than 24 [    1.483154] ti-sysc
> > > > > ocp:target-module@48210000: could not add child clock fck: -12  
> > > >
> > > > And on boneblack:
> > > >
> > > > 48000000.interconnect:segment@200000:target-module@0:mpu@0:fck:
> > > > device ID is greater than 24
> > > > target-module@4b000000:target-module@140000:pmu@0:fck: device ID
> > > > is greater than 24
> > > >  
> > > > > Maybe
> > > > >         /*
> > > > >          * Use clkdev_add() instead of clkdev_alloc() to avoid
> > > > > the MAX_DEV_ID
> > > > >          * limit for clk_get(). If cl ever needs to be freed, it
> > > > > should be done
> > > > >          * with clkdev_drop().
> > > > >          */
> > > > > in ti-sysc.c does not work anymore?
> > > > >
> > > > > The offending clock definition is in omap4.dtsi
> > > > >
> > > > > clocks = <&mpuss_clkctrl OMAP4_MPU_CLKCTRL 0>;
> > > > >
> > > > > Did not bisect that yet.  
> > > >
> > > > Commit 8d532528ff6a6b1b ("clkdev: report over-sized strings when
> > > > creating clkdev entries") in v6.10-rc1, with follow-up commit
> > > > 616501eccb58615f ("clkdev: don't fail clkdev_alloc() if
> > > > over-sized") in v6.10-rc4.
> > > >
> > > > I have no idea if these clkdev registrations are still
> > > > necessary/used. 
> > > well, it might explain some mystery behavior in the past. Lets
> > > see where it comes from. As the comment says, there should be a
> > > workaround against that limitation. So the problem should not be
> > > there in the first place. I have some strange problems with
> > > clk_disable_unused.
> > >
> > > I first thought it is a id < 24 issue and not a strlen(something) <
> > > 24.  
> > 
> > Me too :-(
> > 
> Ok, setting
> MAX_DEV_ID to 64 in clkdev.c lets the warnings disappear. ti-sys.c
> has at one place precautions for overlong dev_ids, but on another place
> it happily calls clkdev_create() running into this issue. 
> 
> The follow-up commit then again at least does not cause a failure for
> dev registration. I am still unsure what the consequences are. Between
> 6.10 and 6.11 something interesting happened which makes the bt200
> reliably boot with near-mainline u-boot+spl even without
> clk_ignore_unused. So no frankenstein-boot (vendor X-Loader + new
> U-boot) anymore.

The bottom line: if you are getting warnings that the strings exceed the
existing sizes, then _any_ lookups using clkdev will have been failing.
Nothing has changed with that. The only thing that changed recently was
to print a warning for this case, and initially to fail the attempt to
register with clkdev. However, that broke stuff, so it was made not to
fail, but still report the problem.

Essentially, if you see the warning, the registration with clkdev is
both pointless and useless.

-- 
*** please note that I probably will only be occasionally responsive
*** for an unknown period of time due to recent eye surgery making
*** reading quite difficult.

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

