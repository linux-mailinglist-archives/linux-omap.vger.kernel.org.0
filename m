Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA9856933BA
	for <lists+linux-omap@lfdr.de>; Sat, 11 Feb 2023 21:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjBKUoj (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 11 Feb 2023 15:44:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjBKUoi (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 11 Feb 2023 15:44:38 -0500
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E69B515569
        for <linux-omap@vger.kernel.org>; Sat, 11 Feb 2023 12:44:37 -0800 (PST)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-142b72a728fso10910708fac.9
        for <linux-omap@vger.kernel.org>; Sat, 11 Feb 2023 12:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P0a2R62UfzU4wzGnZYYCbKQQwGbwoRBDW8AgYInwpck=;
        b=U2moyUL5FYJpHKsC7goFFdofu0pE2p49ouotDs3V55VCONT/bo/NSQUrTremVVHJsx
         aEUeuEvZzDzgub7IMqK1HEFw1jSXInE+uJuPA2K0hJygrg9XIewRxtoDi7TC5SBVw2Ub
         XboBmZYSpN8d1WF8MSqxFihRDMVlma1DP0n+ZDAiY2hQjmuyRc8oqycFP5mdfy2FT46+
         a4gtdqkwPBvSYeXOxQsl0FtJKnoSrqNqBxqHIm+fgkBImqv7yMkRySk/6q3YStsolEot
         LlHDJVKq6bhuTwcrVtG2VbN4893KcnHgwIxo+3oYb+wcSt7vN/xsfxitrrQN25yskBNp
         AS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0a2R62UfzU4wzGnZYYCbKQQwGbwoRBDW8AgYInwpck=;
        b=XkkMRLGul2PdpupeKht2BiYG2PnUgdLPQxLCHrJ8Zi7oumx6oFUs2LcytPkcxHziLT
         nvZ871TjTpd3rRlwAzBQLaOytDfCMa7bzzcKya4OVxI5h11eFUnLT0QIdr5HPiAWIZxu
         BW5GzFO1n1crR1QGyL1unE52eFXAof+yM+jNlyKANqco6b6iJ52PQHCWpzTXiE4Zr46V
         iybggDSqutUwqDXG0SFZ5SzLZycpW9i2HQMWZCceo/aEkBLSBugSpH02fi3tTR+XMO/M
         9O9ET7AuzGLa3E1xB/41NfOIeRZFoRO7SmYTFlPZZq6TB1OVAi4DOCw6dcx4EocXb8z2
         PUvw==
X-Gm-Message-State: AO0yUKVtmc7yUL34CCm7AWngRqAfu6pmvvluPEs6A1DXgvA/UvnhTvcT
        Vpdr+vdOagNaDEUdB/6cvj0=
X-Google-Smtp-Source: AK7set80Zln9W5+7nE8wR+9+DqHc2z+L/JgBrFTx6vu9fkO4OIjQzV1M6WE6aIOcVRFePhnbKNqR5Q==
X-Received: by 2002:a05:6870:c182:b0:163:86c0:6d9b with SMTP id h2-20020a056870c18200b0016386c06d9bmr10124525oad.4.1676148277189;
        Sat, 11 Feb 2023 12:44:37 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h4-20020a05687003c400b0013b911d5960sm3232941oaf.49.2023.02.11.12.44.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Feb 2023 12:44:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b4f65c1f-649d-6c35-b553-15c3ed0fbfb4@roeck-us.net>
Date:   Sat, 11 Feb 2023 12:44:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Linux-OMAP <linux-omap@vger.kernel.org>,
        Tony Lindgren <tony@atomide.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>
References: <20230211182408.GA898817@roeck-us.net>
 <01667a3f-4957-4bb6-a694-2e5642cb8571@app.fastmail.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] ARM: omap1: remove unused board files
In-Reply-To: <01667a3f-4957-4bb6-a694-2e5642cb8571@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 2/11/23 12:06, Arnd Bergmann wrote:
> On Sat, Feb 11, 2023, at 19:24, Guenter Roeck wrote:
>> On Thu, Sep 29, 2022 at 03:38:56PM +0200, Arnd Bergmann wrote:
>>> All board support that was marked as 'unused' earlier can
>>> now be removed, leaving the five machines that that still
>>> had someone using them in 2022, or that are supported in
>>> qemu.
>>>
>>> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
>>> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
>>> Cc: Tony Lindgren <tony@atomide.com>
>>> Cc: linux-omap@vger.kernel.org
>>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>>
>> After this patch I can no longer boot the qemu sx1 emulation from mmc.
>> Is this on purpose ?
> 
> Thanks a lot for the report and for tracking it down to this commit!
> 
> This is not intentional and I don't see what is going on exactly.
> I had another look at the patch but don't see anything wrong with
> it, as it should only removed files that are dead code after the
> unused boards started depending on CONFIG_EXPERT.
> 
> I never managed to get sx1 to boot in qemu in the first place, so
> unfortunately I can't reproduce this here. Are you able to
> narrow it down a little further? My first guess was that
> something inadvertently changed in the output of 'make defconfig',
> but the only symbols I see there are CONFIG_ARCH_OMAP730 and
> CONFIG_ARCH_OMAP850, and I don't see any effect that they would
> have on an OMAP310/1510.
> 
> What happens if you disable those options manually on a working kernel?
> 

Those are not even listed as possible options. The key difference
in defconfig is:

44a45
 > CONFIG_IOSCHED_BFQ=y
79a81
 > CONFIG_MMC_OMAP=y

and the latter is now disabled because

	depends on TPS65010 || !MACH_OMAP_H2

was changed to

	depends on TPS65010

and TPS65010 is not enabled in my configuration.

Removing the dependency of MMC_OMAP on TPS65010 fixes the problem.

Guenter

