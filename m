Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4762CE1123
	for <lists+linux-omap@lfdr.de>; Wed, 23 Oct 2019 06:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731556AbfJWEls (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 23 Oct 2019 00:41:48 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([85.215.255.50]:33465 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731487AbfJWEls (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 23 Oct 2019 00:41:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571805705;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=p84wWu+8rvP9qG2T8V0aa5d86OgYm2mqo8DV3AkG+rs=;
        b=VNyzV54eE7PwwLNOZAlH8ZpE256I1w/OGPgOpYoK2dVLHZXLmFmM5fuvaVvgG4OdSt
        ktBnSnl9rE+o9gcJkrolwVhAzpa12wFxKko6N+llTNVgvRIfrXUqwm/64EehxC3oeSrT
        iJnSAUan4erlDRxUv5gQKyJU7zFFgUAECdIJ5AY0FMjapNQ94vcZ83oJB0ZXfSgxXbWm
        cuXtp2YO6ClRp/WzAx+9o2hGt+L46XUttKT2eFKN4LO4/4+GV9899HXGyQRwbSuXhjTJ
        DF0JJf4PUunUwnEHPna/fegYaQ4CYG8vzWuQL7Gvw5b0M6y1oqmlrUWKTIKNEDfEjHbb
        W2+g==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj7wpz8NMGH/PswDOqm1w="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 44.28.1 DYNA|AUTH)
        with ESMTPSA id R0b2a8v9N4fBSsx
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Wed, 23 Oct 2019 06:41:11 +0200 (CEST)
Subject: Re: [PATCH 1/2] configs: ARM: omap2plus: Enable OMAP3_THERMAL
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20191022221919.GF5610@atomide.com>
Date:   Wed, 23 Oct 2019 06:41:11 +0200
Cc:     Adam Ford <aford173@gmail.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Adam Ford <adam.ford@logicpd.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Message-Id: <1CE62E4E-1A38-448C-9197-8FA16747F942@goldelico.com>
References: <20191007220540.30690-1-aford173@gmail.com> <20191022162223.GU5610@atomide.com> <CAHCN7xLy975mxX+cm56PMx-TKODEZjYPfMHb=byspKxYXXq7OA@mail.gmail.com> <20191022221919.GF5610@atomide.com>
To:     Tony Lindgren <tony@atomide.com>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


> Am 23.10.2019 um 00:19 schrieb Tony Lindgren <tony@atomide.com>:
> 
> * Adam Ford <aford173@gmail.com> [191022 19:01]:
>> On Tue, Oct 22, 2019 at 11:22 AM Tony Lindgren <tony@atomide.com> wrote:
>>> 
>>> Hi,
>>> 
>>> * Adam Ford <aford173@gmail.com> [191007 15:06]:
>>>> The some in the OMAP3 family have a bandgap thermal sensor, but
>>>> omap2plus has it disabled.
>>>> 
>>>> This patch enables the OMAP3_THERMAL by default like the rest of
>>>> the OMAP family.
>>> 
>>> Looks like this breaks off mode during idle for omap3, and that's
>>> probably why it never got enabled. The difference in power
>>> consumption during idle is about 7mW vs 32mW for the SoC as
>>> measured from torpedo shunt for main_battery_som.
>>> 
>>> I think the right fix might be simply to add handling for
>>> CPU_CLUSTER_PM_ENTER to the related thermal driver to disable
>>> it during idle like we have for gpio-omap.c for example.
>> 
>> I am not sure I know where to start on fixing that issue.  Would you
>> entertain enabling the driver if we set the device tree to 'disabled'
>> by default?  This way if people want to to use it, it can be enabled
>> on a per-device option.  Once the power stuff gets resolved, we might
>> be able to enable it by default.  For people who are planning on using
>> the DM3730 @ 1GHz in high temp environments, I am not sure they'll
>> care about low power.
> 
> They should both work fine together though. They are not mutually
> exclusive features.
> 
>> I'll try to look into it when I have time, but I was hoping a
>> compromise might be a reasonable work-around.
> 
> It should be hopefully a trivial fix.. I have not looked at the
> driver code though.

If I am taken right, it is the drivers/thermal/ti-soc-thermal/ti-*.c
which is a common driver for omap3, omap4, omap5. They only differ
in the thermal data and which registers and bits are used to access
the ADC.

So is this problem with off mode also known for omap4 and omap5?

BR,
Nikolaus

