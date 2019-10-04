Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26862CB87A
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 12:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729834AbfJDKjM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 06:39:12 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:46487 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729319AbfJDKjM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Oct 2019 06:39:12 -0400
Received: by mail-io1-f67.google.com with SMTP id c6so12344806ioo.13;
        Fri, 04 Oct 2019 03:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=qZkq2IFXpYdFUAnRVtV16PjDv6kvLyNtOPmSknMDol4=;
        b=Mp2DLOFOq3R1RI5KaWj39fc1oBw6TxRdIvXzsQ0B0fhH/lbeuSRNfiJKbUfuQrK7WH
         5luCH418ZMKmk7qe9lJvudy6XbTFEhj7D24H5TAsxvrxV9kq6YvyOUFFCSEJQTbWr3i8
         QbzrQTlwPeXbbkREqQ7/g37cQ9U+TPxmI3kcGQT/HFPvRsiNQp9ok+J4fvOV22K0oTHf
         C/vE9TMqxqjz4qzKwM6517/YXKAE3/+7CqG9BLlzpl2DT3ffDBl1/2aEBm4lH4gaAnhp
         ZIKW5V7EqoetyfZ4eF1VqmLidThv1DLK79zUP3ikQRTs7AIT8W8LGkyER9YzZvO9u2Ry
         k1xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=qZkq2IFXpYdFUAnRVtV16PjDv6kvLyNtOPmSknMDol4=;
        b=Wdl7ISq4J9kwt1hnhdu44b95oUsN/aRLoCE4u2NelaYpbJHncV/8wObUCCVgTYjurt
         umNwNvKUwQ+JoFuJziyzHcl94u7WYFOEZS79wl3HgwyxsJPF/0nRM+1vbofGMWuqqPW4
         vIjWeHNS46HOn4wGklGTKBv76hmr2GkTNaK6VY8gLfzwEQymIhqooOn+j97i6GI14Zb6
         RXd/DxScQkPz93xSlbVroSq68k7MokDfvNR/e6BOdv8RG1kyqk/IOaRCSNNvAadbZwpo
         dTVuR4UVR63Rty6KSWlLUdpswS7NZVMd1OnxEEtdT4/DGEib0qtR2D0fMfUZ4ZX0TCP9
         sNPw==
X-Gm-Message-State: APjAAAXO8ZW3xS4aN513bkWf4o4nb4YuqvNBKkmmZXrRi+Y8Z6/LFTV8
        MsAM73gAGizBUQnct+kfRkHe4/0DDEcDjczpGSM=
X-Google-Smtp-Source: APXvYqz+Xj/q8hbRyOg8+71Aa+R2dm9DnYdbORf3IizXzCYBaNRlGKcl0yuGyJeYNFdYvisEVnWOazRJtqbNoFnP1I0=
X-Received: by 2002:a02:65cd:: with SMTP id u196mr13949946jab.3.1570185550237;
 Fri, 04 Oct 2019 03:39:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xLO5VgA6tW4p7QjwPv_QXv==zbC38TxXtsR5x9H0mUGJA@mail.gmail.com>
In-Reply-To: <CAHCN7xLO5VgA6tW4p7QjwPv_QXv==zbC38TxXtsR5x9H0mUGJA@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 4 Oct 2019 05:38:59 -0500
Message-ID: <CAHCN7xJPv7W381R7LS4bB8xWWpugz2NwbTUtj-hqHnDBZ9MFzA@mail.gmail.com>
Subject: Re: DM3730 Bluetooth Performance differences between SERIAL_8250_OMAP
 vs SERIAL_OMAP
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 4, 2019 at 5:02 AM Adam Ford <aford173@gmail.com> wrote:
>
> I am running Kernel 5.3.2 trying to troubleshoot some intermittent
> Bluetooth issues, and I think I have narrowed it down to the serial
> driver in use.

I should have also noted that it's using UART2 with CTS and RTS on the
DM3730 (omap3630) and its configured with a baud rate of 3M.
I tried slowing it to 115200, but that didn't help.  I tried disabling
the DMA hooks from the device tree, and that didn't help.

> By default, omap2plus_defconfig enables both SERIAL_8250_OMAP and
> SERIAL_OMAP.  I have my console device configured as  ttyS0, and all
> appears fine.  When I enable Bluetooth, however, I get intermittent
> errors on an DM3730 / OMAP3630.
>
> Using the 8250 driver for Blueotooth I get intermittent frame errors
> and data loss.
>
> Scanning ...
> [   28.482452] Bluetooth: hci0: Frame reassembly failed (-84)
> [   36.162170] Bluetooth: hci0: Frame reassembly failed (-84)
>         F4:4E:FC:C9:2F:57       BluJax
> # l2ping F4:4E:FC:C9:2F:57
> Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
> 44 bytes from F4:4E:FC:C9:2F:57 id 0 time 8.27ms
> no response from F4:4E:FC:C9:2F:57: id 1
> ^C2 sent, 1 received, 50% loss
>
> (after a fairly long hang, I hit control-c)
>
> However, disabling the 8250 driver and using the only SERIAL_OMAP and
> the console routed to ttyO0, the Bluetooth works well, so I believe it
> to be a serial driver issue and not a Bluetooth error.
>
> # hcitool scan
> Scanning ...
>         F4:4E:FC:C9:2F:57       BluJax
> ^C
> # l2ping F4:4E:FC:C9:2F:57
> Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
> 44 bytes from F4:4E:FC:C9:2F:57 id 0 time 6.90ms
> ...
> 44 bytes from F4:4E:FC:C9:2F:57 id 14 time 28.29ms
> ^C15 sent, 15 received, 0% loss
> #
>
> 0% loss and regular, repeatable communication without any Frame
> reassembly errors.
>

I tried disabling SERIAL_OMAP and using only SERIAL_8250_OMAP, but
that didn't help.  Because the issue goes away when I disable
SERIAL_8250_OMAP, I am wondering if something is either being
misconfigured or some IRQ or DMA integration is missing that may be
present with the older SERIAL_OMAP driver.

> Any suggestions on how to troubleshoot or what might cause the
> difference between the two drivers?
>
> adam
