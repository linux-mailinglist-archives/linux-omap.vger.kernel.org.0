Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CFDCE1B01
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 14:43:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391624AbfJWMmq convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-omap@lfdr.de>); Wed, 23 Oct 2019 08:42:46 -0400
Received: from coyote.holtmann.net ([212.227.132.17]:47812 "EHLO
        mail.holtmann.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732361AbfJWMmp (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Oct 2019 08:42:45 -0400
Received: from marcel-macpro.fritz.box (p4FEFC197.dip0.t-ipconnect.de [79.239.193.151])
        by mail.holtmann.org (Postfix) with ESMTPSA id E0B6ACECDE;
        Wed, 23 Oct 2019 14:51:43 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.19\))
Subject: Re: [PATCHv2 4/4] Bluetooth: btwilink: drop superseded driver
From:   Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20191023122745.ldh2ghnzazdhaf2x@earth.universe>
Date:   Wed, 23 Oct 2019 14:42:43 +0200
Cc:     Tony Lindgren <tony@atomide.com>, Adam Ford <aford173@gmail.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-bluetooth@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@collabora.com
Content-Transfer-Encoding: 8BIT
Message-Id: <299B10E1-E7A8-4346-BED9-A48446C4D866@holtmann.org>
References: <20191003134147.9458-1-sre@kernel.org>
 <20191003134147.9458-5-sre@kernel.org>
 <BC1F82AC-2988-4BC6-99EA-1C9F9289E582@holtmann.org>
 <20191020205901.56bafijk7cu3rpaj@earth.universe>
 <AC376F8D-77F3-4497-94D1-FE25A5ED9337@holtmann.org>
 <20191023122745.ldh2ghnzazdhaf2x@earth.universe>
To:     Sebastian Reichel <sre@kernel.org>
X-Mailer: Apple Mail (2.3594.4.19)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Sebastian,

>>>>> All users of this driver have been converted to the serdev based
>>>>> hci_ll driver. The unused driver can be safely dropped now.
>>>>> 
>>>>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>>>>> ---
>>>>> drivers/bluetooth/Kconfig    |  11 --
>>>>> drivers/bluetooth/Makefile   |   1 -
>>>>> drivers/bluetooth/btwilink.c | 337 -----------------------------------
>>>>> 3 files changed, 349 deletions(-)
>>>>> delete mode 100644 drivers/bluetooth/btwilink.c
>>>> 
>>>> patch has been applied to bluetooth-next tree.
>>>> 
>>>> However what I really like to see is that you re-introduce a
>>>> btwilink driver that is purely serdev based and doesn’t rely on
>>>> any hci_uart/hci_ldisc code. A clean serdev only driver is that
>>>> best and easier to maintain long term.
>>> 
>>> So basically move the serdev implementation from hci_ll.c into its
>>> own driver and make hci_ll hci_uart based only? That effectively
>>> means, that we have two implementations of the protocol. I don't
>>> think this will improve maintainability, since then bugs needs to
>>> be fixed in two places? Note, that we have a couple of drivers
>>> with serdev+hci_uart by now:
>>> 
>>> for file in $(grep -l serdev drivers/bluetooth/hci_*c) ; grep -l hci_uart_register_proto "${file}"
>>> hci_bcm.c
>>> hci_h5.c
>>> hci_ldisc.c
>>> hci_ll.c
>>> hci_mrvl.c
>>> hci_qca.c
>> 
>> I would like to have something similar to btmtkuart.c which is a
>> pure serdev driver that doesn’t depend on any hci_ldisc.c
>> framework. If we have this, then we would just drop hci_ll.c from
>> the kernel and focus on the serdev only version. As noted, there
>> is no need for any other driver at that point since everything is
>> probed anyway. Users will not even notice the difference.
> 
> This can be achieved by just removing the hci_uart part from
> hci_ll. But AFAIK there are some non-wilink based TI HCILL
> devices, which do not require any extra platform data and might
> still use the hci_uart part.

the hci_ldisc and hci_uart driver abstraction provides enqueue and dequeue handling that just needs to be removed and done natively in the serdev driver. This should be all straight forward and we can keep the current hci_ll.c around for a bit to see what users we have. However I really want to migrate everything over to native serdev drivers that are standalone. The TI HCILL is complex enough to warrant a separate driver.

Regards

Marcel

