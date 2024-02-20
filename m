Return-Path: <linux-omap+bounces-685-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D612985C6A1
	for <lists+linux-omap@lfdr.de>; Tue, 20 Feb 2024 22:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F29E1F2264D
	for <lists+linux-omap@lfdr.de>; Tue, 20 Feb 2024 21:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E43151CE9;
	Tue, 20 Feb 2024 21:03:33 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C793314A4E2
	for <linux-omap@vger.kernel.org>; Tue, 20 Feb 2024 21:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708463013; cv=none; b=EYloOpHStgMUC93LnRYLsItC3howTV3LHaGDrVdjfTSofvvxE5ZNazzvVWl34ulg9c5XRHCGdASy5kcaInz04c39MbBSLZNK0yxPWlUDBCEcawxOD+UiaVRq0kqtBUtNx9BTXMPY8eF1+cZ+xEMcWpUcheLenKx5Tqzh9p7E5bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708463013; c=relaxed/simple;
	bh=vm6uSB6JaZw2WzCggYuBKNVvljB75A+JwEwpklaPAPU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=e6/ssJUFjEO/egPqeBWE2/hYd2nAMUYn50uhpOaw6Ppb8GiBw00oxxA7aTcssHiDNQ0g173qPE/IZ8Xgdu9GOB7bqfSDlhvGb6d/eI9hj9nSShJ+ffJvAFm5vyMnkujiLAM8XMvyj2NCzbMsWitF2tMiFKtDDK74X0Kcfp/3OKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:a66f:1f5b:42c8:e3c5])
	by andre.telenet-ops.be with bizsmtp
	id pZ3D2B00A1N8lK501Z3Dp7; Tue, 20 Feb 2024 22:03:22 +0100
Received: from geert (helo=localhost)
	by ramsan.of.borg with local-esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rcXGj-001Bz0-Bj;
	Tue, 20 Feb 2024 22:03:13 +0100
Date: Tue, 20 Feb 2024 22:03:13 +0100 (CET)
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Linus Walleij <linus.walleij@linaro.org>
cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, 
    Ming Lei <ming.lei@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
    Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Pitre <nico@fluxnic.net>, 
    Aaro Koskinen <aaro.koskinen@iki.fi>, 
    Adrian Hunter <adrian.hunter@intel.com>, 
    Angelo Dureghello <angelo.dureghello@timesys.com>, 
    linux-mmc@vger.kernel.org, linux-block@vger.kernel.org, 
    linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 9/9] mmc: sh_mmcif: Use sg_miter for PIO
In-Reply-To: <20240127-mmc-proper-kmap-v2-9-d8e732aa97d1@linaro.org>
Message-ID: <7f40cb40-1a1-532-75fc-d3376ed27a@linux-m68k.org>
References: <20240127-mmc-proper-kmap-v2-0-d8e732aa97d1@linaro.org> <20240127-mmc-proper-kmap-v2-9-d8e732aa97d1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed

 	Hi Linus,

On Sat, 27 Jan 2024, Linus Walleij wrote:
> Use sg_miter iterator instead of sg_virt() and custom code
> to loop over the scatterlist. The memory iterator will do
> bounce buffering if the page happens to be located in high memory,
> which the driver may or may not be using.
>
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Link: https://lore.kernel.org/linux-mmc/20240122073423.GA25859@lst.de/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for your patch, which is now commit 27b57277d9ba3a90 ("mmc:
sh_mmcif: Use sg_miter for PIO") in mmc/next.

