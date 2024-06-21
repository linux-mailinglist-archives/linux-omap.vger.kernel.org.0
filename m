Return-Path: <linux-omap+bounces-1581-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE96F912C9D
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jun 2024 19:48:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9F751C21CEA
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jun 2024 17:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19AE1169AD0;
	Fri, 21 Jun 2024 17:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLyDDW6j"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF1F15FD0E;
	Fri, 21 Jun 2024 17:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718992088; cv=none; b=NEMGyi+L81t1o+YBN5Gp3OIm/h/I60fNwc2C/k2bFsv9eplU06XUzFjaUHruetsHVy8ypXtOOw/OPawPEisGlTuUkOrvb891VbStioyLRwo0sd1RfWoh/cl4pPbDfNFoMjRYe89leiVX3uel5s27zadxKb6nfofRHsLqooUdPc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718992088; c=relaxed/simple;
	bh=mQ5L2vYcZRCcrLtYFaBkfoz0TXVWKORjITMqPyTNnlM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=RzfTVYPwMmAMVM3PYLZtUutOKsgvNLgRA4fdnq6Zj5UWf/de99G8NnAqKO+fH0OtICCluEXg938HuHC+3zr6z/TcaaqCIwMl52fx51CZbrdnUeZpT9FmsG9A7UT3h70ZPOfCw6cGSK9IsM8Jh62kDoAva4UItrL95fHWXxW/o8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLyDDW6j; arc=none smtp.client-ip=209.85.222.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-80f6cc81aa4so353951241.2;
        Fri, 21 Jun 2024 10:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718992086; x=1719596886; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=81ObmjHXbEwa7gKh45uz6idV8z3omKUYoqXG05RakrE=;
        b=FLyDDW6jUcz1RfebPvBnPSoPO5IHFDPFuN6ONc0hgauR0YWSf2wvbyfO8LuWnMBCNj
         JmsHXPoViElWKKDJghvqxledpIGTKr0K39+RIwDTJG2vYtdI51hXrO7dKC0y/HyaAUIw
         tSUXPPW3p2UQxBtQdfC6pjmzRlSUdt1R8UICZ0hcfp0YPvJ69cTg2isSvTYibIvkYVLm
         qflbLh2AP52uCjeQmboNEpC/bF34+P/YskNnr4LR+jWIofMUlc/wzGFfUtw1Z05RLXlw
         HkHYh+XPTK+vz2mIhVCSSVkv+V7mGRcp7ozcPR3vKEgKU84/+ujx9v6sDVRpL+wlf54h
         TYhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718992086; x=1719596886;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=81ObmjHXbEwa7gKh45uz6idV8z3omKUYoqXG05RakrE=;
        b=hIG/1cdRWYBQvUYdy+pddsW6EgifaHy7EwLgO7YtUKzkFQGn/XsW1zyNbHffbaVpgI
         Wlfj+SZ8a6ljrVm3cR8FLC3+3IickegIQ5b//Qp821uRcB2j3wc6bpfYQf2D1ogVDHsP
         RdNQ6IdRj2rVmA03AZ2/485eHWjVXHhp0K8JhwLPHmazztBC1xU/srPHKvKFF0pbq/LB
         oe9emOmb92MhcENFouF7/e3c82MAJnUjcaVclLDAjU/4r9Vlp9n/Qd5HpfGhTVn7Vbb0
         yDqpGrvyKrGJXhXNUvRUIcbq+Cyt5s5JV7IjNu3befF8A4WBwEiAoF8YGvTpdNRPtUGP
         sFFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCXjV2pyoJtc+dcHAtz1TbEFMAQCPHOnoQ5L4EvTzOl6n5ek4L5ppIQsezHhtLJgRNPIuNtYb1+EvNvPx7GnrJvR6PuzRYQSsgFlYvKjancHstXivL6plVJjDukl+bISyElYuC43AXqO9d+irl7kCev5pqmL9PB1HFBhz8HliWCVeKHPY/VuTa4++7tmVdLQvx289cxOqI3iBDNCNfZEyf5xy8XEi8
X-Gm-Message-State: AOJu0YwerkS4r4v1KHDhdcyldn3qCrwBRleNK26fsx5VV6pwbGqG5pMl
	4dpV6+JmWxfQ5tLBxbyJVDfr2kCvJvdmnSHOfdzrU4MoekfNvFdwVTblR1IzpCXyNF61cYUA+g9
	bqxuKRuS2LZpNTGFZA2CqA2oF8Kk=
X-Google-Smtp-Source: AGHT+IGuB2z+co8OUz9vMffmlPdrxKTYQViMR/EpC9iBEu86iSA4jDVHANAWyQ0JOxVMxt1gemx/eb204mkQAI8RZ4I=
X-Received: by 2002:a05:6122:18a1:b0:4ef:53ad:97bd with SMTP id
 71dfb90a1353d-4ef53ad9c40mr1421229e0c.3.1718992086037; Fri, 21 Jun 2024
 10:48:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618225210.825290-1-allen.lkml@gmail.com> <gw6adkoy3ndjdjufti2gs2gnk3xdgylt6tnia2zha76hsgdwtq@dr3czbxjij66>
In-Reply-To: <gw6adkoy3ndjdjufti2gs2gnk3xdgylt6tnia2zha76hsgdwtq@dr3czbxjij66>
From: Allen <allen.lkml@gmail.com>
Date: Fri, 21 Jun 2024 10:47:54 -0700
Message-ID: <CAOMdWS+p4Dt2xDGWvwoXtWinsRZintLwPmADddbsmaEfLvRQkw@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: Convert from tasklet to BH workqueue
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

> On Tue, Jun 18, 2024 at 03:52:07PM GMT, Allen Pais wrote:
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
>
> Has this been fully build-tested?
>
> =3D=3D=3D
> drivers/mmc/host/renesas_sdhi_internal_dmac.c: In function =E2=80=98renes=
as_sdhi_internal_dmac_complete_work_fn=E2=80=99:
> ./include/linux/container_of.h:20:54: error: =E2=80=98struct tmio_mmc_hos=
t=E2=80=99 has no member named =E2=80=98dma_complete=E2=80=99
> =3D=3D=3D

 Yes, it does break. My bad, my local compile testing failed to catch this.

>
> In deed, 'dma_complete' is only in 'struct renesas_sdhi_dma'. From
> there, we can get to the parent 'struct renesas_sdhi' using
> container_of. But then, I don't see a way to go to 'struct
> tmio_mmc_host' from there. The other way around is possible because
> there is the pointer 'struct tmio_mmc_data *pdata' in the TMIO struct
> pointing to the data contained in 'struct renesas_sdhi'. 'host_to_priv()'
> does the math. But I don't see a path the other way around.
>

 I have been looking at this code since the issue was reported. Yes it
is a bit tricky and so far, the only way I found was to introduce a new poi=
nter.
But, I am not very familiar with the code and have asked Ulf for pointers.

If introducing the pointer is the only way forward and is an
acceptable solution,
I can send out a draft.

Thanks,
Allen

> So, it doesn't look like the workqueue interface can provide a
> generic pointer like tasklets could do? This means we have to add a
> pointer from 'struct renesas_sdhi' to 'struct tmio_mmc_host'?
>
> All the best,
>
>    Wolfram
>


--=20
       - Allen

