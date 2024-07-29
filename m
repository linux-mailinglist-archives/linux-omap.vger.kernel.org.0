Return-Path: <linux-omap+bounces-1799-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B4993FF9D
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jul 2024 22:40:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94A13283A47
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jul 2024 20:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBBE4189F27;
	Mon, 29 Jul 2024 20:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="idoXaJ/V"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03AE14601E;
	Mon, 29 Jul 2024 20:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722285639; cv=none; b=pIo4xBv7BiEDglCMYeundHUaKnPylUhzFFnrpf+xPTetCoJLsprgchSGWAJ0iQ7AkbWELM1krooXIwoelxzr6amjBo7LstsxX48biaiz+umrZ+xDQSswQZSnMGaPdpRMwX+8EToH1hQO5EfHI6V6JXtESUBwqXUMbBEBJsyHK/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722285639; c=relaxed/simple;
	bh=Vy8JdXDw1XfAmLV6Z9SHmUhGP36VprPtP1X5qnDehj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oICBhpBhXdsEYgvedVFKgSdESnTSY4f0P98YdTHBFTNpEno7zH9MshrfsMZ1Pulc6dh7lzU7+fv0n1gA6i3ocRd5bVXMELoxFXv+dMbUwUPPTUcfpluFWWkO1+mXhAPBmQHnEUjjLMQwksZlpvB8HgvPgXX5AJn+dzpGcP9yhyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=idoXaJ/V; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-428141be2ddso20386195e9.2;
        Mon, 29 Jul 2024 13:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722285636; x=1722890436; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rq+JYssKdPU95PWekAjV2U0WcUbJ7MXMWsw4i+/X8iw=;
        b=idoXaJ/VSoTyLlFFXaLvAa3E9sVICSGh1Og0+F0ADKBCVNEwgcI5uvMDEocfFTLmrF
         ZcvdyxZVKOcnVAleG+ueG7UZ86QkMWaY7xO+0pMVwuiKsTaCXoL/DOSTYrHWF9ztbD7r
         nqTtkxUZQOUfjmtQlAGgoKqE3LUTyclkL0rnAif+N9tcCKwF5x4RySPh7/0xpTAs4XH0
         z5olmH9Er19cWTM6fR6Vc4C94UtLfJ0jyDFsoWBZ/RL5RtcpkLrRkRmZO87ME5u7Kbnz
         VJjwVTqDhLHQvVXCt6fKK1CXeOgk/yhXv8qt8iQx65RelWxvvT78tNklJeqmTLdj0CSg
         tufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722285636; x=1722890436;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rq+JYssKdPU95PWekAjV2U0WcUbJ7MXMWsw4i+/X8iw=;
        b=ZzZykdRexPkSEZiK88IlgGTtwhkKzp7yGIDgfxRKgZSTEEwEMfqZMocrGf5TeDO+1L
         CdMNjza3g2DLVh2EHoUhbNmqNbuzuEJBJ0pob+alUfHsmjSlWe4hSYkJpjFh5amhVge8
         scLNaI0O9Xi3wAmUxd0V6OW9Je9D5vg9aTRI0+sVIZWKg0vjylu1ctVQYkllbbv4LUUA
         d8glyDlUxQWJKUSzIQC3pXx1dMFSJ1cyM3vcxcuAOc87q9YWp7Empt5/fM2Ds2sko+Do
         ostiCZKPuM6Vp3NCuZYjIbw7OukVU20yEIIu91I8XZahsSQq2YPj+oLG9bElpEGlHjkc
         5FEg==
X-Forwarded-Encrypted: i=1; AJvYcCV0eyS6q6G1teqUlyqrqF00AKMO0vSTL6gGf+PwD43CJztVvbgs4zF/fPwd+KbFtE9uPKTg05N5tutrW3y0FYPEAx9QMnKShpZIPbN0sBF8q58IkI0XNFLJLhYTAey3kI5judMSue0=
X-Gm-Message-State: AOJu0YzaLe55rf3jJM0vQ57yKG3VAvsF9d3ao1BMTnHgWl9QuRHaJwG6
	DcIYSIwp0ebqrqGo+qCKRpntQR0fncbKsnDy75ZbZeBbXN7uJBK+
