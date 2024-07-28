Return-Path: <linux-omap+bounces-1792-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1681993E428
	for <lists+linux-omap@lfdr.de>; Sun, 28 Jul 2024 10:48:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA7F4281C2A
	for <lists+linux-omap@lfdr.de>; Sun, 28 Jul 2024 08:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EBC628DD1;
	Sun, 28 Jul 2024 08:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="FKiXAUWC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25091CFA9;
	Sun, 28 Jul 2024 08:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722156462; cv=none; b=EFvhOK0W94kAzWJhjCX/zTNdpLQLxFT8Ka6VJvPafQ6FKKoygFwqOddyqypEjybCRrbW0wgV1HCfPXjeVt1pHrPI4pWC00XgBvelm7Hi5zFtQ5MGuO4LWLIUuw83PJ7OihtzG3vJE7ZhA30yaEDOze6hjSPRLJVyLG01wYKXT74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722156462; c=relaxed/simple;
	bh=wkCTu1XgbZxHWtMNt9uk1vYk2H5PNPY7J4VdBbI3HnU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QVpJvLakVs47A0cf3PL6U4EqZ2f26iXay97rWJG8fgYIeUh/D2HnB7Rx//jHzZpkgrn0A0JwjOqyPubI8+lba/VhOagpXdMEMKNhJ6dcUnOPFCoHjCal+gEqsc/S+cnSBVXK6KvUXZEkpmIneXE12M49b9EhkkFPlimzxHSW0Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=FKiXAUWC; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=KFX/SC+Zxxjw9y7AUq6KQ/fBhSumCRs8PxWgkMO54jk=; b=FKiXAUWC8SmyYBnI2y/SiK7KMj
	3eZtsI+De4dkzQ95HfBI9Ar6cBuzTUyUVDfyG4C1fjN4Ew7wQi0TSDZNeJ1YLe1g43R1dEnYQ+l4n
	7z6HWp7gVs5RI9kdaDE2AZ012cxJ9aLE1jnKptecOBLjAlzqysYOlKE8Sz0xbGeLOHsgvnJGShtN6
	s08YCL17ih9XLIO6VSt/8RHA3L6ik+Q6EZ+NdeHSYEqB5MQVUJQfEPYqxD+CiZTCop+VBg1RxYutk
	f7PCjYuk/t5IMMobjxbvAx8efU8Fy7RDVdbvb1kffSL9HQ3ubK8x96ZbsjlBuZ2HXyOydedGVZn7Q
	UgK5SOxA==;
Date: Sun, 28 Jul 2024 10:06:58 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Sicelo <absicsz@gmail.com>
Cc: tony@atomide.com, linux-omap@vger.kernel.org,
 maemo-leste@lists.dyne.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org, Aaro Koskinen
 <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] ARM: dts: omap3-n900: correct the accelerometer
 orientation
Message-ID: <20240728100658.0001864d@akphone>
In-Reply-To: <ZqU_UPQHCJ37qZfa@tp440p.steeds.sam>
References: <20240722113137.3240847-1-absicsz@gmail.com>
	<ZqU_UPQHCJ37qZfa@tp440p.steeds.sam>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.37; aarch64-alpine-linux-musl)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 27 Jul 2024 20:41:20 +0200
Sicelo <absicsz@gmail.com> wrote:

> On Mon, Jul 22, 2024 at 01:31:11PM +0200, Sicelo A. Mhlongo wrote:
> > Negate the values reported for the accelerometer z-axis in order to
> > match Documentation/devicetree/bindings/iio/mount-matrix.txt.
> > 
> > Fixes: 14a213dcb004 ("ARM: dts: n900: use iio driver for
> > accelerometer")
> > 
> > Signed-off-by: Sicelo A. Mhlongo <absicsz@gmail.com>
> > ---
> >  arch/arm/boot/dts/ti/omap/omap3-n900.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/ti/omap/omap3-n900.dts
> > b/arch/arm/boot/dts/ti/omap/omap3-n900.dts index
> > 07c5b963af78..4bde3342bb95 100644 ---
> > a/arch/arm/boot/dts/ti/omap/omap3-n900.dts +++
> > b/arch/arm/boot/dts/ti/omap/omap3-n900.dts @@ -781,7 +781,7 @@
> > accelerometer@1d { 
> >  		mount-matrix =	 "-1",  "0",  "0",
> >  				  "0",  "1",  "0",
> > -				  "0",  "0",  "1";
> > +				  "0",  "0",  "-1";
> >  	};
> >  
> >  	cam1: camera@3e {
> > -- 
> > 2.45.2
> >   
> 
> CC: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
> <andreas@kemnade.info>
> 
I would expect it to be a rotation matrix but it is not. So maybe this
should be fixed in,the driver?

Regards
Andreas

