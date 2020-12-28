Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57DE62E6A3E
	for <lists+linux-omap@lfdr.de>; Mon, 28 Dec 2020 20:05:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728746AbgL1TDU (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Dec 2020 14:03:20 -0500
Received: from server28.superhosting.bg ([217.174.156.11]:35714 "EHLO
        server28.superhosting.bg" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726420AbgL1TDU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Dec 2020 14:03:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dinux.eu;
         s=default; h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
        In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=I+BVKutBGfYuGWfwlRR3mXcKmqAQToGgmmhYigRys+Y=; b=Uj5rzlgiz0vQvIe9TKPmzZGSRw
        9cr0cjSZDhhp5LrFJ4zQ7pYQmJHEtNmkA5nyzSg+L89PTCzMxlMTrpLQA28o+5d4T+Cg4PGAtkKgU
        K6SYQO2jPbO2wz0Nux3XfZnkV2rwbu4jy4mGrHoZ+yYuInLwvq58ZwcfXCdqaBFTcs/irX7cDrIRF
        82V6n/N1ENLWqYbToksvZL4ZJ7uEGwCHfkk2hxuaYZCS/T3qGqX7HHGQFQ29aBuzUDN6GrNUzhJEm
        kjvJyV4T49R46dru211ki0u9tGULbdkSYJ6XPgOJjv8mXplgxUkZA76bSEKohNPKyq1B8obyFS9l5
        mLuTrgIQ==;
Received: from [95.87.234.74] (port=50422 helo=tpdeb.localnet)
        by server28.superhosting.bg with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <dimitar@dinux.eu>)
        id 1ktxmp-0001k9-7A; Mon, 28 Dec 2020 21:02:33 +0200
From:   Dimitar Dimitrov <dimitar@dinux.eu>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     ohad@wizery.com, Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        Suman Anna <s-anna@ti.com>
Subject: Re: [PATCH] remoteproc: pru: Fix loading of GNU Binutils ELF
Date:   Mon, 28 Dec 2020 21:02:30 +0200
Message-ID: <12787202.XeUNL8V5Kl@tpdeb>
In-Reply-To: <X+oZxcgHLlInB3c2@builder.lan>
References: <20201228074933.22675-1-dimitar@dinux.eu> <X+oZxcgHLlInB3c2@builder.lan>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-OutGoing-Spam-Status: No, score=-0.2
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server28.superhosting.bg
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - dinux.eu
X-Get-Message-Sender-Via: server28.superhosting.bg: authenticated_id: dimitar@dinux.eu
X-Authenticated-Sender: server28.superhosting.bg: dimitar@dinux.eu
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 28 Dec 2020 19:45:41 EET Bjorn Andersson wrote:
> On Mon 28 Dec 01:49 CST 2020, Dimitar Dimitrov wrote:
> > PRU port of GNU Binutils lacks support for separate address spaces.
> > PRU IRAM addresses are marked with artificial offset to differentiate
> > them from DRAM addresses. Hence remoteproc must mask IRAM addresses
> > coming from GNU ELF in order to get the true hardware address.
> > 
> > Patch was tested on top of latest linux-remoteproc/for-next branch:
> >   commit 4c0943255805 ("Merge branches 'hwspinlock-next', 'rpmsg-next' and
> >   'rproc-next' into for-next")'> 
> > PRU firmware used for testing was the example in:
> >   https://github.com/dinuxbg/pru-gcc-examples/tree/master/blinking-led/pru
> > 
> > Signed-off-by: Dimitar Dimitrov <dimitar@dinux.eu>
> > ---
> > 
> >  drivers/remoteproc/pru_rproc.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> > 
> > diff --git a/drivers/remoteproc/pru_rproc.c
> > b/drivers/remoteproc/pru_rproc.c index 2667919d76b3..b03114bbb9ab 100644
> > --- a/drivers/remoteproc/pru_rproc.c
> > +++ b/drivers/remoteproc/pru_rproc.c
> > @@ -61,6 +61,18 @@
> > 
> >  #define PRU_SDRAM_DA	0x2000	/* Secondary Data RAM */
> >  #define PRU_SHRDRAM_DA	0x10000 /* Shared Data RAM */
> > 
> > +/*
> > + * GNU binutils do not support multiple address spaces. The GNU linker's
> > + * default linker script places IRAM at an arbitrary high offset, in
> > order
> > + * to differentiate it from DRAM. Hence we need to strip the artificial
> > offset + * in the IRAM addresses coming from the ELF file.
> > + *
> > + * The TI proprietary linker would never set those higher IRAM address
> > bits + * anyway. PRU architecture limits the program counter to 16 bit
> > word + * addresses.
> > + */
> > +#define PRU_IRAM_DA_MASK	0xfffff
> 
> If the limit is 16 bits, why is your mask 20 bits?
The 16-bit word-address range specified by PRU architecture corresponds to 18-
bit byte-address range in ELF.

I added two more bits just in case TI decides to implement banking to expand 
the IRAM in future SoCs.

I'll put this clarification in the comment.

> 
> > +
> > 
> >  #define MAX_PRU_SYS_EVENTS 160
> >  
> >  /**
> > 
> > @@ -450,6 +462,8 @@ static void *pru_i_da_to_va(struct pru_rproc *pru, u32
> > da, size_t len)> 
> >  	if (len == 0)
> >  	
> >  		return NULL;
> 
> Given that the comment explains this operation I think it would be
> better to place it here. And if the masking directly follows what's
> described in the comment you don't need a define for the mask.
Will do.

Thanks,
Dimitar


