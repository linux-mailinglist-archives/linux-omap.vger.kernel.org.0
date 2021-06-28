Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92CD03B5C80
	for <lists+linux-omap@lfdr.de>; Mon, 28 Jun 2021 12:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231700AbhF1KgG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Jun 2021 06:36:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232625AbhF1KgF (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Jun 2021 06:36:05 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31D82C061574
        for <linux-omap@vger.kernel.org>; Mon, 28 Jun 2021 03:33:40 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id 68so9731406vsu.6
        for <linux-omap@vger.kernel.org>; Mon, 28 Jun 2021 03:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fqldo274cRQtWPO01/2tkRixOOqvTCPK4n5oBSxoxEU=;
        b=NGSi3Es466KQymlQSqp7vwkt2GifromSAJ60psFqDtQtkpRKgp95sBDlExwiPNF+NF
         ss9JjmdfVghrG4IzdJf5RE79/qqUSlf8zSxsGNd5/tPplM0/kBhIq/x9kquAvLfnjFW0
         LQlHSo6d9BMiyCgimr4zsmmAnfIoZJTtmYfNjV/og8GflYEw0QhkhSNvim4nKNGP+Knt
         3mOUQSNFYDnENNmhPBhd2H+pE0PACUC185VjJmjhf8pxC/nvxNsAK27zFeXca4S57+Qc
         Rg5IUe8EBrDnC/1aVdVrUMRHDx3r2+MfSxHq4vAGeZ3f3b3afehl+7rp9IT4RP3rMFQh
         89kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fqldo274cRQtWPO01/2tkRixOOqvTCPK4n5oBSxoxEU=;
        b=pzUl9d+fryXW1PnVJVgvbfHS3r5qApZVxujMO0tITVMksXAJXpSDpW7SZfdJmjZwgC
         Ca9Y5LpgtgemDxZaB79Dh9NVvlWEeVT22tS/fDs9qPzaeNXCLf2rtE8SDQj3yE8hdF2d
         UW6AckoKVyKNeVozO8wqmggtU4m15q5oZcECWU1dEO4EWubbZlyuCeZqYk8UBPll5CgB
         31YIXnztRdITTTJJaXcmU5iSscw259DXVORAbzGoQelt8LaTwcKz6Q5wO8H+Cb2EBtRb
         knzrFib+tfKR1j7J2ghaDngDlrDMdvQZMq/t7ev8qROpf/Hsc2W9MKKjClb8ieqpsd5x
         GiIA==
X-Gm-Message-State: AOAM532Cvj1w5PfsZD3GXc2BdJfFfaJwhnf+IxuJjxcNwMvETIMaYzDw
        dx7R0VrRccKW+pXuZHwg5AK0aH09oXrPH56Crvb0+g==
X-Google-Smtp-Source: ABdhPJyx6sp0+7HY7w3JTTxCTRlOTqt98H6NP7RLMh3FcTajmyCSZrXKGYjrSkpNO54Ya9g6k/52q9OQ32SD/MFuSp4=
X-Received: by 2002:a67:1087:: with SMTP id 129mr17609453vsq.42.1624876413847;
 Mon, 28 Jun 2021 03:33:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210626083657.49475-1-wjc@cdjrlc.com>
In-Reply-To: <20210626083657.49475-1-wjc@cdjrlc.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 28 Jun 2021 12:32:57 +0200
Message-ID: <CAPDyKFoCVbO1oX0N5tBaTzU2RPZ9EjfeakVTyGNOsPJdzRD5zQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: Prefer unsigned int to bare use of unsigned
To:     wjc@cdjrlc.com
Cc:     udovic.desroches@microchip.com,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        inux-mmc@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, 26 Jun 2021 at 10:38, Jinchao Wang <wjc@cdjrlc.com> wrote:
>
> Fix checkpatch warnings:
>     WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
>
> Signed-off-by: Jinchao Wang <wjc@cdjrlc.com>

Looks like this didn't reach the mmc patchtracker and not the
linux-mmc list. Can you please double check why and repost?

Moreover, please run checkpatch and fix the error it reports.

Kind regards
Uffe

> ---
>  drivers/mmc/core/core.c            |  6 +++---
>  drivers/mmc/core/core.h            |  2 +-
>  drivers/mmc/core/mmc.c             |  8 ++++----
>  drivers/mmc/core/mmc_ops.c         |  2 +-
>  drivers/mmc/core/mmc_ops.h         |  2 +-
>  drivers/mmc/core/mmc_test.c        | 19 ++++++++++---------
>  drivers/mmc/core/queue.c           |  4 ++--
>  drivers/mmc/core/sd.c              |  4 ++--
>  drivers/mmc/core/sd.h              |  2 +-
>  drivers/mmc/core/sdio.c            |  4 ++--
>  drivers/mmc/core/sdio_cis.c        | 22 +++++++++++-----------
>  drivers/mmc/core/sdio_io.c         | 10 +++++-----
>  drivers/mmc/core/sdio_ops.c        | 13 +++++++------
>  drivers/mmc/core/sdio_ops.h        |  9 +++++----
>  drivers/mmc/core/sdio_uart.c       |  2 +-
>  drivers/mmc/host/atmel-mci.c       | 10 +++++-----
>  drivers/mmc/host/cb710-mmc.c       |  6 +++---
>  drivers/mmc/host/davinci_mmc.c     | 10 +++++-----
>  drivers/mmc/host/mmc_spi.c         | 12 ++++++------
>  drivers/mmc/host/mxs-mmc.c         |  2 +-
>  drivers/mmc/host/omap.c            | 12 ++++++------
>  drivers/mmc/host/pxamci.c          |  2 +-
>  drivers/mmc/host/s3cmci.h          |  4 ++--
>  drivers/mmc/host/sdhci-esdhc-imx.c |  2 +-
>  drivers/mmc/host/sdhci-tegra.c     |  2 +-
>  drivers/mmc/host/sdhci.c           |  8 ++++----
>  drivers/mmc/host/sdhci.h           |  4 ++--
>  drivers/mmc/host/vub300.c          | 10 +++++-----
>  28 files changed, 98 insertions(+), 95 deletions(-)
>
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index b039dcff17f8..c7a8a5386e5f 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -51,7 +51,7 @@
>  #define MMC_ERASE_TIMEOUT_MS   (60 * 1000) /* 60 s */
>  #define SD_DISCARD_TIMEOUT_MS  (250)
>
> -static const unsigned freqs[] = { 400000, 300000, 200000, 100000 };
> +static const unsigned int freqs[] = { 400000, 300000, 200000, 100000 };
>
>  /*
>   * Enabling software CRCs on the data blocks can be a significant (30%)
> @@ -1083,7 +1083,7 @@ static int mmc_of_get_func_num(struct device_node *node)
>  }
>
>  struct device_node *mmc_of_find_child_device(struct mmc_host *host,
> -               unsigned func_num)
> +               unsigned int func_num)
>  {
>         struct device_node *node;
>
> @@ -2028,7 +2028,7 @@ int mmc_sw_reset(struct mmc_host *host)
>  }
>  EXPORT_SYMBOL(mmc_sw_reset);
>
> -static int mmc_rescan_try_freq(struct mmc_host *host, unsigned freq)
> +static int mmc_rescan_try_freq(struct mmc_host *host, unsigned int freq)
>  {
>         host->f_init = freq;
>
> diff --git a/drivers/mmc/core/core.h b/drivers/mmc/core/core.h
> index 0c4de2030b3f..2730f32dd3ac 100644
> --- a/drivers/mmc/core/core.h
> +++ b/drivers/mmc/core/core.h
> @@ -37,7 +37,7 @@ void mmc_attach_bus(struct mmc_host *host, const struct mmc_bus_ops *ops);
>  void mmc_detach_bus(struct mmc_host *host);
>
>  struct device_node *mmc_of_find_child_device(struct mmc_host *host,
> -               unsigned func_num);
> +               unsigned int func_num);
>
>  void mmc_init_erase(struct mmc_card *card);
>
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 838726b68ff3..c6e44f4aa8cb 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -701,7 +701,7 @@ static int mmc_read_ext_csd(struct mmc_card *card)
>         return err;
>  }
>
> -static int mmc_compare_ext_csds(struct mmc_card *card, unsigned bus_width)
> +static int mmc_compare_ext_csds(struct mmc_card *card, unsigned int bus_width)
>  {
>         u8 *bw_ext_csd;
>         int err;
> @@ -995,16 +995,16 @@ static void mmc_set_bus_speed(struct mmc_card *card)
>   */
>  static int mmc_select_bus_width(struct mmc_card *card)
>  {
> -       static unsigned ext_csd_bits[] = {
> +       static unsigned int ext_csd_bits[] = {
>                 EXT_CSD_BUS_WIDTH_8,
>                 EXT_CSD_BUS_WIDTH_4,
>         };
> -       static unsigned bus_widths[] = {
> +       static unsigned int bus_widths[] = {
>                 MMC_BUS_WIDTH_8,
>                 MMC_BUS_WIDTH_4,
>         };
>         struct mmc_host *host = card->host;
> -       unsigned idx, bus_width = 0;
> +       unsigned int idx, bus_width = 0;
>         int err = 0;
>
>         if (!mmc_can_ext_csd(card) ||
> diff --git a/drivers/mmc/core/mmc_ops.c b/drivers/mmc/core/mmc_ops.c
> index 973756ed4016..0e84341c0dbd 100644
> --- a/drivers/mmc/core/mmc_ops.c
> +++ b/drivers/mmc/core/mmc_ops.c
> @@ -252,7 +252,7 @@ mmc_send_cxd_native(struct mmc_host *host, u32 arg, u32 *cxd, int opcode)
>   * buffer or on-stack buffer (with some overhead in callee).
>   */
>  int mmc_send_adtc_data(struct mmc_card *card, struct mmc_host *host, u32 opcode,
> -                      u32 args, void *buf, unsigned len)
> +                      u32 args, void *buf, unsigned int len)
>  {
>         struct mmc_request mrq = {};
>         struct mmc_command cmd = {};
> diff --git a/drivers/mmc/core/mmc_ops.h b/drivers/mmc/core/mmc_ops.h
> index 41ab4f573a31..b302d6b4a1b8 100644
> --- a/drivers/mmc/core/mmc_ops.h
> +++ b/drivers/mmc/core/mmc_ops.h
> @@ -28,7 +28,7 @@ int mmc_go_idle(struct mmc_host *host);
>  int mmc_send_op_cond(struct mmc_host *host, u32 ocr, u32 *rocr);
>  int mmc_set_relative_addr(struct mmc_card *card);
>  int mmc_send_adtc_data(struct mmc_card *card, struct mmc_host *host, u32 opcode,
> -                      u32 args, void *buf, unsigned len);
> +                      u32 args, void *buf, unsigned int len);
>  int mmc_send_csd(struct mmc_card *card, u32 *csd);
>  int __mmc_send_status(struct mmc_card *card, u32 *status, unsigned int retries);
>  int mmc_send_status(struct mmc_card *card, u32 *status);
> diff --git a/drivers/mmc/core/mmc_test.c b/drivers/mmc/core/mmc_test.c
> index 63524551a13a..e23670a9c65b 100644
> --- a/drivers/mmc/core/mmc_test.c
> +++ b/drivers/mmc/core/mmc_test.c
> @@ -176,7 +176,7 @@ struct mmc_test_multiple_rw {
>  /*
>   * Configure correct block size in card
>   */
> -static int mmc_test_set_blksize(struct mmc_test_card *test, unsigned size)
> +static int mmc_test_set_blksize(struct mmc_test_card *test, unsigned int size)
>  {
>         return mmc_set_blocklen(test->card, size);
>  }
> @@ -208,8 +208,9 @@ static void mmc_test_prepare_sbc(struct mmc_test_card *test,
>   * Fill in the mmc_request structure given a set of transfer parameters.
>   */
>  static void mmc_test_prepare_mrq(struct mmc_test_card *test,
> -       struct mmc_request *mrq, struct scatterlist *sg, unsigned sg_len,
> -       unsigned dev_addr, unsigned blocks, unsigned blksz, int write)
> +       struct mmc_request *mrq, struct scatterlist *sg, unsigned int sg_len,
> +       unsigned int dev_addr, unsigned int blocks,
> +       unsigned int blksz, int write)
>  {
>         if (WARN_ON(!mrq || !mrq->cmd || !mrq->data || !mrq->stop))
>                 return;
> @@ -288,7 +289,7 @@ static int mmc_test_wait_busy(struct mmc_test_card *test)
>   * Transfer a single sector of kernel addressable data
>   */
>  static int mmc_test_buffer_transfer(struct mmc_test_card *test,
> -       u8 *buffer, unsigned addr, unsigned blksz, int write)
> +       u8 *buffer, unsigned int addr, unsigned int blksz, int write)
>  {
>         struct mmc_request mrq = {};
>         struct mmc_command cmd = {};
> @@ -872,8 +873,8 @@ static int mmc_test_nonblock_transfer(struct mmc_test_card *test,
>   * Tests a basic transfer with certain parameters
>   */
>  static int mmc_test_simple_transfer(struct mmc_test_card *test,
> -       struct scatterlist *sg, unsigned sg_len, unsigned dev_addr,
> -       unsigned blocks, unsigned blksz, int write)
> +       struct scatterlist *sg, unsigned int sg_len, unsigned int dev_addr,
> +       unsigned int blocks, unsigned int blksz, int write)
>  {
>         struct mmc_request mrq = {};
>         struct mmc_command cmd = {};
> @@ -898,7 +899,7 @@ static int mmc_test_simple_transfer(struct mmc_test_card *test,
>   * Tests a transfer where the card will fail completely or partly
>   */
>  static int mmc_test_broken_transfer(struct mmc_test_card *test,
> -       unsigned blocks, unsigned blksz, int write)
> +       unsigned int blocks, unsigned int blksz, int write)
>  {
>         struct mmc_request mrq = {};
>         struct mmc_command cmd = {};
> @@ -929,8 +930,8 @@ static int mmc_test_broken_transfer(struct mmc_test_card *test,
>   * Note: mmc_test_prepare() must have been done before this call
>   */
>  static int mmc_test_transfer(struct mmc_test_card *test,
> -       struct scatterlist *sg, unsigned sg_len, unsigned dev_addr,
> -       unsigned blocks, unsigned blksz, int write)
> +       struct scatterlist *sg, unsigned int sg_len, unsigned int dev_addr,
> +       unsigned int blocks, unsigned int blksz, int write)
>  {
>         int ret, i;
>         unsigned long flags;
> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> index cc3261777637..87c887c56977 100644
> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -177,7 +177,7 @@ static struct scatterlist *mmc_alloc_sg(int sg_len, gfp_t gfp)
>  static void mmc_queue_setup_discard(struct request_queue *q,
>                                     struct mmc_card *card)
>  {
> -       unsigned max_discard;
> +       unsigned int max_discard;
>
>         max_discard = mmc_calc_max_discard(card);
>         if (!max_discard)
> @@ -365,7 +365,7 @@ static const struct blk_mq_ops mmc_mq_ops = {
>  static void mmc_setup_queue(struct mmc_queue *mq, struct mmc_card *card)
>  {
>         struct mmc_host *host = card->host;
> -       unsigned block_size = 512;
> +       unsigned int block_size = 512;
>
>         blk_queue_flag_set(QUEUE_FLAG_NONROT, mq->queue);
>         blk_queue_flag_clear(QUEUE_FLAG_ADD_RANDOM, mq->queue);
> diff --git a/drivers/mmc/core/sd.c b/drivers/mmc/core/sd.c
> index 4646b7a03db6..c32455933e1b 100644
> --- a/drivers/mmc/core/sd.c
> +++ b/drivers/mmc/core/sd.c
> @@ -980,9 +980,9 @@ int mmc_sd_setup_card(struct mmc_host *host, struct mmc_card *card,
>         return 0;
>  }
>
> -unsigned mmc_sd_get_max_clock(struct mmc_card *card)
> +unsigned int mmc_sd_get_max_clock(struct mmc_card *card)
>  {
> -       unsigned max_dtr = (unsigned int)-1;
> +       unsigned int max_dtr = (unsigned int)-1;
>
>         if (mmc_card_hs(card)) {
>                 if (max_dtr > card->sw_caps.hs_max_dtr)
> diff --git a/drivers/mmc/core/sd.h b/drivers/mmc/core/sd.h
> index 1af5a038bae9..73fbbaecfe3e 100644
> --- a/drivers/mmc/core/sd.h
> +++ b/drivers/mmc/core/sd.h
> @@ -14,7 +14,7 @@ int mmc_sd_get_csd(struct mmc_card *card);
>  void mmc_decode_cid(struct mmc_card *card);
>  int mmc_sd_setup_card(struct mmc_host *host, struct mmc_card *card,
>         bool reinit);
> -unsigned mmc_sd_get_max_clock(struct mmc_card *card);
> +unsigned int mmc_sd_get_max_clock(struct mmc_card *card);
>  int mmc_sd_switch_hs(struct mmc_card *card);
>
>  #endif
> diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
> index 68edf7a615be..acf8db525d63 100644
> --- a/drivers/mmc/core/sdio.c
> +++ b/drivers/mmc/core/sdio.c
> @@ -424,9 +424,9 @@ static int sdio_enable_hs(struct mmc_card *card)
>         return ret;
>  }
>
> -static unsigned mmc_sdio_get_max_clock(struct mmc_card *card)
> +static unsigned int mmc_sdio_get_max_clock(struct mmc_card *card)
>  {
> -       unsigned max_dtr;
> +       unsigned int max_dtr;
>
>         if (mmc_card_hs(card)) {
>                 /*
> diff --git a/drivers/mmc/core/sdio_cis.c b/drivers/mmc/core/sdio_cis.c
> index b23773583179..c6d84dc2d8c4 100644
> --- a/drivers/mmc/core/sdio_cis.c
> +++ b/drivers/mmc/core/sdio_cis.c
> @@ -23,10 +23,10 @@
>  #define SDIO_READ_CIS_TIMEOUT_MS  (10 * 1000) /* 10s */
>
>  static int cistpl_vers_1(struct mmc_card *card, struct sdio_func *func,
> -                        const unsigned char *buf, unsigned size)
> +                        const unsigned char *buf, unsigned int size)
>  {
>         u8 major_rev, minor_rev;
> -       unsigned i, nr_strings;
> +       unsigned int i, nr_strings;
>         char **buffer, *string;
>
>         if (size < 2)
> @@ -81,7 +81,7 @@ static int cistpl_vers_1(struct mmc_card *card, struct sdio_func *func,
>  }
>
>  static int cistpl_manfid(struct mmc_card *card, struct sdio_func *func,
> -                        const unsigned char *buf, unsigned size)
> +                        const unsigned char *buf, unsigned int size)
>  {
>         unsigned int vendor, device;
>
> @@ -109,7 +109,7 @@ static const unsigned int speed_unit[8] =
>
>
>  typedef int (tpl_parse_t)(struct mmc_card *, struct sdio_func *,
> -                          const unsigned char *, unsigned);
> +                          const unsigned char *, unsigned int);
>
>  struct cis_tpl {
>         unsigned char code;
> @@ -121,7 +121,7 @@ static int cis_tpl_parse(struct mmc_card *card, struct sdio_func *func,
>                          const char *tpl_descr,
>                          const struct cis_tpl *tpl, int tpl_count,
>                          unsigned char code,
> -                        const unsigned char *buf, unsigned size)
> +                        const unsigned char *buf, unsigned int size)
>  {
>         int i, ret;
>
> @@ -153,7 +153,7 @@ static int cis_tpl_parse(struct mmc_card *card, struct sdio_func *func,
>  }
>
>  static int cistpl_funce_common(struct mmc_card *card, struct sdio_func *func,
> -                              const unsigned char *buf, unsigned size)
> +                              const unsigned char *buf, unsigned int size)
>  {
>         /* Only valid for the common CIS (function 0) */
>         if (func)
> @@ -170,10 +170,10 @@ static int cistpl_funce_common(struct mmc_card *card, struct sdio_func *func,
>  }
>
>  static int cistpl_funce_func(struct mmc_card *card, struct sdio_func *func,
> -                            const unsigned char *buf, unsigned size)
> +                            const unsigned char *buf, unsigned int size)
>  {
> -       unsigned vsn;
> -       unsigned min_size;
> +       unsigned int vsn;
> +       unsigned int min_size;
>
>         /* Only valid for the individual function's CIS (1-7) */
>         if (!func)
> @@ -220,7 +220,7 @@ static const struct cis_tpl cis_tpl_funce_list[] = {
>  };
>
>  static int cistpl_funce(struct mmc_card *card, struct sdio_func *func,
> -                       const unsigned char *buf, unsigned size)
> +                       const unsigned char *buf, unsigned int size)
>  {
>         if (size < 1)
>                 return -EINVAL;
> @@ -244,7 +244,7 @@ static int sdio_read_cis(struct mmc_card *card, struct sdio_func *func)
>  {
>         int ret;
>         struct sdio_func_tuple *this, **prev;
> -       unsigned i, ptr = 0;
> +       unsigned int i, ptr = 0;
>
>         /*
>          * Note that this works for the common CIS (function number 0) as
> diff --git a/drivers/mmc/core/sdio_io.c b/drivers/mmc/core/sdio_io.c
> index 79dbf90216b5..89c5d20a7b08 100644
> --- a/drivers/mmc/core/sdio_io.c
> +++ b/drivers/mmc/core/sdio_io.c
> @@ -156,7 +156,7 @@ EXPORT_SYMBOL_GPL(sdio_disable_func);
>   *     size register writes failed.
>   *
>   */
> -int sdio_set_block_size(struct sdio_func *func, unsigned blksz)
> +int sdio_set_block_size(struct sdio_func *func, unsigned int blksz)
>  {
>         int ret;
>
> @@ -234,7 +234,7 @@ unsigned int sdio_align_size(struct sdio_func *func, unsigned int sz)
>  {
>         unsigned int orig_sz;
>         unsigned int blk_sz, byte_sz;
> -       unsigned chunk_sz;
> +       unsigned int chunk_sz;
>
>         orig_sz = sz;
>
> @@ -313,10 +313,10 @@ EXPORT_SYMBOL_GPL(sdio_align_size);
>  /* Split an arbitrarily sized data transfer into several
>   * IO_RW_EXTENDED commands. */
>  static int sdio_io_rw_ext_helper(struct sdio_func *func, int write,
> -       unsigned addr, int incr_addr, u8 *buf, unsigned size)
> +       unsigned int addr, int incr_addr, u8 *buf, unsigned int size)
>  {
>         unsigned remainder = size;
> -       unsigned max_blocks;
> +       unsigned int max_blocks;
>         int ret;
>
>         if (!func || (func->num > 7))
> @@ -329,7 +329,7 @@ static int sdio_io_rw_ext_helper(struct sdio_func *func, int write,
>                 max_blocks = min(func->card->host->max_blk_count, 511u);
>
>                 while (remainder >= func->cur_blksize) {
> -                       unsigned blocks;
> +                       unsigned int blocks;
>
>                         blocks = remainder / func->cur_blksize;
>                         if (blocks > max_blocks)
> diff --git a/drivers/mmc/core/sdio_ops.c b/drivers/mmc/core/sdio_ops.c
> index 4c229dd2b6e5..4c6389f29493 100644
> --- a/drivers/mmc/core/sdio_ops.c
> +++ b/drivers/mmc/core/sdio_ops.c
> @@ -59,8 +59,8 @@ int mmc_send_io_op_cond(struct mmc_host *host, u32 ocr, u32 *rocr)
>         return err;
>  }
>
> -static int mmc_io_rw_direct_host(struct mmc_host *host, int write, unsigned fn,
> -       unsigned addr, u8 in, u8 *out)
> +static int mmc_io_rw_direct_host(struct mmc_host *host, int write,
> +               unsigned int fn, unsigned int addr, u8 in, u8 *out)
>  {
>         struct mmc_command cmd = {};
>         int err;
> @@ -105,14 +105,15 @@ static int mmc_io_rw_direct_host(struct mmc_host *host, int write, unsigned fn,
>         return 0;
>  }
>
> -int mmc_io_rw_direct(struct mmc_card *card, int write, unsigned fn,
> -       unsigned addr, u8 in, u8 *out)
> +int mmc_io_rw_direct(struct mmc_card *card, int write, unsigned int fn,
> +       unsigned int addr, u8 in, u8 *out)
>  {
>         return mmc_io_rw_direct_host(card->host, write, fn, addr, in, out);
>  }
>
> -int mmc_io_rw_extended(struct mmc_card *card, int write, unsigned fn,
> -       unsigned addr, int incr_addr, u8 *buf, unsigned blocks, unsigned blksz)
> +int mmc_io_rw_extended(struct mmc_card *card, int write, unsigned int fn,
> +       unsigned int addr, int incr_addr, u8 *buf, unsigned int blocks,
> +       unsigned int blksz)
>  {
>         struct mmc_request mrq = {};
>         struct mmc_command cmd = {};
> diff --git a/drivers/mmc/core/sdio_ops.h b/drivers/mmc/core/sdio_ops.h
> index 37f79732a206..940c3abaf8a9 100644
> --- a/drivers/mmc/core/sdio_ops.h
> +++ b/drivers/mmc/core/sdio_ops.h
> @@ -16,10 +16,11 @@ struct mmc_card;
>  struct work_struct;
>
>  int mmc_send_io_op_cond(struct mmc_host *host, u32 ocr, u32 *rocr);
> -int mmc_io_rw_direct(struct mmc_card *card, int write, unsigned fn,
> -       unsigned addr, u8 in, u8* out);
> -int mmc_io_rw_extended(struct mmc_card *card, int write, unsigned fn,
> -       unsigned addr, int incr_addr, u8 *buf, unsigned blocks, unsigned blksz);
> +int mmc_io_rw_direct(struct mmc_card *card, int write, unsigned int fn,
> +               unsigned int addr, u8 in, u8* out);
> +int mmc_io_rw_extended(struct mmc_card *card, int write, unsigned int fn,
> +       unsigned int addr, int incr_addr, u8 *buf, unsigned int blocks,
> +       unsigned int blksz);
>  int sdio_reset(struct mmc_host *host);
>  void sdio_irq_work(struct work_struct *work);
>
> diff --git a/drivers/mmc/core/sdio_uart.c b/drivers/mmc/core/sdio_uart.c
> index c36242b86b1d..fc1ea2babd88 100644
> --- a/drivers/mmc/core/sdio_uart.c
> +++ b/drivers/mmc/core/sdio_uart.c
> @@ -106,7 +106,7 @@ static int sdio_uart_add_port(struct sdio_uart_port *port)
>         return ret;
>  }
>
> -static struct sdio_uart_port *sdio_uart_port_get(unsigned index)
> +static struct sdio_uart_port *sdio_uart_port_get(unsigned int index)
>  {
>         struct sdio_uart_port *port;
>
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index 807177c953f3..69519378db8f 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -731,18 +731,18 @@ static inline unsigned int atmci_ns_to_clocks(struct atmel_mci *host,
>  static void atmci_set_timeout(struct atmel_mci *host,
>                 struct atmel_mci_slot *slot, struct mmc_data *data)
>  {
> -       static unsigned dtomul_to_shift[] = {
> +       static unsigned int dtomul_to_shift[] = {
>                 0, 4, 7, 8, 10, 12, 16, 20
>         };
> -       unsigned        timeout;
> -       unsigned        dtocyc;
> -       unsigned        dtomul;
> +       unsigned int    timeout;
> +       unsigned int    dtocyc;
> +       unsigned int    dtomul;
>
>         timeout = atmci_ns_to_clocks(host, data->timeout_ns)
>                 + data->timeout_clks;
>
>         for (dtomul = 0; dtomul < 8; dtomul++) {
> -               unsigned shift = dtomul_to_shift[dtomul];
> +               unsigned int shift = dtomul_to_shift[dtomul];
>                 dtocyc = (timeout + (1 << shift) - 1) >> shift;
>                 if (dtocyc < 15)
>                         break;
> diff --git a/drivers/mmc/host/cb710-mmc.c b/drivers/mmc/host/cb710-mmc.c
> index 6d623b2681c3..764ba546dc1a 100644
> --- a/drivers/mmc/host/cb710-mmc.c
> +++ b/drivers/mmc/host/cb710-mmc.c
> @@ -145,7 +145,7 @@ static int cb710_check_event(struct cb710_slot *slot, u8 what)
>  static int cb710_wait_for_event(struct cb710_slot *slot, u8 what)
>  {
>         int err = 0;
> -       unsigned limit = 2000000;       /* FIXME: real timeout */
> +       unsigned int limit = 2000000;   /* FIXME: real timeout */
>
>  #ifdef CONFIG_CB710_DEBUG
>         u32 e, x;
> @@ -177,7 +177,7 @@ static int cb710_wait_for_event(struct cb710_slot *slot, u8 what)
>
>  static int cb710_wait_while_busy(struct cb710_slot *slot, uint8_t mask)
>  {
> -       unsigned limit = 500000;        /* FIXME: real timeout */
> +       unsigned int limit = 500000;    /* FIXME: real timeout */
>         int err = 0;
>
>  #ifdef CONFIG_CB710_DEBUG
> @@ -395,7 +395,7 @@ static u16 cb710_encode_cmd_flags(struct cb710_mmc_reader *reader,
>  static void cb710_receive_response(struct cb710_slot *slot,
>         struct mmc_command *cmd)
>  {
> -       unsigned rsp_opcode, wanted_opcode;
> +       unsigned int rsp_opcode, wanted_opcode;
>
>         /* Looks like final byte with CRC is always stripped (same as SDHCI) */
>         if (cmd->flags & MMC_RSP_136) {
> diff --git a/drivers/mmc/host/davinci_mmc.c b/drivers/mmc/host/davinci_mmc.c
> index 2a757c88f9d2..c7fff3eb67f3 100644
> --- a/drivers/mmc/host/davinci_mmc.c
> +++ b/drivers/mmc/host/davinci_mmc.c
> @@ -146,22 +146,22 @@
>
>  #define MAX_NR_SG      16
>
> -static unsigned rw_threshold = 32;
> +static unsigned int rw_threshold = 32;
>  module_param(rw_threshold, uint, S_IRUGO);
>  MODULE_PARM_DESC(rw_threshold,
>                 "Read/Write threshold. Default = 32");
>
> -static unsigned poll_threshold = 128;
> +static unsigned int poll_threshold = 128;
>  module_param(poll_threshold, uint, S_IRUGO);
>  MODULE_PARM_DESC(poll_threshold,
>                  "Polling transaction size threshold. Default = 128");
>
> -static unsigned poll_loopcount = 32;
> +static unsigned int poll_loopcount = 32;
>  module_param(poll_loopcount, uint, S_IRUGO);
>  MODULE_PARM_DESC(poll_loopcount,
>                  "Maximum polling loop count. Default = 32");
>
> -static unsigned use_dma = 1;
> +static unsigned int use_dma = 1;
>  module_param(use_dma, uint, 0);
>  MODULE_PARM_DESC(use_dma, "Whether to use DMA or not. Default = 1");
>
> @@ -203,7 +203,7 @@ struct mmc_davinci_host {
>         /* Version of the MMC/SD controller */
>         u8 version;
>         /* for ns in one cycle calculation */
> -       unsigned ns_in_one_cycle;
> +       unsigned int ns_in_one_cycle;
>         /* Number of sg segments */
>         u8 nr_sg;
>  #ifdef CONFIG_CPU_FREQ
> diff --git a/drivers/mmc/host/mmc_spi.c b/drivers/mmc/host/mmc_spi.c
> index 65c65bb5737f..b8c9944e0a1d 100644
> --- a/drivers/mmc/host/mmc_spi.c
> +++ b/drivers/mmc/host/mmc_spi.c
> @@ -148,7 +148,7 @@ static inline int mmc_cs_off(struct mmc_spi_host *host)
>  }
>
>  static int
> -mmc_spi_readbytes(struct mmc_spi_host *host, unsigned len)
> +mmc_spi_readbytes(struct mmc_spi_host *host, unsigned int len)
>  {
>         int status;
>
> @@ -175,14 +175,14 @@ mmc_spi_readbytes(struct mmc_spi_host *host, unsigned len)
>  }
>
>  static int mmc_spi_skip(struct mmc_spi_host *host, unsigned long timeout,
> -                       unsigned n, u8 byte)
> +                       unsigned int n, u8 byte)
>  {
>         u8 *cp = host->data->status;
>         unsigned long start = jiffies;
>
>         while (1) {
>                 int             status;
> -               unsigned        i;
> +               unsigned int    i;
>
>                 status = mmc_spi_readbytes(host, n);
>                 if (status < 0)
> @@ -868,7 +868,7 @@ mmc_spi_data_do(struct mmc_spi_host *host, struct mmc_command *cmd,
>         struct spi_transfer     *t;
>         enum dma_data_direction direction;
>         struct scatterlist      *sg;
> -       unsigned                n_sg;
> +       unsigned int            n_sg;
>         int                     multiple = (data->blocks > 1);
>         u32                     clock_rate;
>         unsigned long           timeout;
> @@ -893,7 +893,7 @@ mmc_spi_data_do(struct mmc_spi_host *host, struct mmc_command *cmd,
>                 int                     status = 0;
>                 dma_addr_t              dma_addr = 0;
>                 void                    *kmap_addr;
> -               unsigned                length = sg->length;
> +               unsigned int            length = sg->length;
>                 enum dma_data_direction dir = direction;
>
>                 /* set up dma mapping for controller drivers that might
> @@ -971,7 +971,7 @@ mmc_spi_data_do(struct mmc_spi_host *host, struct mmc_command *cmd,
>         if (direction == DMA_TO_DEVICE && multiple) {
>                 struct scratch  *scratch = host->data;
>                 int             tmp;
> -               const unsigned  statlen = sizeof(scratch->status);
> +               const unsigned int      statlen = sizeof(scratch->status);
>
>                 dev_dbg(&spi->dev, "    STOP_TRAN\n");
>
> diff --git a/drivers/mmc/host/mxs-mmc.c b/drivers/mmc/host/mxs-mmc.c
> index 947581de7860..7523d4e9d1f1 100644
> --- a/drivers/mmc/host/mxs-mmc.c
> +++ b/drivers/mmc/host/mxs-mmc.c
> @@ -325,7 +325,7 @@ static void mxs_mmc_ac(struct mxs_mmc_host *host)
>                  "%s: failed to prep dma\n", __func__);
>  }
>
> -static unsigned short mxs_ns_to_ssp_ticks(unsigned clock_rate, unsigned ns)
> +static unsigned short mxs_ns_to_ssp_ticks(unsigned int clock_rate, unsigned int ns)
>  {
>         const unsigned int ssp_timeout_mul = 4096;
>         /*
> diff --git a/drivers/mmc/host/omap.c b/drivers/mmc/host/omap.c
> index 5e5af34090f1..aad6b979eeb9 100644
> --- a/drivers/mmc/host/omap.c
> +++ b/drivers/mmc/host/omap.c
> @@ -106,7 +106,7 @@ struct mmc_omap_slot {
>
>         struct tasklet_struct   cover_tasklet;
>         struct timer_list       cover_timer;
> -       unsigned                cover_open;
> +       unsigned int            cover_open;
>
>         struct mmc_request      *mrq;
>         struct mmc_omap_host    *host;
> @@ -135,7 +135,7 @@ struct mmc_omap_host {
>         unsigned int            reg_shift;
>
>         struct work_struct      cmd_abort_work;
> -       unsigned                abort:1;
> +       unsigned int            abort:1;
>         struct timer_list       cmd_abort_timer;
>
>         struct work_struct      slot_release_work;
> @@ -149,9 +149,9 @@ struct mmc_omap_host {
>         u32                     buffer_bytes_left;
>         u32                     total_bytes_left;
>
> -       unsigned                features;
> -       unsigned                brs_received:1, dma_done:1;
> -       unsigned                dma_in_use:1;
> +       unsigned int            features;
> +       unsigned int            brs_received:1, dma_done:1;
> +       unsigned int            dma_in_use:1;
>         spinlock_t              dma_lock;
>
>         struct mmc_omap_slot    *slots[OMAP_MMC_MAX_SLOTS];
> @@ -946,7 +946,7 @@ mmc_omap_prepare_data(struct mmc_omap_host *host, struct mmc_request *req)
>         struct mmc_data *data = req->data;
>         int i, use_dma = 1, block_size;
>         struct scatterlist *sg;
> -       unsigned sg_len;
> +       unsigned int sg_len;
>
>         host->data = data;
>         if (data == NULL) {
> diff --git a/drivers/mmc/host/pxamci.c b/drivers/mmc/host/pxamci.c
> index 316393c694d7..2b30af600350 100644
> --- a/drivers/mmc/host/pxamci.c
> +++ b/drivers/mmc/host/pxamci.c
> @@ -380,7 +380,7 @@ static irqreturn_t pxamci_irq(int irq, void *devid)
>         ireg = readl(host->base + MMC_I_REG) & ~readl(host->base + MMC_I_MASK);
>
>         if (ireg) {
> -               unsigned stat = readl(host->base + MMC_STAT);
> +               unsigned int stat = readl(host->base + MMC_STAT);
>
>                 pr_debug("PXAMCI: irq %08x stat %08x\n", ireg, stat);
>
> diff --git a/drivers/mmc/host/s3cmci.h b/drivers/mmc/host/s3cmci.h
> index 8b65d7ad9f97..f89e3c2cfd6d 100644
> --- a/drivers/mmc/host/s3cmci.h
> +++ b/drivers/mmc/host/s3cmci.h
> @@ -31,8 +31,8 @@ struct s3cmci_host {
>         u8                      prescaler;
>
>         int                     is2440;
> -       unsigned                sdiimsk;
> -       unsigned                sdidata;
> +       unsigned int            sdiimsk;
> +       unsigned int            sdidata;
>
>         bool                    irq_disabled;
>         bool                    irq_enabled;
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 72c0bf0c1887..6ff72ac7dcba 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1150,7 +1150,7 @@ static void esdhc_reset_tuning(struct sdhci_host *host)
>         }
>  }
>
> -static void esdhc_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
> +static void esdhc_set_uhs_signaling(struct sdhci_host *host, unsigned int timing)
>  {
>         u32 m;
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 387ce9cdbd7c..97aedc1da17e 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -980,7 +980,7 @@ static int tegra_sdhci_execute_hw_tuning(struct mmc_host *mmc, u32 opcode)
>  }
>
>  static void tegra_sdhci_set_uhs_signaling(struct sdhci_host *host,
> -                                         unsigned timing)
> +                                         unsigned int timing)
>  {
>         struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
>         struct sdhci_tegra *tegra_host = sdhci_pltfm_priv(pltfm_host);
> diff --git a/drivers/mmc/host/sdhci.c b/drivers/mmc/host/sdhci.c
> index 6aaf5c3ce34c..a05dda6257f1 100644
> --- a/drivers/mmc/host/sdhci.c
> +++ b/drivers/mmc/host/sdhci.c
> @@ -928,7 +928,7 @@ static u8 sdhci_calc_timeout(struct sdhci_host *host, struct mmc_command *cmd,
>  {
>         u8 count;
>         struct mmc_data *data;
> -       unsigned target_timeout, current_timeout;
> +       unsigned int target_timeout, current_timeout;
>
>         *too_big = true;
>
> @@ -2209,7 +2209,7 @@ void sdhci_set_bus_width(struct sdhci_host *host, int width)
>  }
>  EXPORT_SYMBOL_GPL(sdhci_set_bus_width);
>
> -void sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
> +void sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned int timing)
>  {
>         u16 ctrl_2;
>
> @@ -3194,7 +3194,7 @@ static void sdhci_cmd_irq(struct sdhci_host *host, u32 intmask, u32 *intmask_p)
>                 if (host->pending_reset)
>                         return;
>                 pr_err("%s: Got command interrupt 0x%08x even though no command operation was in progress.\n",
> -                      mmc_hostname(host->mmc), (unsigned)intmask);
> +                      mmc_hostname(host->mmc), (unsigned int)intmask);
>                 sdhci_dumpregs(host);
>                 return;
>         }
> @@ -3324,7 +3324,7 @@ static void sdhci_data_irq(struct sdhci_host *host, u32 intmask)
>                         return;
>
>                 pr_err("%s: Got data interrupt 0x%08x even though no data operation was in progress.\n",
> -                      mmc_hostname(host->mmc), (unsigned)intmask);
> +                      mmc_hostname(host->mmc), (unsigned int)intmask);
>                 sdhci_dumpregs(host);
>
>                 return;
> diff --git a/drivers/mmc/host/sdhci.h b/drivers/mmc/host/sdhci.h
> index c35ed4be75b7..7d99fe3c9f13 100644
> --- a/drivers/mmc/host/sdhci.h
> +++ b/drivers/mmc/host/sdhci.h
> @@ -575,7 +575,7 @@ struct sdhci_host {
>         unsigned int            ocr_avail_mmc;
>         u32 ocr_mask;           /* available voltages */
>
> -       unsigned                timing;         /* Current timing */
> +       unsigned int            timing;         /* Current timing */
>
>         u32                     thread_isr;
>
> @@ -777,7 +777,7 @@ void sdhci_request(struct mmc_host *mmc, struct mmc_request *mrq);
>  int sdhci_request_atomic(struct mmc_host *mmc, struct mmc_request *mrq);
>  void sdhci_set_bus_width(struct sdhci_host *host, int width);
>  void sdhci_reset(struct sdhci_host *host, u8 mask);
> -void sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned timing);
> +void sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned int timing);
>  int sdhci_execute_tuning(struct mmc_host *mmc, u32 opcode);
>  void sdhci_set_ios(struct mmc_host *mmc, struct mmc_ios *ios);
>  int sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
> diff --git a/drivers/mmc/host/vub300.c b/drivers/mmc/host/vub300.c
> index 4950d10d3a19..19f00247b888 100644
> --- a/drivers/mmc/host/vub300.c
> +++ b/drivers/mmc/host/vub300.c
> @@ -483,8 +483,8 @@ static void send_irqpoll(struct vub300_mmc_host *vub300)
>         vub300->cmnd.poll.header_type = 1;
>         vub300->cmnd.poll.port_number = 0;
>         vub300->cmnd.poll.command_type = 2;
> -       vub300->cmnd.poll.poll_timeout_lsb = 0xFF & (unsigned)timeout;
> -       vub300->cmnd.poll.poll_timeout_msb = 0xFF & (unsigned)(timeout >> 8);
> +       vub300->cmnd.poll.poll_timeout_lsb = 0xFF & (unsigned int)timeout;
> +       vub300->cmnd.poll.poll_timeout_msb = 0xFF & (unsigned int)(timeout >> 8);
>         usb_fill_bulk_urb(vub300->command_out_urb, vub300->udev,
>                           usb_sndbulkpipe(vub300->udev, vub300->cmnd_out_ep)
>                           , &vub300->cmnd, sizeof(vub300->cmnd)
> @@ -1437,7 +1437,7 @@ static int __command_read_data(struct vub300_mmc_host *vub300,
>                 ((63 + linear_length) >> 6) << 6;
>         if ((padded_length == linear_length) || !pad_input_to_usb_pkt) {
>                 int result;
> -               unsigned pipe;
> +               unsigned int pipe;
>                 pipe = usb_rcvbulkpipe(vub300->udev, vub300->data_inp_ep);
>                 result = usb_sg_init(&vub300->sg_request, vub300->udev,
>                                      pipe, 0, data->sg,
> @@ -1468,7 +1468,7 @@ static int __command_read_data(struct vub300_mmc_host *vub300,
>                 u8 *buf = kmalloc(padded_length, GFP_KERNEL);
>                 if (buf) {
>                         int result;
> -                       unsigned pipe = usb_rcvbulkpipe(vub300->udev,
> +                       unsigned int pipe = usb_rcvbulkpipe(vub300->udev,
>                                                         vub300->data_inp_ep);
>                         int actual_length = 0;
>                         result = vub300_usb_bulk_msg(vub300, pipe, buf,
> @@ -1503,7 +1503,7 @@ static int __command_write_data(struct vub300_mmc_host *vub300,
>                                 struct mmc_command *cmd, struct mmc_data *data)
>  {
>         /* cmd_mutex is held by vub300_cmndwork_thread */
> -       unsigned pipe = usb_sndbulkpipe(vub300->udev, vub300->data_out_ep);
> +       unsigned int pipe = usb_sndbulkpipe(vub300->udev, vub300->data_out_ep);
>         int linear_length = vub300->datasize;
>         int modulo_64_length = linear_length & 0x003F;
>         int modulo_512_length = linear_length & 0x01FF;
> --
> 2.31.1
>
>
>
