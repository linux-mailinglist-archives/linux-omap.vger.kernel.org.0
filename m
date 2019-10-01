Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B595C2FEB
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2019 11:19:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730334AbfJAJTl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 05:19:41 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:45457 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730112AbfJAJTl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 1 Oct 2019 05:19:41 -0400
Received: by mail-vs1-f68.google.com with SMTP id d204so8808395vsc.12;
        Tue, 01 Oct 2019 02:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bQ9G483ab3lNVVoqgYDTd6EzV0Y2I40ZBWBGU5e+zc0=;
        b=m0HfYCJfMEqPnmisIZK+WDLhmGxayvz4DyCNCK6269WIhuRilu01qJMaSxJEgioVlX
         ZSQLdZhhAhjVuEdRA+dIAff/rcFZA4yQctQSrVV3NA1zJ3XI87p8WU9nMOtJVJm5ckFI
         KpJF952HA35GfmufBdnF02kQhwMXw+baTwixK4yx6m645TpEDH3wBLspk+fc2bdewlbX
         MPBFRmFBq2NdqWCGIfIdCiSMjjz8ULVvuo39ZfHPRQeHzBS/sFJev1POoQ3dpkcqu9+x
         mFQu2t5www/+qEBR76TRQBdFZb1CvWq6ITt9ZcYTB+B303kpBK9PtE3HyaVGfsz+HSZr
         yCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bQ9G483ab3lNVVoqgYDTd6EzV0Y2I40ZBWBGU5e+zc0=;
        b=f+Vv/LQ3vH227J37etix17SvZrNfeywZQG9h+tJAwYoo8MX2WdZbQOamqrGz8ybGHF
         Ag0Bp5FEA8tFxzzYrGrZF0Dsv6xbCa7lNFMe7kouiTXR3Q5156STPF9x+8TaTq6XsKKM
         A7e2GDeWHVmaaWfLQF7vx8OHNZOrSmtLmKk/QsB3bz8NHXg4pPXDP8FnMttfgpl65ned
         TPxBY8OK3x+9EGb4LJyD1AUaEX4zyhprX/4sGbBK5K6+aLv2wL+QZ00mbCAGkXCNmi3Z
         zZ5zhxp1Z54oWRC8wOZWfkqMY4pgZw446hWT+c3yhBYxkskDqJz90z+Siel3U6ciZKAR
         EFoQ==
X-Gm-Message-State: APjAAAWJ+U6rmNx/0VC/1/foiKW2pN0NaWj+7vK7Vl75i2gyn5Lnctfh
        qqH1bErfqt3B1ENcyrgX4CPzchTP6MD8h+Y5XUg=
X-Google-Smtp-Source: APXvYqyMkHzCxlMVOW3xNrOan8sqtInPGJG0BghoNm8YVD/rDqTxI53YLbTbjSk9UAY1SX0WA1tvOjU9/nygVaVYTm4=
X-Received: by 2002:a67:dc95:: with SMTP id g21mr12533350vsk.164.1569921578412;
 Tue, 01 Oct 2019 02:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAGm1_kuK6aA1ew9ZY-fVDUE+o71u1QaSg0kfX2jWUWE9Me8Tjg@mail.gmail.com>
 <CAGm1_kuQTtyrdwXAV9NCHnvj3f5d7TixmqCPw=Cxd2A=jKSYmg@mail.gmail.com>
 <20190927151935.GD5610@atomide.com> <20190927155738.GF5610@atomide.com>
 <CAGm1_kvvMc848f6f+kg5K2sQ3+NHA-Se7T_pcwQfrB=4GfZM4Q@mail.gmail.com>
 <CAGm1_kvZpYH+NP8JfYJWE2v3E9v+yFs20L8MSKsAjfC_g+GmaQ@mail.gmail.com>
 <CAGm1_ktjndofS_N-qh7GVRuJFG1Jn87rf4D8Lt2XMj=+RrL2aw@mail.gmail.com>
 <20190930145711.GG5610@atomide.com> <20190930152330.GH5610@atomide.com>
 <20190930195411.6porqtm7tlokgel3@earth.universe> <20191001080339.GF13531@localhost>
