Return-Path: <linux-omap+bounces-1533-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E32907DBD
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2024 22:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24898B2144C
	for <lists+linux-omap@lfdr.de>; Thu, 13 Jun 2024 20:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0666713B7A1;
	Thu, 13 Jun 2024 20:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+NZO3rk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363BF2F50;
	Thu, 13 Jun 2024 20:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718312375; cv=none; b=JK/kN/fxmQMNBdgkox8YU25wiY83ge7qHSpZTm7gEADDejqh3LdXso0Rr/LY8DaMED2EINCBNFh2mhmgXq0DWl68cq3PWQZhqsUgNl8puLhzg6lDB+dJYU5eJGG5D51X7tjLf1jzj+iMlUkxlumSGjeLUSH6ReHQ03hkDxTofZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718312375; c=relaxed/simple;
	bh=nVm6c8dzPN6w85JqRXEcHGl1cDE6oCtq/cbPfbXWx+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gSx5gXUq+o/F7hquZtBb+Ms+BvDpHabaICkwqBeI77yQlnmNmL3gQlz6agoELCMVo0BCXjRyBwU/7xZR9t3ZDfdJsHrOBOXgFvuaJLvRRuHzVr/9DTkbhquOptBHTRIefKlLHzaTyEyClVZEW2sUCU+CPrvO5NC9yfYMhX1dMno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+NZO3rk; arc=none smtp.client-ip=209.85.222.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-80b8fd76e6dso752500241.1;
        Thu, 13 Jun 2024 13:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718312373; x=1718917173; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGK4HgLF/G5T6sS6MVCIimC13eAz1/g4TH5Np1XTe5Y=;
        b=g+NZO3rk2/U10AQNTg6EdbyYHp7Kmw/w61tIxOh9tJm5FxgJ/woImgKhINmsXI863b
         hjuWmkJTUkuMXxzgwpQQnG8dE5kASU7r9u5FGKuTDtiSqxsdBOcIMLJy3PZuFnxCNoYa
         iFpf/biiQUDB+iELWASvN3fY62GlgK2CuHE8odrKxXPEWEHz59RDOebHh5FUswOjX+rf
         somkX3dGx7XbujoYfIORod9ehd7t4uZwI/LDUZzq1SNMvEKuDVD7diztgVUlAs9yNnFh
         PK0DtZMW404K1IpPcLUFjm43RC0Q/y34uHGxRuhJypkqS0eTssAHIWODOgUV7w8OiDAK
         fAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718312373; x=1718917173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGK4HgLF/G5T6sS6MVCIimC13eAz1/g4TH5Np1XTe5Y=;
        b=XaZYSkAC+pnfG/3Lit2KBaflzKUq8ulAVmTwxs+5jnujR1O8VOGWdKIfwDgmkxeruF
         T1Ol2ATWE8XQ7TBA5QdF8h0sEPNf7jEdDM0QF5Nq2UiPma/dwwP4BsPOGlrbB1FElLuf
         Cmn6WkEY34LXuVF6fzE516YfT3ooDbzoGXzHu+34hz7ZOZAPne3BNUCFNEE53iqGX9GD
         wmQZp0Pu8T3EkmDrLPmNa4dC0D0XgC8y6P0UbTqiN5Ps8U/bs47tdtvdTgqY5lodC3mn
         3HZeA+FORWhvQu0w3fZUpdiLGiOFoVljalu08QhEzgjWED31qDwVRgV8MDC11ag/07dj
         Jhfw==
X-Forwarded-Encrypted: i=1; AJvYcCWoBjNvF4fj844tD5SQ31qzHqbon0BH7UP5yodCgJVxgpL7OLSrpikzAaDm1RQAN9wsKB1Cow3mSmTXw9Toid0TKumFcjP6VLbRYxa7qZAHxEAlmGcOAeAXWuGiRBvMWYmwFbaf1dphXgNUKd009aR9Yz9nKaDvNvID3a5G2ur3kuimOZb3TR/kjBGww7bX4ShhtE/Xte1AgRMS9ESv5WwF5y5YnsTU
X-Gm-Message-State: AOJu0Yy72TStiW6Hjbiy9/G6glPyL38WBrPcNzWuqa2T7WWFGZsZ6uLb
	Z1S177dAC6tgzna1yo8lamTAarYIVg6UzXeEX7U7yUdIvY8+3W15LL0E91GfbuMTt4poKNa4mvn
	NbLVfWLPOYQPJt8KIUDtIaNpELYI=
