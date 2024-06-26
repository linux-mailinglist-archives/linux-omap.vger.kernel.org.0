Return-Path: <linux-omap+bounces-1594-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEBD91808F
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 14:08:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA661282891
	for <lists+linux-omap@lfdr.de>; Wed, 26 Jun 2024 12:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A15A180A9F;
	Wed, 26 Jun 2024 12:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hYYsN89E"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564F01802C2;
	Wed, 26 Jun 2024 12:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719403677; cv=none; b=SnMXFfDv4uND2r8eKgswpLQ/Q2U16Ra+jNE+Na/bjaH0KjE91GvDteILcvbU4Rw2qitKMS8G1FWJZ5nJ4WJqRIbAso18UTm5kp19h+5AqqFAepSPPLwIs+BluJJav0Ev6btgZUCxZb/Jq6CXvh1m3pZsXzsl/gDKeR1Mvq3s4lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719403677; c=relaxed/simple;
	bh=8mOhudOXTmEbkqgsYqYigKENLG9E0OWtck7yCITGflo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=t89vE4e0WsYbv3JlBO5OS0QexqtvsTvz+7DSvk0PpZCgHQRC/hDdPCC27CcF1ysNo9i/oT8jNWL7hrmNPLbCrsQcjQt1/IXPQMmfkTXjd2RSN2gm5+P0S4MrOWEpWC7qA7c8y9JBY+7pLv9nXAozuYcjVzYhIqm/JUCwtiyVGHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hYYsN89E; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-700cc97b220so782526a34.0;
        Wed, 26 Jun 2024 05:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719403675; x=1720008475; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAronMZ9nXpH4cj2QDMqDD8SJNWWfIBviKFCpnieLuA=;
        b=hYYsN89EOiTtdFuTAep7Sl1lB7VspehP6MmaqmiZrvG+nmLjxRSpsDAH3My9Jpozz2
         D1KjP4J9f8oNUD/qgAuimOFQPx7XzcMIQAKSchvwLdPcyLkNRjgGx+mZFnHnCfgheZOa
         imFhiLj6xLYnWwhdMpzHRvcasX64dNwwi1+8RH5sDbPLQzKFFgTf/D/GgcEVVGlUm7QO
         b08xenW/xs94iL7Y5BFkIjVvKSXfAAjxYbmA10WaA9MZeH7BkHhiYbfy/LJVgRtHAxQm
         OQUgW8t12kfYjaRYbIiOcqj+kbzqpbKUhVitLOhgcg8vGdYM/8ZkZM/ADHvoSn5ABr6W
         F+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719403675; x=1720008475;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAronMZ9nXpH4cj2QDMqDD8SJNWWfIBviKFCpnieLuA=;
        b=fptcvSXZM0IhpNjSxGqa7mS3oS7HfJvoKCc44n9j18XCwhEC+9So/4zyhvWDW5fGMH
         xVnbwFyAh8Fni+RbZvWYyZQCBdmkp3sDmZ3bX7MIi9iYcIiOaWzm6+fSyGsRqr5jVdFe
         TivqyemOKbkV9xIL5B8pSEm356gLuDGI0cq2EMVBJVyEbRk3XCLdG9MPDhn3FAolbCpR
         7zI/n9/1ktSPW6Fdvs36vYnthfKK3EGAxGKuBrg+3+UuPTC0popU1O58hwzp0mBIEXiW
         iT3GjzluEKauHKtV1lptzdfc2bM0cp4zMVq2a6pPjSn/0okBc+Rnrfr8E4KhBsU07bsY
         5PHg==
X-Forwarded-Encrypted: i=1; AJvYcCVZjY6/a6A7KwB7bJr0Ydlp5uCh9QVOHswnPZuswIPGS5RzI6tR6K953j4JCHX10JAuYhRhwoXx+AD2r+8QMzd1GUUSrrMbOd8S3sxnhTs1crVmxDwgOiUZBJwHBlfM2rmp7AJyqmkFfd7xPw8bFMfg5EFWmxvrOujcGPZrKbDKO2q7RomWZG7GxYBqCTo7aOevJ5B2VNlP7kPlxXYG2atoNY+1aYyX
X-Gm-Message-State: AOJu0YzDmKBaj8CSFAKAPPXTNuhos3ZOLOL6sy3RrRy9OfHyhOoc699I
	H118K9YdOcm9DuNns/ywdvxCWTGwnpQLHyPMOPCEt+5FtqRjEpRLgCA7ath0wtkfRSnwYz/qcN3
	YTFQ1cy03StScY+TWoJcYDj+fZTk=
X-Google-Smtp-Source: AGHT+IFCMAsx9tDIVv13DMuoIpRL3C+UVD1twOEvF1DCf250YptSJiuynlLDnbBYZxJDsZQy5NgaF8VHgyg9gL3Q/kQ=
X-Received: by 2002:a05:6870:a2c7:b0:258:368e:4b46 with SMTP id
 586e51a60fabf-25d06e55e10mr11622922fac.38.1719403675266; Wed, 26 Jun 2024
 05:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625170938.2579372-1-allen.lkml@gmail.com>
 <racc3a2kmhu5275xcb6bght5j2bbg5ujlowdbfqeiwputmygei@ckscwafglafl> <rddr35qidcxfemy24lcqnz7fo6ogltlffizwbf7evtdoz5qgsu@tva3pf6e2isb>
In-Reply-To: <rddr35qidcxfemy24lcqnz7fo6ogltlffizwbf7evtdoz5qgsu@tva3pf6e2isb>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 26 Jun 2024 05:07:42 -0700
Message-ID: <CAOMdWS+2t9410vke+xr7fTnWrHq0tfq5PdohpX_G2q+LrZWevA@mail.gmail.com>
Subject: Re: [PATCH v4] mmc: Convert from tasklet to BH workqueue
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Allen Pais <allen.lkml@gmail.com>, 
	Aubin Constans <aubin.constans@microchip.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Manuel Lauss <manuel.lauss@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Alex Dubov <oakad@yahoo.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Bruce Chang <brucechang@via.com.tw>, Harald Welte <HaraldWelte@viatech.com>, 
	Pierre Ossman <pierre@ossman.eu>, Christian Loehle <christian.loehle@arm.com>, linux-mmc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > Hi Allen,
> >
> > >    - dropped changes to renasas sdhci(dma_complete)
> > >    - Wolfram to send a patch for it.
> >
> > It is still there.
>
> With build errors (forgot to say that):
>
> drivers/mmc/host/renesas_sdhi_internal_dmac.c: In function =E2=80=98renes=
as_sdhi_internal_dmac_request_dma=E2=80=99:
> drivers/mmc/host/renesas_sdhi_internal_dmac.c:551:22: error: =E2=80=98ren=
esas_sdhi_internal_dmac_issue_bh_work_fn=E2=80=99 undeclared (first use in =
this function); did you mean =E2=80=98renesas_sdhi_internal_dmac_issue_work=
_fn=E2=80=99?
>   551 |                      renesas_sdhi_internal_dmac_issue_bh_work_fn)=
;
>       |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>
> Please let me handle TMIO/SDHI completely. You will get the credit,
> still.
>

 My bad. Will drop that entirely from my changes.

Thanks.


--=20
       - Allen

