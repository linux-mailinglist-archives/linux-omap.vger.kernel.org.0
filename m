Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FE30229F52
	for <lists+linux-omap@lfdr.de>; Wed, 22 Jul 2020 20:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726666AbgGVSg1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 22 Jul 2020 14:36:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726539AbgGVSg1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 22 Jul 2020 14:36:27 -0400
Received: from smtp.al2klimov.de (smtp.al2klimov.de [IPv6:2a01:4f8:c0c:1465::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AF9DC0619DC;
        Wed, 22 Jul 2020 11:36:27 -0700 (PDT)
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 247A0BDF0B;
        Wed, 22 Jul 2020 18:36:21 +0000 (UTC)
Subject: Re: [PATCH for v5.9] mfd: Replace HTTP links with HTTPS ones
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh@kernel.org>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh+dt@kernel.org, tony@atomide.com, devicetree@vger.kernel.org
References: <20200719195613.61458-1-grandmaster@al2klimov.de>
 <20200721161028.GA389086@bogus> <20200722065429.GI621928@dell>
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <df4b92a2-0c19-ca0e-7967-4ec059196835@al2klimov.de>
Date:   Wed, 22 Jul 2020 20:36:19 +0200
MIME-Version: 1.0
In-Reply-To: <20200722065429.GI621928@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: +
X-Spam-Level: *
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



Am 22.07.20 um 08:54 schrieb Lee Jones:
> On Tue, 21 Jul 2020, Rob Herring wrote:
> 
>> On Sun, 19 Jul 2020 21:56:13 +0200, Alexander A. Klimov wrote:
>>> Rationale:
>>> Reduces attack surface on kernel devs opening the links for MITM
>>> as HTTPS traffic is much harder to manipulate.
>>>
>>> Deterministic algorithm:
>>> For each file:
>>>    If not .svg:
>>>      For each line:
>>>        If doesn't contain `\bxmlns\b`:
>>>          For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>>> 	  If neither `\bgnu\.org/license`, nor `\bmozilla\.org/MPL\b`:
>>>              If both the HTTP and HTTPS versions
>>>              return 200 OK and serve the same content:
>>>                Replace HTTP with HTTPS.
>>>
>>> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
>>> ---
>>>   Continuing my work started at 93431e0607e5.
>>>   See also: git log --oneline '--author=Alexander A. Klimov <grandmaster@al2klimov.de>' v5.7..master
>>>   (Actually letting a shell for loop submit all this stuff for me.)
> 
> I'm guessing something went wrong with your submission, as Rob's reply
> is the first time I saw this patch.  Did your bot send it to me?
Yes,
https://lore.kernel.org/lkml/20200719195613.61458-1-grandmaster@al2klimov.de/

> 
> You really should be fully reviewing anything that gets sent to the
> MLs.  "Sorry, I didn't send it, my bot did" is not an acceptable
> excuse for inadequacies.
See this as an excuse for not stopping sending on demand (if any), not 
for invalid To:.
Whoever's (not) in To: of auto-submitted patches would also (not) be 
there on manual submission because the bot just emulates myself:


➜  linux git:(master) cat submit.sh
#!/bin/bash
set -exo pipefail

if [ "$(perl scripts/get_maintainer.pl --nogit{,-fallback} --nol "$1" 
|wc -l)" -eq 0 ]; then
         GCP=--git-chief-penguins
else
         GCP=''
fi

git send-email --confirm=never "--to=$(
         perl scripts/get_maintainer.pl $GCP --norolestats "$1" |\
         perl -pe 'if (/<(.+?)>/) { $_ = "$1\n" }' |\
         tr \\n , |\
         perl -pe 's/,$//'
)" "$@"

> 
>>>   If there are any URLs to be removed completely
>>>   or at least not (just) HTTPSified:
>>>   Just clearly say so and I'll *undo my change*.
>>>   See also: https://lkml.org/lkml/2020/6/27/64
>>>
>>>   If there are any valid, but yet not changed URLs:
>>>   See: https://lkml.org/lkml/2020/6/26/837
>>>
>>>   If you apply the patch, please let me know.
>>>
>>>   Sorry again to all maintainers who complained about subject lines.
>>>   Now I realized that you want an actually perfect prefixes,
>>>   not just subsystem ones.
>>>   I tried my best...
>>>   And yes, *I could* (at least half-)automate it.
>>>   Impossible is nothing! :)
>>>
>>>
>>>   Documentation/devicetree/bindings/mfd/twl-family.txt | 2 +-
>>>   drivers/mfd/hi6421-pmic-core.c                       | 2 +-
>>>   drivers/mfd/lp873x.c                                 | 2 +-
>>>   drivers/mfd/lp87565.c                                | 2 +-
>>>   drivers/mfd/omap-usb-host.c                          | 2 +-
>>>   drivers/mfd/omap-usb-tll.c                           | 2 +-
>>>   drivers/mfd/smsc-ece1099.c                           | 2 +-
>>>   drivers/mfd/ti_am335x_tscadc.c                       | 2 +-
>>>   drivers/mfd/tps65086.c                               | 2 +-
>>>   drivers/mfd/tps65217.c                               | 2 +-
>>>   drivers/mfd/tps65218.c                               | 2 +-
>>>   drivers/mfd/tps65912-core.c                          | 2 +-
>>>   drivers/mfd/tps65912-i2c.c                           | 2 +-
>>>   drivers/mfd/tps65912-spi.c                           | 2 +-
>>>   include/linux/mfd/hi6421-pmic.h                      | 2 +-
>>>   include/linux/mfd/lp873x.h                           | 2 +-
>>>   include/linux/mfd/lp87565.h                          | 2 +-
>>>   include/linux/mfd/ti_am335x_tscadc.h                 | 2 +-
>>>   include/linux/mfd/tps65086.h                         | 2 +-
>>>   include/linux/mfd/tps65217.h                         | 2 +-
>>>   include/linux/mfd/tps65218.h                         | 2 +-
>>>   include/linux/mfd/tps65912.h                         | 2 +-
>>>   22 files changed, 22 insertions(+), 22 deletions(-)
>>>
>>
>> Acked-by: Rob Herring <robh@kernel.org>
> 
