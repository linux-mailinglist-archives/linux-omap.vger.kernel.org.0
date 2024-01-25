Return-Path: <linux-omap+bounces-375-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DBD83C835
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 17:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5E3E91C24C7E
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 16:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4255B12FF8C;
	Thu, 25 Jan 2024 16:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="n4shag+V";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="aqPlbphJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665327CF13;
	Thu, 25 Jan 2024 16:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706200667; cv=none; b=LOQe9c5+gZEeAlj0IC4TK9/4kJpv79TA8PyT/dJyo5T0JaUlz/RoOxLnwwrzM9hXgZ0ABWtU3B2q9U3F9A7zryo5OriUDc1NPy6XFuQacb5nWzVbMpm7VSAiASVwTzDft7wTRUTN4dKPD+F7xB6Sjyqu7gSV7o3OlbvG2pMYqA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706200667; c=relaxed/simple;
	bh=8fOPIjHVb90c7CRguRNiFQ8VqTpSNg82Bt7oXHc10n0=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=ebE2BTSTA8I5rAJJnYKyMqsvugKh4gwMCsZ9lAEoiF6pjTzjXhRQt5Qq7bQF44EQbjCRZ49Psz8Ch+t08h1nb7RE5SUIb2WtmIChYW626y2LGcVN1ZABSnjWAxpqtmTlFwSMBoExEgtsK8/FspSfKySB8sxUUuWcODkMUo9pN+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=n4shag+V; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=aqPlbphJ; arc=none smtp.client-ip=64.147.123.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 825643200B08;
	Thu, 25 Jan 2024 11:37:43 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Thu, 25 Jan 2024 11:37:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1706200663; x=1706287063; bh=J5VRdZ5Wrh
	/dRaVmPUXcvh82GOraLIduVTWkeuUJFbU=; b=n4shag+VqaeUJhDNLSjR9TUSyX
	mAn9cxpCCuEPUB8eH+KvngqOdKK3ZLxDAcWhjJVM/BIqvYV1yz6Zf6bR+sCqMSVy
	syctT8VoIQoN+zN+1AOruKbw+qT/4Fw2odpQMK9Vlr4ZuMveDvch0ECoc+4bdv79
	U8UA/hCoGvhOyup7Wr48hfOayk3PLor9oA6jUoohmNCAJYPS2cUVhWyqr1KOCXqx
	Emhc70Xd9hHtn4SDQKV+F4bLj8VUbbxCzoz6jJs7JOfr6dCUG0AjeSbjjp5oKeeM
	pj0fvjX3u/oyuF7vjfC9ebLxY6tP5IiSb45wiPmYyuFo6Gey0wm+BBGM5zdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1706200663; x=1706287063; bh=J5VRdZ5Wrh/dRaVmPUXcvh82GOra
	LIduVTWkeuUJFbU=; b=aqPlbphJhWHMQjdedoU7ZRJmdXfsrAwXBis/SyhkSp65
	ZQ2BUcPfalbo9gr9jesOg0lj9fXNdtpKHFoP3ZiIqLEmLSql++srx0dhAijNlCss
	zVYG0KxKd2NMdWJi8b3w3D8YG/xYTdk+hqFPFUTQtKTvMHEQQF0w2gMRhs4fZOfj
	DGECoiF6RWVF/IhI7NNuJwRVEUC18IMUo5DQs7Z02+9V6a9vsbI9KySWuRBE4b9z
	X/Gfbyym5xkv7MhEmXS2tEJHU2EVwaaYknznio2l9hT0Z9fzi70UecbRJ9JUwK3n
	R6SMMe7owtNVXca/cV0et7cPpwnAfp7Hr8KiDlVE0A==
