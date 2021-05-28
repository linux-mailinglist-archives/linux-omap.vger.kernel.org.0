Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4113943A3
	for <lists+linux-omap@lfdr.de>; Fri, 28 May 2021 15:56:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236126AbhE1N6L (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 28 May 2021 09:58:11 -0400
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:54258 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235379AbhE1N6K (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 28 May 2021 09:58:10 -0400
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142] helo=[192.168.1.42])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1lmcyX-0006Ov-Vz; Fri, 28 May 2021 16:56:34 +0300
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
To:     linux-omap@vger.kernel.org
Cc:     Tony Lindgren <tony@atomide.com>
Subject: Regression with 6cfcd5563b4f on BeagleBoard Rev C2
Message-ID: <68f28473-a196-b106-b4ae-e9162b7002e6@bitmer.com>
Date:   Fri, 28 May 2021 16:56:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi

My old BeagleBoard Rev C2 stopped booting properly.

Booting stops "Waiting for root device /dev/mmcblk0p2..." but goes
forward if I feed e.g. ENTER over serial and have to press it through
almost the whole userspace booting. At some point during process it
seems to start working. Perhaps userspace fires some timer etc?

I bisected the issue into commit 6cfcd5563b4f
("clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 and
am4"). I used omap2plus_defconfig.

# cat /proc/cpuinfo
processor       : 0

model name      : ARMv7 Processor rev 3 (v7l)

BogoMIPS        : 594.73

Features        : half thumb fastmult vfp edsp thumbee neon vfpv3 tls
vfpd32
CPU implementer : 0x41

CPU architecture: 7

CPU variant     : 0x1

CPU part        : 0xc08

CPU revision    : 3



Hardware        : Generic OMAP3-GP (Flattened Device Tree)

Revision        : 0000

Serial          : 0000000000000000


Jarkko
