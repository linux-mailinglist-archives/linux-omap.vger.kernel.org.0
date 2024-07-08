Return-Path: <linux-omap+bounces-1738-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1134F92A2BF
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2024 14:27:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 664551F2264C
	for <lists+linux-omap@lfdr.de>; Mon,  8 Jul 2024 12:27:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5A6B137757;
	Mon,  8 Jul 2024 12:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wnSDDJHO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E1313F43A
	for <linux-omap@vger.kernel.org>; Mon,  8 Jul 2024 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720441483; cv=none; b=CHssWBNbmyPiR057IwW0j3jPAe5p4kjrWnki/sWNl9nJkQnifmGC+mogPCoKQImifYCGLZqJ4IJvWsSRf+kSug2tXrhYubrMNRzo3RyjmpBuqZ1ZhaErBzLNL3TWnDTf2hj08WJrDfjVPGk1y0N/YUA1s4H8CF6NE83yrPnrsUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720441483; c=relaxed/simple;
	bh=XtJCyAKbOk1p48TODtO/cgoIvPnPzDZKJSPuRiCVJ90=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=daeC7ihjqd2hbDb6qMPd1FaVK0iP8XM/2IB/sXGK0kz1zTGs5MuBDfx870oTV5QuzSo1qL0rCHQe9fP0vL8BYq4KxrINIOT9EV1mONru0sN/qzyc/+0VhumSe1/qe8juyFQh18MR4tIWn47nsabiRnGwsR3A2EBrdPBG42SpLJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wnSDDJHO; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e03c689addcso4099520276.0
        for <linux-omap@vger.kernel.org>; Mon, 08 Jul 2024 05:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720441479; x=1721046279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oly4AYk331HbXc0SJiFSUityUqH530MmVNy1R2IMBsI=;
        b=wnSDDJHOB3KqAxVsXsEXWd0t8qWzJnrZXu7UU/hX6sF+NDmCNZU3u09I/DqVx6JPT4
         jq7Vx0j3TsUQvl4FbAELeMNaKPLLd6XgvN/MGosZu4Z/kDjl1YFOuaqPZZbSlnybluus
         chPVmkGF0hHBb5JHZsA5RIJqV+sXleUg42kulsLNgGYJtvqi9ObjcojCwPyNHRvxTRcQ
         RJP+BLtXhOkM3hgK72AKy6Ao4DKki7RcGstRp63EYSZkLS6AOHZNhFhCkvfqWkXN/e0G
         lCvpN69/bli66+xZQwqW6T4lMJf2eHfBODwW60z7u4nt0pzjHIGpVPub27B43lq6hW2c
         S1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720441479; x=1721046279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oly4AYk331HbXc0SJiFSUityUqH530MmVNy1R2IMBsI=;
        b=xKA2Isn9qC59xp1Wm3vmE0PXksZ7BKL6tcHFntzkhbS/F/2bvE40Qs6vP1BeFA7B9V
         vOUG34v102PNhkgyVlycvCAMxhBLpSm1doUfBKWBghWHacuWGzuYOGSJrA+r/CmOAAoF
         rx+icnyarmecDw5K1BbhirhQRxZ03bTAEe6tDqNoRpDlm6dy4OlL3mfNubk4CPHYHSQE
         Wes9GUCHJ1ecyn5EpM+tsoTa8D0W6vinCRiAJKxRPk04BYmIYEeD1ZKQvk9PHbP0+gVz
         bRKrwPZyRBkWLc/vJvM2cSim749crBzb25JmWBdoE3/NJfgtQLr4pSSXZAZ5kf096laI
         KtfA==
X-Forwarded-Encrypted: i=1; AJvYcCX/nO6W1Ky5bjHSA+o8PEFwg8efoILd3lSL0A8SQC9jkmE5wE8KO22bPli8s80WEX1atSxoFyuW/GFjbN1cNviVn+1FPp2YYliQkA==
X-Gm-Message-State: AOJu0YzmvCNZ+db7sCEXV6dHFhWbWCuiZa2qeJuG6lpyj/TtbnBLk0hJ
	GmMSZtXwDvI4iWK5Xl5bzUAo9a0VdiCPGntQGTwyMDpxd2dXVx7xMNKe9KZ8quo6g5cACvhLsoC
	Y1+AAs4t2BbT4I4e0L3+io+UsUomHSDkOflvzHw==
X-Google-Smtp-Source: AGHT+IHt76W5P5Wkq1aAATliquF7d3gff+ymLfAR4pZjrl8I5nhgCqcTMPEv/qvnSYn6wPzvlx8IkxD+crGbFWCNaa4=
X-Received: by 2002:a25:6b41:0:b0:e02:6e8b:af87 with SMTP id
 3f1490d57ef6-e03c196f482mr12733864276.20.1720441478263; Mon, 08 Jul 2024
 05:24:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701100736.4001658-1-allen.lkml@gmail.com>