X-ME-Sender: <xms:Vo6yZbnam_W0ANRv1TjXGUm4qyL3EhHW59_aaqosk3LCt5j60FEiDQ>
    <xme:Vo6yZe1yYPLx_yuIF8pi3OOY3d_9tSvVK9PJsucgHVKXcUlHhshmnFd-YVunYN8Ns
    CI6MMC0mWFxKmHebpM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdelgedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:Vo6yZRo1LkrxEhYyI-DFbbbZdx8tb0IaMbP6sfg8DMN9W4LNTpXC3g>
    <xmx:Vo6yZTlkPd64S2eP45kt2cGe04z14oOCpLgHxGGLj9YqKweTkAAxFA>
    <xmx:Vo6yZZ2m_taDGKWkwSphpb2QbSVP29-mrypkTHprhs8aDzgfsPRP1Q>
    <xmx:V46yZTwFSM8_9HKXzg4FILbZoph0a1S964FLaUBsnEuTLsg53IIIfQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 65321B6008D; Thu, 25 Jan 2024 11:37:42 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-119-ga8b98d1bd8-fm-20240108.001-ga8b98d1b
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <7ca13324-ac47-4648-9b3c-c616de515625@app.fastmail.com>
In-Reply-To: <20240125-mmc-proper-kmap-v1-1-ba953c1ac3f9@linaro.org>
References: <20240125-mmc-proper-kmap-v1-0-ba953c1ac3f9@linaro.org>
 <20240125-mmc-proper-kmap-v1-1-ba953c1ac3f9@linaro.org>
Date: Thu, 25 Jan 2024 17:37:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Walleij" <linus.walleij@linaro.org>,
 "Christoph Hellwig" <hch@lst.de>, "Jens Axboe" <axboe@kernel.dk>,
 "Ming Lei" <ming.lei@redhat.com>, "Ulf Hansson" <ulf.hansson@linaro.org>,
 "Nicolas Pitre" <nico@fluxnic.net>, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "Angelo Dureghello" <angelo.dureghello@timesys.com>
Cc: "linux-mmc @ vger . kernel . org" <linux-mmc@vger.kernel.org>,
 linux-block@vger.kernel.org, Linux-OMAP <linux-omap@vger.kernel.org>
Subject: Re: [PATCH 1/7] mmc: davinci_mmc: Map the virtual page for PIO
Content-Type: text/plain

On Thu, Jan 25, 2024, at 15:37, Linus Walleij wrote:
> Use kmap_local_page() instead of sg_virt() to obtain a page
> from the scatterlist: sg_virt() will not perform bounce
> buffering if the page happens to be located in high memory,
> which the driver may or may not be using.
>
> Suggested-by: Christoph Hellwig <hch@lst.de>
> Link: https://lore.kernel.org/linux-mmc/20240122073423.GA25859@lst.de/
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/mmc/host/davinci_mmc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/davinci_mmc.c 
> b/drivers/mmc/host/davinci_mmc.c
> index ee3b1a4e0848..4e9f96b1caf3 100644
> --- a/drivers/mmc/host/davinci_mmc.c
> +++ b/drivers/mmc/host/davinci_mmc.c
> @@ -216,7 +216,7 @@ static irqreturn_t mmc_davinci_irq(int irq, void 
> *dev_id);
>  static void mmc_davinci_sg_to_buf(struct mmc_davinci_host *host)
>  {
>  	host->buffer_bytes_left = sg_dma_len(host->sg);
> -	host->buffer = sg_virt(host->sg);
> +	host->buffer = kmap_local_page(sg_page(host->sg));
>  	if (host->buffer_bytes_left > host->bytes_left)
>  		host->buffer_bytes_left = host->bytes_left;
>  }

I see multiple problems here:

 - you are missing the offset within the page, which you
   get by adding sg->offset

 - kmap_local_page() only maps one page at a time, so
   this will fail if the scatterlist entry spans one or
   more pages.

 - the first call to mmc_davinci_sg_to_buf() may happen
   in mmc_davinci_prepare_data(), while the rest is done
   in the interrupt handler, and you can't hold the
   kmap reference across multiple contexts

 - It looks like you are missing the unmap inside of
   loop when moving to the next sg element.

I think to do this properly, the driver would have to
use struct sg_mapping_iter like the cb710 driver does,
but the conversion is not as simple as your patch here.

       Arnd

