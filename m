Return-Path: <linux-omap+bounces-2543-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D979B70B6
	for <lists+linux-omap@lfdr.de>; Thu, 31 Oct 2024 00:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D8F08282590
	for <lists+linux-omap@lfdr.de>; Wed, 30 Oct 2024 23:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6450E217446;
	Wed, 30 Oct 2024 23:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhQISddr"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FF91E570F;
	Wed, 30 Oct 2024 23:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730332212; cv=none; b=k5wbpyzEkaX9ttOFNzvUQ2MQoUd/G81Muj7sQc5uX964hFSj5DmOSIEgvub/LCSCY3PZerGbUafp9rylbbEkXYVokqOMHyl3ak4qjFTpFSM2dvHGmD63pPXQM3wPyF6yioukYzF4MmIW6tCzJbwcfJNM/Iw3EPuGcEbmuxAh81A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730332212; c=relaxed/simple;
	bh=g2Gr6BSJI30hLHHrUt4HEWLZS4G2MgGxc9n66A9DdH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FYqrgcYD5XtMGHWkPI5ZQ6JmR0r27BNzfIl9kx8ffuHUnBAqcAmGcc7CrHit/ThVXKViymIJoQG7IsIGN/ETyq4ssCEaKzRzvR1vDCwD/VY/fXVIqVM1jt5pVDtOMnVFMRioHHGEtIclBgjdk4wJ/yVxfVH+103WNI0KxVY8W4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HhQISddr; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7ee11ff7210so342213a12.1;
        Wed, 30 Oct 2024 16:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730332209; x=1730937009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xITKeeCQTPMHTwhjLrB4rhB00Y72QJELP5T2ItEbVI=;
        b=HhQISddr/HQF0FX9a7D59KrZWE0DMWBw/I5nRobvRwqD9zo5ip6bNXIz/w7T8s0QEl
         GL7/M6vjpmNCogr7jntj5RiP6dwLR5PiYzaxTaOyTx/iAhJVj598S3cHUysQT8a6xcDT
         Hlyv++EHyLrSlSaKFqg3pikkynxQEBUlPYDl3GSgGdEd12zVQx3WJ1RijpCZ0rnS17Nv
         k1Fa+cCmb+jjmweH+hJJ6pUkuKJLw4pSexBwd0Wg2iRRSCjGk3bXPzQ3dhL1Ei7sFhaT
         r/TSYli8daS9R4CCb7MGxiyY12qYgfk2/K/CkLFYj/bvbuhTPwW0V8BGYtteAFgsDyDz
         tQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730332209; x=1730937009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xITKeeCQTPMHTwhjLrB4rhB00Y72QJELP5T2ItEbVI=;
        b=FDHnTsP+EfhBPbwOR3bgGwsC46onxx3JnfH91+tP0fmLc1+VJVGuo833G/sta6D9fB
         OtTgXFx24MwTXdj18kRJwhi8NU/hHt6YnRGi1grhpWfI+5wdRndp60pJD7G6pbse4Kr/
         YS4eY0r+9TIimGxrB+EdfGUmiutAx8+2g/Z11iq7MAGQCDyYH28MuQEBuNOxs2Ldx+dX
         DOWR25euQ2lQccThvhvxwlyHLKGYIvSjft8gh6bwMhfR5qi4DKRlbnCPnMGKOXx99Y8n
         iASKztpvKB+y0KZrI3S6nx0+oulPhWnj788WcPfb+63BS5coc3rlkKZ6YjJ0hc9HMV73
         YDBw==
X-Forwarded-Encrypted: i=1; AJvYcCU9xzH1doScWX79DXFJpyjOWPL4tRiqUR4LxtaqIOgJ3f3iHzjrCBOHD3VBWgUQvQzUaaaaeHYGLafBVA==@vger.kernel.org, AJvYcCUHaxoCBqlOslcqPkbYgJMElprWjNh1OnkKcjAM9trGqgbxW4lDonJqUbjdTQnmi4jVZJLxJuyeWkEQhA==@vger.kernel.org, AJvYcCV75h9rVMNY82ipyLPdBAZ9P4nuaCWbKECgANprKb53BpSK0xYSWJSuFBL+3MamtPiw/MpjRyC/VKDKyWWmJoDA4w==@vger.kernel.org
X-Gm-Message-State: AOJu0YycX0SSEpPe0gF3u1YWwy1FBFmjVP0UZoGLneUOBmRYteg3k4nd
	7JyEoegaTYv+vAzyiT71guRw2VSBAJKFQhdMJIrYKyZgF/kY+ADN+eAOYCOFV6FKOsoaONN5Q+6
	kKWZS+M8OUSMfzyDGlofBbUkVmpI=
