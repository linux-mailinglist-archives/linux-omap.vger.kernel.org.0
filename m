Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3BF1133E54
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2020 10:30:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727567AbgAHJaE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 8 Jan 2020 04:30:04 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:44977 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727205AbgAHJaE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 8 Jan 2020 04:30:04 -0500
Received: by mail-qv1-f66.google.com with SMTP id n8so1091983qvg.11;
        Wed, 08 Jan 2020 01:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V+AnIr8xJIC3DpDvf2MIpLIgJZ+CN4irLPhk6yFtscY=;
        b=f1io/82ztPz4bFPaOPr46ckbgnYVY94PXievQr73C+rowMuyOHKiSNrmuascnB2cze
         h03T47dhOjR86Dt4+dh1p5suEVfENZ4d6otja4ynHrN8Y/AkVV7JDKsDgRzjdw0YoD4J
         v21ym8pM4mxz8OHeBSloSUy5dhzb7B6vL1xVE9B0E+soNiQ3xbEWdWQ+pZoiZoE6j9WD
         4KAhq6HGZ5Xi6gcU1IwQCu4dcFDBfiHsblTYD+laPFzVGomS+6yFfX3O6l6OyWbP01J+
         ZP/LKr4ThZX0/ZN9ogymhRtyvt0IMG6mba+oUevS5RE2McnKNGvP8b70YbwvEiPLVRya
         aPfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V+AnIr8xJIC3DpDvf2MIpLIgJZ+CN4irLPhk6yFtscY=;
        b=kE1t6WTQ7oFwM12gF4YhZTYzwbnQE20znTiqD9dHzUzIsyHb976VSD24pUTHLNZMAC
         wcI06YxxbaZ7MJqmPDgKDoa+L6kcdFpWvj0kEVTltJuq5/CP/zDNCxrSafc9QSu9fYnd
         cfIR8GLDhpaDu3typKaanQE9J8UWzkhUcbqidrkPTSw1APEr9hEXGI+2T5J2G0FjJgpU
         9kO6Lypm3xBDk0lnLgW2RREFQsLRbAZ72t2/GBCvWytx442UU69kl5s1fW1D/N2Uhi8g
         OUoFHkl/B+tXVWKTUXbeu6Ztm/Uc3pZRMjcdXrYiEh4u/GdbVW0t4TfOVngMi81vfKCn
         qePA==
X-Gm-Message-State: APjAAAWevDF6X3lCqQ3nLc+z7B/tTLlIqmuw10WmIxvSxeRCsbz6UCp1
        MNC+PtTR2TYPBWwSGqN9k9dmrEdQOAEQGB4iu1I=
X-Google-Smtp-Source: APXvYqyBrSSS+aT2CW4js6+jBTqkMjLw2OzZRXJCjT67nXeKRwAZ5gsI59ky8XuqOn13xntwvOGG55Pa0BGIb3OB4zY=
X-Received: by 2002:ad4:496f:: with SMTP id p15mr3146294qvy.191.1578475802943;
 Wed, 08 Jan 2020 01:30:02 -0800 (PST)
MIME-Version: 1.0
References: <20200106110133.13791-1-faiz_abbas@ti.com> <20200106110133.13791-4-faiz_abbas@ti.com>
 <CADBw62onwxPmn=HmdL05hz+FOUe9crRPDO+CB5hDmaVeYMSTsQ@mail.gmail.com> <48c10fdf-f2c7-a719-2f64-0f87895f3704@ti.com>
In-Reply-To: <48c10fdf-f2c7-a719-2f64-0f87895f3704@ti.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Wed, 8 Jan 2020 17:29:51 +0800
Message-ID: <CADBw62rK1a9K7cxf5ti7YkFsJJ5tJ+8yjuF2aYR3PnZnoK-r2g@mail.gmail.com>
Subject: Re: [PATCH v4 03/11] mmc: sdhci: add support for using external DMA devices
To:     Faiz Abbas <faiz_abbas@ti.com>
Cc:     linux-omap@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-mmc <linux-mmc@vger.kernel.org>,
        kishon@ti.com, Adrian Hunter <adrian.hunter@intel.com>,
        mark.rutland@arm.com, robh+dt@kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>, tony@atomide.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Faiz,

