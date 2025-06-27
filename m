Return-Path: <linux-omap+bounces-3985-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B55AEAB99
	for <lists+linux-omap@lfdr.de>; Fri, 27 Jun 2025 02:10:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 995153AD91A
	for <lists+linux-omap@lfdr.de>; Fri, 27 Jun 2025 00:09:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833EF2F3E;
	Fri, 27 Jun 2025 00:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YY1x5GFc"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B7CBDF59;
	Fri, 27 Jun 2025 00:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750982666; cv=none; b=AH4KI26R55znIRENd4xuOWywc92HiBpapk0RKjhWUyiwIZUMdRKiV0AWqCwgRbvJwJdqNt5BMAtScuCHBi85NVGEugCiNkyXHWOnrIv8MkpAibpvqEkWCbuWD2MD0GxSKsYMN8F8yj0hH1JrO6vx4idQyXoBkzSH3TGVxPhvQt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750982666; c=relaxed/simple;
	bh=MMnGvwviEVFlUvuSc5IrOYIGoVikK7rLR8ZR2R2Vb74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lx6VKOlUf1xG8eCJJqqC8H9n8dX+f+iKn5nN352xUkI7JgDo24nVDkAvYEUEO+MiVCSqwyuXNDfyEdBMXfIY3+e0x5hPUG9DtQ6ToAgl1dC5WTwa5WDDG7Ekrv3M46kicvW0cHi67zSaS+H4j9tD1mPrZdzK/DxJTxeboKImh+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YY1x5GFc; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-236470b2dceso17908285ad.0;
        Thu, 26 Jun 2025 17:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750982664; x=1751587464; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MMnGvwviEVFlUvuSc5IrOYIGoVikK7rLR8ZR2R2Vb74=;
        b=YY1x5GFc9sOdDUcj7fllnIRRt11uSZx/pdaycwO8UNq70joxNoda+99Hphz08jMIEq
         w65DiQfjFYsIF40SDOV0aJ+j5aTZLBQs/2KQPShWd88Vc0wK6c7jCVvHgF60tXW4aWF8
         U89WCVOmq/wCqIfaFKmJ8+vV/mLbj92prnuNpsHgy1sVJCyp7WCHbiqwE6objMCIKwzw
         9LWJe/MvC1yc3c4EJd7yfvBQAFH4KE5hq+txnil7Ca/2iiRRm+PBxsEFnu+H1uP7RjjL
         oX7AzkSCgeY8GbydUfH7LAMgYcP8PSLxtgjYmGhcdQft0cSvmxf9Blvc6Ww1BazunKBR
         O9Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750982664; x=1751587464;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MMnGvwviEVFlUvuSc5IrOYIGoVikK7rLR8ZR2R2Vb74=;
        b=tXfAtR7K4fmW1Uz3YzKS/oaVxg8EG/OBaWIy63jSoUCC7ePcN5hmnim8RCg9mPRBP1
         E3C31rZW0hdhOIPVmwT2xWvIWSCoeqavH/9Q7BSx00wozIrkY4N0YFnPRNyXWXtZ1TFg
         iO+GLWw1/Cf0ZKWk6JzELpZV4w54XgtdSvlMbdxzXqjiX6xibVppbAIZHySTksm/PoFa
         0FYdMe5nyi/xbqttdLZx2JB1JyxqNl6Bi1XLSIYskN0OtIIyiA/XJT0ZHwhgJIZ8JCFC
         JAOA3QSxBHdUT7lWVXBpM6y3S8p5NXxW1LmgyvDJ90SKpx9ipxHBtoQGSS0f2g1rVibZ
         c6tA==
