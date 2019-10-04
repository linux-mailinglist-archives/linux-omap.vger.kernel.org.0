Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BBFDCBCAD
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 16:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388855AbfJDOI0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 10:08:26 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:37717 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388376AbfJDOI0 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Oct 2019 10:08:26 -0400
Received: by mail-io1-f68.google.com with SMTP id b19so13835226iob.4;
        Fri, 04 Oct 2019 07:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uzkPOSU8Ouy39k0YoAh95vN8AhycLXhvB11rMhtKOIM=;
        b=AFdIlwJwAD2j5XHSFHy3ujkkvS/1K3NuIMCGTa3fD289v+ILUxoHsOeYW3r63dJOls
         eOZKDqnkHIVsSoMvWeiGuQqOcI4pIo6Af1FqdZjdg8O8Ny9xhBLDFZ76We0cCSEsSGCF
         pKUBeEhL615SRK/WXnb36Z3j2jSRUAl97PbiVa5olzxBkoL9ciAl+jyitSkNSoWVLUpP
         8ILAOLsNNd6+19ke/+ybk9VQQg5WArK+Meuk+jbTRI4Dapukdpfi6HYZWfCfIuhvx1eQ
         udsh3wR6prAO4o3OHKSb0O0xVlfAT291pMY6pzV3MXUpTA9DkLG6BJTXlGefw3pAuQee
         Rsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uzkPOSU8Ouy39k0YoAh95vN8AhycLXhvB11rMhtKOIM=;
        b=BtVHA6s6NAN4sFZHTb04axB+oyMU715UV8UR+hi3FrNiEJ42tMSlrhe8ofAFvDqR9M
         Zwtqs3GcrAMBsG35LY5sBPaJquALTqtBkv0tsXvZLjcLmKDibVlCC9PWT4/EbnvN4uEH
         mJP6Hzrdg13zzuHrYT1pbTwmdfRbppJM7zHmIZY+Qm5BZlgLnoMoC9JwuyqZlNV05m2p
         rE1LuKmfK5bu7erP6eVD4YdRVOsuEraDsAGDickAxBSwXXpWioxQd+0kVKIblvct9EtV
         wMltunJ3cYWY8eQOCEjItAvp8wlFO6V2QpHRkjT4/ltHAgFrTI5CvLedVaB0GphLJDGF
         4Wsg==
X-Gm-Message-State: APjAAAWWY3ULbanfWJLv1BV7Q+ppAB1QZRKPUMNmv48Oqoe4Ua0yyGV/
        SNMv+vV1s60WFV6trtwWn2b9DvTaCAuKfq/PbBc=
X-Google-Smtp-Source: APXvYqzWggmyOwesjFCEmzm0yxrC3gofPGGTaE+Fi3c088hl3DPsXtlVILDI/J3lL//9OdwOHnA094RdIjrwy6Rszek=
X-Received: by 2002:a92:d84d:: with SMTP id h13mr15901954ilq.205.1570198104548;
 Fri, 04 Oct 2019 07:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xLO5VgA6tW4p7QjwPv_QXv==zbC38TxXtsR5x9H0mUGJA@mail.gmail.com>
 <CAHCN7xJPv7W381R7LS4bB8xWWpugz2NwbTUtj-hqHnDBZ9MFzA@mail.gmail.com> <CAGm1_kv6RMUDppu6ZjY9Dq7QL=hS=D+e3KS37+V0ncbwoXE6mQ@mail.gmail.com>