I have bisected the following BUGs on R-Mobile APE6 (also seen on
R-Mobile A1 and SH-Mobile AG5) to this commit:

     sh_mobile_sdhi ee120000.mmc: mmc1 base at 0xee120000, max clock rate 12 MHz
     mmc2: new high speed MMC card at address 0001
     sh_mobile_sdhi ee100000.mmc: mmc0 base at 0xee100000, max clock rate 88 MHz
     mmcblk2: mmc2:0001 MMC08G 7.33 GiB
     BUG: sleeping function called from invalid context at kernel/workqueue.c:3347
     in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 35, name: irq/151-ee20000
     preempt_count: 1, expected: 0
     no locks held by irq/151-ee20000/35.
     CPU: 0 PID: 35 Comm: irq/151-ee20000 Not tainted 6.8.0-rc4-ape6evm-00017-g27b57277d9ba #491
     Hardware name: Generic R8A73A4 (Flattened Device Tree)
      unwind_backtrace from show_stack+0x10/0x14
      show_stack from dump_stack_lvl+0x68/0x90
      dump_stack_lvl from __might_resched+0x1ac/0x228
      __might_resched from __flush_work+0x20c/0x2e4
      __flush_work from __cancel_work_timer+0x118/0x198
      __cancel_work_timer from sh_mmcif_irqt+0x38/0x8f8
      sh_mmcif_irqt from irq_thread_fn+0x1c/0x58
      irq_thread_fn from irq_thread+0x10c/0x218
      irq_thread from kthread+0xf0/0x100
      kthread from ret_from_fork+0x14/0x28
     Exception stack(0xf0959fb0 to 0xf0959ff8)
     9fa0:                                     00000000 00000000 00000000 00000000
     9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
     9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
     BUG: scheduling while atomic: irq/151-ee20000/35/0x00000002
     no locks held by irq/151-ee20000/35.
     CPU: 0 PID: 35 Comm: irq/151-ee20000 Tainted: G        W          6.8.0-rc4-ape6evm-00017-g27b57277d9ba #491
     Hardware name: Generic R8A73A4 (Flattened Device Tree)
      unwind_backtrace from show_stack+0x10/0x14
      show_stack from dump_stack_lvl+0x68/0x90
      dump_stack_lvl from __schedule_bug+0x5c/0x7c
      __schedule_bug from __schedule+0xa0/0x9bc
      __schedule from schedule+0x64/0x94
      schedule from irq_thread+0x1dc/0x218
      irq_thread from kthread+0xf0/0x100
      kthread from ret_from_fork+0x14/0x28
     Exception stack(0xf0959fb0 to 0xf0959ff8)
     9fa0:                                     00000000 00000000 00000000 00000000
     9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
     9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
     sh_mmcif ee200000.mmc: Timeout waiting for 2 on CMD18

Reverting this commit fixes the issue.

