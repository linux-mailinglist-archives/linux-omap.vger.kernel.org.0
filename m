Return-Path: <linux-omap+bounces-5060-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 36478C8BB6C
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 20:53:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A03E43A7FE9
	for <lists+linux-omap@lfdr.de>; Wed, 26 Nov 2025 19:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76982344028;
	Wed, 26 Nov 2025 19:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfbUcXHy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB3A343D70
	for <linux-omap@vger.kernel.org>; Wed, 26 Nov 2025 19:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764186632; cv=none; b=HqUQYEhbW2HxkfaYuQJt4C5OaAUWMpf/36p+LpkO8Z6T+IUYwIZPiQaNrctYXufYuYVQlAMBVJyogX0wDbdKMRuIU2Hi2eseMqaGr9yV+NLEkbRJAentSII4PGrQSZAY6eYyFgRrS+xwtoSngqCok9e+CjZB5G5uIFIPA5Pb6TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764186632; c=relaxed/simple;
	bh=mYZu6q1mKH3Ia0eJL4ADk5m1+90RiD40dY+YcRXOoo0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FXHF+DrFc1e5YZcj2cxK7NBE8QTyFo7/RlNKU7XmOylJkVUAdk3pkxgar0Jsq0TR4G7u3VNayMp8/oASzmrSNEkLIvLG3saclpCqqOfC35RACa/LHwQyIX+jE9aiONT9grmZRUkPhGAP6fRwBmfB65/BgglrUsZCHh3aOR+4Whs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfbUcXHy; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7881b67da53so1556417b3.1
        for <linux-omap@vger.kernel.org>; Wed, 26 Nov 2025 11:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764186629; x=1764791429; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=V6WTVHEYOh73wJPybBHZpQae4Q31hwe5BpFUWCvD62E=;
        b=BfbUcXHyTI828ui3+0VhbNCUAJZT1IRcrLsTL65RzCPcGxbfTPh72V4LdJY8YHqdiC
         aHqEqSWtYrXaNiZPn1xuyuFJmmnoo3iRancIxdjd3VDboE9ELNWJb6EhF50iORfVXdzu
         a3zNaiprlO/HJ7+Odx+ya7s8S6oIzGY8Lu44c5J9BQCBrLlYgn18XLbNkf+eB5qseYcP
         NCot5nh96Chj8P+X5WVfKJ6qfrxRumgCRBceJHxajYy4rMXpyDDcQ+/2d2frkQysejqT
         dQiFv2Zh4+Q94rAZlTKFonSKmcctLZHgGsRyN79Z0iwj68UJ5R59Q41cXV/hpu1OLGm8
         Leog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764186629; x=1764791429;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6WTVHEYOh73wJPybBHZpQae4Q31hwe5BpFUWCvD62E=;
        b=tsWgyUTQff+toaXi7V2QBr+bWEP7UEJT87m9DPfTX/ZjDhOjhWta5l9aqxdHAMSFpi
         PT0bnFfrJlwqpoKjiCUhevflCwGkca3nyuaBGwYsKt6gBbPVop/ydeeHPS9eVqFJGqZ4
         gdQ3gK+QS1WCBP7d/8BerqZ6w9UE87vKzysDYAAwEBKCzP0WP12UoBmmui4Vc+AuvGHZ
         uoSfy3tgPzPxGI3oUfC7egmwrmKFgOdqheJ1EroxZf9Fr1QgEa4czxZIVubuYDbGvSUU
         f4IdO9YL7kbd1OjKmOshK1NLPXT2a1l69er+OZP3ER+BHEinasQdGaglO/VHEv4Egz54
         XGUw==
X-Gm-Message-State: AOJu0YyX8tfnxo8FxnSP7J8xKfJSN8KuDfDwNEDTfIaqsPO8e73P8q9I
	LR0D7wS0aj6GFjp8+FXoW0DYS6S9u0Sym4cnUvVZqGrUlaFjNYhFyeKgjCBndxPBOghz4/PFcau
	RzHlz52LOog4YBbZ7xVF/V7pYJk8rTXA=
