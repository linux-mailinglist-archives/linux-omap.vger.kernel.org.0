Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDDC28E438
	for <lists+linux-omap@lfdr.de>; Wed, 14 Oct 2020 18:18:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730558AbgJNQRy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 14 Oct 2020 12:17:54 -0400
Received: from Galois.linutronix.de ([193.142.43.55]:59646 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726105AbgJNQRy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 14 Oct 2020 12:17:54 -0400
From:   Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1602692271;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6vlX2JaF1sElgNB9gtOmRBeCz48vpsOYcg9B7pk8ung=;
        b=dwZNDaYtqbFlIeLo/Yn5Rqcmh0yEdi1FdWMJaT6EfMEHJmf3g1yR8U5x/0aLFF5XIWgYN0
        TIXpvxNERp0GLsjcQ/WTXF0VdQm3oPBQydyM1gRuFv1w1SjSetq2hfI5ADYAZpQ9xr0LXt
        QRkfUcIueIBYmVdqF3nlcpiGTHTWBfn5lZhH87bdi84KzNwWukAVqwmFmC2U9hVpmzk46s
        3Elon318GI6k+mup9gtdm0zhrQPnfLZXmcEAk0DwWNbaymmyWDTaEnf2fVtDUQf9MXRmTo
        9ptDFFWbkvf6NshGrgXgaYYA8yBsze9LgYnlKuE/fsckD73VpuLa+esnXHJJfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1602692271;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=6vlX2JaF1sElgNB9gtOmRBeCz48vpsOYcg9B7pk8ung=;
        b=Tlkepl20VtdWrbWqyNT+On+gqPKUipSXEXIZPPkpkNLVDnCvtu1PVZPN1Pf215uK2jnBXN
        lg8+SHLhHkPituAQ==
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Thomas Winischhofer <thomas@winischhofer.net>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, linux-omap@vger.kernel.org,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, Felipe Balbi <balbi@kernel.org>,
        Duncan Sands <duncan.sands@free.fr>
Subject: Re: [patch 03/12] USB: serial: keyspan_pda: Consolidate room query
In-Reply-To: <20201014161433.GB712494@rowland.harvard.edu>
References: <20201014145215.518912759@linutronix.de> <20201014145727.338773481@linutronix.de> <20201014161433.GB712494@rowland.harvard.edu>
Date:   Wed, 14 Oct 2020 18:17:51 +0200
Message-ID: <87ft6gbx3k.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Oct 14 2020 at 12:14, Alan Stern wrote:
> On Wed, Oct 14, 2020 at 04:52:18PM +0200, Thomas Gleixner wrote:
>> From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>> 
>> Having two copies of the same code doesn't make the code more readable and
>> allocating a buffer of 1 byte for a synchronous operation is a pointless
>> exercise.
>
> Not so.  In fact, it is required, because a portion of a structure 
> cannot be mapped for DMA unless it is aligned at a cache line boundary.
>
>> Add a byte buffer to struct keyspan_pda_private which can be used
>> instead. The buffer is only used in open() and tty->write().
>
> This won't work.

Ok.

>> +	res = usb_control_msg(serial->dev, usb_rcvctrlpipe(serial->dev, 0),
>> +			      6, /* write_room */
>> +			      USB_TYPE_VENDOR | USB_RECIP_INTERFACE | USB_DIR_IN,
>> +			      0, /* value */
>> +			      0, /* index */
>> +			      &priv->query_buf,
>> +			      1,
>> +			      2000);
>
> Instead, consider using the new usb_control_msg_recv() API.  But it 
> might be better to allocate the buffer once and for all.

Let me have a look.

Thanks,

        tglx