> --- a/drivers/mmc/host/sh_mmcif.c
> +++ b/drivers/mmc/host/sh_mmcif.c
> @@ -227,14 +227,12 @@ struct sh_mmcif_host {
> 	bool dying;
> 	long timeout;
> 	void __iomem *addr;
> -	u32 *pio_ptr;
> 	spinlock_t lock;		/* protect sh_mmcif_host::state */
> 	enum sh_mmcif_state state;
> 	enum sh_mmcif_wait_for wait_for;
> 	struct delayed_work timeout_work;
> 	size_t blocksize;
> -	int sg_idx;
> -	int sg_blkidx;
> +	struct sg_mapping_iter sg_miter;
> 	bool power;
> 	bool ccs_enable;		/* Command Completion Signal support */
> 	bool clk_ctrl2_enable;
> @@ -600,32 +598,17 @@ static int sh_mmcif_error_manage(struct sh_mmcif_host *host)
> 	return ret;
> }
>
> -static bool sh_mmcif_next_block(struct sh_mmcif_host *host, u32 *p)
> -{
> -	struct mmc_data *data = host->mrq->data;
> -
> -	host->sg_blkidx += host->blocksize;
> -
> -	/* data->sg->length must be a multiple of host->blocksize? */
> -	BUG_ON(host->sg_blkidx > data->sg->length);
> -
> -	if (host->sg_blkidx == data->sg->length) {
> -		host->sg_blkidx = 0;
> -		if (++host->sg_idx < data->sg_len)
> -			host->pio_ptr = sg_virt(++data->sg);
> -	} else {
> -		host->pio_ptr = p;
> -	}
> -
> -	return host->sg_idx != data->sg_len;
> -}
> -
> static void sh_mmcif_single_read(struct sh_mmcif_host *host,
> 				 struct mmc_request *mrq)
> {
> +	struct mmc_data *data = mrq->data;
> +
> 	host->blocksize = (sh_mmcif_readl(host->addr, MMCIF_CE_BLOCK_SET) &
> 			   BLOCK_SIZE_MASK) + 3;
>
> +	sg_miter_start(&host->sg_miter, data->sg, data->sg_len,
> +		       SG_MITER_ATOMIC | SG_MITER_TO_SG);
> +
> 	host->wait_for = MMCIF_WAIT_FOR_READ;
>
> 	/* buf read enable */
> @@ -634,20 +617,32 @@ static void sh_mmcif_single_read(struct sh_mmcif_host *host,
>
> static bool sh_mmcif_read_block(struct sh_mmcif_host *host)
> {
> +	struct sg_mapping_iter *sgm = &host->sg_miter;
> 	struct device *dev = sh_mmcif_host_to_dev(host);
> 	struct mmc_data *data = host->mrq->data;
> -	u32 *p = sg_virt(data->sg);
> +	u32 *p;
> 	int i;
>
> 	if (host->sd_error) {
> +		sg_miter_stop(sgm);
> 		data->error = sh_mmcif_error_manage(host);
> 		dev_dbg(dev, "%s(): %d\n", __func__, data->error);
> 		return false;
> 	}
>
> +	if (!sg_miter_next(sgm)) {
> +		/* This should not happen on single blocks */
> +		sg_miter_stop(sgm);
> +		return false;
> +	}
> +
> +	p = sgm->addr;
> +
> 	for (i = 0; i < host->blocksize / 4; i++)
> 		*p++ = sh_mmcif_readl(host->addr, MMCIF_CE_DATA);
>
> +	sg_miter_stop(&host->sg_miter);
> +
> 	/* buffer read end */
> 	sh_mmcif_bitset(host, MMCIF_CE_INT_MASK, MASK_MBUFRE);
> 	host->wait_for = MMCIF_WAIT_FOR_READ_END;
> @@ -666,34 +661,40 @@ static void sh_mmcif_multi_read(struct sh_mmcif_host *host,
> 	host->blocksize = sh_mmcif_readl(host->addr, MMCIF_CE_BLOCK_SET) &
> 		BLOCK_SIZE_MASK;
>
> +	sg_miter_start(&host->sg_miter, data->sg, data->sg_len,
> +		       SG_MITER_ATOMIC | SG_MITER_TO_SG);
> +
> 	host->wait_for = MMCIF_WAIT_FOR_MREAD;
> -	host->sg_idx = 0;
> -	host->sg_blkidx = 0;
> -	host->pio_ptr = sg_virt(data->sg);
>
> 	sh_mmcif_bitset(host, MMCIF_CE_INT_MASK, MASK_MBUFREN);
> }
>
> static bool sh_mmcif_mread_block(struct sh_mmcif_host *host)
> {
> +	struct sg_mapping_iter *sgm = &host->sg_miter;
> 	struct device *dev = sh_mmcif_host_to_dev(host);
> 	struct mmc_data *data = host->mrq->data;
> -	u32 *p = host->pio_ptr;
> +	u32 *p;
> 	int i;
>
> 	if (host->sd_error) {
> +		sg_miter_stop(sgm);
> 		data->error = sh_mmcif_error_manage(host);
> 		dev_dbg(dev, "%s(): %d\n", __func__, data->error);
> 		return false;
> 	}
>
> -	BUG_ON(!data->sg->length);
> +	if (!sg_miter_next(sgm)) {
> +		sg_miter_stop(sgm);
> +		return false;
> +	}
> +
> +	p = sgm->addr;
>
> 	for (i = 0; i < host->blocksize / 4; i++)
> 		*p++ = sh_mmcif_readl(host->addr, MMCIF_CE_DATA);
>
> -	if (!sh_mmcif_next_block(host, p))
> -		return false;
> +	sgm->consumed = host->blocksize;
>
> 	sh_mmcif_bitset(host, MMCIF_CE_INT_MASK, MASK_MBUFREN);
>
> @@ -703,9 +704,14 @@ static bool sh_mmcif_mread_block(struct sh_mmcif_host *host)
> static void sh_mmcif_single_write(struct sh_mmcif_host *host,
> 					struct mmc_request *mrq)
> {
> +	struct mmc_data *data = mrq->data;
> +
> 	host->blocksize = (sh_mmcif_readl(host->addr, MMCIF_CE_BLOCK_SET) &
> 			   BLOCK_SIZE_MASK) + 3;
>
> +	sg_miter_start(&host->sg_miter, data->sg, data->sg_len,
> +		       SG_MITER_ATOMIC | SG_MITER_FROM_SG);
> +
> 	host->wait_for = MMCIF_WAIT_FOR_WRITE;
>
> 	/* buf write enable */
> @@ -714,20 +720,32 @@ static void sh_mmcif_single_write(struct sh_mmcif_host *host,
>
> static bool sh_mmcif_write_block(struct sh_mmcif_host *host)
> {
> +	struct sg_mapping_iter *sgm = &host->sg_miter;
> 	struct device *dev = sh_mmcif_host_to_dev(host);
> 	struct mmc_data *data = host->mrq->data;
> -	u32 *p = sg_virt(data->sg);
> +	u32 *p;
> 	int i;
>
> 	if (host->sd_error) {
> +		sg_miter_stop(sgm);
> 		data->error = sh_mmcif_error_manage(host);
> 		dev_dbg(dev, "%s(): %d\n", __func__, data->error);
> 		return false;
> 	}
>
> +	if (!sg_miter_next(sgm)) {
> +		/* This should not happen on single blocks */
> +		sg_miter_stop(sgm);
> +		return false;
> +	}
> +
> +	p = sgm->addr;
> +
> 	for (i = 0; i < host->blocksize / 4; i++)
> 		sh_mmcif_writel(host->addr, MMCIF_CE_DATA, *p++);
>
> +	sg_miter_stop(&host->sg_miter);
> +
> 	/* buffer write end */
> 	sh_mmcif_bitset(host, MMCIF_CE_INT_MASK, MASK_MDTRANE);
> 	host->wait_for = MMCIF_WAIT_FOR_WRITE_END;
> @@ -746,34 +764,40 @@ static void sh_mmcif_multi_write(struct sh_mmcif_host *host,
> 	host->blocksize = sh_mmcif_readl(host->addr, MMCIF_CE_BLOCK_SET) &
> 		BLOCK_SIZE_MASK;
>
> +	sg_miter_start(&host->sg_miter, data->sg, data->sg_len,
> +		       SG_MITER_ATOMIC | SG_MITER_FROM_SG);
> +
> 	host->wait_for = MMCIF_WAIT_FOR_MWRITE;
> -	host->sg_idx = 0;
> -	host->sg_blkidx = 0;
> -	host->pio_ptr = sg_virt(data->sg);
>
> 	sh_mmcif_bitset(host, MMCIF_CE_INT_MASK, MASK_MBUFWEN);
> }
>
> static bool sh_mmcif_mwrite_block(struct sh_mmcif_host *host)
> {
> +	struct sg_mapping_iter *sgm = &host->sg_miter;
> 	struct device *dev = sh_mmcif_host_to_dev(host);
> 	struct mmc_data *data = host->mrq->data;
> -	u32 *p = host->pio_ptr;
> +	u32 *p;
> 	int i;
>
> 	if (host->sd_error) {
> +		sg_miter_stop(sgm);
> 		data->error = sh_mmcif_error_manage(host);
> 		dev_dbg(dev, "%s(): %d\n", __func__, data->error);
> 		return false;
> 	}
>
> -	BUG_ON(!data->sg->length);
> +	if (!sg_miter_next(sgm)) {
> +		sg_miter_stop(sgm);
> +		return false;
> +	}
> +
> +	p = sgm->addr;
>
> 	for (i = 0; i < host->blocksize / 4; i++)
> 		sh_mmcif_writel(host->addr, MMCIF_CE_DATA, *p++);
>
> -	if (!sh_mmcif_next_block(host, p))
> -		return false;
> +	sgm->consumed = host->blocksize;
>
> 	sh_mmcif_bitset(host, MMCIF_CE_INT_MASK, MASK_MBUFWEN);
>

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds

