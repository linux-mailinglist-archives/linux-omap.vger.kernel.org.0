Return-Path: <linux-omap+bounces-5164-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 479B2CB3FF2
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 21:50:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3FFAC300F1B0
	for <lists+linux-omap@lfdr.de>; Wed, 10 Dec 2025 20:50:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85FE9322B99;
	Wed, 10 Dec 2025 20:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b="A5lusV7z"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3777230171F
	for <linux-omap@vger.kernel.org>; Wed, 10 Dec 2025 20:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765399850; cv=none; b=WOiOD5sCZ7PejSriYE6H5ILrCBhvmZfmhg58T6x3l2uPvxdnyY6LuBEBUFhLbO//Xys352TXggChVVrHz4Ypr9sIC4kMccyOK28NrOfwX1+YWyaP/F/Rs2OQRCoLvBKy7TWOILve8/vHmY1qw7prfLQw7YkEHEx3OkeZ9z8RbTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765399850; c=relaxed/simple;
	bh=Ni/DlTRLrWNBrRfruswlghq4vvB8vlWS1U6dlJqQLC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=Sb1/7RR3OLGmB3YCz76Jj6hBOhKHMqMwNhU6tf2ns9h7shQxLMVGVS/RvjLVzQBodi2edOfMVhZz+8jb82xWxTSVI50qikyoIvFa7iI9XMfdrEacT9qWvrB8ipgXd0vj7jHBEHKwkyDgwGPypLzcK1A1kalxSNKxvSV5rAO13hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar; spf=pass smtp.mailfrom=frba.utn.edu.ar; dkim=pass (2048-bit key) header.d=frba.utn.edu.ar header.i=@frba.utn.edu.ar header.b=A5lusV7z; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=frba.utn.edu.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frba.utn.edu.ar
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-78c8d74bf4cso2618977b3.1
        for <linux-omap@vger.kernel.org>; Wed, 10 Dec 2025 12:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=frba.utn.edu.ar; s=google; t=1765399846; x=1766004646; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHUWRafJ365AEdJneJMcUNVrKE6WQP71DnOIKXCfU0Q=;
        b=A5lusV7zHjhqUFEE7GvUrKcbSujX/EXFfWv0R2KGFh6e/kOwB3g9ZDMS+vDb8I+AQM
         H6Rg57TqX3fUxZi4PrcekEf6GHYi2BcHqjC+Brnz+q3uPpieRIEXorDtwn1DsqW6rVyK
         QX77wIw9EGl8iK3LxIYmaR9MZTY1NB/KIhxw3PnHOQ83TzpbUbNXbmolNyLyoYpBy55/
         bNcl429389c6RRSGXCBDfCpUeN41dhFcryhDXnO2f608Ctmclyr7VeF1mLzghBm8g2jk
         uII96qnAs0Zf6WfvUlskLv9oTZH488aR1+1jAWdwDlUdRAmz24ezBaHjoTVzJkM7m4+2
         xs2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765399846; x=1766004646;
        h=content-transfer-encoding:cc:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dHUWRafJ365AEdJneJMcUNVrKE6WQP71DnOIKXCfU0Q=;
        b=bEI8+S3w0+SZ9iM9WtXMvLiNg+GKfgqNTDYWCNhZy045uVekHUirOGXHLa8A+nyxOm
         ch+Ap+NZGh4E8rRdjNyYiK0tD9eYzsv7Wl7/wADJ59mvjxiH16Y8km0qdiYS9M33vz1T
         Pp3mtU2h+pjgl3Dd5n4TVDbAPcUKCwM3zwf+zw76MvooY+gNSbjMaFF6331VsqoasCcV
         I/tA/3NpdPISCXCV6okntza/yO3xrHNu/iTdjx26OltLEmZ0WBXI0E7wTFrMyb83TRj5
         Buh7qqz1YLkE6d1GK73DLoozWIzIxfIkoHWB6eqDu/oG1UE0TObE9gPBAU7Q5cm6OMvC
         2SLg==
X-Gm-Message-State: AOJu0Yyn4fPZT87OOYZqB5lISGvKJfJw51MGR6MrHAAuMB7FX+hCPQF3
	MIxkygspre2aIDC8ZvlQv6fVqk17RgWjFUyefsJ8ppXToOBcYm8XXNh4qFiVpzu71lBXcBNI0Nq
	eMHdf1yEXx72Qdmaub91DF5DIFrytVqm6saP51sT0vz44h2hPBZ4KkG2o9r7r
