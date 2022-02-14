Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3B694B430D
	for <lists+linux-omap@lfdr.de>; Mon, 14 Feb 2022 08:43:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235659AbiBNHnz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Feb 2022 02:43:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:58682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiBNHny (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Feb 2022 02:43:54 -0500
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 881F25A59E
        for <linux-omap@vger.kernel.org>; Sun, 13 Feb 2022 23:43:47 -0800 (PST)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 66E5380DE;
        Mon, 14 Feb 2022 07:43:09 +0000 (UTC)
Date:   Mon, 14 Feb 2022 09:43:44 +0200
From:   Tony Lindgren <tony@atomide.com>
To:     Romain Naour <romain.naour@smile.fr>
Cc:     linux-omap@vger.kernel.org
Subject: Re: AM5749: tty serial 8250 omap driver crash
Message-ID: <YgoIMPZd7bi6XDGW@atomide.com>
References: <2c80fd8a-2935-9a6d-43fd-f95fa53c93d2@smile.fr>
 <YgDSj7FJS7nbkJol@atomide.com>
 <e3cf5082-b494-9309-6878-da208920fa5a@smile.fr>
 <YgT/fhpFQfkj1b0j@atomide.com>
 <9f0cb8f9-ac94-eb50-266a-95df521a7360@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9f0cb8f9-ac94-eb50-266a-95df521a7360@smile.fr>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Romain Naour <romain.naour@smile.fr> [220211 10:10]:
> Le 10/02/2022 à 13:05, Tony Lindgren a écrit :
> > Could be that too, but maybe it's as simple as the patch below. Care to
> > give it a try?
> 
> The serial console stop working during the kernel boot with this patch applied.

Yeah and we already have the serdev taking case of PM runtime here.

> >> Are you able to reproduce it ?
> >> Maybe on a IDK574 or a Beaglebone-AI board ?
> > 
> > Not sure why I'm not seeing this one with my test systems.. Have not tried
> > with the RT patches for a while though.
> 
> The RT patches really makes a difference here.

Looks like the following script to just toggle the module state locks
up things for me on beagle-x15 very fast. So yeah now I'm able to
reproduce the issue. Seems like the module is not ready right after
enabling it live we've seen for dra7 iva for example.

Regards,

Tony

8< ------
#!/bin/sh

# Test rebind for serial console uart3 ttyS2, run from an ssh session
module="48020050.target-module"
driver="/sys/bus/platform/drivers/ti-sysc"

# Detach all kernel serial consoles
consoles=$(find /sys/bus/platform/devices/4*.serial/ -name console)
for console in ${consoles}; do
        echo -n N > ${console}
done

# Configure PM runtime autosuspend for all uarts
uarts=$(find /sys/bus/platform/devices/4*.serial/power/ -type d)
for uart in $uarts; do
        echo -n 3000 > $uart/autosuspend_delay_ms
        echo -n enabled > $uart/wakeup
        echo -n auto > $uart/control
done

# Configure wake-up from suspend for all uarts
uarts=$(find /sys/class/tty/tty[SO]*/power/ -type d 2>/dev/null)
for uart in $uarts; do
        echo -n enabled > $uart/wakeup
done

# Keep rebinding uart3 in a loop
while true; do
        echo ${module} > ${driver}/bind
        echo ${module} > ${driver}/unbind
done
