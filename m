Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7300D4182EF
	for <lists+linux-omap@lfdr.de>; Sat, 25 Sep 2021 16:55:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343833AbhIYO5G (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 25 Sep 2021 10:57:06 -0400
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:55056 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234173AbhIYO5G (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sat, 25 Sep 2021 10:57:06 -0400
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142] helo=[192.168.1.42])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1mU95J-00047V-Oa; Sat, 25 Sep 2021 17:55:25 +0300
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andreas Kemnade <andreas@kemnade.info>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
 <YUiOA4QEbZXPmQ7F@atomide.com>
 <5de5382b-9f11-c99b-5b9b-c90ae023e10b@bitmer.com>
 <YUmC/xbYDnXMrsb1@atomide.com>
 <638e4599-ab1d-ee88-6974-17463ce42f5c@bitmer.com>
 <YUsAffFIHUi1ZxEY@atomide.com>
 <cbe53e9f-b407-d758-67bb-5fb65bddfc03@bitmer.com>
 <YUwThz8SAdjBD+cn@atomide.com>
 <93196bcd-836d-2432-9d1c-458904ba4f41@bitmer.com>
 <YU14FjzAMU0uUubW@atomide.com>
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <18a27933-e412-c1ed-a744-62cfbcd6a81b@bitmer.com>
Date:   Sat, 25 Sep 2021 17:55:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YU14FjzAMU0uUubW@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 9/24/21 10:02 AM, Tony Lindgren wrote:
> * Jarkko Nikula <jarkko.nikula@bitmer.com> [210923 18:04]:
>> On 9/23/21 8:41 AM, Tony Lindgren wrote:
>>> * Jarkko Nikula <jarkko.nikula@bitmer.com> [210922 17:22]:
>>>> Better luck with this one but looks like idling cause "undefined
>>>> instruction" crash. Cache/memory etc corruption perhaps? Serial console
>>>> log attached.
>>>
>>> Hmm. If you comment out the twl power node, does the omap3-beagle-ab4.dtb
>>> boot normally for you? It should behave the same as current mainline then
>>> with the omap3isp issue.
>>>
>> Commenting the twl_power node out or removing the twl section leads to
>> immediately rebooting kernel:
> 
> Below is an updated patch to move the timer quirks to omap3-beagle-ab4.dtb
> with no twl changes.
> 
Sigh, I found the reason for immediately rebooting kernel from bash history:

"rm arch/arm/boot/zImage" followed by "cat
arch/arm/boot/dts/omap3-beagle-ab4.dtb >>arch/arm/boot/zImage; ma
LOADADDR=0x80008000 uImage", i.e. forgot to build the zImage between.

(alias ma='nice make -j `getconf _NPROCESSORS_ONLN` ARCH=arm
CROSS_COMPILE="ccache arm-linux-gnueabihf-"')

So yes, with your latest patch omap3-beagle-ab4.dtb behaves as unpatched
omap3-beagle.dtb (boots but timer issues when omap3_isp not loaded).

Jarkko
