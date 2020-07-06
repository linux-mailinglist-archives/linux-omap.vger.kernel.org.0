Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F8F1215B86
	for <lists+linux-omap@lfdr.de>; Mon,  6 Jul 2020 18:10:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729406AbgGFQKy (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Jul 2020 12:10:54 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.51]:27549 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729293AbgGFQKy (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 6 Jul 2020 12:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1594051852;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=hVt/Cz++hbUBnWXKsMOde2MTlCEheUB2/NrB9aVfjyg=;
        b=KGDY4zYqx36LOlUc+N1yCkveaHOXwgkh6aFvkal2hOdR9tc0/TxTEOwE79NWo9MvUN
        3JZJyIbhENy6ahNbQcqF4j/hYh193crOqJLjlLdLz/vUNQQ0up9iVeg4u1Vxi9v+n6cW
        HaOuzVUIDhuZri8AmMBLfZPJvNeIW9IxjxXuNFxaQ/UfwZR3Ir8LWOg9QMv7nqeEGhOO
        rL8CgSYeF/8gu7yk3AZ2D/1KGv0284aJCzYBxDYkmXD5DkPJY0oRCvFnpPGBv5vRWAYo
        rZJ913+D6RzdnY8xYReNjl9lL9Q/bEng2CHsKYMtKdFQd/z/bo9qFJNDvxjExsJZ87UE
        2m0g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PvwDCqz4U="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id V07054w66GAnrHV
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Mon, 6 Jul 2020 18:10:49 +0200 (CEST)
Subject: Re: OMAP5: inconsistency between target-module and dsi_of_data_omap5
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20200706143613.GS37466@atomide.com>
Date:   Mon, 6 Jul 2020 18:10:49 +0200
Cc:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>, kernel@pyra-handheld.com,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jyri Sarha <jsarha@ti.com>
Content-Transfer-Encoding: 7bit
Message-Id: <E4616E3C-2519-4421-BC75-87A5CA2BB9EF@goldelico.com>
References: <F5C04FAF-0029-48F3-B0A6-5327CD911EA2@goldelico.com> <49725F81-E615-4101-81B3-0850F201D9E8@goldelico.com> <5F4C23B0-A82B-4F94-BD74-D04F6D798FC0@goldelico.com> <20200705142653.GQ37466@atomide.com> <20200705143614.GR37466@atomide.com> <E200E98D-A4F8-4270-B192-33733F4C7235@goldelico.com> <20200706143613.GS37466@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

> Am 06.07.2020 um 16:36 schrieb Tony Lindgren <tony@atomide.com>:
> 
> * H. Nikolaus Schaller <hns@goldelico.com> [200705 15:41]:
>> Does the panel driver also need some modification? It is no longer loaded.
> 
> Hmm so what's the panel driver in this case?

boe,btl507212-w677l

> 
> I think you should now be using just the generic panel with
> drivers/gpu/drm/panel/panel-simple or some panel specific
> driver for dsi.

None of them supports the vendor specific MIPI commands of
this panel.

Therefore we have our own panel driver for years and try to
keep pace with upstream changes.

> 
> I think dsi command mode is now the only omapdrm output not
> yet using generic panel. And Sebastian has a branch pending
> for updating dsi command mode to use generic panel.

I know and had made an attempt to make a modified panel driver
compatible to his code.

But his code is no longer compatible to v5.7 or v5.8 and I failed
to get the panel working on earlier releases.

We also use it in video mode and not command mode.

It seems to be the third or fourth time that we have to rework
the panel driver for an -rc1 because dss panel api has changed
(for good reasons)...

The best thing would be that the panel driver can be upstreamed.
Ideally as a DRM panel and no an OMAPDSS display.

But there are some blocking points:

a) driver is now no longer working, so that it is no longer ready
   for submission
b) there is no DTS upstream that makes use of it
c) it is still an omapdss display driver sitting in
   drivers/gpu/drm/omapdrm/displays where it works up to v5.6.y
d) AFAIR omapdrm does not support random MIPI-DSI panels from
   drivers/gpu/drm/panel (or does it now and we have not yet
   recognised?)

Sort of hen&egg problem :)

BR and thanks,
Nikolaus

