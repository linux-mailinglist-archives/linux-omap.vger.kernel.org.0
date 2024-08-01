Return-Path: <linux-omap+bounces-1821-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D838944450
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2024 08:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AC239B23FC8
	for <lists+linux-omap@lfdr.de>; Thu,  1 Aug 2024 06:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D30E16DC18;
	Thu,  1 Aug 2024 06:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="FJrNpu3e"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08ED21A3BB1;
	Thu,  1 Aug 2024 06:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722492871; cv=none; b=Ab/cgqOZdMBWzZswPUNTnl0mwj9xfsxhFDTcKQNxtYN+ZxpfN/NLiOUR6BxoS0gRN4jryGIY+zoPqdTBBn2nzxh9SB+Rn42mntj0/dqMr5F6CHMGurDHlc1yOVDhSNnJIVzroTTyYCJwig8vugYWXaR8UQve6BLFHCLn9XHgn/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722492871; c=relaxed/simple;
	bh=mheeKTBgP71Lh0GEwqMXV7bF45lg/JDZTzRDjIoVLss=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=F8TlNXfEWbDb4eWwPdXOyUVIrWa0nPtBaZWyEfHRwsVSYJ6aQb5v5Fl9gcHxx7DrvWmUHMpVsW+k3Q/7TlLdDKczu6CVHr15wCshvMIA/GR0TEPu6Kp0bdo5gCJZMWrEzWGTzjm6GjsFsRVXmAyr00dPHE5FAomK0juunxAAvNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=FJrNpu3e; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9Hl43r3H3KJjFvw7Ei6QBZOSB1URtWg3J8BiG6j6oYM=; b=FJrNpu3eJoWgRq5ZvrORU11DRE
	ewJ3s4nWmBSLUGS4/ia2l7WMGFXBP13/o7Odt7QEGK6CDRVOjgOeNhfEloF1gpHGOhlJPFqzfu8Pi
	GnM7vGEQ2Oz+9RJwU/NZKh+U7J5n4Porybp5E4eWFATgQnuL1E2Lmmaq7rWX5ewe0PWF5scIydk8U
	6OwVDJG8+fi1qrUxGmFjJPlvZCVmUEeZic3e4ypykEKM591hEe7XaltfEQFPrFOiHIXRqoiXzVL2r
	TYE1Y20JbihTx47oXPFAfF0zmk6pS7mHTPePurzqYA4W8+Igh1gTmCgWQZcLWkdzWdT1OIjq4/SgV
	d2WtjoJg==;
Date: Thu, 1 Aug 2024 08:14:12 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Sicelo <absicsz@gmail.com>
Cc: tony@atomide.com, linux-omap@vger.kernel.org,
 maemo-leste@lists.dyne.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, Aaro Koskinen
 <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] ARM: dts: omap3-n900: correct the accelerometer
 orientation
Message-ID: <20240801081412.55d1792c@kemnade.info>
In-Reply-To: <Zqf-NosCToA_czCQ@tp440p.steeds.sam>
References: <20240722113137.3240847-1-absicsz@gmail.com>
	<ZqU_UPQHCJ37qZfa@tp440p.steeds.sam>
	<20240728100658.0001864d@akphone>
	<Zqf-NosCToA_czCQ@tp440p.steeds.sam>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 29 Jul 2024 22:40:22 +0200
Sicelo <absicsz@gmail.com> wrote:

> Hello Andreas
> 
> On Sun, Jul 28, 2024 at 10:06:58AM +0200, Andreas Kemnade wrote:
> > > On Mon, Jul 22, 2024 at 01:31:11PM +0200, Sicelo A. Mhlongo
> > > wrote:  
> > > > Negate the values reported for the accelerometer z-axis in
> > > > order to match
> > > > Documentation/devicetree/bindings/iio/mount-matrix.txt.
> > > > 
> > > > Fixes: 14a213dcb004 ("ARM: dts: n900: use iio driver for
> > > > accelerometer")
> > > > 
> > > > Signed-off-by: Sicelo A. Mhlongo <absicsz@gmail.com>
> > > > ---
> > > >  arch/arm/boot/dts/ti/omap/omap3-n900.dts | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/arch/arm/boot/dts/ti/omap/omap3-n900.dts
> > > > b/arch/arm/boot/dts/ti/omap/omap3-n900.dts index
> > > > 07c5b963af78..4bde3342bb95 100644 ---
> > > > a/arch/arm/boot/dts/ti/omap/omap3-n900.dts +++
> > > > b/arch/arm/boot/dts/ti/omap/omap3-n900.dts @@ -781,7 +781,7 @@
> > > > accelerometer@1d { 
> > > >  		mount-matrix =	 "-1",  "0",  "0",
> > > >  				  "0",  "1",  "0",
> > > > -				  "0",  "0",  "1";
> > > > +				  "0",  "0",  "-1";
> > > >  	};
> > > >  
> > > >  	cam1: camera@3e {
> > > > -- 
> > > > 2.45.2
> > > >     
> > > 
> > > CC: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
> > > <andreas@kemnade.info>
> > >   
> > I would expect it to be a rotation matrix but it is not. So maybe
> > this should be fixed in,the driver?  
> 
> The mount matrix is documented in the kernel docs [1], and this patch
> implements the suggestion that the z-axis should "be negative under
> the screen and positive in front of it, toward the face of the user."
> 
> On the N900, the accelerometer is mounted such that the raw z-values
> are opposite to the specification in the kernel docs. The driver
> itself seems to be correct, and is used on a number of other boards
> (such as Motorola Droid 4), reporting expected values when used in
> conjuction with mount matrices.
> 
Ok, I did not notice the other -1. It was mirroring before and now it
is a clear 180 deg turn on the y-axis.

So
Reviewed-By: Andreas Kemnade <andreas@kemnade.info>