In-Reply-To: <20240701100736.4001658-1-allen.lkml@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 8 Jul 2024 14:24:02 +0200
Message-ID: <CAPDyKFrOCRJ5KqnEcHE2PWfEHxs=NRiow_TkbWNHws-u0m_DdQ@mail.gmail.com>
Subject: Re: [PATCH v6] mmc: Convert from tasklet to BH workqueue
To: Allen Pais <allen.lkml@gmail.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, 
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
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 1 Jul 2024 at 12:07, Allen Pais <allen.lkml@gmail.com> wrote:
>
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
>
> This patch converts drivers/mmc/* from tasklet to BH workqueue.
>
> Based on the work done by Tejun Heo <tj@kernel.org>
>
> Tested-by: Christian Loehle <christian.loehle@arm.com>
> Tested-by: Aubin Constans <aubin.constans@microchip.com>
> Acked-by: Aubin Constans <aubin.constans@microchip.com>
> Acked-by: Micha=C5=82 Miros=C5=82aw <mirq-linux@rere.qmqm.pl>
> Reviewed-by: Christian Loehle <christian.loehle@arm.com>
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v6:
>    - drop changes to
>      drivers/mmc/host/tmio_mmc.h
>      drivers/mmc/host/tmio_mmc_core.c
> v5:
>    - completely dropped renasas changes from this series.
> v4:
>    - dropped changes to renasas sdhci(dma_complete)
>    - Wolfram to send a patch for it.
> v3:
>    - fixed a comment - [Adrian Hunter]
> v2:
>    - fixed patch styling issues
>    - rename work to bh_work
>
> Link to v1:
> https://lore.kernel.org/all/20240327160314.9982-10-apais@linux.microsoft.=
com/
>
>  drivers/mmc/host/atmel-mci.c      | 35 ++++++++-------
>  drivers/mmc/host/au1xmmc.c        | 37 ++++++++--------
>  drivers/mmc/host/cb710-mmc.c      | 14 +++---
>  drivers/mmc/host/cb710-mmc.h      |  3 +-
>  drivers/mmc/host/dw_mmc.c         | 24 +++++-----
>  drivers/mmc/host/dw_mmc.h         |  9 ++--
>  drivers/mmc/host/omap.c           | 17 +++----
>  drivers/mmc/host/sdhci-bcm-kona.c |  2 +-
>  drivers/mmc/host/tifm_sd.c        | 15 ++++---
>  drivers/mmc/host/uniphier-sd.c    | 12 ++---
>  drivers/mmc/host/via-sdmmc.c      | 25 ++++++-----
>  drivers/mmc/host/wbsd.c           | 74 +++++++++++++++----------------
>  drivers/mmc/host/wbsd.h           | 10 ++---
>  13 files changed, 142 insertions(+), 135 deletions(-)
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 8199d9620075..6490df54a6f5 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -33,6 +33,7 @@
>  #include <linux/pm.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pinctrl/consumer.h>
> +#include <linux/workqueue.h>
>
>  #include <asm/cacheflush.h>
>  #include <asm/io.h>
> @@ -272,12 +273,12 @@ struct atmel_mci_dma {
>   *     EVENT_DATA_ERROR is pending.
>   * @stop_cmdr: Value to be loaded into CMDR when the stop command is
>   *     to be sent.
> - * @tasklet: Tasklet running the request state machine.
> + * @bh_work: Work running the request state machine.
>   * @pending_events: Bitmask of events flagged by the interrupt handler
> - *     to be processed by the tasklet.
> + *     to be processed by the work.
>   * @completed_events: Bitmask of events which the state machine has
>   *     processed.
> - * @state: Tasklet state.
> + * @state: Work state.
>   * @queue: List of slots waiting for access to the controller.
>   * @need_clock_update: Update the clock rate before the next request.
>   * @need_reset: Reset controller before next request.
> @@ -352,7 +353,7 @@ struct atmel_mci {
>         u32                     data_status;
>         u32                     stop_cmdr;
>
> -       struct tasklet_struct   tasklet;
> +       struct work_struct      bh_work;
>         unsigned long           pending_events;
>         unsigned long           completed_events;
>         enum atmel_mci_state    state;
> @@ -735,7 +736,7 @@ static void atmci_timeout_timer(struct timer_list *t)
>         host->need_reset =3D 1;
>         host->state =3D STATE_END_REQUEST;
>         smp_wmb();
> -       tasklet_schedule(&host->tasklet);
> +       queue_work(system_bh_wq, &host->bh_work);
>  }
>
>  static inline unsigned int atmci_ns_to_clocks(struct atmel_mci *host,
> @@ -958,7 +959,7 @@ static void atmci_pdc_complete(struct atmel_mci *host=
)
>
>         dev_dbg(dev, "(%s) set pending xfer complete\n", __func__);
>         atmci_set_pending(host, EVENT_XFER_COMPLETE);
> -       tasklet_schedule(&host->tasklet);
> +       queue_work(system_bh_wq, &host->bh_work);
>  }
>
>  static void atmci_dma_cleanup(struct atmel_mci *host)
> @@ -972,7 +973,7 @@ static void atmci_dma_cleanup(struct atmel_mci *host)
>  }
>
>  /*
> - * This function is called by the DMA driver from tasklet context.
> + * This function is called by the DMA driver from bh context.
>   */
>  static void atmci_dma_complete(void *arg)
>  {
> @@ -995,7 +996,7 @@ static void atmci_dma_complete(void *arg)
>         if (data) {
>                 dev_dbg(dev, "(%s) set pending xfer complete\n", __func__=
);
>                 atmci_set_pending(host, EVENT_XFER_COMPLETE);
> -               tasklet_schedule(&host->tasklet);
> +               queue_work(system_bh_wq, &host->bh_work);
>
>                 /*
>                  * Regardless of what the documentation says, we have
> @@ -1008,7 +1009,7 @@ static void atmci_dma_complete(void *arg)
>                  * haven't seen all the potential error bits yet.
>                  *
>                  * The interrupt handler will schedule a different
> -                * tasklet to finish things up when the data transfer
> +                * bh work to finish things up when the data transfer
>                  * is completely done.
>                  *
>                  * We may not complete the mmc request here anyway
> @@ -1745,9 +1746,9 @@ static void atmci_detect_change(struct timer_list *=
t)
>         }
>  }
>
> -static void atmci_tasklet_func(struct tasklet_struct *t)
> +static void atmci_work_func(struct work_struct *t)
>  {
> -       struct atmel_mci        *host =3D from_tasklet(host, t, tasklet);
> +       struct atmel_mci        *host =3D from_work(host, t, bh_work);
>         struct mmc_request      *mrq =3D host->mrq;
>         struct mmc_data         *data =3D host->data;
>         struct device           *dev =3D host->dev;
> @@ -1759,7 +1760,7 @@ static void atmci_tasklet_func(struct tasklet_struc=
t *t)
>
>         state =3D host->state;
>
> -       dev_vdbg(dev, "tasklet: state %u pending/completed/mask %lx/%lx/%=
x\n",
> +       dev_vdbg(dev, "bh_work: state %u pending/completed/mask %lx/%lx/%=
x\n",
>                 state, host->pending_events, host->completed_events,
>                 atmci_readl(host, ATMCI_IMR));
>
> @@ -2118,7 +2119,7 @@ static irqreturn_t atmci_interrupt(int irq, void *d=
ev_id)
>                         dev_dbg(dev, "set pending data error\n");
>                         smp_wmb();
>                         atmci_set_pending(host, EVENT_DATA_ERROR);
> -                       tasklet_schedule(&host->tasklet);
> +                       queue_work(system_bh_wq, &host->bh_work);
>                 }
>
>                 if (pending & ATMCI_TXBUFE) {
> @@ -2187,7 +2188,7 @@ static irqreturn_t atmci_interrupt(int irq, void *d=
ev_id)
>                         smp_wmb();
>                         dev_dbg(dev, "set pending notbusy\n");
>                         atmci_set_pending(host, EVENT_NOTBUSY);
> -                       tasklet_schedule(&host->tasklet);
> +                       queue_work(system_bh_wq, &host->bh_work);
>                 }
>
>                 if (pending & ATMCI_NOTBUSY) {
> @@ -2196,7 +2197,7 @@ static irqreturn_t atmci_interrupt(int irq, void *d=
ev_id)
>                         smp_wmb();
>                         dev_dbg(dev, "set pending notbusy\n");
>                         atmci_set_pending(host, EVENT_NOTBUSY);
> -                       tasklet_schedule(&host->tasklet);
> +                       queue_work(system_bh_wq, &host->bh_work);
>                 }
>
>                 if (pending & ATMCI_RXRDY)
> @@ -2211,7 +2212,7 @@ static irqreturn_t atmci_interrupt(int irq, void *d=
ev_id)
>                         smp_wmb();
>                         dev_dbg(dev, "set pending cmd rdy\n");
>                         atmci_set_pending(host, EVENT_CMD_RDY);
> -                       tasklet_schedule(&host->tasklet);
> +                       queue_work(system_bh_wq, &host->bh_work);
>                 }
>
>                 if (pending & (ATMCI_SDIOIRQA | ATMCI_SDIOIRQB))
> @@ -2487,7 +2488,7 @@ static int atmci_probe(struct platform_device *pdev=
)
>
>         host->mapbase =3D regs->start;
>
> -       tasklet_setup(&host->tasklet, atmci_tasklet_func);
> +       INIT_WORK(&host->bh_work, atmci_work_func);
>
>         ret =3D request_irq(irq, atmci_interrupt, 0, dev_name(dev), host)=
;
>         if (ret) {
> diff --git a/drivers/mmc/host/au1xmmc.c b/drivers/mmc/host/au1xmmc.c
> index b5a5c6a2fe8b..6e80bcb668ec 100644
> --- a/drivers/mmc/host/au1xmmc.c
> +++ b/drivers/mmc/host/au1xmmc.c
> @@ -42,6 +42,7 @@
>  #include <linux/leds.h>
>  #include <linux/mmc/host.h>
>  #include <linux/slab.h>
> +#include <linux/workqueue.h>
>
>  #include <asm/io.h>
>  #include <asm/mach-au1x00/au1000.h>
> @@ -113,8 +114,8 @@ struct au1xmmc_host {
>
>         int irq;
>
> -       struct tasklet_struct finish_task;
> -       struct tasklet_struct data_task;
> +       struct work_struct finish_bh_work;
> +       struct work_struct data_bh_work;
>         struct au1xmmc_platform_data *platdata;
>         struct platform_device *pdev;
>         struct resource *ioarea;
> @@ -253,9 +254,9 @@ static void au1xmmc_finish_request(struct au1xmmc_hos=
t *host)
>         mmc_request_done(host->mmc, mrq);
>  }
>
> -static void au1xmmc_tasklet_finish(struct tasklet_struct *t)
> +static void au1xmmc_finish_bh_work(struct work_struct *t)
>  {
> -       struct au1xmmc_host *host =3D from_tasklet(host, t, finish_task);
> +       struct au1xmmc_host *host =3D from_work(host, t, finish_bh_work);
>         au1xmmc_finish_request(host);
>  }
>
> @@ -363,9 +364,9 @@ static void au1xmmc_data_complete(struct au1xmmc_host=
 *host, u32 status)
>         au1xmmc_finish_request(host);
>  }
>
> -static void au1xmmc_tasklet_data(struct tasklet_struct *t)
> +static void au1xmmc_data_bh_work(struct work_struct *t)
>  {
> -       struct au1xmmc_host *host =3D from_tasklet(host, t, data_task);
> +       struct au1xmmc_host *host =3D from_work(host, t, data_bh_work);
>
>         u32 status =3D __raw_readl(HOST_STATUS(host));
>         au1xmmc_data_complete(host, status);
> @@ -425,7 +426,7 @@ static void au1xmmc_send_pio(struct au1xmmc_host *hos=
t)
>                 if (host->flags & HOST_F_STOP)
>                         SEND_STOP(host);
>
> -               tasklet_schedule(&host->data_task);
> +               queue_work(system_bh_wq, &host->data_bh_work);
>         }
>  }
>
> @@ -505,7 +506,7 @@ static void au1xmmc_receive_pio(struct au1xmmc_host *=
host)
>                 if (host->flags & HOST_F_STOP)
>                         SEND_STOP(host);
>
> -               tasklet_schedule(&host->data_task);
> +               queue_work(system_bh_wq, &host->data_bh_work);
>         }
>  }
>
> @@ -561,7 +562,7 @@ static void au1xmmc_cmd_complete(struct au1xmmc_host =
*host, u32 status)
>
>         if (!trans || cmd->error) {
>                 IRQ_OFF(host, SD_CONFIG_TH | SD_CONFIG_RA | SD_CONFIG_RF)=
;
> -               tasklet_schedule(&host->finish_task);
> +               queue_work(system_bh_wq, &host->finish_bh_work);
>                 return;
>         }
>
> @@ -797,7 +798,7 @@ static irqreturn_t au1xmmc_irq(int irq, void *dev_id)
>                 IRQ_OFF(host, SD_CONFIG_NE | SD_CONFIG_TH);
>
>                 /* IRQ_OFF(host, SD_CONFIG_TH | SD_CONFIG_RA | SD_CONFIG_=
RF); */
> -               tasklet_schedule(&host->finish_task);
> +               queue_work(system_bh_wq, &host->finish_bh_work);
>         }
>  #if 0
>         else if (status & SD_STATUS_DD) {
> @@ -806,7 +807,7 @@ static irqreturn_t au1xmmc_irq(int irq, void *dev_id)
>                         au1xmmc_receive_pio(host);
>                 else {
>                         au1xmmc_data_complete(host, status);
> -                       /* tasklet_schedule(&host->data_task); */
> +                       /* queue_work(system_bh_wq, &host->data_bh_work);=
 */
>                 }
>         }
>  #endif
> @@ -854,7 +855,7 @@ static void au1xmmc_dbdma_callback(int irq, void *dev=
_id)
>         if (host->flags & HOST_F_STOP)
>                 SEND_STOP(host);
>
> -       tasklet_schedule(&host->data_task);
> +       queue_work(system_bh_wq, &host->data_bh_work);
>  }
>
>  static int au1xmmc_dbdma_init(struct au1xmmc_host *host)
> @@ -1039,9 +1040,9 @@ static int au1xmmc_probe(struct platform_device *pd=
ev)
>         if (host->platdata)
>                 mmc->caps &=3D ~(host->platdata->mask_host_caps);
>
> -       tasklet_setup(&host->data_task, au1xmmc_tasklet_data);
> +       INIT_WORK(&host->data_bh_work, au1xmmc_data_bh_work);
>
> -       tasklet_setup(&host->finish_task, au1xmmc_tasklet_finish);
> +       INIT_WORK(&host->finish_bh_work, au1xmmc_finish_bh_work);
>
>         if (has_dbdma()) {
>                 ret =3D au1xmmc_dbdma_init(host);
> @@ -1091,8 +1092,8 @@ static int au1xmmc_probe(struct platform_device *pd=
ev)
>         if (host->flags & HOST_F_DBDMA)
>                 au1xmmc_dbdma_shutdown(host);
>
> -       tasklet_kill(&host->data_task);
> -       tasklet_kill(&host->finish_task);
> +       cancel_work_sync(&host->data_bh_work);
> +       cancel_work_sync(&host->finish_bh_work);
>
>         if (host->platdata && host->platdata->cd_setup &&
>             !(mmc->caps & MMC_CAP_NEEDS_POLL))
> @@ -1135,8 +1136,8 @@ static void au1xmmc_remove(struct platform_device *=
pdev)
>                 __raw_writel(0, HOST_CONFIG2(host));
>                 wmb(); /* drain writebuffer */
>
> -               tasklet_kill(&host->data_task);
> -               tasklet_kill(&host->finish_task);
> +               cancel_work_sync(&host->data_bh_work);
> +               cancel_work_sync(&host->finish_bh_work);
>
>                 if (host->flags & HOST_F_DBDMA)
>                         au1xmmc_dbdma_shutdown(host);
> diff --git a/drivers/mmc/host/cb710-mmc.c b/drivers/mmc/host/cb710-mmc.c
> index 0aec33b88bef..902f7f20abaa 100644
> --- a/drivers/mmc/host/cb710-mmc.c
> +++ b/drivers/mmc/host/cb710-mmc.c
> @@ -493,7 +493,7 @@ static void cb710_mmc_request(struct mmc_host *mmc, s=
truct mmc_request *mrq)
>         if (!cb710_mmc_command(mmc, mrq->cmd) && mrq->stop)
>                 cb710_mmc_command(mmc, mrq->stop);
>
> -       tasklet_schedule(&reader->finish_req_tasklet);
> +       queue_work(system_bh_wq, &reader->finish_req_bh_work);
>  }
>
>  static int cb710_mmc_powerup(struct cb710_slot *slot)
> @@ -646,10 +646,10 @@ static int cb710_mmc_irq_handler(struct cb710_slot =
*slot)
>         return 1;
>  }
>
> -static void cb710_mmc_finish_request_tasklet(struct tasklet_struct *t)
> +static void cb710_mmc_finish_request_bh_work(struct work_struct *t)
>  {
> -       struct cb710_mmc_reader *reader =3D from_tasklet(reader, t,
> -                                                      finish_req_tasklet=
);
> +       struct cb710_mmc_reader *reader =3D from_work(reader, t,
> +                                                      finish_req_bh_work=
);
>         struct mmc_request *mrq =3D reader->mrq;
>
>         reader->mrq =3D NULL;
> @@ -718,8 +718,8 @@ static int cb710_mmc_init(struct platform_device *pde=
v)
>
>         reader =3D mmc_priv(mmc);
>
> -       tasklet_setup(&reader->finish_req_tasklet,
> -                     cb710_mmc_finish_request_tasklet);
> +       INIT_WORK(&reader->finish_req_bh_work,
> +                       cb710_mmc_finish_request_bh_work);
>         spin_lock_init(&reader->irq_lock);
>         cb710_dump_regs(chip, CB710_DUMP_REGS_MMC);
>
> @@ -763,7 +763,7 @@ static void cb710_mmc_exit(struct platform_device *pd=
ev)
>         cb710_write_port_32(slot, CB710_MMC_CONFIG_PORT, 0);
>         cb710_write_port_16(slot, CB710_MMC_CONFIGB_PORT, 0);
>
> -       tasklet_kill(&reader->finish_req_tasklet);
> +       cancel_work_sync(&reader->finish_req_bh_work);
>
>         mmc_free_host(mmc);
>  }
> diff --git a/drivers/mmc/host/cb710-mmc.h b/drivers/mmc/host/cb710-mmc.h
> index 5e053077dbed..59abaccaad10 100644
> --- a/drivers/mmc/host/cb710-mmc.h
> +++ b/drivers/mmc/host/cb710-mmc.h
> @@ -8,10 +8,11 @@
>  #define LINUX_CB710_MMC_H
>
>  #include <linux/cb710.h>
> +#include <linux/workqueue.h>
>
>  /* per-MMC-reader structure */
>  struct cb710_mmc_reader {
> -       struct tasklet_struct finish_req_tasklet;
> +       struct work_struct finish_req_bh_work;
>         struct mmc_request *mrq;
>         spinlock_t irq_lock;
>         unsigned char last_power_mode;
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index 8e2d676b9239..7195de2cde44 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -493,7 +493,7 @@ static void dw_mci_dmac_complete_dma(void *arg)
>          */
>         if (data) {
>                 set_bit(EVENT_XFER_COMPLETE, &host->pending_events);
> -               tasklet_schedule(&host->tasklet);
> +               queue_work(system_bh_wq, &host->bh_work);
>         }
>  }
>
> @@ -1834,7 +1834,7 @@ static enum hrtimer_restart dw_mci_fault_timer(stru=
ct hrtimer *t)
>         if (!host->data_status) {
>                 host->data_status =3D SDMMC_INT_DCRC;
>                 set_bit(EVENT_DATA_ERROR, &host->pending_events);
> -               tasklet_schedule(&host->tasklet);
> +               queue_work(system_bh_wq, &host->bh_work);
>         }
>
>         spin_unlock_irqrestore(&host->irq_lock, flags);
> @@ -2056,9 +2056,9 @@ static bool dw_mci_clear_pending_data_complete(stru=
ct dw_mci *host)
>         return true;
>  }
>
> -static void dw_mci_tasklet_func(struct tasklet_struct *t)
> +static void dw_mci_work_func(struct work_struct *t)
>  {
> -       struct dw_mci *host =3D from_tasklet(host, t, tasklet);
> +       struct dw_mci *host =3D from_work(host, t, bh_work);
>         struct mmc_data *data;
>         struct mmc_command *cmd;
>         struct mmc_request *mrq;
> @@ -2113,7 +2113,7 @@ static void dw_mci_tasklet_func(struct tasklet_stru=
ct *t)
>                                  * will waste a bit of time (we already k=
now
>                                  * the command was bad), it can't cause a=
ny
>                                  * errors since it's possible it would ha=
ve
> -                                * taken place anyway if this tasklet got
> +                                * taken place anyway if this bh work got
>                                  * delayed. Allowing the transfer to take=
 place
>                                  * avoids races and keeps things simple.
>                                  */
> @@ -2706,7 +2706,7 @@ static void dw_mci_cmd_interrupt(struct dw_mci *hos=
t, u32 status)
>         smp_wmb(); /* drain writebuffer */
>
>         set_bit(EVENT_CMD_COMPLETE, &host->pending_events);
> -       tasklet_schedule(&host->tasklet);
> +       queue_work(system_bh_wq, &host->bh_work);
>
>         dw_mci_start_fault_timer(host);
>  }
> @@ -2774,7 +2774,7 @@ static irqreturn_t dw_mci_interrupt(int irq, void *=
dev_id)
>                                 set_bit(EVENT_DATA_COMPLETE,
>                                         &host->pending_events);
>
> -                       tasklet_schedule(&host->tasklet);
> +                       queue_work(system_bh_wq, &host->bh_work);
>
>                         spin_unlock(&host->irq_lock);
>                 }
> @@ -2793,7 +2793,7 @@ static irqreturn_t dw_mci_interrupt(int irq, void *=
dev_id)
>                                         dw_mci_read_data_pio(host, true);
>                         }
>                         set_bit(EVENT_DATA_COMPLETE, &host->pending_event=
s);
> -                       tasklet_schedule(&host->tasklet);
> +                       queue_work(system_bh_wq, &host->bh_work);
>
>                         spin_unlock(&host->irq_lock);
>                 }
> @@ -3098,7 +3098,7 @@ static void dw_mci_cmd11_timer(struct timer_list *t=
)
>
>         host->cmd_status =3D SDMMC_INT_RTO;
>         set_bit(EVENT_CMD_COMPLETE, &host->pending_events);
> -       tasklet_schedule(&host->tasklet);
> +       queue_work(system_bh_wq, &host->bh_work);
>  }
>
>  static void dw_mci_cto_timer(struct timer_list *t)
> @@ -3144,7 +3144,7 @@ static void dw_mci_cto_timer(struct timer_list *t)
>                  */
>                 host->cmd_status =3D SDMMC_INT_RTO;
>                 set_bit(EVENT_CMD_COMPLETE, &host->pending_events);
> -               tasklet_schedule(&host->tasklet);
> +               queue_work(system_bh_wq, &host->bh_work);
>                 break;
>         default:
>                 dev_warn(host->dev, "Unexpected command timeout, state %d=
\n",
> @@ -3195,7 +3195,7 @@ static void dw_mci_dto_timer(struct timer_list *t)
>                 host->data_status =3D SDMMC_INT_DRTO;
>                 set_bit(EVENT_DATA_ERROR, &host->pending_events);
>                 set_bit(EVENT_DATA_COMPLETE, &host->pending_events);
> -               tasklet_schedule(&host->tasklet);
> +               queue_work(system_bh_wq, &host->bh_work);
>                 break;
>         default:
>                 dev_warn(host->dev, "Unexpected data timeout, state %d\n"=
,
> @@ -3435,7 +3435,7 @@ int dw_mci_probe(struct dw_mci *host)
>         else
>                 host->fifo_reg =3D host->regs + DATA_240A_OFFSET;
>
> -       tasklet_setup(&host->tasklet, dw_mci_tasklet_func);
> +       INIT_WORK(&host->bh_work, dw_mci_work_func);
>         ret =3D devm_request_irq(host->dev, host->irq, dw_mci_interrupt,
>                                host->irq_flags, "dw-mci", host);
>         if (ret)
> diff --git a/drivers/mmc/host/dw_mmc.h b/drivers/mmc/host/dw_mmc.h
> index 4ed81f94f7ca..b504f7ae513a 100644
> --- a/drivers/mmc/host/dw_mmc.h
> +++ b/drivers/mmc/host/dw_mmc.h
> @@ -17,6 +17,7 @@
>  #include <linux/fault-inject.h>
>  #include <linux/hrtimer.h>
>  #include <linux/interrupt.h>
> +#include <linux/workqueue.h>
>
>  enum dw_mci_state {
>         STATE_IDLE =3D 0,
> @@ -89,12 +90,12 @@ struct dw_mci_dma_slave {
>   * @stop_cmdr: Value to be loaded into CMDR when the stop command is
>   *     to be sent.
>   * @dir_status: Direction of current transfer.
> - * @tasklet: Tasklet running the request state machine.
> + * @bh_work: Work running the request state machine.
>   * @pending_events: Bitmask of events flagged by the interrupt handler
> - *     to be processed by the tasklet.
> + *     to be processed by bh work.
>   * @completed_events: Bitmask of events which the state machine has
>   *     processed.
> - * @state: Tasklet state.
> + * @state: BH work state.
>   * @queue: List of slots waiting for access to the controller.
>   * @bus_hz: The rate of @mck in Hz. This forms the basis for MMC bus
>   *     rate and timeout calculations.
> @@ -194,7 +195,7 @@ struct dw_mci {
>         u32                     data_status;
>         u32                     stop_cmdr;
>         u32                     dir_status;
> -       struct tasklet_struct   tasklet;
> +       struct work_struct      bh_work;
>         unsigned long           pending_events;
>         unsigned long           completed_events;
>         enum dw_mci_state       state;
> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
> index a8ee0df47148..335350a4e99a 100644
> --- a/drivers/mmc/host/omap.c
> +++ b/drivers/mmc/host/omap.c
> @@ -28,6 +28,7 @@
>  #include <linux/slab.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/platform_data/mmc-omap.h>
> +#include <linux/workqueue.h>
>
>
>  #define        OMAP_MMC_REG_CMD        0x00
> @@ -105,7 +106,7 @@ struct mmc_omap_slot {
>         u16                     power_mode;
>         unsigned int            fclk_freq;
>
> -       struct tasklet_struct   cover_tasklet;
> +       struct work_struct      cover_bh_work;
>         struct timer_list       cover_timer;
>         unsigned                cover_open;
>
> @@ -873,18 +874,18 @@ void omap_mmc_notify_cover_event(struct device *dev=
, int num, int is_closed)
>                 sysfs_notify(&slot->mmc->class_dev.kobj, NULL, "cover_swi=
tch");
>         }
>
> -       tasklet_hi_schedule(&slot->cover_tasklet);
> +       queue_work(system_bh_highpri_wq, &slot->cover_bh_work);
>  }
>
>  static void mmc_omap_cover_timer(struct timer_list *t)
>  {
>         struct mmc_omap_slot *slot =3D from_timer(slot, t, cover_timer);
> -       tasklet_schedule(&slot->cover_tasklet);
> +       queue_work(system_bh_wq, &slot->cover_bh_work);
>  }
>
> -static void mmc_omap_cover_handler(struct tasklet_struct *t)
> +static void mmc_omap_cover_bh_handler(struct work_struct *t)
>  {
> -       struct mmc_omap_slot *slot =3D from_tasklet(slot, t, cover_taskle=
t);
> +       struct mmc_omap_slot *slot =3D from_work(slot, t, cover_bh_work);
>         int cover_open =3D mmc_omap_cover_is_open(slot);
>
>         mmc_detect_change(slot->mmc, 0);
> @@ -1314,7 +1315,7 @@ static int mmc_omap_new_slot(struct mmc_omap_host *=
host, int id)
>
>         if (slot->pdata->get_cover_state !=3D NULL) {
>                 timer_setup(&slot->cover_timer, mmc_omap_cover_timer, 0);
> -               tasklet_setup(&slot->cover_tasklet, mmc_omap_cover_handle=
r);
> +               INIT_WORK(&slot->cover_bh_work, mmc_omap_cover_bh_handler=
);
>         }
>
>         r =3D mmc_add_host(mmc);
> @@ -1333,7 +1334,7 @@ static int mmc_omap_new_slot(struct mmc_omap_host *=
host, int id)
>                                         &dev_attr_cover_switch);
>                 if (r < 0)
>                         goto err_remove_slot_name;
> -               tasklet_schedule(&slot->cover_tasklet);
> +               queue_work(system_bh_wq, &slot->cover_bh_work);
>         }
>
>         return 0;
> @@ -1356,7 +1357,7 @@ static void mmc_omap_remove_slot(struct mmc_omap_sl=
ot *slot)
>         if (slot->pdata->get_cover_state !=3D NULL)
>                 device_remove_file(&mmc->class_dev, &dev_attr_cover_switc=
h);
>
> -       tasklet_kill(&slot->cover_tasklet);
> +       cancel_work_sync(&slot->cover_bh_work);
>         del_timer_sync(&slot->cover_timer);
>         flush_workqueue(slot->host->mmc_omap_wq);
>
> diff --git a/drivers/mmc/host/sdhci-bcm-kona.c b/drivers/mmc/host/sdhci-b=
cm-kona.c
> index cb9152c6a65d..e067c7f5c537 100644
> --- a/drivers/mmc/host/sdhci-bcm-kona.c
> +++ b/drivers/mmc/host/sdhci-bcm-kona.c
> @@ -107,7 +107,7 @@ static void sdhci_bcm_kona_sd_init(struct sdhci_host =
*host)
>   * Software emulation of the SD card insertion/removal. Set insert=3D1 f=
or insert
>   * and insert=3D0 for removal. The card detection is done by GPIO. For B=
roadcom
>   * IP to function properly the bit 0 of CORESTAT register needs to be se=
t/reset
> - * to generate the CD IRQ handled in sdhci.c which schedules card_taskle=
t.
> +* to generate the CD IRQ handled in sdhci.c
>   */
>  static int sdhci_bcm_kona_sd_card_emulate(struct sdhci_host *host, int i=
nsert)
>  {
> diff --git a/drivers/mmc/host/tifm_sd.c b/drivers/mmc/host/tifm_sd.c
> index b5a2f2f25ad9..aea14bf3e2e8 100644
> --- a/drivers/mmc/host/tifm_sd.c
> +++ b/drivers/mmc/host/tifm_sd.c
> @@ -13,6 +13,7 @@
>  #include <linux/highmem.h>
>  #include <linux/scatterlist.h>
>  #include <linux/module.h>
> +#include <linux/workqueue.h>
>  #include <asm/io.h>
>
>  #define DRIVER_NAME "tifm_sd"
> @@ -97,7 +98,7 @@ struct tifm_sd {
>         unsigned int          clk_div;
>         unsigned long         timeout_jiffies;
>
> -       struct tasklet_struct finish_tasklet;
> +       struct work_struct    finish_bh_work;
>         struct timer_list     timer;
>         struct mmc_request    *req;
>
> @@ -463,7 +464,7 @@ static void tifm_sd_check_status(struct tifm_sd *host=
)
>                 }
>         }
>  finish_request:
> -       tasklet_schedule(&host->finish_tasklet);
> +       queue_work(system_bh_wq, &host->finish_bh_work);
>  }
>
>  /* Called from interrupt handler */
> @@ -723,9 +724,9 @@ static void tifm_sd_request(struct mmc_host *mmc, str=
uct mmc_request *mrq)
>         mmc_request_done(mmc, mrq);
>  }
>
> -static void tifm_sd_end_cmd(struct tasklet_struct *t)
> +static void tifm_sd_end_cmd(struct work_struct *t)
>  {
> -       struct tifm_sd *host =3D from_tasklet(host, t, finish_tasklet);
> +       struct tifm_sd *host =3D from_work(host, t, finish_bh_work);
>         struct tifm_dev *sock =3D host->dev;
>         struct mmc_host *mmc =3D tifm_get_drvdata(sock);
>         struct mmc_request *mrq;
> @@ -960,7 +961,7 @@ static int tifm_sd_probe(struct tifm_dev *sock)
>          */
>         mmc->max_busy_timeout =3D TIFM_MMCSD_REQ_TIMEOUT_MS;
>
> -       tasklet_setup(&host->finish_tasklet, tifm_sd_end_cmd);
> +       INIT_WORK(&host->finish_bh_work, tifm_sd_end_cmd);
>         timer_setup(&host->timer, tifm_sd_abort, 0);
>
>         mmc->ops =3D &tifm_sd_ops;
> @@ -999,7 +1000,7 @@ static void tifm_sd_remove(struct tifm_dev *sock)
>         writel(0, sock->addr + SOCK_MMCSD_INT_ENABLE);
>         spin_unlock_irqrestore(&sock->lock, flags);
>
> -       tasklet_kill(&host->finish_tasklet);
> +       cancel_work_sync(&host->finish_bh_work);
>
>         spin_lock_irqsave(&sock->lock, flags);
>         if (host->req) {
> @@ -1009,7 +1010,7 @@ static void tifm_sd_remove(struct tifm_dev *sock)
>                 host->req->cmd->error =3D -ENOMEDIUM;
>                 if (host->req->stop)
>                         host->req->stop->error =3D -ENOMEDIUM;
> -               tasklet_schedule(&host->finish_tasklet);
> +               queue_work(system_bh_wq, &host->finish_bh_work);
>         }
>         spin_unlock_irqrestore(&sock->lock, flags);
>         mmc_remove_host(mmc);
> diff --git a/drivers/mmc/host/uniphier-sd.c b/drivers/mmc/host/uniphier-s=
d.c
> index 1404989e6151..417fd13efdfd 100644
> --- a/drivers/mmc/host/uniphier-sd.c
> +++ b/drivers/mmc/host/uniphier-sd.c
> @@ -90,9 +90,9 @@ static void uniphier_sd_dma_endisable(struct tmio_mmc_h=
ost *host, int enable)
>  }
>
>  /* external DMA engine */
> -static void uniphier_sd_external_dma_issue(struct tasklet_struct *t)
> +static void uniphier_sd_external_dma_issue(struct work_struct *t)
>  {
> -       struct tmio_mmc_host *host =3D from_tasklet(host, t, dma_issue);
> +       struct tmio_mmc_host *host =3D from_work(host, t, dma_issue);
>         struct uniphier_sd_priv *priv =3D uniphier_sd_priv(host);
>
>         uniphier_sd_dma_endisable(host, 1);
> @@ -199,7 +199,7 @@ static void uniphier_sd_external_dma_request(struct t=
mio_mmc_host *host,
>         host->chan_rx =3D chan;
>         host->chan_tx =3D chan;
>
> -       tasklet_setup(&host->dma_issue, uniphier_sd_external_dma_issue);
> +       INIT_WORK(&host->dma_issue, uniphier_sd_external_dma_issue);
>  }
>
>  static void uniphier_sd_external_dma_release(struct tmio_mmc_host *host)
> @@ -236,9 +236,9 @@ static const struct tmio_mmc_dma_ops uniphier_sd_exte=
rnal_dma_ops =3D {
>         .dataend =3D uniphier_sd_external_dma_dataend,
>  };
>
> -static void uniphier_sd_internal_dma_issue(struct tasklet_struct *t)
> +static void uniphier_sd_internal_dma_issue(struct work_struct *t)
>  {
> -       struct tmio_mmc_host *host =3D from_tasklet(host, t, dma_issue);
> +       struct tmio_mmc_host *host =3D from_work(host, t, dma_issue);
>         unsigned long flags;
>
>         spin_lock_irqsave(&host->lock, flags);
> @@ -317,7 +317,7 @@ static void uniphier_sd_internal_dma_request(struct t=
mio_mmc_host *host,
>
>         host->chan_tx =3D (void *)0xdeadbeaf;
>
> -       tasklet_setup(&host->dma_issue, uniphier_sd_internal_dma_issue);
> +       INIT_WORK(&host->dma_issue, uniphier_sd_internal_dma_issue);
>  }
>
>  static void uniphier_sd_internal_dma_release(struct tmio_mmc_host *host)
> diff --git a/drivers/mmc/host/via-sdmmc.c b/drivers/mmc/host/via-sdmmc.c
> index ba6044b16e07..f77457105ec3 100644
> --- a/drivers/mmc/host/via-sdmmc.c
> +++ b/drivers/mmc/host/via-sdmmc.c
> @@ -12,6 +12,7 @@
>  #include <linux/interrupt.h>
>
>  #include <linux/mmc/host.h>
> +#include <linux/workqueue.h>
>
>  #define DRV_NAME       "via_sdmmc"
>
> @@ -307,7 +308,7 @@ struct via_crdr_mmc_host {
>         struct sdhcreg pm_sdhc_reg;
>
>         struct work_struct carddet_work;
> -       struct tasklet_struct finish_tasklet;
> +       struct work_struct finish_bh_work;
>
>         struct timer_list timer;
>         spinlock_t lock;
> @@ -643,7 +644,7 @@ static void via_sdc_finish_data(struct via_crdr_mmc_h=
ost *host)
>         if (data->stop)
>                 via_sdc_send_command(host, data->stop);
>         else
> -               tasklet_schedule(&host->finish_tasklet);
> +               queue_work(system_bh_wq, &host->finish_bh_work);
>  }
>
>  static void via_sdc_finish_command(struct via_crdr_mmc_host *host)
> @@ -653,7 +654,7 @@ static void via_sdc_finish_command(struct via_crdr_mm=
c_host *host)
>         host->cmd->error =3D 0;
>
>         if (!host->cmd->data)
> -               tasklet_schedule(&host->finish_tasklet);
> +               queue_work(system_bh_wq, &host->finish_bh_work);
>
>         host->cmd =3D NULL;
>  }
> @@ -682,7 +683,7 @@ static void via_sdc_request(struct mmc_host *mmc, str=
uct mmc_request *mrq)
>         status =3D readw(host->sdhc_mmiobase + VIA_CRDR_SDSTATUS);
>         if (!(status & VIA_CRDR_SDSTS_SLOTG) || host->reject) {
>                 host->mrq->cmd->error =3D -ENOMEDIUM;
> -               tasklet_schedule(&host->finish_tasklet);
> +               queue_work(system_bh_wq, &host->finish_bh_work);
>         } else {
>                 via_sdc_send_command(host, mrq->cmd);
>         }
> @@ -848,7 +849,7 @@ static void via_sdc_cmd_isr(struct via_crdr_mmc_host =
*host, u16 intmask)
>                 host->cmd->error =3D -EILSEQ;
>
>         if (host->cmd->error)
> -               tasklet_schedule(&host->finish_tasklet);
> +               queue_work(system_bh_wq, &host->finish_bh_work);
>         else if (intmask & VIA_CRDR_SDSTS_CRD)
>                 via_sdc_finish_command(host);
>  }
> @@ -955,16 +956,16 @@ static void via_sdc_timeout(struct timer_list *t)
>                                 sdhost->cmd->error =3D -ETIMEDOUT;
>                         else
>                                 sdhost->mrq->cmd->error =3D -ETIMEDOUT;
> -                       tasklet_schedule(&sdhost->finish_tasklet);
> +                       queue_work(system_bh_wq, &sdhost->finish_bh_work)=
;
>                 }
>         }
>
>         spin_unlock_irqrestore(&sdhost->lock, flags);
>  }
>
> -static void via_sdc_tasklet_finish(struct tasklet_struct *t)
> +static void via_sdc_finish_bh_work(struct work_struct *t)
>  {
> -       struct via_crdr_mmc_host *host =3D from_tasklet(host, t, finish_t=
asklet);
> +       struct via_crdr_mmc_host *host =3D from_work(host, t, finish_bh_w=
ork);
>         unsigned long flags;
>         struct mmc_request *mrq;
>
> @@ -1005,7 +1006,7 @@ static void via_sdc_card_detect(struct work_struct =
*work)
>                         pr_err("%s: Card removed during transfer!\n",
>                                mmc_hostname(host->mmc));
>                         host->mrq->cmd->error =3D -ENOMEDIUM;
> -                       tasklet_schedule(&host->finish_tasklet);
> +                       queue_work(system_bh_wq, &host->finish_bh_work);
>                 }
>
>                 spin_unlock_irqrestore(&host->lock, flags);
> @@ -1051,7 +1052,7 @@ static void via_init_mmc_host(struct via_crdr_mmc_h=
ost *host)
>
>         INIT_WORK(&host->carddet_work, via_sdc_card_detect);
>
> -       tasklet_setup(&host->finish_tasklet, via_sdc_tasklet_finish);
> +       INIT_WORK(&host->finish_bh_work, via_sdc_finish_bh_work);
>
>         addrbase =3D host->sdhc_mmiobase;
>         writel(0x0, addrbase + VIA_CRDR_SDINTMASK);
> @@ -1193,7 +1194,7 @@ static void via_sd_remove(struct pci_dev *pcidev)
>                 sdhost->mrq->cmd->error =3D -ENOMEDIUM;
>                 if (sdhost->mrq->stop)
>                         sdhost->mrq->stop->error =3D -ENOMEDIUM;
> -               tasklet_schedule(&sdhost->finish_tasklet);
> +               queue_work(system_bh_wq, &sdhost->finish_bh_work);
>         }
>         spin_unlock_irqrestore(&sdhost->lock, flags);
>
> @@ -1203,7 +1204,7 @@ static void via_sd_remove(struct pci_dev *pcidev)
>
>         del_timer_sync(&sdhost->timer);
>
> -       tasklet_kill(&sdhost->finish_tasklet);
> +       cancel_work_sync(&sdhost->finish_bh_work);
>
>         /* switch off power */
>         gatt =3D readb(sdhost->pcictrl_mmiobase + VIA_CRDR_PCICLKGATT);
> diff --git a/drivers/mmc/host/wbsd.c b/drivers/mmc/host/wbsd.c
> index f0562f712d98..6e20405d0430 100644
> --- a/drivers/mmc/host/wbsd.c
> +++ b/drivers/mmc/host/wbsd.c
> @@ -459,7 +459,7 @@ static void wbsd_empty_fifo(struct wbsd_host *host)
>          * FIFO threshold interrupts properly.
>          */
>         if ((data->blocks * data->blksz - data->bytes_xfered) < 16)
> -               tasklet_schedule(&host->fifo_tasklet);
> +               queue_work(system_bh_wq, &host->fifo_bh_work);
>  }
>
>  static void wbsd_fill_fifo(struct wbsd_host *host)
> @@ -524,7 +524,7 @@ static void wbsd_fill_fifo(struct wbsd_host *host)
>          * 'FIFO empty' under certain conditions. So we
>          * need to be a bit more pro-active.
>          */
> -       tasklet_schedule(&host->fifo_tasklet);
> +       queue_work(system_bh_wq, &host->fifo_bh_work);
>  }
>
>  static void wbsd_prepare_data(struct wbsd_host *host, struct mmc_data *d=
ata)
> @@ -746,7 +746,7 @@ static void wbsd_request(struct mmc_host *mmc, struct=
 mmc_request *mrq)
