Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3666B758D4B
	for <lists+linux-omap@lfdr.de>; Wed, 19 Jul 2023 07:43:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230056AbjGSFnZ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Jul 2023 01:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjGSFnY (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 19 Jul 2023 01:43:24 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D42221BF2;
        Tue, 18 Jul 2023 22:43:23 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 4876B80AA;
        Wed, 19 Jul 2023 05:43:23 +0000 (UTC)
Date:   Wed, 19 Jul 2023 08:43:21 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, Dhruva Gole <d-gole@ti.com>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>,
        Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-omap@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] serial: core: Add sysfs links for serial core port
 instances for ttys
Message-ID: <20230719054321.GJ5194@atomide.com>
References: <20230719051613.46569-1-tony@atomide.com>
 <ZLd1uCKoGMBruwiN@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZLd1uCKoGMBruwiN@smile.fi.intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Andy Shevchenko <andriy.shevchenko@intel.com> [230719 05:34]:
> On Wed, Jul 19, 2023 at 08:16:11AM +0300, Tony Lindgren wrote:
> > Let's allow the userspace to find out the tty name for a serial core
> > controller id if a tty exists. This can be done with:
> > 
> > $ grep DEVNAME /sys/bus/serial-base/devices/port*/tty/uevent
> > /sys/bus/serial-base/devices/port.00:04.0/tty/uevent:DEVNAME=ttyS0
> > /sys/bus/serial-base/devices/port.serial8250.1/tty/uevent:DEVNAME=ttyS1
> > /sys/bus/serial-base/devices/port.serial8250.2/tty/uevent:DEVNAME=ttyS2
> > /sys/bus/serial-base/devices/port.serial8250.3/tty/uevent:DEVNAME=ttyS3
> 
> What part is the controller ID here?

Oh looks like controller id it's missing in the name, I'll send a fix
for that.

> We also have something in procfs (I don't remember what info exactly is there).

Do you mean /proc/devices?

> > And with this, we can add /dev/serial/by-id symlinks to the serial port
> > device instances so we can start using serial core port addressing in
> > addition to the legacy ttyS naming.
> > 
> > The naming we can use is dev_name:0.0 where 0.0 are the serial core
> > controller id and port id, so for the ttyS0 example above the naming
> > would be 00:04.0:0.0.
> 
> This is interesting idea. But any hint why it can be useful?

If you have lots of serial ports and we are stuck with adding aliases
for the ports in the dts files where the ttyS naming and ordering does
not really help or may not necessarily make sense if the ports are on
different buses or domains. With CONFIG_SERIAL_8250_RUNTIME_UARTS=4,
the ttyS naming is only needed for the legacy ports really.

Regards,

Tony
