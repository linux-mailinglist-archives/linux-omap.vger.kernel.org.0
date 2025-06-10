Return-Path: <linux-omap+bounces-3817-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22502AD3766
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 14:54:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87D8D7AC60F
	for <lists+linux-omap@lfdr.de>; Tue, 10 Jun 2025 12:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5EF29ACF0;
	Tue, 10 Jun 2025 12:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDxW8kOJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE89328CF5D;
	Tue, 10 Jun 2025 12:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559711; cv=none; b=n1vVgBm5AhObWobMjDXp84rm7LzsxRNdpxDjIzF4thdip9F8ks3x11RAGt1a2uFuE7ct6KqdpI9nfmJq2qYI6fHe8jRcd8q/ahSvqQnDI/Sw7FMDsOUMregJ4sBx2NN+demoKCvXhvoNtDOAbl2d0WiO3i5ZyORyQunnY306e4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559711; c=relaxed/simple;
	bh=4+lKuBWusMuD5aQll58u24JjCw59i5+HaxKROrmnh7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=abKBkepgFEIBGUgh2WOrlbR6omrPfim7EfjrowkT0K9EoU7dhdFVA7Fnq9VABhyVsHKCg+UjQPpE3crdCxSsFGuC/f/nmT7Q3yik8xnGNX7ug5T7uDX7rzbBw8pVLJWxROIWDAiKQiOjK2tyEBY1JJ8iskX9Hg+QPIOFbV3li5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDxW8kOJ; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2cc82edcf49so1622837fac.1;
        Tue, 10 Jun 2025 05:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749559709; x=1750164509; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOjXPe8NVJxqY9cA3/rXFnzAlTaT0lIlpmhgjVsyJZM=;
        b=IDxW8kOJhcWJiru15OrPLrkoeOQhcOgPB4yn9vU6IgJEybBUnZcQT8eQI5ZfVdAcj3
         zVjZnf28lOMFMmfKZUmw/rLWWuQS9k07EAy57yPA2CVc0Mvkh1cBseQegESb4PNZWOR1
         Ulgc4+8ss4czJJxLGqI0sRaPrBQEUcrbGWl/nq4LJnwhG/4zmmj4dAWx7sTO82fzYnQk
         4EKW3qiExHCu802tMvCudGLFeD/YF6whx4A4mASaUyZQuleJ8E7wDWHK6Z/47jNXSdoK
         NrJC3VbjSvVthK+pWjVzdwYh4PEPWIQLtcALeJrYvSFafViZ8R4HvTYzwi8OQSmXnLDe
         +0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559709; x=1750164509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOjXPe8NVJxqY9cA3/rXFnzAlTaT0lIlpmhgjVsyJZM=;
        b=wb8KmneMPeWil8eKLvIRw24cNdJs7GnkTMVFuMs2ln3iOcaa8cBSGzeZluJ5yOR2a3
         8BH5bGe6PU4rLESKRTPCgyYadJn7LAdHCYiUINltTh1FiT3qnJnIBAh3YWn9Cpi6Y+fb
         uIxmAM/byGuiUPtcxcnKGd3hXC/FQQ4jwRgjqlw9zOtK41TfWJ05UzjAMxktE3Skz7wW
         NFY8/Kfqt6FShjkUt9PRH3TAcR3Bk6huSYFzKTPSFb3ArbLWuOs7Pj8xUV9K7q8h/xA5
         evUep2o7vBgNRAmigfnMlS5+M9YvRa04yzsgapOJ1CEhtW+ZcgjJ8mbmsBRf9gprU0yA
         YS3A==
X-Forwarded-Encrypted: i=1; AJvYcCVSMUZOvDE+H+NsC2NEmJnYj3Al/ZuZh1kUCmI5eskhoorS6tieBAqvHBxPhDFRxLBbmZXV2PvKP54hYA==@vger.kernel.org, AJvYcCWIWYnOOKA3XgDB1GcR4Tvn1ife1l/saIpXOIw4AN04xeAErNRS4VroMGrtj46uuJ2LN5ReuXwmZxYOBzrb@vger.kernel.org, AJvYcCWdD7KVz22TcYiWy721YZR8aDNDe+Wh40SDcvbCjgqpqIpwnh1LMingseQ1qqAl2Pg6jXpLHOLjJFqX@vger.kernel.org
X-Gm-Message-State: AOJu0YxOluZpEUgvO7mxpMg5VMhAZbaeU3FyeGuSB8xdXKdHujYkMwwd
	RXSoDUyVM0E23YYyszAEXsE84H1+TxeOFGplDf+sRw7zoV33BLH3CJMejc0+eam4pHOTpoadAnv
	XF6ejhXtImVtUUfS3To9uebClzlRMDQI=
X-Gm-Gg: ASbGncvUvS5HrYLTEPGzIuAT2nB3KijkIzescaAlqdiyK2rwGQQlxa2Yi9VcAItU4b5
	Cp7LBGx1fisdhXQacsgH1jYDW6C788C+pA1ggXuZpgbL+GUOq1Uzu1/tvi/qSYqWLm/20gL6fHx
	9uHroDD7CN8AXZBkWzvs0K8ZNc3WaIbR6kSxGuX99j7GkLA13DgVCiwoQoPg==
X-Google-Smtp-Source: AGHT+IEJkSHuAGQdalloHnhm/KPuTWMMm47KacsCwCjSaDxe3Ht+ktdr1ZxnlrLVEu4bU9Ld02X4PkCAm/YKMs7Fce0=
X-Received: by 2002:a05:6870:164e:b0:2e9:b6:2edd with SMTP id
 586e51a60fabf-2ea011dacb5mr10416784fac.32.1749559708578; Tue, 10 Jun 2025
 05:48:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com> <20250609-bbg-v2-2-5278026b7498@bootlin.com>
 <20250609-hacking-corporate-d53531577680@spud>
