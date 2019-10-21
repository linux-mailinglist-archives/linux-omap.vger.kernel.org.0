Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 09F6BDE6C0
	for <lists+linux-omap@lfdr.de>; Mon, 21 Oct 2019 10:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726227AbfJUIjv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Oct 2019 04:39:51 -0400
Received: from mail-ua1-f68.google.com ([209.85.222.68]:39339 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbfJUIju (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Oct 2019 04:39:50 -0400
Received: by mail-ua1-f68.google.com with SMTP id b14so3558777uap.6;
        Mon, 21 Oct 2019 01:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GDHAImBPnfYdcTZv5QN22K8grMSnjgjEI3IeurJ6b2A=;
        b=RhHHQGjo61Z4HtNc5YxV5my1PmI/qYMRqvqJ3DZ/MvVMoFetpkKn2n9NqDQHhDXIN4
         ZKuMbLKgGeM8LejyvWt+0Kp8kDiKUfI2/Ioa/++6elGSm6B7VJ/B91mso+HwE30IxCd7
         NynlnBmQfhIi+wIPUjmtxkp04tDCAe39OfQRnesRIiayHgi4fo0e7ttK9W4L7tR7Stt/
         kEVtyetjHTn1dIVXDtkELAo/LpSKmECtMyMZDgCPAhPu/Ru0H5JX8rvBkxr2qAnPrR0R
         j084ygG2bbVYYHjfHHqv5SevHODqVmahfN6qphkWixIR9E2/CfBkJUnd4vW2Fe5q4CVD
         hslg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GDHAImBPnfYdcTZv5QN22K8grMSnjgjEI3IeurJ6b2A=;
        b=UD+4jZlhrJpl3ioYZfUMDERIwgKyAa0/aB6ZEuwzeI0gpjYladxUvj64O+XhDeVBro
         F1u6wYEHm9H4O1WwjkkyvXsjDI7TE0TR5kl7OJY8kjSXNI8vAuSHakCuWArKhcgjMPQ9
         dlaVORIrWz2Mfl7gJcI8Rh8bCLF0k1lBNFq7jPq8fvuSBc+uj4Fn9o8VDUFJjKhLtLv2
         t/hryBcORXmItq+CCP1fO+v2blI5CCyLRfm6L5nYVBG4zFf3eujEM61+SZ+xSE6gNgwh
         7pTCz3S/ACH7VNxvNXns+8bhhuNrzac2phZ0OCTfOm3r6PQWzuXXldC3npBhq/OiGnGR
         m/Xw==
X-Gm-Message-State: APjAAAU13CctgGIrzAZeLVapbSWI5rkfMj74tLrpmhzdTgK9s7hmxLBZ
        9tdrMRMxMd20kEuSqLdYw9mUG88eTZeEASS1lTM=
X-Google-Smtp-Source: APXvYqwHj5MQjpWZVXcmDx/PyiCrd2a4eCq9uZekfMZ/S11wGH1cgzOkPg5Wt/zzVKEOqLpE0vIbkA5d/0N4RGR89E4=
X-Received: by 2002:a9f:200a:: with SMTP id 10mr11924965uam.42.1571647189530;
 Mon, 21 Oct 2019 01:39:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kvZpYH+NP8JfYJWE2v3E9v+yFs20L8MSKsAjfC_g+GmaQ@mail.gmail.com>
 <CAGm1_ktjndofS_N-qh7GVRuJFG1Jn87rf4D8Lt2XMj=+RrL2aw@mail.gmail.com>
 <20190930145711.GG5610@atomide.com> <20190930152330.GH5610@atomide.com>
 <20190930195411.6porqtm7tlokgel3@earth.universe> <20191001080339.GF13531@localhost>
 <CAGm1_ksg2x9USqB+XGhkMQpA-zc77Ha1-j+foPJFR7R3XPZsNg@mail.gmail.com>
 <20191001164351.GJ5610@atomide.com> <20191001220321.GK5610@atomide.com>
 <CAGm1_kv12P1hb7PXSQUo3EXXrCUCQV0ptoQpxewGYHJgROL=cQ@mail.gmail.com>
 <20191002165219.GL5610@atomide.com> <CAGm1_kt4W+2uN_6WduUtR+NwKCmQMZwNRHQQ7kVJt0PqmoobaA@mail.gmail.com>
In-Reply-To: <CAGm1_kt4W+2uN_6WduUtR+NwKCmQMZwNRHQQ7kVJt0PqmoobaA@mail.gmail.com>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Mon, 21 Oct 2019 10:39:21 +0200
Message-ID: <CAGm1_kvK+Xkd0Yx8AUvTPMejLTm7jr5+2dzrwNLkG2ivuUC6bw@mail.gmail.com>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when connected
 to musb directly
To:     Tony Lindgren <tony@atomide.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>, vkoul@kernel.org,
        Bin Liu <b-liu@ti.com>, linux-usb <linux-usb@vger.kernel.org>,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        Giulio Benetti <giulio.benetti@benettiengineering.com>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On Thu, Oct 3, 2019 at 10:39 AM Yegor Yefremov
<yegorslists@googlemail.com> wrote:
>
> Hi Tony,
>
> On Wed, Oct 2, 2019 at 6:52 PM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Yegor Yefremov <yegorslists@googlemail.com> [191002 06:57]:
> > > On Wed, Oct 2, 2019 at 12:03 AM Tony Lindgren <tony@atomide.com> wrote:
> > > > The other way to fix this would be to just wake up cpp41 in
> > > > cppi41_dma_prep_slave_sg() and return NULL so that we can
> > > > have musb_ep_program() continue with PIO while cppi41 is
> > > > asleep.
> > > >
> > > > Anyways, care to try it out and see if it fixes your issue?
> > >
> > > The fix is working but on the first invocation, I get this output
> > > (minicom provokes the same output):
> >
> > > # serialtest.py -c 2 /dev/ttyUSB0 /dev/ttyUSB0
> > ...
> > > [  210.940612] [<c065fc94>] (__rpm_callback) from [<c065fd60>]
> > > (rpm_callback+0x20/0x80)
> > > [  210.948402] [<c065fd60>] (rpm_callback) from [<c065f7cc>]
> > > (rpm_resume+0x468/0x7a0)
> > > [  210.956018] [<c065f7cc>] (rpm_resume) from [<c065fb50>]
> > > (__pm_runtime_resume+0x4c/0x64)
> > > [  210.964086] [<c065fb50>] (__pm_runtime_resume) from [<bf020940>]
> > > (cppi41_dma_prep_slave_sg+0x20/0xfc [cppi41])
> >
> > OK so that won't work, thanks for testing. Here's the alternative
> > patch to try along the lines described above that just wakes up
> > cppi41 and returns NULL so musb_ep_program() can continue with PIO
> > until cppi41 is awake.
>
> I'm out of the office for some weeks and don't have access to my hw.
> I'll make the test as soon as I'm back.

I've tested your patch with both systems (with and without a hub) and
everything is working as expected.

Thanks.
Yegor

> > 8< -----------------------
> > diff --git a/drivers/dma/ti/cppi41.c b/drivers/dma/ti/cppi41.c
> > --- a/drivers/dma/ti/cppi41.c
> > +++ b/drivers/dma/ti/cppi41.c
> > @@ -586,9 +586,22 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
> >         enum dma_transfer_direction dir, unsigned long tx_flags, void *context)
> >  {
> >         struct cppi41_channel *c = to_cpp41_chan(chan);
> > +       struct dma_async_tx_descriptor *txd = NULL;
> > +       struct cppi41_dd *cdd = c->cdd;
> >         struct cppi41_desc *d;
> >         struct scatterlist *sg;
> >         unsigned int i;
> > +       int error;
> > +
> > +       error = pm_runtime_get(cdd->ddev.dev);
> > +       if (error < 0) {
> > +               pm_runtime_put_noidle(cdd->ddev.dev);
> > +
> > +               return NULL;
> > +       }
> > +
> > +       if (cdd->is_suspended)
> > +               goto err_out_not_ready;
> >
> >         d = c->desc;
> >         for_each_sg(sgl, sg, sg_len, i) {
> > @@ -611,7 +624,13 @@ static struct dma_async_tx_descriptor *cppi41_dma_prep_slave_sg(
> >                 d++;
> >         }
> >
> > -       return &c->txd;
> > +       txd = &c->txd;
> > +
> > +err_out_not_ready:
> > +       pm_runtime_mark_last_busy(cdd->ddev.dev);
> > +       pm_runtime_put_autosuspend(cdd->ddev.dev);
> > +
> > +       return txd;
> >  }
> >
> >  static void cppi41_compute_td_desc(struct cppi41_desc *d)
> > --
> > 2.23.0
