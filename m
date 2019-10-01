Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87656C2DFC
	for <lists+linux-omap@lfdr.de>; Tue,  1 Oct 2019 09:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726703AbfJAHKu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 1 Oct 2019 03:10:50 -0400
Received: from mx1.emlix.com ([188.40.240.192]:38752 "EHLO mx1.emlix.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726157AbfJAHKu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 1 Oct 2019 03:10:50 -0400
X-Greylist: delayed 382 seconds by postgrey-1.27 at vger.kernel.org; Tue, 01 Oct 2019 03:10:49 EDT
Received: from mailer.emlix.com (unknown [81.20.119.6])
        (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mx1.emlix.com (Postfix) with ESMTPS id A6EB25FCC9;
        Tue,  1 Oct 2019 09:04:26 +0200 (CEST)
Subject: Re: [PATCH] Bluetooth: hci_ll: set operational frequency earlier
To:     Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        "open list:BLUETOOTH DRIVERS" <linux-bluetooth@vger.kernel.org>
References: <CAHCN7xLOCC00UC4PB3vHa6Q7yyhXVEaWgx2X9D9L2dDubd_5fA@mail.gmail.com>
From:   Philipp Puschmann <philipp.puschmann@emlix.com>
Openpgp: preference=signencrypt
Message-ID: <9525ffc4-3e1f-9941-8f7b-ba74690add77@emlix.com>
Date:   Tue, 1 Oct 2019 09:04:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHCN7xLOCC00UC4PB3vHa6Q7yyhXVEaWgx2X9D9L2dDubd_5fA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

A few times i have seen this here too. The wl1837mod should definitely be able to set
the operaional frequency before loading the firmware.
It takes nearly 5 seconds to upload the firmware with 115kbps while only
0.2s with 3mbps. So i see a high interest to do it the fast way.
A problem i have identified may be the power supply. At least on my custom board
the power supply is controlled via gpio. But the serial bluetooth device has no
support for a regulator. As it is controlled by wifi driver only. I have prepared a patch
adding regulator support to hci_ll driver. In a few weeks i may try to get it upstream.

Another problem may be the timings. The timings the driver uses are according the wl1837mod
datasheets but it may that not all devices of that class or the wiring have the same
specifications and this causes the trouble.

For the above mentioned performance gain i would like to see the problem really solved.
It may be enough to add some sleep time or small delay or something of that kind in
ll_setup().

Regards,
Philipp


Am 30.09.19 um 22:10 schrieb Adam Ford:
> Is anyone else having issues with the hci_ll after  a2e02f38eff8
> ("Bluetooth: hci_ll: set operational frequency earlier") was applied?
> 
> I have an i.MX6Q with a WL1837MOD attached to UART2.  After this patch
> I git a bunch of timeouts when initializing the device using the 5.3
> and 5.3.1 kernel.   I know a bunch of omap and imx users have done
> some various tests over the years, so I thought I'd ask.
> 
> [  195.911836] Bluetooth: hci0: command 0xff36 tx timeout
> [  206.071837] Bluetooth: hci0: command 0x1001 tx timeout
> [  214.231862] Bluetooth: hci0: Reading TI version information failed (-110)
> [  214.238712] Bluetooth: hci0: download firmware failed, retrying...
> [  216.391834] Bluetooth: hci0: command 0xff36 tx timeout
> [  226.551843] Bluetooth: hci0: command 0x1001 tx timeout
> [  234.711856] Bluetooth: hci0: Reading TI version information failed (-110)
> [  234.718705] Bluetooth: hci0: download firmware failed, retrying...
> [  236.871832] Bluetooth: hci0: command 0xff36 tx timeout
> [  247.031837] Bluetooth: hci0: command 0x1001 tx timeout
> [  255.191852] Bluetooth: hci0: Reading TI version information failed (-110)
> [  255.198706] Bluetooth: hci0: download firmware failed, retrying...
> Can't init device hci0: Connection timed out (110)
> 
> Revering this patch fixes the issue, and subsequent patch proposals
> form Philipp haven't seemed to fix the issues for me on 5.3
> 
> adam
> 