X-Google-Smtp-Source: AGHT+IGuEfez6CK1timgXxVp0xE5gnGcSK4bdjdOKc2Wa+djQb/95R1GNpVB6fXgqVQEpt/AJ+Xe3ejMsNulcikviis=
X-Received: by 2002:a05:6102:22cf:b0:48d:a0d8:8ac4 with SMTP id
 ada2fe7eead31-48dad965b79mr1460181137.2.1718312372353; Thu, 13 Jun 2024
 13:59:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240612234930.211119-1-allen.lkml@gmail.com> <17eadeab-ecd5-4302-94b3-bbcf4f9d8dfc@intel.com>
In-Reply-To: <17eadeab-ecd5-4302-94b3-bbcf4f9d8dfc@intel.com>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 13 Jun 2024 13:59:21 -0700
Message-ID: <CAOMdWSLRuzrytH_6t2POHeDNLvZ2SDk5z5ahfSE5dYa7fKKs-Q@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: Convert from tasklet to BH workqueue
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Manuel Lauss <manuel.lauss@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Alex Dubov <oakad@yahoo.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Bruce Chang <brucechang@via.com.tw>, Harald Welte <HaraldWelte@viatech.com>, 
	Pierre Ossman <pierre@ossman.eu>, Christian Loehle <christian.loehle@arm.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > The only generic interface to execute asynchronously in the BH context =
is
> > tasklet; however, it's marked deprecated and has some design flaws. To
> > replace tasklets, BH workqueue support was recently added. A BH workque=
ue
> > behaves similarly to regular workqueues except that the queued work ite=
ms
> > are executed in the BH context.
> >
> > This patch converts drivers/mmc/* from tasklet to BH workqueue.
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> >
> > Tested-by: Christian Loehle <christian.loehle@arm.com>
> > Tested-by: Aubin Constans <aubin.constans@microchip.com>
> > Acked-by: Aubin Constans <aubin.constans@microchip.com>
> > Acked-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> > Reviewed-by: Christian Loehle <christian.loehle@arm.com>
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
> > v2:
> >    - fixed patch styling issues
> >    - rename work to bh_work
> >
> > Link to v1:
> > https://lore.kernel.org/all/20240327160314.9982-10-apais@linux.microsof=
t.com/
> >
>
> [SNIP]
>
> > diff --git a/drivers/mmc/host/sdhci-bcm-kona.c b/drivers/mmc/host/sdhci=
-bcm-kona.c
> > index cb9152c6a65d..9c215db81b2b 100644
> > --- a/drivers/mmc/host/sdhci-bcm-kona.c
> > +++ b/drivers/mmc/host/sdhci-bcm-kona.c
> > @@ -107,7 +107,7 @@ static void sdhci_bcm_kona_sd_init(struct sdhci_hos=
t *host)
> >   * Software emulation of the SD card insertion/removal. Set insert=3D1=
 for insert
> >   * and insert=3D0 for removal. The card detection is done by GPIO. For=
 Broadcom
> >   * IP to function properly the bit 0 of CORESTAT register needs to be =
set/reset
> > - * to generate the CD IRQ handled in sdhci.c which schedules card_task=
let.
> > + * to generate the CD IRQ handled in sdhci.c which schedules card_bh_w=
ork.
>
> The comment was stale because sdhci.c has not had a card_tasklet for
> a long time.  Just drop the " which schedules card_tasklet"
>

 Will do. Thanks.

- Allen

> >   */
> >  static int sdhci_bcm_kona_sd_card_emulate(struct sdhci_host *host, int=
 insert)
> >  {
>


--=20
       - Allen