X-Gm-Gg: ASbGnctHYq7hqn1yggDs55WLK0qBSGhCEUpLjf5zEujxgyWKepsSXJe3pTHGKNKelXM
	Q2mH57jN956/F3Sm1yukWkfm96srdkwTnl++GHFWvXvYKJEJ06oZCdtiaANVhyoE5beCAck3YTG
	VEIdrEHcJZrzRNhEt+H2XFK/PDXiVx13NkZ2Egy816cAac0L+WMJFQv9afFBwagTS80RKk7+g+z
	6x1YUlfRZrFqwuM/I3JaBS5iOC4o2OGHJCMLMS1XeTfgE+wL8F8tU8ZVIZq16l/Kx/gxH0=
X-Google-Smtp-Source: AGHT+IHvxgYlFUja/x9PLOxZsctMcQB9MffkBVjkSSF/6rC2j41Qa8cHUSRaN3PHNh5ycJnVRz/yfDORrgWMoF7/+WI=
X-Received: by 2002:a05:690c:6a13:b0:78a:6e1d:cc0f with SMTP id
 00721157ae682-78a8b572c26mr160683627b3.66.1764186628990; Wed, 26 Nov 2025
 11:50:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721173741.6369-1-bruno.thomsen@gmail.com>
 <91f764ab-bec1-4791-b01b-3ba0803ce8f8@pengutronix.de> <CAH+2xPAEAfJW+yy-45Y8EpOWb-8vvaNf27GXe1Ch0Xj8ZuLZHA@mail.gmail.com>
 <6926f5eb.050a0220.2c99cd.7373SMTPIN_ADDED_MISSING@mx.google.com>
In-Reply-To: <6926f5eb.050a0220.2c99cd.7373SMTPIN_ADDED_MISSING@mx.google.com>
From: Bruno Thomsen <bruno.thomsen@gmail.com>
Date: Wed, 26 Nov 2025 20:50:12 +0100
X-Gm-Features: AWmQ_ble4aghP8TqURUE2X7dadmdcjpcDVwGSTOorI3PTVRp-HDsssWh3NAVXio
Message-ID: <CAH+2xPDHnG4+t1qt1OCh5JpnAJjLPx8X4qx+H0Rq3urgyBFtpg@mail.gmail.com>
Subject: Re: DT compatibility break for am335x (Was: Re: [PATCH] ARM: dts:
 am33xx-l4: fix UART compatible)
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
	Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"

Hi Ahmad,

Den ons. 26. nov. 2025 kl. 13.43 skrev Ahmad Fatoum <a.fatoum@pengutronix.de>:
>
> Hello Bruno,
>
> On 11/11/25 4:15 PM, Bruno Thomsen wrote:
> > Hi Ahmad,
> >
> > Den fre. 7. nov. 2025 kl. 19.47 skrev Ahmad Fatoum <a.fatoum@pengutronix.de>:
> >>
> >> Hello Bruno,
> >>
> >> On 21.07.25 19:37, Bruno Thomsen wrote:
> >>> Fixes the following dtschema check warning:
> >>>
> >>> serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
> >>>       ['ti,am3352-uart', 'ti,omap3-uart'] is too long
> >>>       'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
> >>>       'ti,am654-uart' was expected
> >>>       from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#
> >>>
> >>> Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
> >>
> >> I tripped over this patch, because it broke the console in barebox after the
> >> device tree sync with Linux v6.18-rc1, fortunately caught before release.
> >
> > Sorry to have caused you issues in barebox, that was not my intention.
> >
> >>
> >> I believe the correct resolution for the DT binding warning would have been
> >> to extend the compatible list in the binding with ti,omap3-uart if they are
> >> indeed compatible.
> >
> > I can see that I forgot to include the full reason for the change in the commit
> > message. We have some products based on ti,am33xx soc and the serial
> > the console had many quirks when using the ti,omap3-uart that we did not
> > see on other soc families. The console did not like opening vi or htop but
> > could only handle simple kernel log. Switching to ti,am3352-uart fixed these
> > issues, so that was why I changed the device trees and not the schema.
>
> Couldn't the same result have been achieved by disabling
> CONFIG_SERIAL_OMAP? The driver match logic should already have preferred
> the more specific compatible, so the problem is that two drivers are
> matching against the same compatible, right?

Yes, that would have given the same result. I chose to fix the DT schema warning
as I'm preparing a few boards (2 existing + 1 new) for upstreaming.
But looking at
DT schema check was not pretty for an am335x based DT :)

