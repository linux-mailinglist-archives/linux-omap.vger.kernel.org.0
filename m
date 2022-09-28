Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA36B5EE08B
	for <lists+linux-omap@lfdr.de>; Wed, 28 Sep 2022 17:34:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233832AbiI1Pd6 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 28 Sep 2022 11:33:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234077AbiI1Pdr (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 28 Sep 2022 11:33:47 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DA4A2250C;
        Wed, 28 Sep 2022 08:33:46 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id a13so2651434edj.0;
        Wed, 28 Sep 2022 08:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:from:to:cc
         :subject:date;
        bh=KNIp28Vg2+4pQl3orQy7BU43XkMc7f8YIquq5ddfBI4=;
        b=qwxVZLk5e7WxfKVc6LTnjvOI9rpDqepST84IrkzPOTOMDwefLnEdnunZwvzHTe3iSc
         pqFfQr2zrScidy3XLEifSbpKEwAimlDgS5A0OHcS78n9ByxHBV79u6W9fbYlXqR2oXVK
         vaZ1OZ/6RmFcGyiRx9KhOJDRl6bmx1t4OKRRkGCjVwCkGJL6lYbwIXb+678i6svDUgVQ
         4VjOzmiC/VQLj+9Ro5p/eAqYhrkU7USqyfAa8p2olMn0/prIXqPhP3s1c2q8pzh7COWC
         i61cEq8QoW3i0oRRt5c6Q06POspOSqDRMOfClSrrO6pbhxCOyD5mn9H0Dfc2otXXnev/
         8c6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :x-gm-message-state:from:to:cc:subject:date;
        bh=KNIp28Vg2+4pQl3orQy7BU43XkMc7f8YIquq5ddfBI4=;
        b=1nNni0lyVYf5YnYoUgBlVA2vxzlnr560qYZOvLC2yeiqzRqOHAxr5aysJY8IlDVoD4
         6MrmkSaVueEj5W1ie1osuj6MEa5HlRdkdaAlFIxBuGz4VG0O/01q3+W+5+Jtk23SO/uO
         LdcRkGNqaDeG8YHNOG7UOQBg/y4XRQjS8VHh0se6l2e2B0Gbb2QtXDJ9uwEIo4/QfRf4
         cUTjsEujZkZz6BKqwVvTSqqxLDQBQKUIUxgyCHmILBl3rzhW28IkCi/6BkLiCE1p+MDQ
         6DIn5A+1eGCOgyXc3b9ShhEXErdbb0mP6HKxRM+IgG9VoTHy5hEzoFthb68SqI27uVC0
         cWfQ==
X-Gm-Message-State: ACrzQf1+BOgD1qBvi5OCzblW+yWQizz+uthbZcnRtDfEeGbEnHYdZFwZ
        OmlA+lPf43nPd8KI/c34F1g=
X-Google-Smtp-Source: AMsMyM5+q4BALEJHomkCJjf1F1WzkkZpWcfT7BBbpNEiZ+8TLJTDa/XkfVxH5XAWhjEAXBfytGGtpw==
X-Received: by 2002:a05:6402:4402:b0:453:6a9:ef8a with SMTP id y2-20020a056402440200b0045306a9ef8amr32663754eda.85.1664379224594;
        Wed, 28 Sep 2022 08:33:44 -0700 (PDT)
Received: from [192.168.1.10] ([46.249.74.23])
        by smtp.googlemail.com with ESMTPSA id t7-20020a170906a10700b0074136cac2e7sm2539149ejy.81.2022.09.28.08.33.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 28 Sep 2022 08:33:43 -0700 (PDT)
Subject: Re: [RFC PATCH 0/5] 8250_omap fixes for testing
To:     Tony Lindgren <tony@atomide.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-serial@vger.kernel.org, linux-omap@vger.kernel.org,
        Merlijn Wajer <merlijn@wizzup.org>,
        Romain Naour <romain.naour@smile.fr>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220928072934.48359-1-tony@atomide.com>
From:   Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
Message-ID: <e14b82f6-9a08-579d-6e4e-dac05543ba96@gmail.com>
Date:   Wed, 28 Sep 2022 18:33:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Firefox/60.0 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20220928072934.48359-1-tony@atomide.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

On 28.09.22 г. 10:29 ч., Tony Lindgren wrote:
> Hi all,
> 
> Here are some 8250_omap fixes for testing. I'm not sure if the first patch
> fixes the issue reported. I'm not sure if I've seen that one, so please test.
> 
> The other patches are for all kind of issues I started running into after
> testing rebinding the driver.

It seems the external abort I was seeing on reboot/poweroff on my d4 is 
no longer here after applying the series, feel free to add:

Tested-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>

> 
> These are tagged RFC as we're close to the merge window, I'll repost the
> series probably after -rc1 after folks have tested this a bit. It seems
> that all these issues have been around for quite a long time.
> 
> Regards,
> 
> Tony
> 
> 
> Tony Lindgren (5):
>    serial: 8250: omap: Fix missing PM runtime calls for
>      omap8250_set_mctrl()
>    serial: 8250: omap: Fix unpaired pm_runtime_put_sync() in
>      omap8250_remove()
>    serial: 8250: omap: Flush PM QOS work on remove
>    serial: 8250: omap: Fix imprecise external abort for omap_8250_pm()
>    serial: 8250: omap: Fix life cycle issues for interrupt handlers
> 
>   drivers/tty/serial/8250/8250_omap.c | 140 +++++++++++++++++-----------
>   1 file changed, 84 insertions(+), 56 deletions(-)
> 