In-Reply-To: <20191001080339.GF13531@localhost>
From:   Yegor Yefremov <yegorslists@googlemail.com>
Date:   Tue, 1 Oct 2019 11:19:21 +0200
Message-ID: <CAGm1_ksg2x9USqB+XGhkMQpA-zc77Ha1-j+foPJFR7R3XPZsNg@mail.gmail.com>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when connected
 to musb directly
To:     Johan Hovold <johan@kernel.org>
Cc:     Sebastian Reichel <sre@kernel.org>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        vkoul@kernel.org, Bin Liu <b-liu@ti.com>,
        linux-usb <linux-usb@vger.kernel.org>,
        Andrey Skvortsov <andrej.skvortzov@gmail.com>,
        giulio.benetti@benettiengineering.com,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Oct 1, 2019 at 10:03 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Mon, Sep 30, 2019 at 09:54:11PM +0200, Sebastian Reichel wrote:
> > Hi,
> >
> > On Mon, Sep 30, 2019 at 08:23:30AM -0700, Tony Lindgren wrote:
>
> > > Actually playing with the cppi41 timeout might be more suitable here,
> > > they use the same module clock from what I remember though. So
> > > maybe increase the cppi41 autosuspend_timeout from 100 ms to 500 ms
> > > or higher:
> > >
> > > # echo 500 > /sys/bus/platform/drivers/cppi41-dma-engine/47400000.dma-controller/power/autosuspend_delay_ms
> > >
> > > If changing the autosuspend_timeout_ms value does not help, then
> > > try setting control to on there.
> >
> > I did not check the details, but from the cover-letter this might be
> > woth looking into:
> >
> > https://lore.kernel.org/lkml/20190930161205.18803-1-johan@kernel.org/
>
> No, that one should be unrelated as it would only prevent later suspends after
> a driver has been unbound (and rebound).

I've tried to increase the autosuspend_delay_ms and to set control to
"on" but nothing changes. Below you can see the output of my testing
script [1] (Py2 only). As one can see, the first cycle i.e. after the
port is open for the first time, fails. But the subsequent cycle is
successful. If you invoke the script again, everything repeats.

I've also made printk() in cppi41_run_queue() and it looks like this
routine will be called from cppi41_dma_issue_pending() only in the
beginning of the second test cycle.

# serialtest.py -c 2 /dev/ttyUSB0 /dev/ttyUSB0
[  662.333862] cppi41_runtime_resume
Rx/Tx test: baudrate 115200
Rx/Tx /dev/ttyUSB0 > /dev/ttyUSB0: string length 0 received
Rx/Tx /dev/ttyUSB0 > /dev/ttyUSB0: FAILED
Rx/Tx test: baudrate 115200
Rx/Tx /dev/ttyUSB0 > /dev/ttyUSB0: string length 0 received
Rx/Tx /dev/ttyUSB0 > /dev/ttyUSB0: FAILED
Rx/Tx test: baudrate 1200
Rx/Tx /dev/ttyUSB0 > /dev/ttyUSB0: string length 0 received
Rx/Tx /dev/ttyUSB0 > /dev/ttyUSB0: FAILED
Rx/Tx test: baudrate 1200
Rx/Tx /dev/ttyUSB0 > /dev/ttyUSB0: string length 0 received
Rx/Tx /dev/ttyUSB0 > /dev/ttyUSB0: FAILED
Rx/Tx test: baudrate 115200
Rx/Tx /dev/ttyUSB0 > /dev/ttyUSB0: O.K.
Rx/Tx test: baudrate 115200
Rx/Tx /dev/ttyUSB0 > /dev/ttyUSB0: O.K.
Rx/Tx test: baudrate 1200
Rx/Tx /dev/ttyUSB0 > /dev/ttyUSB0: O.K.
Rx/Tx test: baudrate 1200
Rx/Tx /dev/ttyUSB0 > /dev/ttyUSB0: O.K.
# [  672.720806] cppi41_runtime_suspend

[1] http://ftp.visionsystems.de/temp/serialtest.py

Regards,
Yegor
