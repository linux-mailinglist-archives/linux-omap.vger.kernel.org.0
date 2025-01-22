Return-Path: <linux-omap+bounces-3186-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1F0A19AF7
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 23:37:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A34116AE1E
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jan 2025 22:36:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0DDE1C9EAA;
	Wed, 22 Jan 2025 22:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvmP44j0"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BC61C4A06;
	Wed, 22 Jan 2025 22:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737585414; cv=none; b=oViAf9zo76/3LImXdg+v20IOD71qNa64FjE/iajEy9TjiKBhCtQ9inAHGCLAH6B9Osmrmz4bk8l8QZuRsijIfLTtnZmsXXwteTRcvrsI7WBMdzKIdXq90xAe/miFa/ZlcuZ17f4ePAuBylqpBVG5utuQLC/+K5Qg7Si6FrmCdv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737585414; c=relaxed/simple;
	bh=SsrOaIloqeFcG2s8OyPYHeqIUA8VV6q9XB+ml53my3I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aiHEKfsESzuxIVRmb6m6GnyPSHQ1Xt1fAG0wbz5ivyrDtvoqedYoNsOtMChtXz4G67uk0O2UnIgBniPuUV3Wybicd/dFFYEgAqGbRv93HHcvSwOnDFJp1XbH8R3U0xX3WmD/e9cNNWQWy119EFTF53H7vBky4FNr2+QzpQGhJCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvmP44j0; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e3a0acba5feso395250276.2;
        Wed, 22 Jan 2025 14:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737585411; x=1738190211; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qRIYMPfZ8j+79b6vhX+XsIXEOJ5ZV42s2D7LLOGgGJA=;
        b=OvmP44j0SRB9KaZjWqsGwTriXoPmAF0CCorzv9lT/Ic4WVL8llD8pmf9N6IwfEFCNL
         mnNJBrSxalEISHLvtx26RqDxX6iCFHLojgXhbDlxBnHtAHQlDnHHH8umOUuYILoz23dX
         kfY1rENc13Q8WTbeb2AeokQ0IU9ckosbarhK57EpC5wHM3njHmhk70gnj99If2F4OGXW
         z9LaRlFoPPJ19gdtDlGYL3SUqYN74qA2GipgjcRhp4cC14rk9P21DDCzIc48yv1Mkxps
         Aheyg7NEooyOFedNA4DAan56cEks05keJPC3R3qnEo8lTHeoxjxYCd+tFcLBzVOnp2+S
         PfFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737585411; x=1738190211;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRIYMPfZ8j+79b6vhX+XsIXEOJ5ZV42s2D7LLOGgGJA=;
        b=h7RKGsx9HNVnEqFLdPhcQP2V2CXpJMWdHGzlK186ByrcsIZ3X3OvDvcRI8hWrhjwGi
         6mg8AIlEnJ1MYbDIFpf8gqd83jnmvUxPte0ckc3RYD5Xsthm9S2fL/ioRxxcInqCxie4
         P73wfh++d8MjiTr8jfMOS9wgfr0+S7DIFmyLIDgEFHJV82JzbKCtQEHfmhhSv/u9R37L
         qTcnBHvGTA8bkDdJPTuiMw5mOcRzdmJdt75hIQJiA1ks6uWVf+gxv+RpoiAVEbRqfZPX
         i70WkTj+57rp1sz8VZhOTNsmAZ/ZAYuMv96MOdVWp2SWnTG1CMA8pf68gEgzOonBJs72
         I4fg==
X-Forwarded-Encrypted: i=1; AJvYcCVXgwZUUcOANENnCPdsrIMAC/RaIvZGJ7m4fgYmXfoK9X0Wt2uVCwxxImj+fAw4JrpN8KzhahdZ2ali/Q==@vger.kernel.org, AJvYcCX7Fq3X9VpXhCCk048bZ9piLAwqGkgMvCsE+sAoXWbVrLTSitPPJkkPYQOxP+3FIcLTvWkwby8yMo7E@vger.kernel.org, AJvYcCXJ1TIyp90SC1ldvUasXJC5XejpN5aeChs3iA8/p6DKeRolCvzuEFqwN9SsK+Xq1DR9WBd2i6CnSCgKyrsl@vger.kernel.org
X-Gm-Message-State: AOJu0YwZyliPx6yoD4ZpY43Jp4LZSmPvbVngtOvCha/bvSqHo+Rq0Hil
	IsKWHOSRev9LsG3w80MHbCoDC4XL/DKeq+7JVoD2oCL8/9aGigAQEZq3KPsb5Fkr8Pt+6WpQ19X
	6oIh7e7o/LXfRfbhRtqS3O1wSZMo=
X-Gm-Gg: ASbGncvGp6++2cI3qOjwQD1xNAY4MYSuCZvb0J31BQhKx13Gj+SqP0Pu1JyWPOp1//v
	X0yhcVYt80Xm8X3ndMTRuIAa01mVqzQzW0VXBlsey8i20D7/CeZ7z