X-Forwarded-Encrypted: i=1; AJvYcCUiUMV14Lrjc7ZHj8E0s7wPRgluR+Utf69bTUNlIklDutkW1mJ3ItOyZntlEr+r/12xcIZzA9gdnI/TGI1i@vger.kernel.org, AJvYcCWAb8jkwprQIbsm8doQg1BKjqXcX+awHVizVqLd43pb+cbgWYmT6HnObe35blE+1QnH/DfrtdKnYkaPLA==@vger.kernel.org, AJvYcCXCEmbeYbcf69qtfiLzYIsUuYySxWgqRPdj51eXkodzkbbNwzB54qci7EbB5GbGaebnIMCeKixhkpoI@vger.kernel.org
X-Gm-Message-State: AOJu0YxYjoJNH/jLvVKTcLnx00GlWjJH/D62PTV1STDAZg2ojXlChI6p
	O7YZFs9GRHloJXTLCzgYzPHIt3WGM1NACJwEAYflqeWLhE8OkZVJDp9mOq32va7+flAxR7GhEPY
	h2CPoRf248pbWz1E1I+v3nRnKupy2ztM=
X-Gm-Gg: ASbGncuw0wboDWWVb6oXSvQR5QTlvohmktvcjCAZnbt6mdD7Kad0acL4xzSi0Q8va5Z
	SeFlPTl1Fa3YYIspIlqSnMVDR8xXe8RQno8l4B3hylah8sUQpu7f2vIurieP1m1/Rb0ijyU0kMG
	eQxd2Xc8LWSRauC1lGO3TvQv0N2joXXp8Swvb8MvTZ13Ys
X-Google-Smtp-Source: AGHT+IFlddWDto7V2+jazoypW+F1vj2BX8bxx8BPpRAZpczzJKylaofzMNivlk1qo7wzFt/Q3vzyNmQWz/UqPI/9Bpo=
X-Received: by 2002:a17:903:f8d:b0:234:a734:4ab1 with SMTP id
 d9443c01a7336-23ac2d86971mr13866665ad.3.1750982663585; Thu, 26 Jun 2025
 17:04:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250620-bbg-v5-0-84f9b9a2e3a8@bootlin.com> <e49a3fff-8a50-44aa-aa0c-1ba1bf478eb6@ti.com>
In-Reply-To: <e49a3fff-8a50-44aa-aa0c-1ba1bf478eb6@ti.com>
From: Robert Nelson <robertcnelson@gmail.com>
Date: Thu, 26 Jun 2025 19:03:56 -0500
X-Gm-Features: Ac12FXzvGaKZfG4TDGgxvXq8kIRn9_pX2bPdP2HIh9V69ipXrdVK7EmoJJX0lj8
Message-ID: <CAOCHtYgNfnAK43GBTdN675dFSHrbTJfy_2GbRE88E-0keoChrg@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] Add support for BeagleBone Green Eco board
To: Judith Mendez <jm@ti.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Tony Lindgren <tony@atomide.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Paul Barker <paul.barker@sancloud.com>, 
	Marc Murphy <marc.murphy@sancloud.com>, Jason Kridner <jkridner@gmail.com>, Andrew Davis <afd@ti.com>, 
	Bajjuri Praneeth <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Romain Gantois <romain.gantois@bootlin.com>, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 6:23=E2=80=AFPM Judith Mendez <jm@ti.com> wrote:
>
> Hi Kory,
>
> On 6/20/25 3:15 AM, Kory Maincent wrote:
> > SeeedStudio BeagleBone Green Eco (BBGE) is a clone of the BeagleBone Gr=
een
> > (BBG). It has minor differences from the BBG, such as a different PMIC,
> > a different Ethernet PHY, and a larger eMMC.
>
> Thanks for the patches.
> I was testing against next and noticed a kernel paging request error:
> https://gist.github.com/jmenti/d861528f98035b07259c29e76e5fae8b
>
> Did you see this by chance?
>
> I will double check that I tested correctly and come back, but was just
> curious to see if this is expected.

The tps65219-regulator.c has a bug, make sure with this board you also
have: https://patchew.org/linux/20250620154541.2713036-1-s-ramamoorthy@ti.c=
om/

Regards,

--=20
Robert Nelson
https://rcn-ee.com/