/Bruno

>
> >> I have submitted a patch to add the now sole compatible to the barebox driver[1],
> >> but please keep DT compatibility in mind with similar changes in future.
> >
> > Thank you for maintaining barebox. On our new platforms we only use barebox
> > as a bootloader as it provides a much easier board boot then u-boot.
>
> Happy to hear. :-)
>
> Cheers,
> Ahmad
>
>
> >
> > /Bruno
> >
> >>
> >> [1]: https://lore.kernel.org/barebox/20251107182805.3367244-1-a.fatoum@pengutronix.de/T/#u
> >>
> >> Thanks,
> >> Ahmad
> >>
> >>
> >>> ---
> >>>  arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 12 ++++++------
> >>>  1 file changed, 6 insertions(+), 6 deletions(-)
> >>>
> >>> diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> >>> index d6a143abae5f..cef24aafed1a 100644
> >>> --- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> >>> +++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
> >>> @@ -200,7 +200,7 @@ SYSC_OMAP2_SOFTRESET |
> >>>                       ranges = <0x0 0x9000 0x1000>;
> >>>
> >>>                       uart0: serial@0 {
> >>> -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
> >>> +                             compatible = "ti,am3352-uart";
> >>>                               clock-frequency = <48000000>;
> >>>                               reg = <0x0 0x1000>;
> >>>                               interrupts = <72>;
> >>> @@ -1108,7 +1108,7 @@ SYSC_OMAP2_SOFTRESET |
> >>>                       ranges = <0x0 0x22000 0x1000>;
> >>>
> >>>                       uart1: serial@0 {
> >>> -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
> >>> +                             compatible = "ti,am3352-uart";
> >>>                               clock-frequency = <48000000>;
> >>>                               reg = <0x0 0x1000>;
> >>>                               interrupts = <73>;
> >>> @@ -1139,7 +1139,7 @@ SYSC_OMAP2_SOFTRESET |
> >>>                       ranges = <0x0 0x24000 0x1000>;
> >>>
> >>>                       uart2: serial@0 {
> >>> -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
> >>> +                             compatible = "ti,am3352-uart";
> >>>                               clock-frequency = <48000000>;
> >>>                               reg = <0x0 0x1000>;
> >>>                               interrupts = <74>;
> >>> @@ -1770,7 +1770,7 @@ SYSC_OMAP2_SOFTRESET |
> >>>                       ranges = <0x0 0xa6000 0x1000>;
> >>>
> >>>                       uart3: serial@0 {
> >>> -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
> >>> +                             compatible = "ti,am3352-uart";
> >>>                               clock-frequency = <48000000>;
> >>>                               reg = <0x0 0x1000>;
> >>>                               interrupts = <44>;
> >>> @@ -1799,7 +1799,7 @@ SYSC_OMAP2_SOFTRESET |
> >>>                       ranges = <0x0 0xa8000 0x1000>;
> >>>
> >>>                       uart4: serial@0 {
> >>> -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
> >>> +                             compatible = "ti,am3352-uart";
> >>>                               clock-frequency = <48000000>;
> >>>                               reg = <0x0 0x1000>;
> >>>                               interrupts = <45>;
> >>> @@ -1828,7 +1828,7 @@ SYSC_OMAP2_SOFTRESET |
> >>>                       ranges = <0x0 0xaa000 0x1000>;
> >>>
> >>>                       uart5: serial@0 {
> >>> -                             compatible = "ti,am3352-uart", "ti,omap3-uart";
> >>> +                             compatible = "ti,am3352-uart";
> >>>                               clock-frequency = <48000000>;
> >>>                               reg = <0x0 0x1000>;
> >>>                               interrupts = <46>;
> >>>
> >>> base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
> >>
> >>
> >> --
> >> Pengutronix e.K.                           |                             |
> >> Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
> >> 31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
> >> Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
> >
>
> --
> Pengutronix e.K.                  |                             |
> Steuerwalder Str. 21              | http://www.pengutronix.de/  |
> 31137 Hildesheim, Germany         | Phone: +49-5121-206917-0    |
> Amtsgericht Hildesheim, HRA 2686  | Fax:   +49-5121-206917-5555 |
>

