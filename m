Return-Path: <linux-omap+bounces-4896-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC8DC4EB9E
	for <lists+linux-omap@lfdr.de>; Tue, 11 Nov 2025 16:16:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 23FC334C88F
	for <lists+linux-omap@lfdr.de>; Tue, 11 Nov 2025 15:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD0C3363C5B;
	Tue, 11 Nov 2025 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gtABr9gX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4583590C5
	for <linux-omap@vger.kernel.org>; Tue, 11 Nov 2025 15:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762874138; cv=none; b=ayqH5n9rMVpApxiSgZs+FmYhdx/rOYTjAsEru6rwoISZH7DXI8PLfiR7UgKdO1jFTHd1383X0sR4ssmB5bIYkLXZ99zaAlAOdxaeJem1qoQX39tF/A/ujcPpBIrfemsWUGES2X/iIOZ9jzJnN9d57BrsVVRwCGDQeQQHc37xC+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762874138; c=relaxed/simple;
	bh=QW+FQHkpVOwBzm5HQos1lTGedke4NV0wMV1kgnsEBbE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gLf02ORAC7E0ZnAfFkT6rrkNEK6ji4TaWKHQDBiRLBqHxVqFBdwR9EJD7BK8Dw3nL+sExzJohNatIn5yys0pEOF7XQ+tLWWPZVwO2GyRx+4QEUKjIIzpieLOvH/7HfsuyAV+3T1Vb2liHP1+1Z59jO/Gs+PaIQP7pHElxpWcVs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gtABr9gX; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-787da30c53dso27154667b3.0
        for <linux-omap@vger.kernel.org>; Tue, 11 Nov 2025 07:15:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762874135; x=1763478935; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/5T34NcDSf0NcUNTCeoFfYpJ8wi/jPOz/B8hX2HjaVs=;
        b=gtABr9gXmhq/3wtJZT5T5z/Tt3keKBh0z7ulqwjiR3j8ycta51WxmdglKXb35pNd+x
         FZ6PDxQpBMva3oh8yebeABgFnekpaD+lQ4P7IyeqBLxODAxxhvX5waIaFRMxaoaxRS7q
         quA3G3e8nnrr4huslrK8rSrnhOJrlJCzlsFcB9J/o67Cbu6G2GImGJloy6/2FYGNco0m
         gEZdMsrcHrPOSeSHejiF6GpQNZpaXHz4U+6RrWuODkn696UnsOWM6Slk8TbptIXZAALS
         N7F0/j8LcstC8Vxyh8Gd9lGk1xlPfNWEkA5bhVMYr03FFAtGI2wjW2n0nv+xITIBaoOu
         Nn+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762874135; x=1763478935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5T34NcDSf0NcUNTCeoFfYpJ8wi/jPOz/B8hX2HjaVs=;
        b=UExPbskB+SvraUBIXQmABhVLzDxEED4IJ4IghSqd8DKA4tVAwLK7t1pF2fjAHpjjNe
         lufgbGwAl53DVtv6qm/NjYnEAF/yRRCwfSRR0Ze1NUN1bVV7ANlfTIGP5BXADhWRL9Rz
         9t/3UQ7WuY0XXpCaJ9tRk7U670GrGkUox9LyGiQ2QsKYsPcel7VqdZEjsKqDFpxAN82y
         n/jo+6DTW9GDmLrrQyvwLZScaOWQ0Kk4NYFts+pUMmFlZuB8fn61kXtM+dbcygP8M+1u
         TJ2xz/lsY68yrZlCmbEm9lfsjpPzT6pM9bdR26vQlwxb5tqEMDFQHoJgPVePvKPTOAgh
         9fJw==
X-Gm-Message-State: AOJu0YyUnrDO5Fs1LSDGvTtG4m7ukjZPibk4REOzCR9BFUbgssz1omRv
	QhqYV7FPBNxC0HAqZJsoF5+4NS74e5H3rbs6HHoWsKB2SdhDp8U/neBxcXNfzULE1d1rFMrEGgT
	efbeibebH1BFJutO1/akl6chDh5S6rz8=
X-Gm-Gg: ASbGncv9cMUrV2T28YXuU+LOKdHPyxB6TPalcnVNHy2zvIlhOifOls5sgE27iuQeJZj
	TNpIq0rN+2fgoheldkOt0xzONjSL2wO0/DWYQF8rCpS5HbtsDaco6nBZnlWLJkOM3pKT14qrwCL
	t2sA9/GDaYan+PHTHbOO4qBlv/Tme37XbY8kbznB10Tj/1fsGnDtc+9K8F9hLW5IdugdoO5r0vf
	3644Wcmoh9ccioRqY5Dua+OlSiUHIGxu22tmaXiQ1tfRNnCwi5VqQ1C3HnqqVR7fX9lh4qoBefW
	vkXpNw==
X-Google-Smtp-Source: AGHT+IH1ZANQnDb/QepbD9r5B5e+jnx89rdM9hgTNu9CJVXCBgvCpdFSimBaCfGVIwQ/5R99klaJNMY8v+RkouI9HDQ=
X-Received: by 2002:a05:690c:9419:10b0:787:f72d:2a57 with SMTP id
 00721157ae682-787f72d4c2cmr47926737b3.15.1762874135446; Tue, 11 Nov 2025
 07:15:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721173741.6369-1-bruno.thomsen@gmail.com> <91f764ab-bec1-4791-b01b-3ba0803ce8f8@pengutronix.de>
