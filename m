Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08BA41D543
	for <lists+linux-omap@lfdr.de>; Thu, 30 Sep 2021 10:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348971AbhI3IM3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 30 Sep 2021 04:12:29 -0400
Received: from muru.com ([72.249.23.125]:39070 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348840AbhI3IM2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 30 Sep 2021 04:12:28 -0400
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 091DF8050;
        Thu, 30 Sep 2021 08:11:15 +0000 (UTC)
Date:   Thu, 30 Sep 2021 11:10:44 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     Robert Nelson <robertcnelson@gmail.com>
Cc:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Paul Barker <paul.barker@sancloud.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Suman Anna <s-anna@ti.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
Subject: Re: beaglebone black boot failure Linux v5.15.rc1
Message-ID: <YVVxBFsFUx0ZMoE1@atomide.com>
References: <8f3963ca-ff09-b876-ae9e-433add242de2@ti.com>
 <331ab81e-cd42-7e9b-617a-fde4c773c07a@ti.com>
 <615b6fec-6c62-4a97-6d0c-d2e5a5d1ccb2@fi.rohmeurope.com>
 <dab93132-2e5a-78f2-4313-fc541ea36a10@ti.com>
 <36785ccf-57b4-eaf1-cfc0-b024857f7694@gmail.com>
 <YUmOGFUFONR/ynfW@atomide.com>
 <cce97271-11d2-cc1a-a0fc-c8e8b4482329@ti.com>
 <7C582E1F-13F6-4432-AE99-FF9B7EE9B06D@goldelico.com>
 <9c80c7af-daf5-c521-fe59-1f0c222a23e1@fi.rohmeurope.com>
 <CAOCHtYhC7f43wz+G-mxwutzoJDm8rhZWxf4Jd9+VHAbxPfPjTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCHtYhC7f43wz+G-mxwutzoJDm8rhZWxf4Jd9+VHAbxPfPjTw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Robert Nelson <robertcnelson@gmail.com> [210924 18:41]:
> On Wed, Sep 22, 2021 at 4:28 AM Vaittinen, Matti
> <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > Maybe a stupid question - how to find out the exact revision?
> 
> Run:
> 
> hexdump -e '8/1 "%c"' /sys/bus/i2c/devices/0-0050/eeprom -n 28 | cut -b 5-28
> 
> Then lookup:
> 
> https://github.com/beagleboard/image-builder/blob/master/readme.md

So do I need some kernel module for this with the mainline kernel
loaded? I don't have eeprom listed under 0-0050.

I also see eeprom only for am335x-pocketbeagle.dts and
am57xx-beagle-x15-common.dtsi so maybe it should be justd added?

I guess this could be checked with i2cget command too meanwhile.

Regards,

Tony
