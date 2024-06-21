Return-Path: <linux-omap+bounces-1582-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 406AE912D41
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jun 2024 20:36:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B471B1F23547
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jun 2024 18:36:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3B7E17B400;
	Fri, 21 Jun 2024 18:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fyadxZ0C"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35B48820;
	Fri, 21 Jun 2024 18:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718994957; cv=none; b=KpuJov8ka8OV71HYXq5D5D9aLREFDfKlt7gwVxbfduTB9iMnESQmxsUohOlSA8XwPWcB3QbQBFPbVSmoHsmBx6W+zPjwy+oZTufUWXiUcn8+FgzQa2liL8SePrkFFVq8JsSFNgJrBy8rF/OYWPHq5yNhXm+jXRPfdx6QfEfz9U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718994957; c=relaxed/simple;
	bh=QIyejG/zbZEcgR5J/ddiOry3kPPgnnTi3cpFLpIU+X0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=TLjeeYzqGTQGVeLvM1du7oWn6AXXoPaHg0nDkotvpHWSfK6WELza+c1ibPXeEuFFVWn9M1S49g7wjPHg7eO2N2rcSgNxXjdJXjyZEtXxXDKP+NCZ+Me6LOlSNnBDy1niObjcqYgC4zyNVcHyJZU8r/8OjhYnusEynKsnO8w7/6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fyadxZ0C; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-57d280e2d5dso1938605a12.1;
        Fri, 21 Jun 2024 11:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718994954; x=1719599754; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ut3soxKE98hJxPx1BWoehHt/249jkHLzLfTJdtT/OE=;
        b=fyadxZ0CIy+j+/8N2zZgG5rB8B6Rwjkf0wO3ina+jcr1lwFAa685g/qwy7rXsgoNuK
         MrQgRJAVVx0HWgvtkvzCTAJzvLOSj3Hx/7hjgqPoxjULaUqPI+TtMECddhHZkx69dYt6
         sYPOqCTC0uchO16PEOPrpp1vKjIzqSiaXTMqVl4g/hZHcV7/sU+oAjsVRkfzPS2oOWV6
         x1Y8Jbhet3Eo2lhGE6rPytekD+5uFk6sMFSAgISfynqNiX0mASD4n2CuYqz4ziqGFdkU
         LcU2DZqxtg9qlgBvgrWaT0SaT892xSNrTae08Eex8opp0oOG6/FgP4fSYsulWoIoS54f
         0FRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718994954; x=1719599754;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8ut3soxKE98hJxPx1BWoehHt/249jkHLzLfTJdtT/OE=;
        b=VSqZV5VIlLhTo0kUZ9twImq7mM/DDw6s7+iv4bHQ2Au0phUSMLB9BAYHkYhIbpF6cQ
         OHf8neeu/nIBNaLL8xvQH2+KIFTmSb/d4ZjkYfgEb7HtB/aviFvKAAP4Av8xtfQyhY12
         sC2zJFCqlKJ8EAjKbmfsnv706n/Bxmx4vkQJC96aBb4wosytD1cCJ7RPCHvcQFDLjO+B
         uK0p8Y5HhSU+7THStEmEqpkdycafSCsbIqIOb3Br+oMRmjG8P6VwbBG374WMzx8Z2BRb
         ytlysZK38Be8DCcaKWf+fhDtWJ+oXuOFXdD3jhmB5zGyV2DrFv8RBFfYNQ3rMPe3LzcP
         K5Pg==
X-Forwarded-Encrypted: i=1; AJvYcCW9yzdVm/MyBl9CDvmAB00stD+0qCyHFKi56OBokjOPq/6uKLkQzkS3s5UEwjuwSGVKX6CO9jveIzgxm+YR0YlLvIGFdBtM0jJKclYTSpFhI4md4VEdCkZOcSGuVFrYU6CJVj7Rm+myJFMSZRLiFKTNezIF/9URZZsTWBUieyCBncPYpVehNikjHZgUbzvL+Bs3m7U8+WdyWdjVWS2qrSjLVSeubV5y
X-Gm-Message-State: AOJu0YzMQLLnB2JppeBQGWE/u8Gf48PlqOPXpgMrrexbGg7EW6Qv2kWT
	p9DUuxBDfaU95dxCfzSZ7AtZw+emiymKzOIF9SWajnP6fjOzshLehwpfBYG+IGCIN1wXJ62EBFm
	qFzvMAv88IF1q3h6kXMiaXlUQFeY=