In-Reply-To: <CAGm1_kv6RMUDppu6ZjY9Dq7QL=hS=D+e3KS37+V0ncbwoXE6mQ@mail.gmail.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Fri, 4 Oct 2019 09:08:13 -0500
Message-ID: <CAHCN7xKsGz4UA4gfM5jpS9UE-V7_k265G_hB=wQ5Ueh3T5kaNQ@mail.gmail.com>
Subject: Re: DM3730 Bluetooth Performance differences between SERIAL_8250_OMAP
 vs SERIAL_OMAP
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>, linux-serial@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Vignesh R <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 4, 2019 at 7:27 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> Hi Adam,
>
> On Fri, Oct 4, 2019 at 12:39 PM Adam Ford <aford173@gmail.com> wrote:
> >
> > On Fri, Oct 4, 2019 at 5:02 AM Adam Ford <aford173@gmail.com> wrote:
> > >
> > > I am running Kernel 5.3.2 trying to troubleshoot some intermittent
> > > Bluetooth issues, and I think I have narrowed it down to the serial
> > > driver in use.
> >
> > I should have also noted that it's using UART2 with CTS and RTS on the
> > DM3730 (omap3630) and its configured with a baud rate of 3M.
> > I tried slowing it to 115200, but that didn't help.  I tried disabling
> > the DMA hooks from the device tree, and that didn't help.
> >
> > > By default, omap2plus_defconfig enables both SERIAL_8250_OMAP and
> > > SERIAL_OMAP.  I have my console device configured as  ttyS0, and all
> > > appears fine.  When I enable Bluetooth, however, I get intermittent
> > > errors on an DM3730 / OMAP3630.
> > >
> > > Using the 8250 driver for Blueotooth I get intermittent frame errors
> > > and data loss.
> > >
> > > Scanning ...
> > > [   28.482452] Bluetooth: hci0: Frame reassembly failed (-84)
> > > [   36.162170] Bluetooth: hci0: Frame reassembly failed (-84)
> > >         F4:4E:FC:C9:2F:57       BluJax
> > > # l2ping F4:4E:FC:C9:2F:57
> > > Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
> > > 44 bytes from F4:4E:FC:C9:2F:57 id 0 time 8.27ms
> > > no response from F4:4E:FC:C9:2F:57: id 1
> > > ^C2 sent, 1 received, 50% loss
> > >
> > > (after a fairly long hang, I hit control-c)
> > >
> > > However, disabling the 8250 driver and using the only SERIAL_OMAP and
> > > the console routed to ttyO0, the Bluetooth works well, so I believe it
> > > to be a serial driver issue and not a Bluetooth error.
> > >
> > > # hcitool scan
> > > Scanning ...
> > >         F4:4E:FC:C9:2F:57       BluJax
> > > ^C
> > > # l2ping F4:4E:FC:C9:2F:57
> > > Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
> > > 44 bytes from F4:4E:FC:C9:2F:57 id 0 time 6.90ms
> > > ...
> > > 44 bytes from F4:4E:FC:C9:2F:57 id 14 time 28.29ms
> > > ^C15 sent, 15 received, 0% loss
> > > #
> > >
> > > 0% loss and regular, repeatable communication without any Frame
> > > reassembly errors.
> > >
> >
> > I tried disabling SERIAL_OMAP and using only SERIAL_8250_OMAP, but
> > that didn't help.  Because the issue goes away when I disable
> > SERIAL_8250_OMAP, I am wondering if something is either being
> > misconfigured or some IRQ or DMA integration is missing that may be
> > present with the older SERIAL_OMAP driver.
> >
> > > Any suggestions on how to troubleshoot or what might cause the
> > > difference between the two drivers?
>
> Can it be related to this issue [1]? Can you confirm that 5.2 is
> working as expected with the 8250 driver?
>
> [1] https://marc.info/?l=linux-serial&m=156965039008649&w=2

I reverted the whole 8250 directory to d99482673f95 ("serial:
mctrl_gpio: Check if GPIO property exisits before requesting it") and
it is somewhat better, but it's not as good as the stock OMAP serial
driver.  I get some frame errors and eventually, I get some timeouts,
but it's not as bad.  I'll try to implement the RTS and CTS as gpio
pins and change the device tree accordingly.  It might shed some light
on the situation.

adam
>
> Cheers,
> Yegor