On Wed, Jan 8, 2020 at 5:19 PM Faiz Abbas <faiz_abbas@ti.com> wrote:
>
> Hi Baolin,
>
> On 08/01/20 6:58 am, Baolin Wang wrote:
> > Hi Faiz,
> >
> > On Mon, Jan 6, 2020 at 7:01 PM Faiz Abbas <faiz_abbas@ti.com> wrote:
> >>
> >> From: Chunyan Zhang <zhang.chunyan@linaro.org>
> >>
> >> Some standard SD host controllers can support both external dma
> >> controllers as well as ADMA/SDMA in which the SD host controller
> >> acts as DMA master. TI's omap controller is the case as an example.
> >>
> >> Currently the generic SDHCI code supports ADMA/SDMA integrated in
> >> the host controller but does not have any support for external DMA
> >> controllers implemented using dmaengine, meaning that custom code is
> >> needed for any systems that use an external DMA controller with SDHCI.
> >>
> >> Fixes by Faiz Abbas <faiz_abbas@ti.com>:
> >> 1. Map scatterlists before dmaengine_prep_slave_sg()
> >> 2. Use dma_async() functions inside of the send_command() path and call
> >> terminate_sync() in non-atomic context in case of an error.
> >>
> >> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
> >> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> >> ---
> >>  drivers/mmc/host/Kconfig |   3 +
> >>  drivers/mmc/host/sdhci.c | 228 ++++++++++++++++++++++++++++++++++++++-
> >>  drivers/mmc/host/sdhci.h |   8 ++
> >>  3 files changed, 237 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> >> index d06b2dfe3c95..adef971582a1 100644
> >> --- a/drivers/mmc/host/Kconfig
> >> +++ b/drivers/mmc/host/Kconfig
> >> @@ -1040,3 +1040,6 @@ config MMC_OWL
> >>         help
> >>           This selects support for the SD/MMC Host Controller on
> >>           Actions Semi Owl SoCs.
> >> +
> >> +config MMC_SDHCI_EXTERNAL_DMA
> >> +       bool
> >> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> >> index f6999054abcf..8cc78c76bc3d 100644
> >> --- a/drivers/mmc/host/sdhci.c
> >> +++ b/drivers/mmc/host/sdhci.c
> >> @@ -10,6 +10,7 @@
> >>   */
> >>
> >>  #include <linux/delay.h>
> >> +#include <linux/dmaengine.h>
> >>  #include <linux/ktime.h>
> >>  #include <linux/highmem.h>
> >>  #include <linux/io.h>
> >> @@ -1157,6 +1158,188 @@ static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
> >>         sdhci_set_block_info(host, data);
> >>  }
> >>
> >> +#if IS_ENABLED(CONFIG_MMC_SDHCI_EXTERNAL_DMA)
> >> +
> >> +static int sdhci_external_dma_init(struct sdhci_host *host)
> >> +{
> >> +       int ret = 0;
> >> +       struct mmc_host *mmc = host->mmc;
> >> +
> >> +       host->tx_chan = dma_request_chan(mmc->parent, "tx");
> >> +       if (IS_ERR(host->tx_chan)) {
> >> +               ret = PTR_ERR(host->tx_chan);
> >> +               if (ret != -EPROBE_DEFER)
> >> +                       pr_warn("Failed to request TX DMA channel.\n");
> >> +               host->tx_chan = NULL;
> >> +               return ret;
> >> +       }
> >> +
> >> +       host->rx_chan = dma_request_chan(mmc->parent, "rx");
> >> +       if (IS_ERR(host->rx_chan)) {
> >> +               if (host->tx_chan) {
> >> +                       dma_release_channel(host->tx_chan);
> >> +                       host->tx_chan = NULL;
> >> +               }
> >> +
> >> +               ret = PTR_ERR(host->rx_chan);
> >> +               if (ret != -EPROBE_DEFER)
> >> +                       pr_warn("Failed to request RX DMA channel.\n");
> >> +               host->rx_chan = NULL;
> >> +       }
> >> +
> >> +       return ret;
> >> +}
> >> +
> >> +static struct dma_chan *sdhci_external_dma_channel(struct sdhci_host *host,
> >> +                                                  struct mmc_data *data)
> >> +{
> >> +       return data->flags & MMC_DATA_WRITE ? host->tx_chan : host->rx_chan;
> >> +}
> >> +
> >> +static int sdhci_external_dma_setup(struct sdhci_host *host,
> >> +                                   struct mmc_command *cmd)
> >> +{
> >> +       int ret, i;
> >> +       struct dma_async_tx_descriptor *desc;
> >> +       struct mmc_data *data = cmd->data;
> >> +       struct dma_chan *chan;
> >> +       struct dma_slave_config cfg;
> >> +       dma_cookie_t cookie;
> >> +       int sg_cnt;
> >> +
> >> +       if (!host->mapbase)
> >> +               return -EINVAL;
> >> +
> >> +       cfg.src_addr = host->mapbase + SDHCI_BUFFER;
> >> +       cfg.dst_addr = host->mapbase + SDHCI_BUFFER;
> >> +       cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> >> +       cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> >> +       cfg.src_maxburst = data->blksz / 4;
> >> +       cfg.dst_maxburst = data->blksz / 4;
> >> +
> >> +       /* Sanity check: all the SG entries must be aligned by block size. */
> >> +       for (i = 0; i < data->sg_len; i++) {
> >> +               if ((data->sg + i)->length % data->blksz)
> >> +                       return -EINVAL;
> >> +       }
> >> +
> >> +       chan = sdhci_external_dma_channel(host, data);
> >> +
> >> +       ret = dmaengine_slave_config(chan, &cfg);
> >> +       if (ret)
> >> +               return ret;
> >> +
> >> +       sg_cnt = sdhci_pre_dma_transfer(host, data, COOKIE_MAPPED);
> >> +       if (sg_cnt <= 0)
> >> +               return -EINVAL;
> >> +
> >> +       desc = dmaengine_prep_slave_sg(chan, data->sg, data->sg_len,
> >> +                                      mmc_get_dma_dir(data),
> >> +                                      DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
> >> +       if (!desc)
> >> +               return -EINVAL;
> >> +
> >> +       desc->callback = NULL;
> >> +       desc->callback_param = NULL;
> >> +
> >> +       cookie = dmaengine_submit(desc);
> >> +       if (cookie < 0)
> >
> > We usually use the DMA engine standard API: dma_submit_error() to
> > validate the cookie.
> >
>
> The if condition is doing the same thing as the API. Do we really
> require it?

Yes, now it did the same thing. But in future if the DMA engine expand
the cookie indication, which may break your current condition, but use
dma_submit_error() is more safe, that will help to cover the internal
cookie things. So I recommend to use the standard API as far as
possible.

But if Ulf does not care about this, it's Okay for me too :)
