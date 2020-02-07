Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 049DE155B1F
	for <lists+linux-omap@lfdr.de>; Fri,  7 Feb 2020 16:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727011AbgBGPvl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 7 Feb 2020 10:51:41 -0500
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.52]:36748 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726982AbgBGPvl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 7 Feb 2020 10:51:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1581090699;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=DIkXk1PtaacUQs51dQ/olllGip1dnwfioA9wtKIWXVw=;
        b=SYNlHotIR4pEhvLJuGpX90lmWOplcPYfhSJ/sB3MoHL9/xFCmP2WdU2K82IHR64M0e
        353sAvf2bVMr9pylfMbj3iBgCZjt2P6pkEdBEgVeluARIGHdRzjjj3y318WlQkBi4JS4
        Ol2NvDPRWjk4m7Et5NGTi/qpMvChBBbOtgdK71HROnlWX4+VjKtnWB6qLxpI9tgWgDrB
        psaTAN+48K/PZTWDvi/uqCgEcgrB0uIQgsj6edxpUdUh5B5Ek+MWeeeMsyyJatvmWKcD
        fVlaEWoFkGXIphquifVMQ7KHC1F7nNGVAtpxF6iP7vwEMN1OyTmtY9WoIu+WA+oSqcc5
        GH5g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NIGF+Ts3l8="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.1.12 DYNA|AUTH)
        with ESMTPSA id U06217w17Fpahwu
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Fri, 7 Feb 2020 16:51:36 +0100 (CET)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: Nokia N900 on 5.4 and 5.5
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <79b91017-b52a-8aff-4b9c-913ae655f7bf@wizzup.org>
Date:   Fri, 7 Feb 2020 16:51:36 +0100
Cc:     linux-omap <linux-omap@vger.kernel.org>,
        Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
        "Arthur D." <spinal.by@gmail.com>, Tony Lindgren <tony@atomide.com>
Content-Transfer-Encoding: 7bit
Message-Id: <185CD173-C13C-4D56-B3DE-9A8D7784963C@goldelico.com>
References: <79b91017-b52a-8aff-4b9c-913ae655f7bf@wizzup.org>
To:     Merlijn Wajer <merlijn@wizzup.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 07.02.2020 um 15:54 schrieb Merlijn Wajer <merlijn@wizzup.org>:
> 
> Hi,
> 
> I've tried to build 5.4.18 and 5.5.2 for the Nokia N900, using
> omap2plus_defconfig. Using appended DTB, like so:
> 
> $ cat arch/arm/boot/zImage arch/arm/boot/dts/omap3-n900.dtb > zImage.dtb
> $ mkimage -A arm -O linux -T kernel -C none -a 80008000 -e 80008000 -n
> zImage -d zImage.dtb uImage
> 
> But they both fail to boot for me - the device resets almost instantly:
> 
>> data abort
>> 
>>    MAYBE you should read doc/README.arm-unaligned-accesses
>> 
>> pc : [<8000c878>]          lr : [<80008160>]
>> sp : 803c46c8  ip : 003a1870     fp : 003a1848
>> r10: 803ba890  r9 : 00caa42c     r8 : 80000100
>> r7 : 000007a3  r6 : 803a9878     r5 : 80000100  r4 : 80008000
>> r3 : 00004e6c  r2 : 00019fa8     r1 : 803a9878  r0 : 00000000
>> Flags: nZcv  IRQs off  FIQs on  Mode SVC_32
>> Resetting CPU ...
>> 
>> resetting ...
> 
> Full log below. I tried the same with "-Os" instead of "-O2" ; to no avail.
> 
> Any clue what could be up?

I can only tell that I have successfully running 5.5.2 on GTA04A5 (dm3730
but with our own defconfig). This may reduce the number of problem areas
a little.

BR,
Nikolaus

