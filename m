Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0E3DCBA62
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2019 14:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730313AbfJDM1z (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 4 Oct 2019 08:27:55 -0400
Received: from mail-ua1-f65.google.com ([209.85.222.65]:43697 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730606AbfJDM1x (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 4 Oct 2019 08:27:53 -0400
Received: by mail-ua1-f65.google.com with SMTP id k24so1962929uag.10;
        Fri, 04 Oct 2019 05:27:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wSaY7W6VdgweKOp9jTYZreYJLfH4I8nv1hwYNYCfNYk=;
        b=KtOZZQLWCS4cSkTOhxNhKpVdlgScCqqd1k9O1sOLLv3yWqmzDmWQCdv8SbIdZBoMW1
         p+XTPTLA1kfle7EHLlKSnLYcUlzSuqJptOPqafa3svn7Hf80RAA2Cx71KzunAZVY5CKI
         8ojxRA8Gp9JZxvfYXIFcqiBo5VkICsvGOOLms+dAmKNc2Gyb1ABs5C4J6QthrMsOZNdB
         mA5kWsr4Hs0Zx6aJQedGIHQBYMfbbCdUocr8j9BalA5nxZKpqtZiAC0qFj6rsGSkNaVO
         NBFkJf8d9O/ZSW6P4AaWH+j1E+rTmA4hXSMSg0moPcRF/G6BePZfF5CN15CA+rHi0N3V
         MILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wSaY7W6VdgweKOp9jTYZreYJLfH4I8nv1hwYNYCfNYk=;
        b=mtlLCuTCcBLd05SOXYG8dYN1SnnX2nuGNWkEGT8e9CSLzbeyAO5hFA5xIlha4VUN+L
         ox0TwflDvulY3lwc5omUCkWW+yg6HpwYdZPdyQHocYSPmHL2Xz2vePYQWu9JdevbPG/k
         J3If6Pkrnx4kopnrYSdbJpCY2kdKtNRpPc0SCjHkk+DllXhALIDHpCzhmpgcsLTe2ifv
         I+Ur6SxmXqcwiZPtE5Vp8HUbcXq8qb0cOfYAwOd1oiaq1YbDUvVM+B3dBA63EzGVAyyl
         OAqHDIXthDflIOk2AmdbvBqXLOxO6PNYxzWF/pjRXFOihDDTxI20tiz+oq62csuIcxEa
         jSCQ==
X-Gm-Message-State: APjAAAV/TQbYXSW9CD0HgYtFdK0/dskZBuvQApVkhOp4jGCOvYfNtZwq
        02/RaAtxq3HJq/Vff5EvI6kySIr7U3T/BJpZ3vQ=
X-Google-Smtp-Source: APXvYqyUkWxXFI6t/ssjecMpUlOsdFzkDM1l5GdegvctcVigKJWMkEH5L7iuW0BTIlwrQde45JWQ1TaHnD69ETrLuPE=
X-Received: by 2002:ab0:2397:: with SMTP id b23mr317737uan.91.1570192072150;
 Fri, 04 Oct 2019 05:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAHCN7xLO5VgA6tW4p7QjwPv_QXv==zbC38TxXtsR5x9H0mUGJA@mail.gmail.com>
 <CAHCN7xJPv7W381R7LS4bB8xWWpugz2NwbTUtj-hqHnDBZ9MFzA@mail.gmail.com>
In-Reply-To: <CAHCN7xJPv7W381R7LS4bB8xWWpugz2NwbTUtj-hqHnDBZ9MFzA@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Fri, 4 Oct 2019 14:27:39 +0200
Message-ID: <CAGm1_kv6RMUDppu6ZjY9Dq7QL=hS=D+e3KS37+V0ncbwoXE6mQ@mail.gmail.com>
Subject: Re: DM3730 Bluetooth Performance differences between SERIAL_8250_OMAP
 vs SERIAL_OMAP
To:     Adam Ford <aford173@gmail.com>
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

Hi Adam,

On Fri, Oct 4, 2019 at 12:39 PM Adam Ford <aford173@gmail.com> wrote:
>
> On Fri, Oct 4, 2019 at 5:02 AM Adam Ford <aford173@gmail.com> wrote:
> >
> > I am running Kernel 5.3.2 trying to troubleshoot some intermittent
> > Bluetooth issues, and I think I have narrowed it down to the serial
> > driver in use.
>
> I should have also noted that it's using UART2 with CTS and RTS on the
> DM3730 (omap3630) and its configured with a baud rate of 3M.
> I tried slowing it to 115200, but that didn't help.  I tried disabling
> the DMA hooks from the device tree, and that didn't help.
>
> > By default, omap2plus_defconfig enables both SERIAL_8250_OMAP and
> > SERIAL_OMAP.  I have my console device configured as  ttyS0, and all
> > appears fine.  When I enable Bluetooth, however, I get intermittent
> > errors on an DM3730 / OMAP3630.
> >
> > Using the 8250 driver for Blueotooth I get intermittent frame errors
> > and data loss.
> >
> > Scanning ...
> > [   28.482452] Bluetooth: hci0: Frame reassembly failed (-84)
> > [   36.162170] Bluetooth: hci0: Frame reassembly failed (-84)
> >         F4:4E:FC:C9:2F:57       BluJax
> > # l2ping F4:4E:FC:C9:2F:57
> > Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
> > 44 bytes from F4:4E:FC:C9:2F:57 id 0 time 8.27ms
> > no response from F4:4E:FC:C9:2F:57: id 1
> > ^C2 sent, 1 received, 50% loss
> >
> > (after a fairly long hang, I hit control-c)
> >
> > However, disabling the 8250 driver and using the only SERIAL_OMAP and
> > the console routed to ttyO0, the Bluetooth works well, so I believe it
> > to be a serial driver issue and not a Bluetooth error.
> >
> > # hcitool scan
> > Scanning ...
> >         F4:4E:FC:C9:2F:57       BluJax
> > ^C
> > # l2ping F4:4E:FC:C9:2F:57
> > Ping: F4:4E:FC:C9:2F:57 from 00:18:30:49:7D:63 (data size 44) ...
> > 44 bytes from F4:4E:FC:C9:2F:57 id 0 time 6.90ms
> > ...
> > 44 bytes from F4:4E:FC:C9:2F:57 id 14 time 28.29ms
> > ^C15 sent, 15 received, 0% loss
> > #
> >
> > 0% loss and regular, repeatable communication without any Frame
> > reassembly errors.
> >
>
> I tried disabling SERIAL_OMAP and using only SERIAL_8250_OMAP, but
> that didn't help.  Because the issue goes away when I disable
> SERIAL_8250_OMAP, I am wondering if something is either being
> misconfigured or some IRQ or DMA integration is missing that may be
> present with the older SERIAL_OMAP driver.
>
> > Any suggestions on how to troubleshoot or what might cause the
> > difference between the two drivers?

Can it be related to this issue [1]? Can you confirm that 5.2 is
working as expected with the 8250 driver?

[1] https://marc.info/?l=linux-serial&m=156965039008649&w=2

Cheers,
Yegor