X-Google-Smtp-Source: AGHT+IEGZomZ5kJjb+R1NLfXagX6H4tJArwRpGGFHsIJUp3TX6AYCJgn71SzvrzS+RXVFHlSMLywNa+CNyNDqhllWuo=
X-Received: by 2002:a05:6a20:c854:b0:1d9:c615:944f with SMTP id
 adf61e73a8af0-1d9c615a145mr12413848637.11.1730332209274; Wed, 30 Oct 2024
 16:50:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1730136799.git.robin.murphy@arm.com> <ZyIClriScBy4s6LX@8bytes.org>
 <515D7932-3939-4C3E-BA3E-CC3152E64749@goldelico.com> <ZyIos2Gm1nf5rejI@8bytes.org>
 <ZyI0baBMPHVZ29-k@tp440p.steeds.sam>
In-Reply-To: <ZyI0baBMPHVZ29-k@tp440p.steeds.sam>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 30 Oct 2024 18:49:58 -0500
Message-ID: <CAHCN7x+M1tfmJYhp0+qovhedMiMG=fdyaf-CnPz_hUi7abuDCQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Fix omap-iommu bitrot
To: Sicelo <absicsz@gmail.com>
Cc: Joerg Roedel <joro@8bytes.org>, "H. Nikolaus Schaller" <hns@goldelico.com>, 
	Robin Murphy <robin.murphy@arm.com>, will@kernel.org, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, mchehab@kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, 
	Beleswar Padhi <b-padhi@ti.com>, Andreas Kemnade <andreas@kemnade.info>, iommu@lists.linux.dev, 
	arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux-OMAP <linux-omap@vger.kernel.org>, linux-media@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 30, 2024 at 8:28=E2=80=AFAM Sicelo <absicsz@gmail.com> wrote:
>
> Hi
>
> On Wed, Oct 30, 2024 at 01:38:11PM +0100, Joerg Roedel wrote:
> > On Wed, Oct 30, 2024 at 12:20:31PM +0100, H. Nikolaus Schaller wrote:
> > > Why that? There was a discussion and everyone agreed to remove omap2,
> > > but not omap3 and later.
> >
> > I raised this question to make sure the things we maintain are still
> > relevant. Developer and maintainers time is limited and we should not
> > spend it on stuff that nobody uses.
> >
> > > There are some devices besides the PandaBoard. I am aware of these wh=
ere
> > > this is relevant: Epson BT200, Samsung Galaxy Tab 2, Pyra Handheld
> > > (in production) and we are currently thinking about producing a tiny =
series
> > > of the DM3730 based GTA04A5 with spare parts.
> > >
> > > And of course we want to participate from the latest and greatest ups=
tream changes.
> >
> > Okay, if there are still real users for latest mainline kernels on this
> > hardware, then the effort is justified.
> >
> > Regards,
> >
> >       Joerg
>
> There is also the Nokia N900 phone (OMAP3) still seeing mainline
> activity, as well as the Motorola Droid 4 (OMAP4), to name a few. I will
> also be testing on the N900 around the weekend.

The Beacon Embedded / LogicPD Torpedo and SOM-LV families (OMA35 and
DM37) are still being sold and I still run various tests on them
periodically. There is also an AM3517 that I still periodically test.

Once Micron kills off the RAM and they run out of supply and Beacon
cannot sell them anymore, I'll submit a patch to remove the
unsupported / EOL boards.

>
> Thanks to everyone for the amazing work.

Thank you for all this.  I haven't been as active lately, but I have
been following this.

adam
>
> Sincerely
> Sicelo
>