X-Google-Smtp-Source: AGHT+IEs0t0eySQJ2q+y7GEGMKKw6cHcK5BlIy2g2kXQBJauyBB4sR0P+jQ1AGofR+buRPyDxYAI+z2FacRSScGKKaM=
X-Received: by 2002:a05:690c:968b:b0:6f6:d149:d64a with SMTP id
 00721157ae682-6f6eb908ca1mr186504857b3.27.1737585411295; Wed, 22 Jan 2025
 14:36:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122001240.4166460-1-trini@konsulko.com> <20250122093236.6152c56c@akair>
 <20250122142058.GM3476@bill-the-cat> <20250122232010.1a5a0525@akair>
In-Reply-To: <20250122232010.1a5a0525@akair>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Wed, 22 Jan 2025 16:36:24 -0600
X-Gm-Features: AWEUYZlQLNY2kE2F-j7-0O2gr9I4QkAgpDcfm-N1Dey0X4zBD9qgZuPllRLkhnI
Message-ID: <CAOCHtYgJr_KK+ww9KhVinPwmNHpR_gCiPFNUnL8+tex9rbKXoQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: omap: Add TI Pandaboard A4 variant
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Tom Rini <trini@konsulko.com>, linux-kernel@vger.kernel.org, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 4:20=E2=80=AFPM Andreas Kemnade <andreas@kemnade.in=
fo> wrote:
>
> Am Wed, 22 Jan 2025 08:20:58 -0600
> schrieb Tom Rini <trini@konsulko.com>:
>
> > On Wed, Jan 22, 2025 at 09:32:36AM +0100, Andreas Kemnade wrote:
> > > Am Tue, 21 Jan 2025 18:12:40 -0600
> > > schrieb Tom Rini <trini@konsulko.com>:
> > >
> > > > Document the ti,omap4-panda-a4 compatible string in the appropriate
> > > > place within the omap family binding file.
> > > >
> > > > Signed-off-by: Tom Rini <trini@konsulko.com>
> > > > ---
> > > > Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
> > > > Cc: Andreas Kemnade <andreas@kemnade.info>
> > > > Cc: Kevin Hilman <khilman@baylibre.com>
> > > > Cc: Roger Quadros <rogerq@kernel.org>
> > > > Cc: Tony Lindgren <tony@atomide.com>
> > > > Cc: Rob Herring <robh@kernel.org>
> > > > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > > Cc: linux-omap@vger.kernel.org
> > > > Cc: devicetree@vger.kernel.org
> > > > Cc: linux-kernel@vger.kernel.org
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/ti/omap.yaml | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/D=
ocumentation/devicetree/bindings/arm/ti/omap.yaml
> > > > index 93e04a109a12..28e23ca766b4 100644
> > > > --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > > > @@ -137,6 +137,7 @@ properties:
> > > >                - motorola,xyboard-mz609
> > > >                - motorola,xyboard-mz617
> > > >                - ti,omap4-panda
> > > > +              - ti,omap4-panda-a4
> > > >                - ti,omap4-sdp
> > > >            - const: ti,omap4430
> > > >            - const: ti,omap4
> > >
> > > This allows compatible =3D "ti,omap4-panda-a4", "ti,omap4430", "ti,om=
ap4"
> > >
> > > According to your other patch, you want
> > > compatible =3D "ti,omap4-panda-a4", "ti,omap4-panda", "ti,omap4430",
> > > "ti,omap4"
> > >
> > > so you need a construction similar to the "ti,omap3-beagle-ab4"
> >
> > Do you mean the order should change, or it should be an enum? I'm not
> > sure where this is documented (the $id and $schema values in the file
> > are just 404s so I guess not something to read directly?).
> >
> you would need a block like this:
>
>       - description: Early Pandaboard revision A4
>         items:
>           - const: ti,omap4-panda-a4
>           - const: ti,omap4-panda
>           - const: ti,omap4430
>           - const: ti,omap4

Here's a good table:

https://omappedia.com/wiki/PandaBoard_Revisions#PandaBoard_Revision_History=
:

The A4 was actually 'late' in the Pandaboard life, sadly the
PandaBoard.org domain went down years ago with no real backup..

The biggest A4 change i've been able to dig up was a change of the i2c
pull ups on the hdmi bus:

https://git.ti.com/gitweb?p=3Dti-linux-kernel/ti-linux-kernel.git;a=3Dblob;=
f=3Darch/arm/boot/dts/omap4-panda-a4.dts;h=3Df1a6476af3716489007c12141d06f2=
08ec2ebc94;hb=3Drefs/heads/ti-linux-4.14.y

I don't believe I ever saw an A5/A6 in my hands.

Since Panda pre-dates device-tree's normally these would have been named:

ti,omap4-panda-a2 (first production)
ti,omap4-panda-a4

But with this new thing called "device-tree" the A2 got
`ti,omap4-panda` and the newer A4 got `ti,omap4-panda-a4`...

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

