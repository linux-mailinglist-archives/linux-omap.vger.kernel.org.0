Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B8F3C0906
	for <lists+linux-omap@lfdr.de>; Fri, 27 Sep 2019 17:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfI0P5m (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 27 Sep 2019 11:57:42 -0400
Received: from muru.com ([72.249.23.125]:34662 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727273AbfI0P5m (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 27 Sep 2019 11:57:42 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id A59878022;
        Fri, 27 Sep 2019 15:58:13 +0000 (UTC)
Date:   Fri, 27 Sep 2019 08:57:38 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Yegor Yefremov <yegorslists@googlemail.com>
Cc:     linux-omap@vger.kernel.org, vkoul@kernel.org,
        Bin Liu <b-liu@ti.com>, linux-usb <linux-usb@vger.kernel.org>
Subject: Re: musb: cppi41: broken high speed FTDI functionality when
 connected to musb directly
Message-ID: <20190927155738.GF5610@atomide.com>
References: <CAGm1_kuK6aA1ew9ZY-fVDUE+o71u1QaSg0kfX2jWUWE9Me8Tjg@mail.gmail.com>
 <CAGm1_kuQTtyrdwXAV9NCHnvj3f5d7TixmqCPw=Cxd2A=jKSYmg@mail.gmail.com>
 <20190927151935.GD5610@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190927151935.GD5610@atomide.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [190927 15:20]:
> * Yegor Yefremov <yegorslists@googlemail.com> [190927 12:31]:
> > On Fri, Sep 27, 2019 at 10:18 AM Yegor Yefremov
> > <yegorslists@googlemail.com> wrote:
> > >
> > > I was porting my system from 3.18/4.2 to 5.3. During this process I
> > > noticed that FT4232 that is attached directly to musb is not working
> > > correctly when opened for the first time: tx is working but nothing
> > > can be received. On the second opening everything is working fine.
> > > When the same chip is connected via a USB hub - everything is working
> > > from the very beginning.
> > >
> > > I could reproduce this issue using BeagleBone Black with omap2plus_defconfig.
> > >
> > > # lsusb -t
> > > +/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=musb-hdrc/1p, 480M
> > >     |__ Port 1: Dev 2, If 0, Class=, Driver=ftdi_sio, 480M
> > >     |__ Port 1: Dev 2, If 1, Class=, Driver=ftdi_sio, 480M
> > >     |__ Port 1: Dev 2, If 2, Class=, Driver=ftdi_sio, 480M
> > >     |__ Port 1: Dev 2, If 3, Class=, Driver=ftdi_sio, 480M
> > >
> > > git bisect revealed the following:
> > >
> > > fdea2d09b997ba4c86e7a707a5fac87c305f2131 is the first bad commit
> > > commit fdea2d09b997ba4c86e7a707a5fac87c305f2131
> > > Author: Tony Lindgren <tony@atomide.com>
> > > Date:   Wed Aug 31 07:19:59 2016 -0700
> > >
> > >     dmaengine: cppi41: Add basic PM runtime support
> > >
> > >     Let's keep the device enabled between cppi41_dma_issue_pending()
> > >     and dmaengine_desc_get_callback_invoke() and rely on the PM runtime
> > >     autoidle timeout elsewhere.
> > >
> > >     As the PM runtime is for whole device, not for each channel,
> > >     we need to queue pending transfers if the device is PM runtime
> > >     suspended. Then we start the pending transfers in PM runtime
> > >     resume.
> > >
> > >     Signed-off-by: Tony Lindgren <tony@atomide.com>
> > >     Signed-off-by: Vinod Koul <vinod.koul@intel.com>
> > >
> > > :040000 040000 8cf92c09083541dfdee01cc2973e73ef520f4fb1
> > > a03c1a7ba8e723f7b503733c46edaa4141483265 M      drivers
> > >
> > > Any idea?
> > 
> > The problems can be reproduced with other FTDI chips like FT232R.
> > 
> > Invoking "minicom -D /dev/ttyUSB0" and typing some characters is
> > enough to reproduce the issue (just in case, hw flow control should be
> > disabled).
> > 
> > cp210x based converter is working without an issue. So only FTDI chips
> > are affected so far.
> 
> Hmm OK. Maybe this could be an issue where the FTDI chip takes
> longer to enumerate and cppi41 is already suspended by then?
> 
> At least we had a similar issue with commit ae4a3e028bb8
> ("dmaengine: cppi41: Fix runtime PM timeouts with USB mass
> storage").

Looks like I'm unable to reproduce this with bbb and FT232R
USB UART.

I tried v5.3 with omap2plus_defconfig, then boot, load musb
and ftdi-sio modules, then connect ftdi directly to bbb,
and then run "minicom -D /dev/ttyUSB0" on bbb and it works
just fine for me.

I tried also rebooting the device inbetween in case it only
happens on the first connect after boot but still no luck
reproducing.

Maybe try adding some debug prints to cppi41_runtime_suspend()
and cppi41_runtime_resume() to see if gets runtime suspended
too early?

Regards,

Tony
