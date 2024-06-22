Return-Path: <linux-omap+bounces-1586-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BEA9134F5
	for <lists+linux-omap@lfdr.de>; Sat, 22 Jun 2024 18:01:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2AB62844D6
	for <lists+linux-omap@lfdr.de>; Sat, 22 Jun 2024 16:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7358416F82A;
	Sat, 22 Jun 2024 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YVzx0gFF"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF50F82492
	for <linux-omap@vger.kernel.org>; Sat, 22 Jun 2024 16:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719072104; cv=none; b=sG96rL6mq6woBW3A8fOVdhH3lZYdaW+maqI450JdP6mMNbIwpd8+GIvEDbDOUqciuHR1LDCr+39bRZ2W1bOW8+5J6aF+M7pLRwQ2TyNJgIRhnrt068NIaznPunadV9NJ0s1fK9Q3rjaQEIpgUa+ZiZxchs1m2Hx2/gzPuD5ane0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719072104; c=relaxed/simple;
	bh=ob6WcuxklzZnHBwl2vNues1841rct6ovIF1Z6N09ekc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mLSCvPA36lXI5vgaKfjnrEoATtfCq3DUaqjNOtdU4UABfQSM2nPMfsZGGNC6ZVt4c7Kw5UyVBpUftrk9xBYUFruxtpXtpqVeaQzPbk49BqADMUmtWjEF/JT0LMHloubezNjHD9Cv2Rah42VavNi5HeiEjz7ElTlM5cUKz6YRmdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YVzx0gFF; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2c81fe42e53so1250086a91.3
        for <linux-omap@vger.kernel.org>; Sat, 22 Jun 2024 09:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719072102; x=1719676902; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9CWpVFbmmEbw7GLbkN6l/on5jTRUET1YhlsKSVd46I=;
        b=YVzx0gFFa+14TWu5BAjR1knwawaz/bfmtZZ3PRnxf0NnO57slzclbOoNcY9dvovhPi
         d1+Ky/oQO+GkOIKXB1FqFTiVrNySyxQOBjDWvD0sZnQSxG4pbDnXN4O4DqGZZxZZUOwX
         KDrk2Sk6aUTF1jZAjNWCwFVkUzitmZBTJumFdxPmunuLtCFC8fqmWXbpw+j3C+oj8Jp9
         kfYexoRoAkwqG/jKb4DuS+CKwE6juE3dcgbg5gW1kCuIGE2rKO6do2JeUaWgEJI+fMle
         HoaH8nx2twYNcK6KIoV//pynQQTaoJQUBm/NJJWtsw8lqRdA5u82BSirT2r3BVMNAOLO
         Ed+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719072102; x=1719676902;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r9CWpVFbmmEbw7GLbkN6l/on5jTRUET1YhlsKSVd46I=;
        b=eAkDFAt90JMus8rWlFExAU4WCn0oYFZmVaXhl7KWEIkyuIErZIr1S0e89NUl1Pg9Iy
         patYSrmyZgHjyiuErs7lkZkoUTSLBAU+5gEaAX7n0juMJVVszbFNWE9mw02Gii/3h3Jq
         +uSLqwrxgXkTNGbCH0JXJFKt2PCkVVcZqtRGk9O3UAeIqQGEgswHwcP8WcU98ouXK2Mr
         nGTAUpubHHypRFOk/1P7jB3uZY3ioTVvL8QiTkDixg2wYIFfjEl8s/+81MGSJnPeywrg
         Sb+UxoowcY/ozRCmQKIGyzRG/9V3DLy+ry+eGsSxdjI3Tq06dPiOGv8oquTB1ilXFaLl
         Npyw==
X-Forwarded-Encrypted: i=1; AJvYcCXl5XeS232fn5U5Fuh9GqknMqIS5pxOaz5FTXjTMaWdSEQKd8YTTFXS6AQyv8OnTwkzdVSLQNmyVPPOPg8q9FxYqqsAiW+2GuG1jA==
X-Gm-Message-State: AOJu0Yy6K02qc8+0LPu+tfKMRCCwSsWSAjpjTkDHivi8ibYJK6W/89G2
	AfKo3/JX/gRBTlG8skYGydMfJCpKhkG8b3mhji5JtjW/mAkRkWMeReWDe0rhObbZQ81nN2aae8F
	RqQu2wSj/5dBVfNmRAqGof+k9oa8=
X-Google-Smtp-Source: AGHT+IFoa7kGPGNdW76ncioRHENWzpNCku+62JtRF1MQ7FV+m26Jn77/ht7D9YJ2Kpye6lnv2x3kNXhGZ5MGVoz1YOI=
X-Received: by 2002:a17:90b:3810:b0:2c7:9b4a:9896 with SMTP id
 98e67ed59e1d1-2c86146c795mr206142a91.36.1719072101734; Sat, 22 Jun 2024
 09:01:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAHCN7x+PAsFBhKyUUdbW2_diZ9PX=-Keb=UtXbkUVv1Mp1eujQ@mail.gmail.com>
 <fedbed5e-8365-85ab-9b81-2ec25ffa64b4@ti.com> <CAHCN7x+E3YrRFerzOHKOQHfx67g=ANESuopskKpZHX5qBx_fHQ@mail.gmail.com>
 <20200521024445.GC5684@iaqt7>