In-Reply-To: <20250609-hacking-corporate-d53531577680@spud>
From: Jason Kridner <jkridner@gmail.com>
Date: Tue, 10 Jun 2025 08:48:16 -0400
X-Gm-Features: AX0GCFvR7zhEYzZzWjg_mjpYwaq3wTlIpZbFoKrzFhLnZGCZZpbjY0Ty6K2T5Io
Message-ID: <CA+T6QPma+4DquH8wfY0gSdn9yaQvsK051tJrYiF6fUGBiMvQrQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] binding: omap: Add lots of missing omap AM33 compatibles
To: Conor Dooley <conor@kernel.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Tony Lindgren <tony@atomide.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Bajjuri Praneeth <praneeth@ti.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 1:03=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:
>
> On Mon, Jun 09, 2025 at 05:43:52PM +0200, Kory Maincent wrote:
> > Add several compatible strings that were missing from the binding
> > documentation. Add description for Bone, BoneBlack and BoneGreen
> > variants.
> >
> > Add several compatible that were missing from the binding.
> >
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >
> > Change in v2:
> > - New patch
> > ---
> >  Documentation/devicetree/bindings/arm/ti/omap.yaml | 38 ++++++++++++++=
++++++++
> >  1 file changed, 38 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/ti/omap.yaml b/Docum=
entation/devicetree/bindings/arm/ti/omap.yaml
> > index 3603edd7361d..c43fa4f4af81 100644
> > --- a/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > +++ b/Documentation/devicetree/bindings/arm/ti/omap.yaml
> > @@ -104,12 +104,50 @@ properties:
> >        - description: TI AM33 based platform
> >          items:
> >            - enum:
> > +              - bosch,am335x-guardian
> >                - compulab,cm-t335
> > +              - grinn,am335x-chilisom
> > +              - gumstix,am335x-pepper
> > +              - moxa,uc-2101
> >                - moxa,uc-8100-me-t
> > +              - myir,myc-am335x
> > +              - myir,myd-am335x
> >                - novatech,am335x-lxm
> > +              - oct,osd3358-sm-refdesign
> > +              - tcl,am335x-sl50
> >                - ti,am335x-bone

What is the convention here? "beagle" is a vendor, so not sure why
this continues to be "ti". The owner of the brand for this board is
"The BeagleBoard.org Foundation". Not sure if it is reasonable to fix
this.

> >                - ti,am335x-evm
> > +              - ti,am335x-evmsk
> > +              - ti,am335x-pocketbeagle

This one is also "beagle", not "ti".

> > +              - ti,am335x-shc
> >                - ti,am3359-icev2
> > +              - vscom,onrisc
> > +          - const: ti,am33xx
> > +
> > +      - description: TI bone variants based on TI AM335
>
> "bone variant" sounds like some shortand or nickname. Are the boards not
> called "beaglebone green" and "beaglebone black"? Whatever about the
> compatible, the description should use the full name I think.

I'm not sure this is really needed. There is some desire to fall-back
to a building block level of functionality around these derivatives of
"BeagleBoard.org BeagleBone", including compatibility with the
expansion headers, but I don't think that will happen at this level.
In u-boot, it is possible to make the determination to utilize a
less-complete devicetree, but it seems impractical here.

What are the objections to just listing these all as TI AM33 based platform=
s?

>
> > +        items:
> > +          - enum:
> > +              - ti,am335x-bone-black

"beagle"

> > +              - ti,am335x-bone-green

This is a Seeed Technology Co., Ltd. board that licenses the
BeagleBone brand from the BeagleBoard.org Foundation, so "seeed", not
"ti".

> > +              - ti,am335x-pocketbeagle

Not sure why this one is repeated. Also, it very much begs the
definition of being a BeagleBone derivative outside of usage of the
PMIC.

> > +          - const: ti,am335x-bone
> > +          - const: ti,am33xx
> > +
> > +      - description: TI bone black variants based on TI AM335

There are lots of derivatives of BeagleBoard.org BeagleBone Black and
falling back to a compatible makes some sense, but I don't think it is
of practical benefit here the way things have worked out. The smarts
have to be in the bootloader based off of the board IDs and the kernel
is just going to do what it is told.

Now, if we had some practical overlays performed by the kernel, this
would all make some sense as patches between these variants provide
useful fallback operation, but this is otherwise confusing. I
appreciate the credit given to BeagleBoard.org for them being
variants, but this really isn't the place.

> > +        items:
> > +          - enum:
> > +              - sancloud,am335x-boneenhanced

Note that this one is correct to be "sancloud", who licenses the
BeagleBone brand from the BeagleBoard.org Foundation.

> > +              - ti,am335x-bone-black-wireless

"beagle"

> > +          - const: ti,am335x-bone-black
> > +          - const: ti,am335x-bone
> > +          - const: ti,am33xx
> > +
> > +      - description: TI bone green variants based on TI AM335
> > +        items:
> > +          - enum:
> > +              - ti,am335x-bone-green-wireless

"seeed"

> > +          - const: ti,am335x-bone-green
> > +          - const: ti,am335x-bone
> >            - const: ti,am33xx
> >
> >        - description: Compulab board variants based on TI AM33
> >
> > --
> > 2.43.0
> >


--=20
Learn about me and setup a meeting at
https://beagleboard.org/about/jkridner - a 501c3 non-profit educating
around open hardware computing

