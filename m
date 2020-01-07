Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0BB3C131FD6
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jan 2020 07:34:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgAGGer (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jan 2020 01:34:47 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:40901 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbgAGGer (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 7 Jan 2020 01:34:47 -0500
Received: by mail-qk1-f193.google.com with SMTP id c17so41758246qkg.7;
        Mon, 06 Jan 2020 22:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hIJgplRJ76RhyxgWHzYQXLkzuycqS5KcOYNXCryb3pU=;
        b=vf3JV4zocywSj93VGGe3LGCCRzY+Y4RmfNIF1doHnmWFKtBWXgaGTaKLn5Fl2ixRs+
         L1cgw38VniG7VxFQIjgUavPesskrlETKwJ+d7l9PZb5rh6c6aV2FsOwvEfmaM8pxyEk1
         wrgVfiP09rOgWbs+Oo7CoHelt6wHYEm8ggkyhlf0OAo4+6ArSWt73MfjMQovNbItl5X6
         e3m8AVu8KMTOUm3nW44fDODiDJXQw3y2dD3Ol0z/8sSQOB5GcwuJiKTmvSJ1IO/mRdRu
         B4swPnqTHnoOvSmP+9UH+x8Yz3Qrg4RpdoHpCwmZlEvT/YwY9jWlqaa2vjcNCWKNO2WJ
         BUPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hIJgplRJ76RhyxgWHzYQXLkzuycqS5KcOYNXCryb3pU=;
        b=UIR7DgvJ0DqfTDndxwFehCR83Gh0+kA9Fwk9v8WJp7gNUrXVikbQltz9fOzhRZnHlm
         7dk5855gcGgpGZq8Tx7hf29Ar1etwAZ0Dvy9Ie34y5G5XYnpARvl30FZTEiOtslep9N6
         cV/M8PWPcbUSZx6xCmE5gFgXHIramfy4AjBTJBm3hAA0BISzxuaTGGLWQKIdIL9jUHEc
         uxCeibSu9qtL0PUY6YR5EQgEsoPSOLRFfo5oryrU+ki0br0gEjSIOb9FEyoGJcjF3xws
         N9+fQgJz0nw0SKCjMrLb9Pmo49t/oUms4QSWZjgPCJYMEz+uuJg38RB949NIWqiYOZo3
         LzgQ==
X-Gm-Message-State: APjAAAVdijiZXaLHEqRqHNbNwpiazGLWDnPzRV4oS5hYSzp3qKL2IJJF
        Rnlu1DjHsjLHPMm+d9KypEI7rGOW/fE1cm+k5Wo=
X-Google-Smtp-Source: APXvYqy/6QqapX3ChkaW3f+y6Y82dfEMw3gnR8ZvHF2xUUzeh/+SkQu1xakvfd6nPvrNB/s8A/AHkK3774z8iwCvyzM=
X-Received: by 2002:a37:b601:: with SMTP id g1mr84298304qkf.114.1578378885720;
 Mon, 06 Jan 2020 22:34:45 -0800 (PST)
MIME-Version: 1.0
References: <20200106110133.13791-1-faiz_abbas@ti.com> <20200106110133.13791-3-faiz_abbas@ti.com>
In-Reply-To: <20200106110133.13791-3-faiz_abbas@ti.com>
From:   Baolin Wang <baolin.wang7@gmail.com>
Date:   Tue, 7 Jan 2020 14:34:34 +0800
Message-ID: <CADBw62qR5F8h4YbpWfU2UESeoR3zXzS=eePMvQHuT7NQE5hdSA@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] mmc: sdhci: Factor out some operations set to
 their own functions
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
> In preparation for adding external dma support, factor out data initialization,
> block info and mrq_done to their own functions.
>
> Signed-off-by: Faiz Abbas <faiz_abbas@ti.com>
> ---
>  drivers/mmc/host/sdhci.c | 96 +++++++++++++++++++++++-----------------
>  1 file changed, 55 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 1b1c26da3fe0..f6999054abcf 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -1025,18 +1025,9 @@ static void sdhci_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
>         }
>  }
>
> -static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
> +static void sdhci_initialize_data(struct sdhci_host *host,
> +                                 struct mmc_data *data)
>  {
> -       struct mmc_data *data = cmd->data;
> -
> -       host->data_timeout = 0;
> -
> -       if (sdhci_data_line_cmd(cmd))
> -               sdhci_set_timeout(host, cmd);
> -
> -       if (!data)
> -               return;
> -
>         WARN_ON(host->data);
>
>         /* Sanity checks */
> @@ -1048,6 +1039,36 @@ static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
>         host->data_early = 0;
>         host->data->bytes_xfered = 0;
>

Can you remove above redundant blank line?

> +}
> +
> +static inline void sdhci_set_block_info(struct sdhci_host *host,
> +                                       struct mmc_data *data)
> +{
> +

Ditto.

Otherwise, please add my tested tag if feel free.

Tested-by: Baolin Wang <baolin.wang7@gmail.com>

> +       /* Set the DMA boundary value and block size */
> +       sdhci_writew(host,
> +                    SDHCI_MAKE_BLKSZ(host->sdma_boundary, host->data->blksz),
> +                    SDHCI_BLOCK_SIZE);
> +       /*
> +        * For Version 4.10 onwards, if v4 mode is enabled, 32-bit Block Count
> +        * can be supported, in that case 16-bit block count register must be 0.
> +        */
> +       if (host->version >= SDHCI_SPEC_410 && host->v4_mode &&
> +           (host->quirks2 & SDHCI_QUIRK2_USE_32BIT_BLK_CNT)) {
> +               if (sdhci_readw(host, SDHCI_BLOCK_COUNT))
> +                       sdhci_writew(host, 0, SDHCI_BLOCK_COUNT);
> +               sdhci_writew(host, host->data->blocks, SDHCI_32BIT_BLK_CNT);
> +       } else {
> +               sdhci_writew(host, host->data->blocks, SDHCI_BLOCK_COUNT);
> +       }
> +}
> +
> +static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
> +{
> +       struct mmc_data *data = cmd->data;
> +
> +       sdhci_initialize_data(host, data);
> +
>         if (host->flags & (SDHCI_USE_SDMA | SDHCI_USE_ADMA)) {
>                 struct scatterlist *sg;
>                 unsigned int length_mask, offset_mask;
> @@ -1133,22 +1154,7 @@ static void sdhci_prepare_data(struct sdhci_host *host, struct mmc_command *cmd)
>
>         sdhci_set_transfer_irqs(host);
>
> -       /* Set the DMA boundary value and block size */
> -       sdhci_writew(host, SDHCI_MAKE_BLKSZ(host->sdma_boundary, data->blksz),
> -                    SDHCI_BLOCK_SIZE);
> -
> -       /*
> -        * For Version 4.10 onwards, if v4 mode is enabled, 32-bit Block Count
> -        * can be supported, in that case 16-bit block count register must be 0.
> -        */
> -       if (host->version >= SDHCI_SPEC_410 && host->v4_mode &&
> -           (host->quirks2 & SDHCI_QUIRK2_USE_32BIT_BLK_CNT)) {
> -               if (sdhci_readw(host, SDHCI_BLOCK_COUNT))
> -                       sdhci_writew(host, 0, SDHCI_BLOCK_COUNT);
> -               sdhci_writew(host, data->blocks, SDHCI_32BIT_BLK_CNT);
> -       } else {
> -               sdhci_writew(host, data->blocks, SDHCI_BLOCK_COUNT);
> -       }
> +       sdhci_set_block_info(host, data);
>  }
>
>  static inline bool sdhci_auto_cmd12(struct sdhci_host *host,
> @@ -1245,22 +1251,10 @@ static bool sdhci_needs_reset(struct sdhci_host *host, struct mmc_request *mrq)
>                  (host->quirks & SDHCI_QUIRK_RESET_AFTER_REQUEST)));
>  }
>
> -static void __sdhci_finish_mrq(struct sdhci_host *host, struct mmc_request *mrq)
> +static void sdhci_set_mrq_done(struct sdhci_host *host, struct mmc_request *mrq)
>  {
>         int i;
>
> -       if (host->cmd && host->cmd->mrq == mrq)
> -               host->cmd = NULL;
> -
> -       if (host->data_cmd && host->data_cmd->mrq == mrq)
> -               host->data_cmd = NULL;
> -
> -       if (host->data && host->data->mrq == mrq)
> -               host->data = NULL;
> -
> -       if (sdhci_needs_reset(host, mrq))
> -               host->pending_reset = true;
> -
>         for (i = 0; i < SDHCI_MAX_MRQS; i++) {
>                 if (host->mrqs_done[i] == mrq) {
>                         WARN_ON(1);
> @@ -1276,6 +1270,23 @@ static void __sdhci_finish_mrq(struct sdhci_host *host, struct mmc_request *mrq)
>         }
>
>         WARN_ON(i >= SDHCI_MAX_MRQS);
> +}
> +
> +static void __sdhci_finish_mrq(struct sdhci_host *host, struct mmc_request *mrq)
> +{
> +       if (host->cmd && host->cmd->mrq == mrq)
> +               host->cmd = NULL;
> +
> +       if (host->data_cmd && host->data_cmd->mrq == mrq)
> +               host->data_cmd = NULL;
> +
> +       if (host->data && host->data->mrq == mrq)
> +               host->data = NULL;
> +
> +       if (sdhci_needs_reset(host, mrq))
> +               host->pending_reset = true;
> +
> +       sdhci_set_mrq_done(host, mrq);
>
>         sdhci_del_timer(host, mrq);
>
> @@ -1390,12 +1401,15 @@ void sdhci_send_command(struct sdhci_host *host, struct mmc_command *cmd)
>         }
>
>         host->cmd = cmd;
> +       host->data_timeout = 0;
>         if (sdhci_data_line_cmd(cmd)) {
>                 WARN_ON(host->data_cmd);
>                 host->data_cmd = cmd;
> +               sdhci_set_timeout(host, cmd);
>         }
>
> -       sdhci_prepare_data(host, cmd);
> +       if (cmd->data)
> +               sdhci_prepare_data(host, cmd);
>
>         sdhci_writel(host, cmd->arg, SDHCI_ARGUMENT);
>
> --
> 2.19.2
>
