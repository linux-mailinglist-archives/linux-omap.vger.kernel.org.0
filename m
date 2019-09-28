Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9D4C1145
	for <lists+linux-omap@lfdr.de>; Sat, 28 Sep 2019 18:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726026AbfI1QJg (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 28 Sep 2019 12:09:36 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:35214 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725897AbfI1QJg (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 28 Sep 2019 12:09:36 -0400
Received: by mail-ua1-f67.google.com with SMTP id n63so2893344uan.2;
        Sat, 28 Sep 2019 09:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x+K9UnCfrc4xLvnB5XXuiuigLQ1VtMaSBjDCqb1oqtQ=;
        b=F+YjJenQRPRJkqwKs+saSX7hgkFSF5yd/XxKIRpJFL2UXKV+voSDyad7kdjn9+QFkB
         QVIfgEVurN5vdLpuN7pcVKW2h3FUzFc61S51NrEqIJvviRcjHf4NY1xcKChY/mujyxGR
         K8l8FPsjA6tR3H8uhEmfpJ15pcXxtQYjEDIwkuXO94byihtC5xDVSlaBasvR9ip6q+n2
         cvsguGEn/jJt/vXBo97FbiD2i+uepiHRPbui8J4itSpBS4w3RNZxqueQcWxojBhc3Pl4
         TYKIrnHJRvZNbeMuClmLujfzh55MlyhmuxF2K4g4DpaytwjsfHu4T9M3DpQy5SeE1B+0
         2vgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x+K9UnCfrc4xLvnB5XXuiuigLQ1VtMaSBjDCqb1oqtQ=;
        b=KDRO5ImK1rbKEahLmV7HAVqbCzUZ16KskerBSiqr1od62IYO76H+aA3LNFHdpzZhfy
         eAx1zEn5BsRwmvwHPySxT+lN9hnF6nnKH3DK+avd5aF74Vwm855T40TJEZRybkdJZfva
         rKJMXbkGznJRlWFWpVbjs9wt/Wyh9J6udbbwyV/LUshjNdr47Up7843q2BEcSXshs4Re
         Jc9/XP7FX/WzbeuhhDVnGHN0mwe4b/yJMGkBryEaeqQ40SyELIxiUdPvif4QSZwaRx75
         QNrzPF50asYhUEUieNqriD6dS7gV2gme1EEGvagFXQLo8uVcXUOjTZAdJFNuMc4kNihJ
         bGpA==
X-Gm-Message-State: APjAAAVBVZl87lpRxI4yKZ6p5R97qrPqwdTSJcttcTRC8yQsn6IeQaQU
        kMIwcObo/vEkhdbiyLutXwpxEqS1CZjZUbJ8bvO/qQ==
X-Google-Smtp-Source: APXvYqxo7pL15FbLwEN/S7zYlabSJ53cmGSd12mqWmRUPAApG0BE4kEp+/ro7+h/yloWv80IjsU62f0FNhMpPk9S4X8=
X-Received: by 2002:ab0:2397:: with SMTP id b23mr7905031uan.91.1569686974940;
 Sat, 28 Sep 2019 09:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kuK6aA1ew9ZY-fVDUE+o71u1QaSg0kfX2jWUWE9Me8Tjg@mail.gmail.com>
 <CAGm1_kuQTtyrdwXAV9NCHnvj3f5d7TixmqCPw=Cxd2A=jKSYmg@mail.gmail.com>
 <20190927151935.GD5610@atomide.com> <20190927155738.GF5610@atomide.com>
In-Reply-To: <20190927155738.GF5610@atomide.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Sat, 28 Sep 2019 18:09:24 +0200
Message-ID: <CAGm1_kvvMc848f6f+kg5K2sQ3+NHA-Se7T_pcwQfrB=4GfZM4Q@mail.gmail.com>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when connected
 to musb directly
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, vkoul@kernel.org,
        Bin Liu <b-liu@ti.com>, linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Sep 27, 2019 at 5:57 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Tony Lindgren <tony@atomide.com> [190927 15:20]:
> > * Yegor Yefremov <yegorslists@googlemail.com> [190927 12:31]:
> > > On Fri, Sep 27, 2019 at 10:18 AM Yegor Yefremov
> > > <yegorslists@googlemail.com> wrote:
> > > >
> > > > I was porting my system from 3.18/4.2 to 5.3. During this process I
> > > > noticed that FT4232 that is attached directly to musb is not working
> > > > correctly when opened for the first time: tx is working but nothing
> > > > can be received. On the second opening everything is working fine.
> > > > When the same chip is connected via a USB hub - everything is working
> > > > from the very beginning.
> > > >
> > > > I could reproduce this issue using BeagleBone Black with omap2plus_defconfig.
> > > >
> > > > # lsusb -t
> > > > +/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=musb-hdrc/1p, 480M
> > > >     |__ Port 1: Dev 2, If 0, Class=, Driver=ftdi_sio, 480M
> > > >     |__ Port 1: Dev 2, If 1, Class=, Driver=ftdi_sio, 480M
> > > >     |__ Port 1: Dev 2, If 2, Class=, Driver=ftdi_sio, 480M
> > > >     |__ Port 1: Dev 2, If 3, Class=, Driver=ftdi_sio, 480M
> > > >
> > > > git bisect revealed the following:
> > > >
> > > > fdea2d09b997ba4c86e7a707a5fac87c305f2131 is the first bad commit
> > > > commit fdea2d09b997ba4c86e7a707a5fac87c305f2131
> > > > Author: Tony Lindgren <tony@atomide.com>
> > > > Date:   Wed Aug 31 07:19:59 2016 -0700
> > > >
> > > >     dmaengine: cppi41: Add basic PM runtime support
> > > >
> > > >     Let's keep the device enabled between cppi41_dma_issue_pending()
> > > >     and dmaengine_desc_get_callback_invoke() and rely on the PM runtime
> > > >     autoidle timeout elsewhere.
> > > >
> > > >     As the PM runtime is for whole device, not for each channel,
> > > >     we need to queue pending transfers if the device is PM runtime
> > > >     suspended. Then we start the pending transfers in PM runtime
> > > >     resume.
> > > >
> > > >     Signed-off-by: Tony Lindgren <tony@atomide.com>
> > > >     Signed-off-by: Vinod Koul <vinod.koul@intel.com>
> > > >
> > > > :040000 040000 8cf92c09083541dfdee01cc2973e73ef520f4fb1
> > > > a03c1a7ba8e723f7b503733c46edaa4141483265 M      drivers
> > > >
> > > > Any idea?
> > >
> > > The problems can be reproduced with other FTDI chips like FT232R.
> > >
> > > Invoking "minicom -D /dev/ttyUSB0" and typing some characters is
> > > enough to reproduce the issue (just in case, hw flow control should be
> > > disabled).
> > >
> > > cp210x based converter is working without an issue. So only FTDI chips
> > > are affected so far.
> >
> > Hmm OK. Maybe this could be an issue where the FTDI chip takes
> > longer to enumerate and cppi41 is already suspended by then?
> >
> > At least we had a similar issue with commit ae4a3e028bb8
> > ("dmaengine: cppi41: Fix runtime PM timeouts with USB mass
> > storage").
>
> Looks like I'm unable to reproduce this with bbb and FT232R
> USB UART.
>
> I tried v5.3 with omap2plus_defconfig, then boot, load musb
> and ftdi-sio modules, then connect ftdi directly to bbb,
> and then run "minicom -D /dev/ttyUSB0" on bbb and it works
> just fine for me.
>
> I tried also rebooting the device inbetween in case it only
> happens on the first connect after boot but still no luck
> reproducing.

Strange. I've used a loopback to check whether the characters will be echoed.
FTDI cable was connected all the time so that I could check RX right after boot.
Both Buildroot and OpenWrt rootfs's showed this behaviour.

> Maybe try adding some debug prints to cppi41_runtime_suspend()
> and cppi41_runtime_resume() to see if gets runtime suspended
> too early?

Will do on Mo.

Regards,
Yegor