In-Reply-To: <91f764ab-bec1-4791-b01b-3ba0803ce8f8@pengutronix.de>
From: Bruno Thomsen <bruno.thomsen@gmail.com>
Date: Tue, 11 Nov 2025 16:15:18 +0100
X-Gm-Features: AWmQ_bllRvQR9MEWmHVmNTd1JuBEwZSL3HXa1q1ZdirDbTD_TO7cfsGydt3FKHQ
Message-ID: <CAH+2xPAEAfJW+yy-45Y8EpOWb-8vvaNf27GXe1Ch0Xj8ZuLZHA@mail.gmail.com>
Subject: Re: DT compatibility break for am335x (Was: Re: [PATCH] ARM: dts:
 am33xx-l4: fix UART compatible)
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Ahmad,

Den fre. 7. nov. 2025 kl. 19.47 skrev Ahmad Fatoum <a.fatoum@pengutronix.de>:
>
> Hello Bruno,
>
> On 21.07.25 19:37, Bruno Thomsen wrote:
> > Fixes the following dtschema check warning:
> >
> > serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
> >       ['ti,am3352-uart', 'ti,omap3-uart'] is too long
> >       'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
> >       'ti,am654-uart' was expected
> >       from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
> >
> > Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
>
> I tripped over this patch, because it broke the console in barebox after the
> device tree sync with Linux v6.18-rc1, fortunately caught before release.

Sorry to have caused you issues in barebox, that was not my intention.

>
> I believe the correct resolution for the DT binding warning would have been
> to extend the compatible list in the binding with ti,omap3-uart if they are
> indeed compatible.

I can see that I forgot to include the full reason for the change in the commit
message. We have some products based on ti,am33xx soc and the serial
the console had many quirks when using the ti,omap3-uart that we did not
see on other soc families. The console did not like opening vi or htop but
could only handle simple kernel log. Switching to ti,am3352-uart fixed these
issues, so that was why I changed the device trees and not the schema.

>
> I have submitted a patch to add the now sole compatible to the barebox driver[1],
> but please keep DT compatibility in mind with similar changes in future.

Thank you for maintaining barebox. On our new platforms we only use barebox
as a bootloader as it provides a much easier board boot then u-boot.

/Bruno

>
> [1]: https://lore.kernel.org/barebox/20251107182805.3367244-1-a.fatoum@pengutronix.de/T/#u
>
> Thanks,
> Ahmad
>
>
> > ---
> >  arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 12 ++++++------
> >  1 file changed, 6 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> > index d6a143abae5f..cef24aafed1a 100644
> > --- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> > +++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> > @@ -200,7 +200,7 @@ SYSC_OMAP2_SOFTRESET |
> >                       ranges = <0x0 0x9000 0x1000>;
> >
> >                       uart0: serial@0 {
> > -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
> > +                             compatible = "ti,am3352-uart";
> >                               clock-frequency = <48000000>;
> >                               reg = <0x0 0x1000>;
> >                               interrupts = <72>;
> > @@ -1108,7 +1108,7 @@ SYSC_OMAP2_SOFTRESET |
> >                       ranges = <0x0 0x22000 0x1000>;
> >
> >                       uart1: serial@0 {
> > -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
> > +                             compatible = "ti,am3352-uart";
> >                               clock-frequency = <48000000>;
> >                               reg = <0x0 0x1000>;
> >                               interrupts = <73>;
> > @@ -1139,7 +1139,7 @@ SYSC_OMAP2_SOFTRESET |
> >                       ranges = <0x0 0x24000 0x1000>;
> >
> >                       uart2: serial@0 {
> > -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
> > +                             compatible = "ti,am3352-uart";
> >                               clock-frequency = <48000000>;
> >                               reg = <0x0 0x1000>;
> >                               interrupts = <74>;
> > @@ -1770,7 +1770,7 @@ SYSC_OMAP2_SOFTRESET |
> >                       ranges = <0x0 0xa6000 0x1000>;
> >
> >                       uart3: serial@0 {
> > -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
> > +                             compatible = "ti,am3352-uart";
> >                               clock-frequency = <48000000>;
> >                               reg = <0x0 0x1000>;
> >                               interrupts = <44>;
> > @@ -1799,7 +1799,7 @@ SYSC_OMAP2_SOFTRESET |
> >                       ranges = <0x0 0xa8000 0x1000>;
> >
> >                       uart4: serial@0 {
> > -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
> > +                             compatible = "ti,am3352-uart";
> >                               clock-frequency = <48000000>;
> >                               reg = <0x0 0x1000>;
> >                               interrupts = <45>;
> > @@ -1828,7 +1828,7 @@ SYSC_OMAP2_SOFTRESET |
> >                       ranges = <0x0 0xaa000 0x1000>;
> >
> >                       uart5: serial@0 {
> > -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
> > +                             compatible = "ti,am3352-uart";
> >                               clock-frequency = <48000000>;
> >                               reg = <0x0 0x1000>;
> >                               interrupts = <46>;
> >
> > base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
>
>
> --
> Pengutronix e.K.                           |                             |
> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

