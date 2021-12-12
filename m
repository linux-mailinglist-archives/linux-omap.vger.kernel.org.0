Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D90474719C8
	for <lists+linux-omap@lfdr.de>; Sun, 12 Dec 2021 12:26:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbhLLL0E (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 12 Dec 2021 06:26:04 -0500
Received: from mail.wizzup.org ([95.217.97.174]:43876 "EHLO wizzup.org"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230156AbhLLL0E (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 12 Dec 2021 06:26:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=wizzup.org;
        s=mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:
        Date:Message-ID:Subject:References:Cc:To:From:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=ogX/nbkE3UJ3k2EGSC+RFd9Wcr19eYwvCtI4ELK5jCY=; b=hChW/hDD7GfTntDLM57CtxSJB+
        1Z2DnSsSb6JeW0fJgY1xFz7YILHNIN6xXsUjSNbPd6dKAkKXrzquWAvt9FPNv8XDDuFdG/2Yy4xXR
        jLGS91QDnJ/IoXohTUouB9WbRIj8xWCaCQnekPZKhCr+1J98gRt85v/Af3JmpeolR8zzW+724oc1Z
        J7bws4slZZkIIbYX8UppQodJ4AiHZK8vzJ3Zys016PBlQYI5n3EoBJ9zcb+dy8msQbf/kv610dTSa
        AHfvQBvC1n6w389Uwy+cnPepXcg2ZfS8v6POh/RHFVdm7eVhTKoCjW2isJCFuFNd35uD3a2O9emPY
        G38TM9zg==;
Received: from [45.83.235.159] (helo=[0.0.0.0])
        by wizzup.org with esmtpsa  (TLS1.3) tls TLS_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <merlijn@wizzup.org>)
        id 1mwMz6-0001UN-6U; Sun, 12 Dec 2021 11:25:40 +0000
From:   Merlijn Wajer <merlijn@wizzup.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Sebastian Reichel <sre@kernel.org>, zhangqilong3@huawei.com,
        jingxiangfeng@huawei.com, Tony Lindgren <tony@atomide.com>,
        Dev Null <devnull@uvos.xyz>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
References: <4ed95c71-2066-6b4c-ad1b-53ef02d79d53@wizzup.org>
 <20211208210706.GB12125@duo.ucw.cz>
 <5780923a-315d-d65e-6bcf-ef2a5a3002bc@wizzup.org>
Subject: Re: Oops in ssi (through nokia-modem)
Message-ID: <865c5758-fc18-7abe-2fa1-cf3b16e827f8@wizzup.org>
Date:   Sun, 12 Dec 2021 12:31:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5780923a-315d-d65e-6bcf-ef2a5a3002bc@wizzup.org>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian, Pavel,

On 12/12/2021 02:26, Merlijn Wajer wrote:

> <snip>
> 
> So it sounds like setting the dev->dma_mask in the driver is the right
> fix, as Pavel suggested. The commit returns an error when the mask is
> NULL and that is probably what causes the oops later on. I'll try look
> at fixing this soon, unless someone beats me to it. I suppose we'll want
> this potential fix in the stable trees as well.

Looking at this again I wonder if DMA just wasn't working already.
Reverting commit f959dcd6ddfd29235030e8026471ac1b022ad2b0 /
4e57482e8440fac7137832629109730ea4b267aa ("dma-direct: Fix potential
NULL pointer dereference") just makes the ssi driver fall back to pio
calls, as far as I can tell, and perhaps the dma_capable change of the
commit causes ssi to now actually use DMA, which fails.

I've tried to set the dma mask in ssi_start_dma but all that goes is rid
of the first warning:

> diff --git a/drivers/hsi/controllers/omap_ssi_port.c b/drivers/hsi/controllers/omap_ssi_port.c
> index a0cb5be246e1..db2df77d79f6 100644
> --- a/drivers/hsi/controllers/omap_ssi_port.c
> +++ b/drivers/hsi/controllers/omap_ssi_port.c
> @@ -227,6 +227,8 @@ static int ssi_start_dma(struct hsi_msg *msg, int lch)
>                 return -EREMOTEIO;
>         }
> 
> +       dma_set_mask_and_coherent(&ssi->device, DMA_BIT_MASK(32));

All the other problems remain (no one cared about the irq and NULL
pointer). Perhaps some IRQ is not set up for DMA completion (just
guessing here?)

However, looking at the omap3-n900.dts it looks to me that the ssi_pins
definition suggests that it should use pio, rather than DMA.

Does either of you recall if DMA was ever used on the N900, or does the
offending commit just cause DMA to be used by accident?

Regards,
Merlijn
