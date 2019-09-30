Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C30E5C1BE1
	for <lists+linux-omap@lfdr.de>; Mon, 30 Sep 2019 09:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727702AbfI3HAJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 30 Sep 2019 03:00:09 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37842 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726858AbfI3HAJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 30 Sep 2019 03:00:09 -0400
Received: by mail-vs1-f66.google.com with SMTP id p13so6041387vsr.4;
        Mon, 30 Sep 2019 00:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WPCu9sOB25lXthDF79C2tI3pqVlApVfxowlbJ7D2bJg=;
        b=fdABa5sb3wgC9qift36otR5o95WPE9hdVZ/CGRUd9rT5pM0CSYsv154TY19KyS4Ehy
         TbQZIscpyTFWTy3Qrr3dLEjRWZQVTnhzGt3CR9QQhtfuGaMxTdXCW0VqKyddZlSEDs+I
         y4LtwM1Eqpok0gOb29kA/omKAeBhPfJvzbXRFctvU9FGHcqwdYNexDm9ugMwONiwfHQN
         O5hK2u0R/f1cW6BDSxwZF00jnzZiH1hqtxGgk4tFRmOC8iwvebfp469wBX/4BumNBMhW
         K4jvKGvLB5ClCgSmK+mfSLTRYvaJxjFYFp8Dci7PrSD2fggsAywtQ4AP/yx9TwxpBTcO
         aGxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WPCu9sOB25lXthDF79C2tI3pqVlApVfxowlbJ7D2bJg=;
        b=q/B9S8CLu3dwpkTAKoPDqRMYynyJNkxKQQYt3pP9viKST8SEabz7DV3HPNeVymntE6
         2Lvrxm9QutyOvGdhGY6m4RfAMWAD/ziBTDptjs+sI1bIzcQF7xW5KJEUwsAaPj28/ORm
         ify54w2as1i+EGA5neSDqH05pkobDHeqSZcN32Idwp34s02Xr70fMHCXfknmVLx1UzXo
         inDdGsmq+Y5GXQWvZ5K02+AKmFuzP4AS5CHQ4XSez6XpJMTgD3bq8JYtzx9zX7mH1RVB
         3qD4nIJLw+veiqwf3RTn0TWoE40lykf3crNvRyDJqx2/B2m1XdCrVJeTlSliRCOZcQ5H
         4jVQ==
X-Gm-Message-State: APjAAAVulf+YKr/pTdXI5KFYyTW9H+SCrF0k3G0pd+xCjFW+KUXJ+JjV
        OGZ2QamAoof7bXk/xxhyqEfv1Tw3fTsF8MQr1SQ=
X-Google-Smtp-Source: APXvYqwlLkX6f9yRlFlinkuFmNZ1HqVjfgSj8PAsFaooE7maEiujWShYgybsI/sgKC1rHNGwVcoAR6KGjZToMb1vO9M=
X-Received: by 2002:a67:6542:: with SMTP id z63mr9053529vsb.143.1569826808018;
 Mon, 30 Sep 2019 00:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kuK6aA1ew9ZY-fVDUE+o71u1QaSg0kfX2jWUWE9Me8Tjg@mail.gmail.com>
 <CAGm1_kuQTtyrdwXAV9NCHnvj3f5d7TixmqCPw=Cxd2A=jKSYmg@mail.gmail.com>
 <20190927151935.GD5610@atomide.com> <20190927155738.GF5610@atomide.com> <CAGm1_kvvMc848f6f+kg5K2sQ3+NHA-Se7T_pcwQfrB=4GfZM4Q@mail.gmail.com>
In-Reply-To: <CAGm1_kvvMc848f6f+kg5K2sQ3+NHA-Se7T_pcwQfrB=4GfZM4Q@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Mon, 30 Sep 2019 08:59:51 +0200
Message-ID: <CAGm1_kvZpYH+NP8JfYJWE2v3E9v+yFs20L8MSKsAjfC_g+GmaQ@mail.gmail.com>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when connected
 to musb directly
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, vkoul@kernel.org,
        Bin Liu <b-liu@ti.com>, linux-usb <linux-usb@vger.kernel.org>,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Sep 28, 2019 at 6:09 PM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> On Fri, Sep 27, 2019 at 5:57 PM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Tony Lindgren <tony@atomide.com> [190927 15:20]:
> > > * Yegor Yefremov <yegorslists@googlemail.com> [190927 12:31]:
> > > > On Fri, Sep 27, 2019 at 10:18 AM Yegor Yefremov
> > > > <yegorslists@googlemail.com> wrote:
> > > > >
> > > > > I was porting my system from 3.18/4.2 to 5.3. During this process I
> > > > > noticed that FT4232 that is attached directly to musb is not working
> > > > > correctly when opened for the first time: tx is working but nothing
> > > > > can be received. On the second opening everything is working fine.
> > > > > When the same chip is connected via a USB hub - everything is working
> > > > > from the very beginning.
> > > > >
> > > > > I could reproduce this issue using BeagleBone Black with omap2plus_defconfig.
> > > > >
> > > > > # lsusb -t
> > > > > +/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=musb-hdrc/1p, 480M
> > > > >     |__ Port 1: Dev 2, If 0, Class=, Driver=ftdi_sio, 480M
> > > > >     |__ Port 1: Dev 2, If 1, Class=, Driver=ftdi_sio, 480M
> > > > >     |__ Port 1: Dev 2, If 2, Class=, Driver=ftdi_sio, 480M
> > > > >     |__ Port 1: Dev 2, If 3, Class=, Driver=ftdi_sio, 480M
> > > > >
> > > > > git bisect revealed the following:
> > > > >
> > > > > fdea2d09b997ba4c86e7a707a5fac87c305f2131 is the first bad commit
> > > > > commit fdea2d09b997ba4c86e7a707a5fac87c305f2131
> > > > > Author: Tony Lindgren <tony@atomide.com>
> > > > > Date:   Wed Aug 31 07:19:59 2016 -0700
> > > > >
> > > > >     dmaengine: cppi41: Add basic PM runtime support
> > > > >
> > > > >     Let's keep the device enabled between cppi41_dma_issue_pending()
> > > > >     and dmaengine_desc_get_callback_invoke() and rely on the PM runtime
> > > > >     autoidle timeout elsewhere.
> > > > >
> > > > >     As the PM runtime is for whole device, not for each channel,
> > > > >     we need to queue pending transfers if the device is PM runtime
> > > > >     suspended. Then we start the pending transfers in PM runtime
> > > > >     resume.
> > > > >
> > > > >     Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > > >     Signed-off-by: Vinod Koul <vinod.koul@intel.com>
> > > > >
> > > > > :040000 040000 8cf92c09083541dfdee01cc2973e73ef520f4fb1
> > > > > a03c1a7ba8e723f7b503733c46edaa4141483265 M      drivers
> > > > >
> > > > > Any idea?
> > > >
> > > > The problems can be reproduced with other FTDI chips like FT232R.
> > > >
> > > > Invoking "minicom -D /dev/ttyUSB0" and typing some characters is
> > > > enough to reproduce the issue (just in case, hw flow control should be
> > > > disabled).
> > > >
> > > > cp210x based converter is working without an issue. So only FTDI chips
> > > > are affected so far.
> > >
> > > Hmm OK. Maybe this could be an issue where the FTDI chip takes
> > > longer to enumerate and cppi41 is already suspended by then?
> > >
> > > At least we had a similar issue with commit ae4a3e028bb8
> > > ("dmaengine: cppi41: Fix runtime PM timeouts with USB mass
> > > storage").
> >
> > Looks like I'm unable to reproduce this with bbb and FT232R
> > USB UART.
> >
> > I tried v5.3 with omap2plus_defconfig, then boot, load musb
> > and ftdi-sio modules, then connect ftdi directly to bbb,
> > and then run "minicom -D /dev/ttyUSB0" on bbb and it works
> > just fine for me.
> >
> > I tried also rebooting the device inbetween in case it only
> > happens on the first connect after boot but still no luck
> > reproducing.
>
> Strange. I've used a loopback to check whether the characters will be echoed.
> FTDI cable was connected all the time so that I could check RX right after boot.
> Both Buildroot and OpenWrt rootfs's showed this behaviour.
>
> > Maybe try adding some debug prints to cppi41_runtime_suspend()
> > and cppi41_runtime_resume() to see if gets runtime suspended
> > too early?
>
> Will do on Mo.

I've added the printks to both routines and the result is quite
interesting. On the system with a directly attached FTDI both routines
will be always invoked before (resume) and after (suspend) the
test/minicom i.e. during the USB initialization.

On the systems with a USB hub, these routines will be invoked only
during the USB initialization and the last invocation is resume.
During the test, there are no invocations.

Regards,
Yegor
