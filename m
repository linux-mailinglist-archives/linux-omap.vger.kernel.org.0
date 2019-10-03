Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8B5BC9A03
	for <lists+linux-omap@lfdr.de>; Thu,  3 Oct 2019 10:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727995AbfJCIjf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 3 Oct 2019 04:39:35 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:33929 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfJCIjf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 3 Oct 2019 04:39:35 -0400
Received: by mail-vs1-f66.google.com with SMTP id d3so1154777vsr.1;
        Thu, 03 Oct 2019 01:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EDL0K7bu+EaFhDHsKjQKMN9nqMYxFXTuN9RZq2K0XLs=;
        b=vZTYtcQT9HDCFCD+QfZYvhzvJqlBBT4f5/Wih2yrcVyVZbjsZF7kRWu43SnCLzGD58
         muuTu3HnQmK7Fa08HI4dbD3tRIOVXtBgDeCL26fqfTI2muFaV7/4foWz7ke+gq14n0I6
         CdtMMXE0JoeomYzFroPc9bw6+nT68Rqf6sZKmu6MHFFPDUaIIMflFEPRXvDJSCRb2SKB
         IwBPDTFGfawz4xydN4Uaqa2moAHlQf6e3pdWUSQ4JjcmXhTRTMrpvFTu4Bd3FBn31p0V
         /aOdkegg0NlNo89Z0CcM2PiISU4w89PtLMqYav14GdC+WTMo5VYhR3qoID16qO0uPkok
         hL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EDL0K7bu+EaFhDHsKjQKMN9nqMYxFXTuN9RZq2K0XLs=;
        b=LwGaTeAYVB9VG3tZvsHdTrU0iCcMcFTw408Th0ePzXVzQExlpBWPbAT6Yr6bdlgtX8
         h6kFIL6BSLO0isoFWoArS584A3e5x/2GmOuJYiou09xcKZJLB3lG78N1dEAhmdUcMaC7
         kkWLpR8kuTOi4rmhJAgf+7TIzqjsohHk3wPTWq2ziMeGb1ooOJEi8O8BZ2n3JXoJ2G7M
         /3+7Hie88xUh5SeTzTSYUvPQpCdKMRMPJyfPIHK2qKxfMnMyB2TXHLsKu7/KW8d9Ddg7
         +b3I9CY8AQGChn/aJR91bs0BOleARgHPbt74bjo5ZGihMJ5BGz4r9caKGwdAnCpTT6ut
         9RGQ==
X-Gm-Message-State: APjAAAWytKYESzRLixkXVSoGIjiw+VqDCGsAz4Lad8rSIKdT8DsSg/jJ
        hQR4xLru2UzwtCPaId2AL83TrDl8mWzldKCiWuc=
X-Google-Smtp-Source: APXvYqyzlaOkmJgrW2R8dTFnOKgdbLZPSAQXVW3o+oNw2ZgL40mHMHZq1tNU8jP/qM4X1maCnDqpPtoeE3WTQdpg6s0=
X-Received: by 2002:a67:dc95:: with SMTP id g21mr4505650vsk.164.1570091974256;
 Thu, 03 Oct 2019 01:39:34 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvZpYH+NP8JfYJWE2v3E9v+yFs20L8MSKsAjfC_g+GmaQ@mail.gmail.com>
 <CAGm1_ktjndofS_N-qh7GVRuJFG1Jn87rf4D8Lt2XMj=+RrL2aw@mail.gmail.com>
 <20190930145711.GG5610@atomide.com> <20190930152330.GH5610@atomide.com>
 <20190930195411.6porqtm7tlokgel3@earth.universe> <20191001080339.GF13531@localhost>
 <CAGm1_ksg2x9USqB+XGhkMQpA-zc77Ha1-j+foPJFR7R3XPZsNg@mail.gmail.com>
 <20191001164351.GJ5610@atomide.com> <20191001220321.GK5610@atomide.com>
 <CAGm1_kv12P1hb7PXSQUo3EXXrCUCQV0ptoQpxewGYHJgROL=cQ@mail.gmail.com> <20191002165219.GL5610@atomide.com>