X-Google-Smtp-Source: AGHT+IGeL1qr5IRUGzRkGEVvSh2+JLe463SKTjitYFVFbztu9r9oubLaI7KKXq2n4LWsmU35TDeIqBD0pgUebFFnfNc=
X-Received: by 2002:a50:cd13:0:b0:57c:6afc:d2a9 with SMTP id
 4fb4d7f45d1cf-57d07ed9449mr4999733a12.26.1718994953827; Fri, 21 Jun 2024
 11:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240618225210.825290-1-allen.lkml@gmail.com> <gw6adkoy3ndjdjufti2gs2gnk3xdgylt6tnia2zha76hsgdwtq@dr3czbxjij66>
 <CAOMdWS+p4Dt2xDGWvwoXtWinsRZintLwPmADddbsmaEfLvRQkw@mail.gmail.com>
In-Reply-To: <CAOMdWS+p4Dt2xDGWvwoXtWinsRZintLwPmADddbsmaEfLvRQkw@mail.gmail.com>
From: Allen <allen.lkml@gmail.com>
Date: Fri, 21 Jun 2024 11:35:40 -0700
Message-ID: <CAOMdWSLfZyoM-_7EV5f1QPKmCM3M2Pkw=zHhVQb4ULnb9B5aZg@mail.gmail.com>
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

> > > The only generic interface to execute asynchronously in the BH contex=
t is
> > > tasklet; however, it's marked deprecated and has some design flaws. T=
o
> > > replace tasklets, BH workqueue support was recently added. A BH workq=
ueue
> > > behaves similarly to regular workqueues except that the queued work i=
tems
> > > are executed in the BH context.
> > >
> > > This patch converts drivers/mmc/* from tasklet to BH workqueue.
> > >
> > > Based on the work done by Tejun Heo <tj@kernel.org>
> >
> > Has this been fully build-tested?
> >
> > =3D=3D=3D
> > drivers/mmc/host/renesas_sdhi_internal_dmac.c: In function =E2=80=98ren=
esas_sdhi_internal_dmac_complete_work_fn=E2=80=99:
> > ./include/linux/container_of.h:20:54: error: =E2=80=98struct tmio_mmc_h=
ost=E2=80=99 has no member named =E2=80=98dma_complete=E2=80=99
> > =3D=3D=3D
>
>  Yes, it does break. My bad, my local compile testing failed to catch thi=
s.
>
> >
> > In deed, 'dma_complete' is only in 'struct renesas_sdhi_dma'. From
> > there, we can get to the parent 'struct renesas_sdhi' using
> > container_of. But then, I don't see a way to go to 'struct
> > tmio_mmc_host' from there. The other way around is possible because
> > there is the pointer 'struct tmio_mmc_data *pdata' in the TMIO struct
> > pointing to the data contained in 'struct renesas_sdhi'. 'host_to_priv(=
)'
> > does the math. But I don't see a path the other way around.
> >
>
>  I have been looking at this code since the issue was reported. Yes it
> is a bit tricky and so far, the only way I found was to introduce a new p=
ointer.
> But, I am not very familiar with the code and have asked Ulf for pointers=
.
>
> If introducing the pointer is the only way forward and is an
> acceptable solution,
> I can send out a draft.
>
> Thanks,
> Allen
>
> > So, it doesn't look like the workqueue interface can provide a
> > generic pointer like tasklets could do? This means we have to add a
> > pointer from 'struct renesas_sdhi' to 'struct tmio_mmc_host'?
> >


How about the following?

diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index 5fd276492f80..9a63b78837e2 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -484,9 +484,14 @@ static bool
renesas_sdhi_internal_dmac_complete(struct tmio_mmc_host *host)
        return true;
 }

-static void renesas_sdhi_internal_dmac_complete_work_fn(struct work_struct=
 *t)
+static void renesas_sdhi_internal_dmac_complete_work_fn(struct
work_struct *work)
 {
-       struct tmio_mmc_host *host =3D from_work(host, t, dma_complete);
+       struct renesas_sdhi_dma *dma_priv =3D container_of(work,
+                                                        struct
renesas_sdhi_dma,
+                                                        dma_complete);
+       struct renesas_sdhi *sdhi =3D container_of(dma_priv,
+                                                struct renesas_sdhi, dma_p=
riv);
+       struct tmio_mmc_host *host =3D sdhi->mmc_data->host;

        spin_lock_irq(&host->lock);
        if (!renesas_sdhi_internal_dmac_complete(host))
diff --git a/include/linux/mfd/tmio.h b/include/linux/mfd/tmio.h
index eace8ea6cda0..cf2cca0e96b5 100644
--- a/include/linux/mfd/tmio.h
+++ b/include/linux/mfd/tmio.h
@@ -100,6 +100,7 @@ struct tmio_mmc_data {
        dma_addr_t                      dma_rx_offset;
        unsigned int                    max_blk_count;
        unsigned short                  max_segs;
+       struct tmio_mmc_host            *host;          /* back
pointer to the parent struct */
        void (*set_pwr)(struct platform_device *host, int state);
        void (*set_clk_div)(struct platform_device *host, int state);
 };

Thanks.

