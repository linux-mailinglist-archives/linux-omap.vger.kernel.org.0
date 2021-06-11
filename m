Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4935C3A432D
	for <lists+linux-omap@lfdr.de>; Fri, 11 Jun 2021 15:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbhFKNsJ (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Jun 2021 09:48:09 -0400
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:55322 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229722AbhFKNsJ (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 11 Jun 2021 09:48:09 -0400
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142] helo=[192.168.1.48])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1lrhU2-0005UL-Tt; Fri, 11 Jun 2021 16:46:02 +0300
Subject: Re: [PATCH] bus: ti-sysc: Fix gpt12 system timer issue with reserved
 status
To:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Cc:     Dave Gerlach <d-gerlach@ti.com>, Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210611060224.36769-1-tony@atomide.com>
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <0444bf45-2b6d-5200-6967-736263e75819@bitmer.com>
Date:   Fri, 11 Jun 2021 16:45:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210611060224.36769-1-tony@atomide.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11.6.2021 9.02, Tony Lindgren wrote:
> Jarkko Nikula <jarkko.nikula@bitmer.com> reported that Beagleboard
> revision c2 stopped booting. Jarkko bisected the issue down to
> commit 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix suspend
> and resume for am3 and am4").
> 
> Let's fix the issue by tagging system timers as reserved rather than
> ignoring them. And let's not probe any interconnect target module child
> devices for reserved modules.
> 
> This allows PM runtime to keep track of clocks and clockdomains for
> the interconnect target module, and prevent the system timer from idling
> as we already have SYSC_QUIRK_NO_IDLE and SYSC_QUIRK_NO_IDLE_ON_INIT
> flags set for system timers.
> 
> Fixes: 6cfcd5563b4f ("clocksource/drivers/timer-ti-dm: Fix suspend and resume for am3 and am4")
> Reported-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  drivers/bus/ti-sysc.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
I tested this on top of 06af8679449d ("coredump: Limit what can
interrupt coredumps"). I tested Tony's earlier test diff which does the
same that this actual patch also on top of 6cfcd5563b4f.

Tested-by: Jarkko Nikula <jarkko.nikula@bitmer.com>
