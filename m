Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F404410CBB
	for <lists+linux-omap@lfdr.de>; Sun, 19 Sep 2021 19:41:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbhISRnT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 19 Sep 2021 13:43:19 -0400
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:54498 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229846AbhISRnS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 19 Sep 2021 13:43:18 -0400
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142] helo=[192.168.1.42])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1mS0p3-00075q-NK; Sun, 19 Sep 2021 20:41:49 +0300
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Subject: Regression with e428e250fde6 on BeagleBoard Rev C2
To:     linux-omap@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Message-ID: <3f6924a7-1934-b94e-2441-4781fe737f32@bitmer.com>
Date:   Sun, 19 Sep 2021 20:41:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi

I found another timer related regression on BeagleBoard Rev C2 which was
present before 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix
suspend and resume for am3 and am4") and which remains after fix
3ff340e24c9d ("bus: ti-sysc: Fix gpt12 system timer issue with reserved
status") including today's head d4d016caa4b8 ("alpha: move __udiv_qrnnd
library function to arch/alpha/lib/").

Issue occurs when omap3_isp is not loaded and symptoms are the same than
my previous finding [1]. I.e. timer interrupts appear missing and need
to hit keys on serial console in order to let boot (when omap3_isp not
built) or "sleep 1" in shell to continue.

I bisected that regression to commit
e428e250fde6 ("ARM: dts: Configure system timers for omap3")

According to commit and dmesg it seems to switch from 32k timer to 13
MHz timer. Commit does not explain why it marks 32k timer as unusable on
the BeagleBoard. Or was that a copy-paste error from another dts?

Before

[    0.000000] OMAP clockevent source: timer12 at 32768 Hz
[    0.000000] OMAP clocksource: 32k_counter at 32768 Hz
[    0.000000] clocksource: 32k_counter: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 58327039986419 ns
[    0.000030] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps
every 65535999984741ns

After e428e250fde6

[    0.000000] TI gptimer clockevent: 13000000 Hz at
/ocp@68000000/target-module@49032000
[    0.000000] TI gptimer clocksource: always-on
/ocp@68000000/target-module@48304000
[    0.000091] sched_clock: 32 bits at 32kHz, resolution 30517ns, wraps
every 65535999984741ns
[    0.000183] clocksource: dmtimer: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 58327039986419 ns

I fail to understand how omap3isp affects this since it actually disable
clocks after probe. Does it keep some power domain active which then
keeps the timer active etc?

1. https://marc.info/?l=linux-omap&m=162221018410523&w=2