X-Gm-Gg: AY/fxX55cM87E9YeoIpe8BlO+SCxUSAmzWVFB/29e3/YXukid8MxSs1ZFeV5PzJsshY
	/s3oGXp04QGlKXWOYDuRM6lSrjL/yJn/8Ug2xwkvaK+mOFzGsUy6R6/CWquj5pBqTSEImHQuJ2J
	91SxvFqzG39PouZpPlgtVCx5tM2+oNDsS/5HFRvTZJbg0Dc2HNrfaZpmOTX3obeRnSHtGeihjt3
	cNSn9LiGLyaUSe+LIpNWDj4EaX94RVEnsF995gElOC851LR8+CP2ewxL8RmiPeoK/jsSGFMJHa1
	HaW8t9pR8FdT/C/rI5VDyHTvroL5b0lmjuCfhWjH1zcQkCzQrT5neCMR
X-Received: by 2002:a05:690c:4b92:b0:78c:5803:f68e with SMTP id
 00721157ae682-78c9d725a6bmt34112057b3.33.1765399845997; Wed, 10 Dec 2025
 12:50:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210052254.279899-1-fcoda@frba.utn.edu.ar> <aTm3EGNR8smNE4Xl@darkstar.musicnaut.iki.fi>
In-Reply-To: <aTm3EGNR8smNE4Xl@darkstar.musicnaut.iki.fi>
From: Fernando Coda <fcoda@frba.utn.edu.ar>
Date: Wed, 10 Dec 2025 17:50:35 -0300
X-Gm-Features: AQt7F2rrgKNAb5w2YQElHsCcBB6u6tOldkHdf4RvDB27jgxE2qXKgx6dd-lof4Q
Message-ID: <CAOXe=TXbvfnqNJJooAV5tzMH+z4Yd8s-1c-41kmRmuspwNV9Vg@mail.gmail.com>
Subject: Re: [PATCH] i2c: omap: fix incorrect SCLH timing calculation
Cc: linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Aaro,

I double checked and it's now evident that I wasn't understanding
the meaning of the flag OMAP_I2C_FLAG_SIMPLE_CLOCK.

Please dismiss my submit.

El mi=C3=A9, 10 dic 2025 a las 15:08, Aaro Koskinen
(<aaro.koskinen@iki.fi>) escribi=C3=B3:
>
> Hi,
>
> On Wed, Dec 10, 2025 at 02:22:54AM -0300, Fernando Coda wrote:
> > According to the AM335x Technical Reference Manual, which uses the
> > i2c-omap driver, in the section 21.4.1.24 (clock timing parameters),
> > the SCL high and low periods are defined as:
> >
> >     tLOW  =3D (SCLL + 7) * ICLK period
> >     tHIGH =3D (SCLH + 5) * ICLK period
> >
> > Every other reference to SCLL and SCLH in the omap_i2c_init() function
> > follows the same pattern:
> >
> >     SCLL =3D value - 7
> >     SCLH =3D value - 5
> >
> > However, in this line the value of SCLH is computed subtracting 7 inste=
ad
> > of 5, which will produce an incorrect SCL high period.
> >
> > This appears to be a copy and paste error.
> >
> > Fix by using =E2=88=925, consistent with both the TRM and the surroundi=
ng SCLH formula
>
> What's the impact, and how the change was tested?
>
> I think the code line you are modifying affects only OMAP1
> (OMAP_I2C_FLAG_SIMPLE_CLOCK branch), so AM335x TRM reference has little
> value.
>
> A.
>
> >
> > Signed-off-by: Fernando Coda <fcoda@frba.utn.edu.ar>
> > ---
> >  drivers/i2c/busses/i2c-omap.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-oma=
p.c
> > index d9f590f0c384..d0a33f5f1bb3 100644
> > --- a/drivers/i2c/busses/i2c-omap.c
> > +++ b/drivers/i2c/busses/i2c-omap.c
> > @@ -459,7 +459,7 @@ static int omap_i2c_init(struct omap_i2c_dev *omap)
> >               if (psc > 2)
> >                       psc =3D 2;
> >               scll =3D fclk_rate / (omap->speed * 2) - 7 + psc;
> > -             sclh =3D fclk_rate / (omap->speed * 2) - 7 + psc;
> > +             sclh =3D fclk_rate / (omap->speed * 2) - 5 + psc;
> >       }
> >
> >       omap->iestate =3D (OMAP_I2C_IE_XRDY | OMAP_I2C_IE_RRDY |
> > --
> > 2.52.0
> >
> >