>         struct mmc_command *cmd;
>
>         /*
> -        * Disable tasklets to avoid a deadlock.
> +        * Disable bh works to avoid a deadlock.
>          */
>         spin_lock_bh(&host->lock);
>
> @@ -821,7 +821,7 @@ static void wbsd_request(struct mmc_host *mmc, struct=
 mmc_request *mrq)
>                  * Dirty fix for hardware bug.
>                  */
>                 if (host->dma =3D=3D -1)
> -                       tasklet_schedule(&host->fifo_tasklet);
> +                       queue_work(system_bh_wq, &host->fifo_bh_work);
>
>                 spin_unlock_bh(&host->lock);
>
> @@ -961,13 +961,13 @@ static void wbsd_reset_ignore(struct timer_list *t)
>          * Card status might have changed during the
>          * blackout.
>          */
> -       tasklet_schedule(&host->card_tasklet);
> +       queue_work(system_bh_wq, &host->card_bh_work);
>
>         spin_unlock_bh(&host->lock);
>  }
>
>  /*
> - * Tasklets
> + * BH Works
>   */
>
>  static inline struct mmc_data *wbsd_get_data(struct wbsd_host *host)
> @@ -987,9 +987,9 @@ static inline struct mmc_data *wbsd_get_data(struct w=
bsd_host *host)
>         return host->mrq->cmd->data;
>  }
>
> -static void wbsd_tasklet_card(struct tasklet_struct *t)
> +static void wbsd_card_bh_work(struct work_struct *t)
>  {
> -       struct wbsd_host *host =3D from_tasklet(host, t, card_tasklet);
> +       struct wbsd_host *host =3D from_work(host, t, card_bh_work);
>         u8 csr;
>         int delay =3D -1;
>
> @@ -1020,7 +1020,7 @@ static void wbsd_tasklet_card(struct tasklet_struct=
 *t)
>                         wbsd_reset(host);
>
>                         host->mrq->cmd->error =3D -ENOMEDIUM;
> -                       tasklet_schedule(&host->finish_tasklet);
> +                       queue_work(system_bh_wq, &host->finish_bh_work);
>                 }
>
>                 delay =3D 0;
> @@ -1036,9 +1036,9 @@ static void wbsd_tasklet_card(struct tasklet_struct=
 *t)