X-Google-Smtp-Source: AGHT+IG05AWEMxKvjbxKVaqKlVeGt7iQUkLNmXQumGlS7RLzyBBtfq1yAkpuBU87nLFq0iKWcyyosQ==
X-Received: by 2002:a05:600c:444d:b0:426:6e95:78d6 with SMTP id 5b1f17b1804b1-42811d71018mr56853145e9.4.1722285635677;
        Mon, 29 Jul 2024 13:40:35 -0700 (PDT)
Received: from tp440p.steeds.sam ([2602:fbf6:10:a::2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428175e60b7sm84572055e9.42.2024.07.29.13.40.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 13:40:35 -0700 (PDT)
Date: Mon, 29 Jul 2024 22:40:22 +0200
From: Sicelo <absicsz@gmail.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: tony@atomide.com, linux-omap@vger.kernel.org,
	maemo-leste@lists.dyne.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] ARM: dts: omap3-n900: correct the accelerometer
 orientation
Message-ID: <Zqf-NosCToA_czCQ@tp440p.steeds.sam>
References: <20240722113137.3240847-1-absicsz@gmail.com>
 <ZqU_UPQHCJ37qZfa@tp440p.steeds.sam>
 <20240728100658.0001864d@akphone>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240728100658.0001864d@akphone>

Hello Andreas

On Sun, Jul 28, 2024 at 10:06:58AM +0200, Andreas Kemnade wrote:
> > On Mon, Jul 22, 2024 at 01:31:11PM +0200, Sicelo A. Mhlongo wrote:
> > > Negate the values reported for the accelerometer z-axis in order to
> > > match Documentation/devicetree/bindings/iio/mount-matrix.txt.
> > > 
> > > Fixes: 14a213dcb004 ("ARM: dts: n900: use iio driver for
> > > accelerometer")
> > > 
> > > Signed-off-by: Sicelo A. Mhlongo <absicsz@gmail.com>
> > > ---
> > >  arch/arm/boot/dts/ti/omap/omap3-n900.dts | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/arch/arm/boot/dts/ti/omap/omap3-n900.dts
> > > b/arch/arm/boot/dts/ti/omap/omap3-n900.dts index
> > > 07c5b963af78..4bde3342bb95 100644 ---
> > > a/arch/arm/boot/dts/ti/omap/omap3-n900.dts +++
> > > b/arch/arm/boot/dts/ti/omap/omap3-n900.dts @@ -781,7 +781,7 @@
> > > accelerometer@1d { 
> > >  		mount-matrix =	 "-1",  "0",  "0",
> > >  				  "0",  "1",  "0",
> > > -				  "0",  "0",  "1";
> > > +				  "0",  "0",  "-1";
> > >  	};
> > >  
> > >  	cam1: camera@3e {
> > > -- 
> > > 2.45.2
> > >   
> > 
> > CC: Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
> > <andreas@kemnade.info>
> > 
> I would expect it to be a rotation matrix but it is not. So maybe this
> should be fixed in,the driver?

The mount matrix is documented in the kernel docs [1], and this patch
implements the suggestion that the z-axis should "be negative under the
screen and positive in front of it, toward the face of the user."

On the N900, the accelerometer is mounted such that the raw z-values are
opposite to the specification in the kernel docs. The driver itself
seems to be correct, and is used on a number of other boards (such as
Motorola Droid 4), reporting expected values when used in conjuction with
mount matrices.

There is not a lot of userspace that uses accelerometer z-axis
information, hence I could not perform thorough testing for the z-values
when I submitted 14a213dcb004 ("ARM: dts: n900: use iio driver for
accelerometer"). The error became evident when Maemo Leste gained
support for face up and face down device states [2]. With the patch in
this thread, userspace reports correct face up/down information.

I hope I have not misunderstood your reply, and please let me know if I
am missing something.

Sicelo A. Mhlongo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/iio/mount-matrix.txt#n31
[2] https://github.com/maemo-leste/mce/commit/0dac5a7e4286b5e9a4dafc627c49cef8cc92f092

