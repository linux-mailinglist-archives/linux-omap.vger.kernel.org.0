Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328B83ECA89
	for <lists+linux-omap@lfdr.de>; Sun, 15 Aug 2021 20:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhHOSZv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sun, 15 Aug 2021 14:25:51 -0400
Received: from 49-237-179-185.static.tentacle.fi ([185.179.237.49]:52482 "EHLO
        bitmer.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229502AbhHOSZu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Sun, 15 Aug 2021 14:25:50 -0400
X-Greylist: delayed 1201 seconds by postgrey-1.27 at vger.kernel.org; Sun, 15 Aug 2021 14:25:50 EDT
Received: from 88-114-184-142.elisa-laajakaista.fi ([88.114.184.142] helo=[192.168.1.42])
        by bitmer.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <jarkko.nikula@bitmer.com>)
        id 1mFKVQ-00047Y-Nw; Sun, 15 Aug 2021 21:05:08 +0300
Subject: Re: [PATCH] bus: ti-sysc: Fix error handling for
 sysc_check_active_timer()
To:     Pavel Machek <pavel@denx.de>, Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, Dave Gerlach <d-gerlach@ti.com>,
        Faiz Abbas <faiz_abbas@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Keerthy <j-keerthy@ti.com>, Nishanth Menon <nm@ti.com>,
        Suman Anna <s-anna@ti.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210811061053.32081-1-tony@atomide.com>
 <20210811062231.GA16241@duo.ucw.cz>
From:   Jarkko Nikula <jarkko.nikula@bitmer.com>
Message-ID: <d9ebbc7f-07f1-160f-f463-7c54ed8dd6d7@bitmer.com>
Date:   Sun, 15 Aug 2021 21:05:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210811062231.GA16241@duo.ucw.cz>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi

On 8/11/21 9:22 AM, Pavel Machek wrote:
> On Wed 2021-08-11 09:10:53, Tony Lindgren wrote:
>> We have changed the return type for sysc_check_active_timer() from -EBUSY
>> to -ENXIO, but the gpt12 system timer fix still checks for -EBUSY. We are
>> also not returning on other errors like we did earlier as noted by
>> Pavel Machek <pavel@denx.de>.
>>
>> Commit 3ff340e24c9d ("bus: ti-sysc: Fix gpt12 system timer issue with
>> reserved status") should have been updated for commit 65fb73676112
>> ("bus: ti-sysc: suppress err msg for timers used as clockevent/source").
>>
>> Let's fix the issue by checking for -ENXIO and returning on any other
>> errors as suggested by Pavel Machek <pavel@denx.de>.
>>
>> Fixes: 3ff340e24c9d ("bus: ti-sysc: Fix gpt12 system timer issue with reserved status")
>> Depends-on: 65fb73676112 ("bus: ti-sysc: suppress err msg for timers used as clockevent/source")
>> Reported-by: Pavel Machek <pavel@denx.de>
>> Cc: Grygorii Strashko <grygorii.strashko@ti.com>
>> Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>
>> Signed-off-by: Tony Lindgren <tony@atomide.com>
> 
> Reviewed-by: Pavel Machek (CIP) <pavel@denx.de>
> 
I double checked but actually both plain 0aa78d17099b ("Merge tag
'scsi-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/jejb/scsi") and with this
patch boot fine on my Beagle C2.

Anyway,

Tested-by: jarkko.nikula@bitmer.com
