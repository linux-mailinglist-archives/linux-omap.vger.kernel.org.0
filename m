Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F28287226C1
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jun 2023 15:02:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233848AbjFENB7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 5 Jun 2023 09:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233766AbjFENBr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 5 Jun 2023 09:01:47 -0400
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00EBA10A
        for <linux-omap@vger.kernel.org>; Mon,  5 Jun 2023 06:01:41 -0700 (PDT)
Received: by mail-vs1-xe2b.google.com with SMTP id ada2fe7eead31-43b3e2cce3eso1303049137.0
        for <linux-omap@vger.kernel.org>; Mon, 05 Jun 2023 06:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685970101; x=1688562101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cO38/BvQLHAQ87G9qM9lbTJ3ImPZclrAKat+fZGulg8=;
        b=Pvm80JLLbw9204UFhZpF1p4N3+QTzv9VaQY6S9dISSHHxWvVTn+6Tp9q8CBQIwHNRJ
         YARczhIEuxIv1KtQTEa4vcAebIMdGhrwywm8IsdbQ+R9Fmi6ivofNqX/RyPSQzp3VX7Q
         PMSBt1Jw0hL48gQ1WNI755anzsZDG7z93nhVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685970101; x=1688562101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cO38/BvQLHAQ87G9qM9lbTJ3ImPZclrAKat+fZGulg8=;
        b=GT4n6LFed7rXEG2hhkKKbrH56WlYF3Eaz3MPDYvlDkxAm6H4ns5A1ClxwWBfdErOnj
         EcsWttSrYA8mAYG5bW64xUs7fW42slYj5zQelee+mz7mlLf+YhEJSsvfKQqPtHD6QnWs
         ojysw7/69hX1aUQfQNmvI2vjrW24uAYc2EuwZzoEKNYOmjB//D9Ph5nl0LOf4kgH8eKa
         yxGrC0x6eojL6t34wvFj9d/aQmSMc4ZjOLBpPeVnVlmqkwpVqvaSvQze9oytwn4ORErB
         fGOWGKRc1VooQ8FcahP/Dt8a7IsZvQ9fDfdRWrHfzdUtyk5NreHVPCvnxwOQP3XtBrJQ
         vyKA==
X-Gm-Message-State: AC+VfDw085nyP+iO7AGVIvEYyCXRPnYxFYAlJjWlYyi7+zbZFXYhsoa3
        I2knnENuwN3FkvjIyZm9BT4IoR2HYrwpDbM/JtmgWA==
X-Google-Smtp-Source: ACHHUZ6YZzW+yZOZuWvTCNoj/dgyh96LyT2DXgLsptRLSpDmYKbQOI/iNYJ3d5WCgu88E0xn8iIVW6pMblwAwmUBM28=
X-Received: by 2002:a67:bd18:0:b0:43b:2c84:1fca with SMTP id
 y24-20020a67bd18000000b0043b2c841fcamr3134845vsq.5.1685970100956; Mon, 05 Jun
 2023 06:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230525113034.46880-1-tony@atomide.com> <20230602083335.GA181647@google.com>
 <87a5xii33r.fsf@jogness.linutronix.de> <20230603054139.GR14287@atomide.com>
 <20230603063533.GS14287@atomide.com> <20230605061511.GW14287@atomide.com>
 <CAGXv+5Fbx7eTxP0ep6DV+jyronAWxYvu2M-g=MjHGRhjSXUc=w@mail.gmail.com> <20230605122447.GY14287@atomide.com>
In-Reply-To: <20230605122447.GY14287@atomide.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 5 Jun 2023 21:01:29 +0800
Message-ID: <CAGXv+5HwL+R5QpO3pHGQd9qAxu2pCMDjYvdni1HjiC8eEE38mg@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] serial: core: Start managing serial controllers
 to enable runtime PM
To:     Tony Lindgren <tony@atomide.com>
Cc:     John Ogness <john.ogness@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Dhruva Gole <d-gole@ti.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= 
        <nfraprado@collabora.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 5, 2023 at 8:24=E2=80=AFPM Tony Lindgren <tony@atomide.com> wro=
te:
>
> * Chen-Yu Tsai <wenst@chromium.org> [230605 11:34]:
> > On Mon, Jun 5, 2023 at 2:15=E2=80=AFPM Tony Lindgren <tony@atomide.com>=
 wrote:
> > > diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/=
8250/8250_mtk.c
> > > --- a/drivers/tty/serial/8250/8250_mtk.c
> > > +++ b/drivers/tty/serial/8250/8250_mtk.c
> > > @@ -425,11 +439,10 @@ mtk8250_set_termios(struct uart_port *port, str=
uct ktermios *termios,
> > >  static int __maybe_unused mtk8250_runtime_suspend(struct device *dev=
)
> > >  {
> > >         struct mtk8250_data *data =3D dev_get_drvdata(dev);
> > > -       struct uart_8250_port *up =3D serial8250_get_port(data->line)=
;
> > >
> > >         /* wait until UART in idle status */
> > >         while
> > > -               (serial_in(up, MTK_UART_DEBUG0));
> > > +               (mtk8250_read(data, MTK_UART_DEBUG0));
> >
> > I believe it still gets stuck here sometimes.
>
> Hmm so maybe you need to mtk8250_write(data, 0, MTK_UART_RATE_FIX) in
> probe before pm_runtime_resume_and_get() that enables the baud clock?
> That's something I changed, so maybe it messes up things.

I think it has something to do with the do_pm() function calling
the callbacks directly, then also calling runtime PM.

> Looking at the 8250_mtk git log, it's runtime PM functions seem to only
> currently manage the baud clock so register access should be doable
> without runtime PM resume?

Actually it only manages the bus clock. The baud clock is simply the system
XTAL which is not gateble.

> > With your earlier patch, it could get through registering the port, and
> > the console would show
> >
> >     11002000.serial: ttyS0 at MMIO 0x11002000 (irq =3D 240, base_baud =
=3D
> > 1625000) is a ST16650V2
> >
> > for the console UART.
>
> OK
>
> > Angelo mentioned that we should be using SLEEP_REQ/SLEEP_ACK registers
> > in the MTK UART hardware.
> >
> > I tried reworking it into your patch here, but it causes issues with th=
e
> > UART-based Bluetooth on one of my devices. After the UART runtime suspe=
nds
> > and resumes, something is off and causes the transfers during Bluetooth
> > init to become corrupt.
> >
> > I'll try some more stuff, but the existing code seems timing dependent.
> > If I add too many printk statements to the runtime suspend/resume
> > callbacks, things seem to work. One time I even ended up with broken
> > UARTs but otherwise booted up the system.
>
> Well another thing that now changes is that we now runtime suspend the
> port at the end of the probe. What the 8250_mtk probe was doing earlier
> it was leaving the port baud clock enabled, but runtime PM disabled
> until mtk8250_do_pm() I guess.

I guess that's the biggest difference? Since the *bus* clock gets disabled,
any access will hang. Is it enough to just support runtime PM? Or do I have
to also have UART_CAP_RPM?

ChenYu
