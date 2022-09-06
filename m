Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12F595AE7A5
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 14:18:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239449AbiIFMSO (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 08:18:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239929AbiIFMRq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 08:17:46 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF28A7C1C4
        for <linux-omap@vger.kernel.org>; Tue,  6 Sep 2022 05:15:36 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id j26so6793728wms.0
        for <linux-omap@vger.kernel.org>; Tue, 06 Sep 2022 05:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5bq6S82bMg6aJgo7PjFCLRPcd2jtWduiuSce7BOPYrM=;
        b=vKiEfaatulaxvhixZjXGBHgFRYzd2zKsutp8w9eLZv3B+YyN/wMKUap+qLPspjhGzb
         vCMz4O9xHlz8fEfTR9HoyMR7Si7b3hghN8vjpFNZVBZSLSsAsQkAOlL5stdz2p3qIW+z
         UnEwYfDvOM2DdXwA6yMAM6VkmFanfvXB9IgrDkCvTwjdjboH0tnS1AZrOIPK/4g9svbz
         EMAOFvhD9lpLuuNWjw3wVXiQzM8gYCnf6i0jZwHDj8ogQWxcsku4FA6OyQ3YcqxrFQG8
         vR4h3mtUDu2R7Asbsb9bWU6DhPAnlNoUNfQeLMhBIGi9Pj1XSbhMBnlzOqXjmFMjlFAJ
         mGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5bq6S82bMg6aJgo7PjFCLRPcd2jtWduiuSce7BOPYrM=;
        b=evfhO2MJyyzvZwFT6Mqg71T/LxcSno8REv2Whj0k/amOB/K8ghPXVnFnZFTw3r8q4+
         Wd4GR4FUMToRTRc3f/eEYg6+FJSyI5WUTQW2w4VemtXASFvVpwMrySP9r+4gL5xneUBy
         EIlUgjrUwfdj9idfnWZKvGQhCXFjXfgAX9o2wEnmrLbbKRcOAS1m5g4ZrZwsuksWxSYt
         lJJ+AsTBDu3SslN7750UPeiMo8pa7eSwNtbLpdZ4TQd2AqvVKzIpTG2XqawwlZkKWL6L
         /jeDJOAibmCavWOTIOfKVU1N12Mq0Dd4H3LuZO8le7OWmQirzDKUfmOQhUUBzUUnIF6f
         amAQ==
X-Gm-Message-State: ACgBeo0x2gjHwVxRhnvDrXPR8Lw40H1g9Otncb4Ga0a6U+IUuB5897Wg
        RlyyywWSVx40mmBeP8Ew3LgjKw==
X-Google-Smtp-Source: AA6agR4y0y7miuBJgIaQBr1EYi6uq0sXp2XVeIE7D/HNfUXxsGJ/Y94TKd84Ivi+qWBPfAUzvFHzBQ==
X-Received: by 2002:a05:600c:4e11:b0:3a5:bfd3:a899 with SMTP id b17-20020a05600c4e1100b003a5bfd3a899mr13540759wmq.185.1662466467593;
        Tue, 06 Sep 2022 05:14:27 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id f9-20020a05600c154900b003a60ff7c082sm22534569wmg.15.2022.09.06.05.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 05:14:27 -0700 (PDT)
Message-ID: <06693033-0cac-06d4-9451-67040c4bef59@smile.fr>
Date:   Tue, 6 Sep 2022 14:14:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Unable to boot 6.0-rc3 on dra76
Content-Language: en-GB
To:     Tony Lindgren <tony@atomide.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Nishanth Menon <nm@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>
References: <abf4d275-b732-b1d5-35f0-40d78ef09962@ideasonboard.com>
 <Yw9MAKJyZlonv9b3@atomide.com>
 <7a0d68b0-0458-9c12-0e8a-cb0ed402700a@ideasonboard.com>
 <Yxbd3xbv2elWZ6/I@atomide.com>
 <79d045ca-38ac-7ad2-3944-e980f0cff0ed@smile.fr>
 <Yxb5cD7kas+Hi695@atomide.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <Yxb5cD7kas+Hi695@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

Le 06/09/2022 à 09:40, Tony Lindgren a écrit :
> * Romain Naour <romain.naour@smile.fr> [220906 07:17]:
>> Hello,
>>
>> Le 06/09/2022 à 07:42, Tony Lindgren a écrit :
>>> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [220831 12:22]:
>>>> On 31/08/2022 14:54, Tony Lindgren wrote:
>>>>> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [220831 11:35]:
>>>>>> Hi,
>>>>>>
>>>>>> I've been unable to boot 6.0-rc3 on dra76 evm with omap2plus_defconfig. I get no output from the kernel.
>>>>>> Enabling earlyprintk gives me the following. Any ideas?
>>>>>
>>>>> This series of fixes for deferred probe in Linux next should help:
>>>>>
>>>>> https://lore.kernel.org/linux-kernel/20220819221616.2107893-1-saravanak@google.com/
>>>>>
>>>>> Hopefully it will get merged to the mainline kernel soonish.
>>>>
>>>> Thanks Tony! This solves the issue.
>>>
>>> Looks like the deferred probe fixes are now merged in v6.0-rc4 FYI.
>>
>> Just to let you know, I had the same boot issue with the kernel v6.0-rc2 and I
>> reverted locally the series removing the driver_deferred_probe_check_state().
>>
>> I'm using an AM5749 cpu on a custom board.
>>
>> I'm glad to see the problem fixed for v6.0-rc4.
> 
> Yup, few more pending fixes that I'm aware of:
> 
> Tomi is suggesting reverting commit 09077bc31165 ("drm/bridge_connector:
> enable HPD by default if supported") to fix the hdmi hpd related warning.
> More info at [0] below.

Yes, I have some new messages related to the hdmi display in dmesg but I didn't
had a look yet.

> 
> To fix the wlcore mac80211 warning, pick Linux next commit 4a86c5462616
> ("wifi: mac80211: fix link warning in RX agg timer expiry"). More info at
> [1] below.

Thanks for the info!

Best regards,
Romain

> 
> Regards,
> 
> Tony
> 
> 
> [0] https://lore.kernel.org/dri-devel/a28a4858-c66a-6737-a9fc-502f591ba2d5@ideasonboard.com/
> [1] https://www.spinics.net/lists/linux-wireless/msg227085.html

