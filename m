Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B18E7413923
	for <lists+linux-omap@lfdr.de>; Tue, 21 Sep 2021 19:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231153AbhIURvI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 21 Sep 2021 13:51:08 -0400
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:54722 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231503AbhIURvH (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 21 Sep 2021 13:51:07 -0400
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142] helo=[192.168.1.42])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1mSjth-0008Mc-3X; Tue, 21 Sep 2021 20:49:37 +0300
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
 <YUiOA4QEbZXPmQ7F@atomide.com>
 <5de5382b-9f11-c99b-5b9b-c90ae023e10b@bitmer.com>
 <YUmC/xbYDnXMrsb1@atomide.com>
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <638e4599-ab1d-ee88-6974-17463ce42f5c@bitmer.com>
Date:   Tue, 21 Sep 2021 20:49:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YUmC/xbYDnXMrsb1@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 9/21/21 10:00 AM, Tony Lindgren wrote:
> * Jarkko Nikula <jarkko.nikula@bitmer.com> [210920 16:35]:
>> On 9/20/21 4:34 PM, Tony Lindgren wrote:
>>> The patch below should take us back to the earlier configuration,
>>> can you please give it a try?
>>>
>> I double checked and unfortunate it doesn't boot at all or give any
>> output when patch is applied:
> 
> Hmm I tested it with copying the beagle timer configuration to omap3.dtsi
> and things worked for me. If you can, please try adding
> CONFIG_SERIAL_EARLYCON=y and then also add "debug earlyprintk" to kernel
> command line. It might show something that I'm not able to reproduce.
> Maybe there is a bootloader dependency or something like that.
> 
Hmm.. no luck on top of d5f6545934c4 ("qnx4: work around gcc false
positive warning bug") with the patch. Nothing gets printed after
"Starting kernel ...". Without the patch boots fine.

Here's the full /proc/cmdline from running system:

console=ttyO2,115200n8 debug earlyprintk=ttyO2,115200n8 mpurate=auto
buddy=none camera=none vram=12M omapfb.mode=dvi:640x480MR-16@60
omapdss.def_disp=dvi root=/dev/mmcblk0p2 rw rootfstype=ext4 rootwait

> It should be OK to keep these options enabled, except maybe not for
> "debug" in the command line.
> 
Yeah, systemd outputs some amount of debug stuff, fortunately doesn't
render system unusable :-)