In-Reply-To: <20191002165219.GL5610@atomide.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Thu, 3 Oct 2019 10:39:22 +0200
Message-ID: <CAGm1_kt4W+2uN_6WduUtR+NwKCmQMZwNRHQQ7kVJt0PqmoobaA@mail.gmail.com>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when connected
 to musb directly
To:     Tony Lindgren <tony@atomide.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, linux-omap@vger.kernel.org,
        vkoul@kernel.org, Bin Liu <b-liu@ti.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        giulio.benetti@benettiengineering.com,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Wed, Oct 2, 2019 at 6:52 PM Tony Lindgren <tony@atomide.com> wrote:
>
> * Yegor Yefremov <yegorslists@googlemail.com> [191002 06:57]:
> > On Wed, Oct 2, 2019 at 12:03 AM Tony Lindgren <tony@atomide.com> wrote:
> > > The other way to fix this would be to just wake up cpp41 in
> > > cppi41_dma_prep_slave_sg() and return NULL so that we can
> > > have musb_ep_program() continue with PIO while cppi41 is
> > > asleep.
> > >
> > > Anyways, care to try it out and see if it fixes your issue?
> >
> > The fix is working but on the first invocation, I get this output
> > (minicom provokes the same output):
>
> > # serialtest.py -c 2 /dev/ttyUSB0 /dev/ttyUSB0
> ...
> > [  210.940612] [<c065fc94>] (__rpm_callback) from [<c065fd60>]
> > (rpm_callback+0x20/0x80)
> > [  210.948402] [<c065fd60>] (rpm_callback) from [<c065f7cc>]
> > (rpm_resume+0x468/0x7a0)
> > [  210.956018] [<c065f7cc>] (rpm_resume) from [<c065fb50>]
> > (__pm_runtime_resume+0x4c/0x64)
> > [  210.964086] [<c065fb50>] (__pm_runtime_resume) from [<bf020940>]
> > (cppi41_dma_prep_slave_sg+0x20/0xfc [cppi41])
>
> OK so that won't work, thanks for testing. Here's the alternative
> patch to try along the lines described above that just wakes up
> cppi41 and returns NULL so musb_ep_program() can continue with PIO
> until cppi41 is awake.

I'm out of the office for some weeks and don't have access to my hw.
I'll make the test as soon as I'm back.

Thanks.
Yegor

> 8< -----------------------
> diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
> --- a/drivers/dma/ti/cppi41.c
> +++ b/drivers/dma/ti/cppi41.c
> @@ -586,9 +586,22 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
>         enum dma_transfer_direction dir, unsigned long tx_flags, void *context)
>  {
>         struct cppi41_channel *c = to_cpp41_chan(chan);
> +       struct dma_async_tx_descriptor *txd = NULL;
> +       struct cppi41_dd *cdd = c->cdd;
>         struct cppi41_desc *d;
>         struct scatterlist *sg;
>         unsigned int i;
> +       int error;
> +
> +       error = pm_runtime_get(cdd->ddev.dev);
> +       if (error < 0) {
> +               pm_runtime_put_noidle(cdd->ddev.dev);
> +
> +               return NULL;
> +       }
> +
> +       if (cdd->is_suspended)
> +               goto err_out_not_ready;
>
>         d = c->desc;
>         for_each_sg(sgl, sg, sg_len, i) {
> @@ -611,7 +624,13 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
>                 d++;
>         }
>
> -       return &c->txd;
> +       txd = &c->txd;
> +
> +err_out_not_ready:
> +       pm_runtime_mark_last_busy(cdd->ddev.dev);
> +       pm_runtime_put_autosuspend(cdd->ddev.dev);
> +
> +       return txd;
>  }
>
>  static void cppi41_compute_td_desc(struct cppi41_desc *d)
> --
> 2.23.0
