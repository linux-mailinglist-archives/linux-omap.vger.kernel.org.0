Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 23A2E106938
	for <lists+linux-omap@lfdr.de>; Fri, 22 Nov 2019 10:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726500AbfKVJsq (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 22 Nov 2019 04:48:46 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:38219 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKVJsq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 22 Nov 2019 04:48:46 -0500
Received: by mail-ot1-f50.google.com with SMTP id z25so5656805oti.5
        for <linux-omap@vger.kernel.org>; Fri, 22 Nov 2019 01:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=f1v9W3nU88rBIrRGemKR25zE3Jyn/3s87PU+a5bhrOQ=;
        b=tW87O8fQkjgEO0VL2dWd0WrW8w4iBvVDa6qduX/A5L3qLhSv26jBeoaBrXv9QPGfTv
         TznO6nfYcor4oslkfWKs+yZxzruv1ehYLYzmrbnA4Y0nrLR6Wnp2i7GsVbnLbH/DHwQy
         GhbHzJSljxRv+tBUZ60phoqZ/zxSVazjjXlE6KMBZ92H77YeyAP3F8lxhdQEja42bl29
         5lISbBlOZTz3muTTeTAj9gT+/x3Y7uag5wR4ibxXrPw7Q3bTFWeykkRewVfWrkSFJ/pz
         cQR/XtUyTpHVKI9sYGV/DY1W4qsP1noJBTQ120QG2GVGTPhG0137hT5CY17RcifN74w5
         SbeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=f1v9W3nU88rBIrRGemKR25zE3Jyn/3s87PU+a5bhrOQ=;
        b=XLFzlucRFtyybRfqY6x4/KqxzJPytC2pW9SxgcHT1c6iWbCmbHeQjGMk6VPiREV3Bs
         JW2D0BQ1s1uAaqLXxgNvYA5XW8lZ5NdzS2i9iCiisHjqNmLDkNmpcoD9c2qSmqPiHls9
         +jm6yjHCx1Ugd73icDxfr8ncaP2SM/3fW3XStuchhg5hXhR7L1hQZkSzS8FeS6tdBWrx
         FA6qvPAWisHYm/wmukIF9OTX1Mt8H3q5B0OEusFngFxfqJ88rqfvC7Lr6LFMBC/VYWBj
         tsXwL67tpkvZGn6NkTjV1rxog7gIHrevS7/Tv2V1pOSgH+xBDdvAkM+aml19JDvg9IuJ
         oSPA==
X-Gm-Message-State: APjAAAWwGydINZV4MSMTd+mNJd5UGKIdbuIjLCAqg1sZNo2ZZr9Nfp9P
        U84iJUTlkD0LrAeCM7dm5DjlTKErWGZ2bmci4DRw9Q==
X-Google-Smtp-Source: APXvYqylBp5Yy3J0KG4bCJ06VTueX8Ml5gffUT3TVXZrHDNGLCT3WL7ET6McobF42Y97MLHeYsIFSijKxspM5Wg3tME=
X-Received: by 2002:a9d:6a81:: with SMTP id l1mr10332094otq.369.1574416125383;
 Fri, 22 Nov 2019 01:48:45 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a4a:2cc6:0:0:0:0:0 with HTTP; Fri, 22 Nov 2019 01:48:44
 -0800 (PST)
In-Reply-To: <20191121184421.GW35479@atomide.com>
References: <CAPm8-H5MWhpnTF88ZFWwfWqnVKFZ+LoKFVF+nVAdynz62cW18w@mail.gmail.com>
 <20191121184421.GW35479@atomide.com>
From:   Laurentiu-Cristian Duca <laurentiu.duca@gmail.com>
Date:   Fri, 22 Nov 2019 11:48:44 +0200
Message-ID: <CAPm8-H5vu4NpP1dFjE2=BrKZkx2jtJTSs_inF4JJLnA44sNYaQ@mail.gmail.com>
Subject: Re: omap4 mcspi interrupts do not appear
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony and friends,

On 11/21/19, Tony Lindgren <tony@atomide.com> wrote:
> * Laurentiu-Cristian Duca <laurentiu.duca@gmail.com> [191121 14:03]:
>> Hello linux-omap community,
>>
>>  I am an open source enthusiast and I am trying to modify
>> omap4 mcspi drivers in order to use interrupts instead of polling.
>> I use beaglebone black.
>>   After I set CS active and enable channel 0 and interrupts,
>> I receive only two interrupts (in fact a pair):
>> - tx0_empty and after this I fill the tx buffer by writing in the
>> mcspi tx reg n-times
>> and then reset the flag in IRQSTATUS
>> - as a follow up to the actions taken for tx0_empty,
>> rx0_full interrupt is risen and I read the mcspi rx reg n-times
>> and reset the flag in IRQSTATUS.
>> After that no interrupt comes (neither of tx_empty, rx_full or EOT)
>> even if interrupts and channel0 are enabled and CS is active,
>> so I can not transfer remaining data.
>>   FIFO is enabled and OMAP2_MCSPI_XFERLEVEL is setup accordingly to
>> transfer size.
>>   Note that if I want to transfer a message that needs only one pair
>> of interrupts,
>> then EOT interrupt comes, which is the expected behavior.
>>   If I use the polling method to see if something is pending on channel0
>> everything works well, but need to use interrupts
>> because I want to port this driver to Xenomai real-time linux.
>>   The dts for spi0 and spi1 is not changed.
>>
>>   Any ideas? Did anybody successfully used interrupts (not dma) on omap4
>> mcspi?
>
> Looks like I'm also seeing zero counts in /proc/interrupts for
> spi for my devices. My guess without looking at the code is that
> it currently does the transfers with dma and uses the dma interrupt
> and dma completion callback.

If transfer len is less than DMA_MIN_BYTES (160), dma is not used
and instead it is used omap2_mcspi_txrx_pio() which makes the transfer
by polling channel 0 for events.
I want to use interrupts instead of polling.
If I set CS active and enable channel 0, then in IRQSTATUS is raised
up TX0_EMPTY
and after interrupts are enabled, TX0_EMPTY interrupt will occur.
But if I reset the TX0_EMPTY bit in IRQSTATUS
(as the am335x manual says in chapter 24.3.4.1 Interrupt-driven operation:
The interrupt status bit should always be reset after the channel is
enabled and before the event is enabled as an interrupt source) then
no interrupts will occur even if interrupts are enabled.


>
> Maybe check am335x and omap4460 related errata pdf and see if
> it provides more clues?
>
> It could also be that the driver bails out wrongly somewhere
> if no dma is configured.
>
> Regards,
>
> Tony
>
