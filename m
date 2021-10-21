Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16512436A37
	for <lists+linux-omap@lfdr.de>; Thu, 21 Oct 2021 20:10:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhJUSMi (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Oct 2021 14:12:38 -0400
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:56754 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhJUSMi (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 21 Oct 2021 14:12:38 -0400
Received: from 88-114-184-125.elisa-laajakaista.fi ([88.114.184.125] helo=[192.168.1.42])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1mdcWC-0008IB-0J; Thu, 21 Oct 2021 21:10:20 +0300
Subject: Re: Regression with e428e250fde6 on BeagleBoard Rev C2
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
 <YUiOA4QEbZXPmQ7F@atomide.com>
 <5de5382b-9f11-c99b-5b9b-c90ae023e10b@bitmer.com>
 <YUmC/xbYDnXMrsb1@atomide.com>
 <2e85559a-52fe-f887-51b5-4e7505ebda1e@bitmer.com>
 <YXFyCIGJj4HnHCpy@atomide.com>
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <5987632f-78a1-94c6-f02e-4f52b927a8e2@bitmer.com>
Date:   Thu, 21 Oct 2021 21:10:16 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YXFyCIGJj4HnHCpy@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/21/21 4:58 PM, Tony Lindgren wrote:
>> Could it be possible the "secure_32k_fck" clock has some system hanging
>> issue on my beagle? How I understand from e428e250fde6 ("ARM: dts:
>> Configure system timers for omap3") that "secure_32k_fck" is not
>> referenced explicitly but your patch here does.
> 
> Yes seems like there may be some extra issue on the omap3-beagle
> boards. Seeing the earlycon output would be good to see.
> 
Here are the last lines with your earlier patch and patch below applied
(my tested-by below):

...
[    0.000000] IRQ: Found an INTC at 0x(ptrval) (revision 4.0) with 96
interrupts
[    0.000000] random: get_random_bytes called from
start_kernel+0x464/0x6c4 with crng_init=0
[    0.000000] Clocking rate (Crystal/Core/MPU): 26.0/332/600 MHz
[    0.000000] OMAP clocksource: 32k_counter at 32768 Hz
[    0.000000] clocksource: 32k_counter: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 58327039986419 ns
[    0.000000] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps
every 65535999984741ns
[    0.014617] TI gptimer clocksource: always-on
/ocp@68000000/target-module@48304000
[    0.022583] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps
every 65535999984741ns
[    0.032073] clocksource: dmtimer: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 58327039986419 ns
[    0.044372] Console: colour dummy device 80x30

> Subject: [PATCH] ARM: dts: Add missing stdout-path for omap3-beagle
>  variants
> 
> This allows seeing early serial console output as long as the kernel
> config has CONFIG_SERIAL_EARLYCON=y, and the kernel command line has
> earlycon.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>

You may add to this patch:

Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