In-Reply-To: <20200521024445.GC5684@iaqt7>
From: Adam Ford <aford173@gmail.com>
Date: Sat, 22 Jun 2024 11:01:30 -0500
Message-ID: <CAHCN7xJpxT6HYR7fyiwKZm4-VO3H00S06KktsOcJbpKZrQKApA@mail.gmail.com>
Subject: Re: AM3517 MUSB and CPPI
To: Bin Liu <b-liu@ti.com>, Adam Ford <aford173@gmail.com>, Sekhar Nori <nsekhar@ti.com>, 
	Linux-OMAP <linux-omap@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>, 
	Tony Lindgren <tony@atomide.com>
Cc: Derald Woods <woods.technical@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2020 at 9:44=E2=80=AFPM Bin Liu <b-liu@ti.com> wrote:
>
> Hi Adam,
>
> First of all for my curiosity, what motivates you to bring up the AM3517
> MUSB support up to date?
>
> Though I maintain the musb drivers, I don't know much about the devices
> other than AM335x. But I spent a little time looked at the drivers and
> the TRM, here is what I thought.
>
> Your query below seems showing that you are trying to bring up the CPPI41
> support for AM3517 MUSB, but have you got the glue driver working in PIO
> mode yet? It seems to be quite amount of effort to get PIO mode working.
> The glue driver am35x.c is there but it doesn't support device tree. The
> dts am3517.dtsi defines the musb node with 'ti,omap3-musb' compatible,
> which seems not right, at least internal phy vs external phy, comparing
> with omap3 musb. am3517.dtsi also misses some required musb properties.
> So I am not sure which glue driver should be used for AM3517 MUSB.
>
> I also looked the CPPI section in the TRM, yes, the scheduler register
> base offset should be 0x2000, and the queue manager register base offset
> should be 0x4000. But I think the CDMA controller register base should
> be 0x1800, not 0x1000 as shown in Table 20-9. However the register
> layout in these 3 segments are quite different from those on AM335x, so
> it seems the CPPI41 dmaengine driver need some work as well to support
> AM3517 CPPI.
>

Bin,

Sorry to resurrect such an old thread, but I have the AM35xx MUSB
driver working in PIO mode.  I have made some attempts to get the CPPI
DMA working, but if I enable the DMA it starts to crash.  If I sent an
RFC for the CPPI41 drivers, would you be willing to look them over?  I
have attempted to made adjustments for some of the segments that have
a different layout from that of the da850 and the am33xx, and I think
I am close, but I am obviously missing something, and I could use a
little help.

thanks,

adam
> -Bin.
>
> On Mon, May 18, 2020 at 05:19:32AM -0500, Adam Ford wrote:
> > On Mon, May 18, 2020 at 12:35 AM Sekhar Nori <nsekhar@ti.com> wrote:
> > >
> > > + Bin who maintains MUSB controller support
> > >
> > > On 5/18/20 8:17 AM, Adam Ford wrote:
> > > > From what I can tell, the MUSB controller on the AM3517 hasn't work=
ed
> > > > in a very long time.
> >
> > Thanks for adding Bin.
> >
> > I can post of code patches as an RFC if interested.  They don't work
> > any better, but they don't work any worse either.
> >
> > I have modifications to the am35x glue to support cppi41, cppi41 to
> > support am35, and updates to the device tree to point the musb
> > controller to the am35 glue with additions for cppi41 references and
> > some additional clocks.
> >
> > adam
> >
> > > >
> > > > I have been going through the TRM for the AM3517, and I am convince=
d
> > > > the device tree for the OTG port is wrong, but I am struggling to f=
ix
> > > > it.
> > > >
> > > > From what I can see the USB OTG Port support the CPPI 4.1 DMA
> > > > controller, but the CPPI 4.1 only appears to support the
> > > > DA850/OMAP-L138 and the AM335x family.
> > > >
> > > > It appears as if the AM35xx is a bit closer in behavior to the AM33=
5x
> > > > than the L138, but I was hoping either Tony, Tero or someone from T=
I
> > > > might have a suggestion.
> > > >
> > > > The compatible flag need to be something like "compatible =3D
> > > > "ti,am35xx-musb" and not omap3, because OMAP3 doesn't support the C=
PPI
> > > > 4.1 DMA controller and the AM3517 does.
> > > >
> > > > Secondly, we need to update a couple of the tables in the cppi driv=
er
> > > > to support the am3517, and lastly, the device tree node needs to
> > > > support the CPPI driver.
> > > >
> > > > It looks like the DA850/L138 makes the CPPI driver a sub-node of th=
e
> > > > OTG port, while the am335x has it as a separate node from the USB
> > > > controller.
> > > >
> > > > From what I can tell on the AM3517, the CPPI DMA node should be a
> > > > sub-node of the OTG.
> > > >
> > > > What I am struggling with now is the register offsets for controlle=
r,
> > > > scheduler and queue manager.
> > > > On both DA850 the 335x, there is an explicit table entry showing th=
e
> > > > offset of DMAREVID, which tells the DMA revision ID.  I cannot find=
 a
> > > > corresponding register for the AM3517, yet the AM3517
> > > >
> > > > FWICT, the scheduler is offset 0x2000 with respect to the OTG
> > > > controller, and the Queue Manager register is at 0ffset 0x4000, bot=
h
> > > > with respect to the OTG base address.  Unfortunately, I am not find=
ing
> > > > the offset for the CDMA controller itself.
> > > >
> > > > Can someone tell me what it should be?  I am guessing it would be n=
ear
> > > > the 0x1000 offset, but it's a pure guess.
> > > >
> > > > adam
> > > >
> > >

