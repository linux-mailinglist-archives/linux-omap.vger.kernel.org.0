Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7623D133871
	for <lists+linux-omap@lfdr.de>; Wed,  8 Jan 2020 02:29:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgAHB2s (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 20:28:48 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:38208 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbgAHB2s (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 20:28:48 -0500
Received: by mail-qk1-f194.google.com with SMTP id k6so1280103qki.5;
        Tue, 07 Jan 2020 17:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nAwqjhRGqFXJzIg3lBkXFVNjftwBX4mw//gKj6RNvIE=;
        b=d+sdWsKioaDMQfVwvM4js/xplepHEPSIMPFJ8ZWXTJm/gZ2PMbiB6qh5gEtr3KSxxI
         JMfxaLVS99Z1VmXqQYdK10yd2HhLYleaPDcgmfsoboWnbLU7oiP+WyX3dqd6o4yWJjsY
         nuEfqmH8gboGbQrabUwXIQo0426ODhG6I6IHOhlCLIqV7QuBJuUxZ7dVAsiiTEv9j7Qk
         Sy1OzwU8gSKWDL/bBGX4PwKGhG8Kegnny4cb0Qqdxh816ER1fIEiFzra5Ypk2Pp3ZBzA
         yDrgklTF+qMdsKdz2p+usEVM6i02Xt0rHvLos37LJcn/IlwhNoel0LRYPLJ4cpeKud6l
         bFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nAwqjhRGqFXJzIg3lBkXFVNjftwBX4mw//gKj6RNvIE=;
        b=eSOXwFrB477NrzbPW5KCdGADxb8iV+qTRgQDEZUbIuBURTTbqYf0ClsnWup0l4pS7R
         8uPUjFM7i4sVAW5WNUYMXwEQkgsbFmy+TU7vXHEVoBJKC1xLIoQoRgMkqty5dJgZtX4e
         amndUl5+fzXx0kQ6NJyC3rE25o5OeKg+W9FF/TXXy5nXU8iR4xq+bepgZACh6Y1ENB5i
         2HgffzaAbbnxrEv+6GxEMaUr8dryqqZRxhq9b7dek4iWsEyuFtsdTkIl728z51w4Fuxp
         J3r2OVBogETv7dfJIQuXpY55kRcRFxwoKDPJigMlJtlTkh6NMfdfD+M9DVP5m+dZrhZQ
         6TTA==
X-Gm-Message-State: APjAAAWb68DJnaX2vsaDbKqFxZYX7kMIBhzo00hhwzNNYL9chJdhF+Qx
        6TYqtJsOJLF3QdluVUjCIU9EnHwzrtdNpY2h7V8=
X-Google-Smtp-Source: APXvYqzGDMvemNyQyj1kGMDw7M31RlDX86odL/bjLg+raDWg1MqtYcdX/WS4zMfQmnseQzZl7HebbITU8dG4JjiwmQo=
X-Received: by 2002:a37:b601:: with SMTP id g1mr2158429qkf.114.1578446926868;
 Tue, 07 Jan 2020 17:28:46 -0800 (PST)
MIME-Version: 1.0
References: <20200106110133.13791-1-faiz_abbas@ti.com> <20200106110133.13791-4-faiz_abbas@ti.com>
In-Reply-To: <20200106110133.13791-4-faiz_abbas@ti.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Wed, 8 Jan 2020 09:28:35 +0800
Message-ID: <CADBw62onwxPmn=HmdL05hz+FOUe9crRPDO+CB5hDmaVeYMSTsQ@mail.gmail.com>
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

On Mon, Jan 6, 2020 at 7:01 PM Faiz Abbas <faiz_abbas@ti.com> wrote:
>
> From: Chunyan Zhang <zhang.chunyan@linaro.org>
>
> Some standard SD host controllers can support both external dma
> controllers as well as ADMA/SDMA in which the SD host controller
> acts as DMA master. TI's omap controller is the case as an example.
>
> Currently the generic SDHCI code supports ADMA/SDMA integrated in
> the host controller but does not have any support for external DMA
> controllers implemented using dmaengine, meaning that custom code is
> needed for any systems that use an external DMA controller with SDHCI.
>
> Fixes by Faiz Abbas <faiz_abbas@ti.com>:
> 1. Map scatterlists before dmaengine_prep_slave_sg()
> 2. Use dma_async() functions inside of the send_command() path and call
> terminate_sync() in non-atomic context in case of an error.
>
> Signed-off-by: Chunyan Zhang <zhang.chunyan@linaro.org>
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> ---
>  drivers/mmc/host/Kconfig |   3 +
>  drivers/mmc/host/sdhci.c | 228 ++++++++++++++++++++++++++++++++++++++-
>  drivers/mmc/host/sdhci.h |   8 ++
>  3 files changed, 237 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index d06b2dfe3c95..adef971582a1 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -1040,3 +1040,6 @@ config MMC_OWL
>         help
>           This selects support for the SD/MMC Host Controller on
>           Actions Semi Owl SoCs.
> +
> +config MMC_SDHCI_EXTERNAL_DMA
> +       bool
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index f6999054abcf..8cc78c76bc3d 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -10,6 +10,7 @@
>   */
>
>  #include <linux/delay.h>
> +#include <linux/dmaengine.h>
>  #include <linux/ktime.h>
>  #include <linux/highmem.h>
>  #include <linux/io.h>
> @@ -1157,6 +1158,188 @@ static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
>         sdhci_set_block_info(host, data);
>  }
>
> +#if IS_ENABLED(CONFIG_MMC_SDHCI_EXTERNAL_DMA)
> +
> +static int sdhci_external_dma_init(struct sdhci_host *host)
> +{
> +       int ret = 0;
> +       struct mmc_host *mmc = host->mmc;
> +
> +       host->tx_chan = dma_request_chan(mmc->parent, "tx");
> +       if (IS_ERR(host->tx_chan)) {
> +               ret = PTR_ERR(host->tx_chan);
> +               if (ret != -EPROBE_DEFER)
> +                       pr_warn("Failed to request TX DMA channel.\n");
> +               host->tx_chan = NULL;
> +               return ret;
> +       }
> +
> +       host->rx_chan = dma_request_chan(mmc->parent, "rx");
> +       if (IS_ERR(host->rx_chan)) {
> +               if (host->tx_chan) {
> +                       dma_release_channel(host->tx_chan);
> +                       host->tx_chan = NULL;
> +               }
> +
> +               ret = PTR_ERR(host->rx_chan);
> +               if (ret != -EPROBE_DEFER)
> +                       pr_warn("Failed to request RX DMA channel.\n");
> +               host->rx_chan = NULL;
> +       }
> +
> +       return ret;
> +}
> +
> +static struct dma_chan *sdhci_external_dma_channel(struct sdhci_host *host,
> +                                                  struct mmc_data *data)
> +{
> +       return data->flags & MMC_DATA_WRITE ? host->tx_chan : host->rx_chan;
> +}
> +
> +static int sdhci_external_dma_setup(struct sdhci_host *host,
> +                                   struct mmc_command *cmd)
> +{
> +       int ret, i;
> +       struct dma_async_tx_descriptor *desc;
> +       struct mmc_data *data = cmd->data;
> +       struct dma_chan *chan;
> +       struct dma_slave_config cfg;
> +       dma_cookie_t cookie;
> +       int sg_cnt;
> +
> +       if (!host->mapbase)
> +               return -EINVAL;
> +
> +       cfg.src_addr = host->mapbase + SDHCI_BUFFER;
> +       cfg.dst_addr = host->mapbase + SDHCI_BUFFER;
> +       cfg.src_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +       cfg.dst_addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
> +       cfg.src_maxburst = data->blksz / 4;
> +       cfg.dst_maxburst = data->blksz / 4;
> +
> +       /* Sanity check: all the SG entries must be aligned by block size. */
> +       for (i = 0; i < data->sg_len; i++) {
> +               if ((data->sg + i)->length % data->blksz)
> +                       return -EINVAL;
> +       }
> +
> +       chan = sdhci_external_dma_channel(host, data);
> +
> +       ret = dmaengine_slave_config(chan, &cfg);
> +       if (ret)
> +               return ret;
> +
> +       sg_cnt = sdhci_pre_dma_transfer(host, data, COOKIE_MAPPED);
> +       if (sg_cnt <= 0)
> +               return -EINVAL;
> +
> +       desc = dmaengine_prep_slave_sg(chan, data->sg, data->sg_len,
> +                                      mmc_get_dma_dir(data),
> +                                      DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
> +       if (!desc)
> +               return -EINVAL;
> +
> +       desc->callback = NULL;
> +       desc->callback_param = NULL;
> +
> +       cookie = dmaengine_submit(desc);
> +       if (cookie < 0)

We usually use the DMA engine standard API: dma_submit_error() to
validate the cookie.