>                 mmc_detect_change(host->mmc, msecs_to_jiffies(delay));
>  }
>
> -static void wbsd_tasklet_fifo(struct tasklet_struct *t)
> +static void wbsd_fifo_bh_work(struct work_struct *t)
>  {
> -       struct wbsd_host *host =3D from_tasklet(host, t, fifo_tasklet);
> +       struct wbsd_host *host =3D from_work(host, t, fifo_bh_work);
>         struct mmc_data *data;
>
>         spin_lock(&host->lock);
> @@ -1060,16 +1060,16 @@ static void wbsd_tasklet_fifo(struct tasklet_stru=
ct *t)
>          */
>         if (host->num_sg =3D=3D 0) {
>                 wbsd_write_index(host, WBSD_IDX_FIFOEN, 0);
> -               tasklet_schedule(&host->finish_tasklet);
> +               queue_work(system_bh_wq, &host->finish_bh_work);
>         }
>
>  end:
>         spin_unlock(&host->lock);
>  }
>
> -static void wbsd_tasklet_crc(struct tasklet_struct *t)
> +static void wbsd_crc_bh_work(struct work_struct *t)
>  {
> -       struct wbsd_host *host =3D from_tasklet(host, t, crc_tasklet);
> +       struct wbsd_host *host =3D from_work(host, t, crc_bh_work);
>         struct mmc_data *data;
>
>         spin_lock(&host->lock);
> @@ -1085,15 +1085,15 @@ static void wbsd_tasklet_crc(struct tasklet_struc=
t *t)
>
>         data->error =3D -EILSEQ;
>
> -       tasklet_schedule(&host->finish_tasklet);
> +       queue_work(system_bh_wq, &host->finish_bh_work);
>
>  end:
>         spin_unlock(&host->lock);
>  }
>
> -static void wbsd_tasklet_timeout(struct tasklet_struct *t)
> +static void wbsd_timeout_bh_work(struct work_struct *t)
>  {
> -       struct wbsd_host *host =3D from_tasklet(host, t, timeout_tasklet)=
;
> +       struct wbsd_host *host =3D from_work(host, t, timeout_bh_work);
>         struct mmc_data *data;
>
>         spin_lock(&host->lock);
> @@ -1109,15 +1109,15 @@ static void wbsd_tasklet_timeout(struct tasklet_s=
truct *t)
>
>         data->error =3D -ETIMEDOUT;
>
> -       tasklet_schedule(&host->finish_tasklet);
> +       queue_work(system_bh_wq, &host->finish_bh_work);
>
>  end:
>         spin_unlock(&host->lock);
>  }
>
> -static void wbsd_tasklet_finish(struct tasklet_struct *t)
> +static void wbsd_finish_bh_work(struct work_struct *t)
>  {
> -       struct wbsd_host *host =3D from_tasklet(host, t, finish_tasklet);
> +       struct wbsd_host *host =3D from_work(host, t, finish_bh_work);
>         struct mmc_data *data;
>
>         spin_lock(&host->lock);
> @@ -1156,18 +1156,18 @@ static irqreturn_t wbsd_irq(int irq, void *dev_id=
)
>         host->isr |=3D isr;
>
>         /*
> -        * Schedule tasklets as needed.
> +        * Schedule bh work as needed.
>          */
>         if (isr & WBSD_INT_CARD)
> -               tasklet_schedule(&host->card_tasklet);
> +               queue_work(system_bh_wq, &host->card_bh_work);
>         if (isr & WBSD_INT_FIFO_THRE)
> -               tasklet_schedule(&host->fifo_tasklet);
> +               queue_work(system_bh_wq, &host->fifo_bh_work);
>         if (isr & WBSD_INT_CRC)
> -               tasklet_hi_schedule(&host->crc_tasklet);
> +               queue_work(system_bh_highpri_wq, &host->crc_bh_work);
>         if (isr & WBSD_INT_TIMEOUT)
> -               tasklet_hi_schedule(&host->timeout_tasklet);
> +               queue_work(system_bh_highpri_wq, &host->timeout_bh_work);
>         if (isr & WBSD_INT_TC)
> -               tasklet_schedule(&host->finish_tasklet);
> +               queue_work(system_bh_wq, &host->finish_bh_work);
>
>         return IRQ_HANDLED;
>  }
> @@ -1443,13 +1443,13 @@ static int wbsd_request_irq(struct wbsd_host *hos=
t, int irq)
>         int ret;
>
>         /*
> -        * Set up tasklets. Must be done before requesting interrupt.
> +        * Set up bh works. Must be done before requesting interrupt.
>          */
> -       tasklet_setup(&host->card_tasklet, wbsd_tasklet_card);
> -       tasklet_setup(&host->fifo_tasklet, wbsd_tasklet_fifo);
> -       tasklet_setup(&host->crc_tasklet, wbsd_tasklet_crc);
> -       tasklet_setup(&host->timeout_tasklet, wbsd_tasklet_timeout);
> -       tasklet_setup(&host->finish_tasklet, wbsd_tasklet_finish);
> +       INIT_WORK(&host->card_bh_work, wbsd_card_bh_work);
> +       INIT_WORK(&host->fifo_bh_work, wbsd_fifo_bh_work);
> +       INIT_WORK(&host->crc_bh_work, wbsd_crc_bh_work);
> +       INIT_WORK(&host->timeout_bh_work, wbsd_timeout_bh_work);
> +       INIT_WORK(&host->finish_bh_work, wbsd_finish_bh_work);
>
>         /*
>          * Allocate interrupt.
> @@ -1472,11 +1472,11 @@ static void  wbsd_release_irq(struct wbsd_host *h=
ost)
>
>         host->irq =3D 0;
>
> -       tasklet_kill(&host->card_tasklet);
> -       tasklet_kill(&host->fifo_tasklet);
> -       tasklet_kill(&host->crc_tasklet);
> -       tasklet_kill(&host->timeout_tasklet);
> -       tasklet_kill(&host->finish_tasklet);
> +       cancel_work_sync(&host->card_bh_work);
> +       cancel_work_sync(&host->fifo_bh_work);
> +       cancel_work_sync(&host->crc_bh_work);
> +       cancel_work_sync(&host->timeout_bh_work);
> +       cancel_work_sync(&host->finish_bh_work);
>  }
>
>  /*
> diff --git a/drivers/mmc/host/wbsd.h b/drivers/mmc/host/wbsd.h
> index be30b4d8ce4c..970886831305 100644
> --- a/drivers/mmc/host/wbsd.h
> +++ b/drivers/mmc/host/wbsd.h
> @@ -171,11 +171,11 @@ struct wbsd_host
>         int                     irq;            /* Interrupt */
>         int                     dma;            /* DMA channel */
>
> -       struct tasklet_struct   card_tasklet;   /* Tasklet structures */
> -       struct tasklet_struct   fifo_tasklet;
> -       struct tasklet_struct   crc_tasklet;
> -       struct tasklet_struct   timeout_tasklet;
> -       struct tasklet_struct   finish_tasklet;
> +       struct work_struct      card_bh_work;   /* Work structures */
> +       struct work_struct      fifo_bh_work;
> +       struct work_struct      crc_bh_work;
> +       struct work_struct      timeout_bh_work;
> +       struct work_struct      finish_bh_work;
>
>         struct timer_list       ignore_timer;   /* Ignore detection timer=
 */
>  };
> --
> 2.34.1
>

