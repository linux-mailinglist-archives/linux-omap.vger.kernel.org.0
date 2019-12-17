Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11496121FD1
	for <lists+linux-omap@lfdr.de>; Tue, 17 Dec 2019 01:35:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727569AbfLQAe5 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 16 Dec 2019 19:34:57 -0500
Received: from muru.com ([72.249.23.125]:48846 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726556AbfLQAe5 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 16 Dec 2019 19:34:57 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 5DD0A810D;
        Tue, 17 Dec 2019 00:35:35 +0000 (UTC)
Date:   Mon, 16 Dec 2019 16:34:53 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Adam Ford <aford173@gmail.com>
Cc:     Evgeniy Polyakov <zbr@ioremap.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "Andrew F . Davis" <afd@ti.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        "H . Nikolaus Schaller" <hns@goldelico.com>,
        Vignesh R <vigneshr@ti.com>
Subject: Re: [PATCHv2] w1: omap-hdq: Simplify driver with PM runtime
 autosuspend
Message-ID: <20191217003453.GU35479@atomide.com>
References: <20191216145359.28219-1-tony@atomide.com>
 <20191216164335.GP35479@atomide.com>
 <CAHCN7xLYRm3Lstb=-r6hguDOrxwi-dT0nTzkhYM0S5GYtEzckw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHCN7xLYRm3Lstb=-r6hguDOrxwi-dT0nTzkhYM0S5GYtEzckw@mail.gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Adam Ford <aford173@gmail.com> [191216 19:04]:
> On Mon, Dec 16, 2019 at 10:43 AM Tony Lindgren <tony@atomide.com> wrote:
> >
> > * Tony Lindgren <tony@atomide.com> [191216 14:54]:
> > > Vignesh, any comments on the ti,mode = "1w" and removal of the call to
> > > hdq_disable_interrupt()? Is there some specific section where we need
> > > to have interrupts disabled and then re-enabled?
> >
> > OK I got "1w" mode working too now. We need to clear the irqstatus before
> > calling wait_event_timeout() on it, and we're now missing it in the
> > hdq_read_byte().
> >
> > Looks like we should not tinker with the actual irstatus register though,
> > that's up to the hdq_isr() to manage.
> >
> > So the following helper is probably what we want to do additionally.
> > I'll be posting v3 of the $subject patch.
> 
> I manually attempted to apply the patches.  I 'think' I did it right.
> 
> For testing, I ran:
>   watch cat /sys/devices/w1_bus_master1/01-000000000000/power_supply/bq27000-battery/voltage_now
> 
> I inserted and removed the power cable several times and observed the
> voltage readings with the battery connected.
> The numbers looked reasonable.
> 
> I then put the board to suspend, waited a few seconds and woke the
> board from sleep.  I resumed my 'watch' function from above and it
> worked just fine.
> If there is nothing else you want me to test, go ahead and add:
> 
> Tested-by: Adam Ford <aford173@gmail.com> #logicpd-torpedo-37xx-devkit

Thanks for testing, will post v3  shortly with the acks.

Regards,

Tony
