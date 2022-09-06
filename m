Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E09F5AE0F9
	for <lists+linux-omap@lfdr.de>; Tue,  6 Sep 2022 09:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238986AbiIFHYn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 6 Sep 2022 03:24:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238452AbiIFHYj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 6 Sep 2022 03:24:39 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D5D511C01
        for <linux-omap@vger.kernel.org>; Tue,  6 Sep 2022 00:24:35 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id b17so698671wrq.3
        for <linux-omap@vger.kernel.org>; Tue, 06 Sep 2022 00:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=DYTBpRO6IPYqim3y5tfWPWOUFUHgR0Ku60awOfetT8Q=;
        b=Wjemof6isG3MI3nwnPF98fGoAxjPJ6yg5rOer2wafeJNvuxsu+R102WPZ8Ofl0Hv/a
         FaooNXzOJRatRBthNyVnshAVLHd9f4XUyILD9rxuwFjiD/0UYwsLwr3u4PbOTNYTLhij
         WZiWpNu4WJ4ZSq9ZBpg8OLeOg+5jbALGtM0trVI5o6WJsVv+5OwwGM18ulDpeV6LCUoV
         RYErXWwbR3VEGvq7yNrq2VB+5WOv8NFFE9rkOokEpFvTAUjiV82yiMFpI8lc4IBYPTOV
         mTjuob4nMRDaOvUKkKNUQTLPqH1vQ2sHyNMVulKreR4HHEOeaOuspkIA23Pbs8RL6o+E
         VKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DYTBpRO6IPYqim3y5tfWPWOUFUHgR0Ku60awOfetT8Q=;
        b=UiGEnwFH5lzXDDBNVGzJFt5J/5Wd0o8nQl+uw6Vr+yejWDlS5nehJ+SU3AVC6CeYpu
         a4X5KPujC+Uycpy2MqmTLefyfPNeuhyW/9gh5MkhrFhTZ26oUKaZOspKWbf784IShGiN
         tto5d8L7SKMiPmhBS16MQTn6BednnEZoiisbq8SUwLFjI6HoU8guorkdjSei+1EndmZe
         9o1NZLwpaZOafAAHZfRhYAaLkl3LQQodFQ5aCePvzGs/2S63ryQos/4xZmTKmMQyBbsv
         dVsDBUgC6/h9aOr/bm/keKxjH7cHrr+KrUQ9Ntv/VuuRYT24LMdLm9uE7vLRBG6+G4Tg
         G7Bw==
X-Gm-Message-State: ACgBeo1uxaBZtB3grvUs7p7G83CAVpSuGl7PjrvQVUyAfCFQAVZxg0tb
        YsMn47m5fyaO00/spMvqhc10FA==
X-Google-Smtp-Source: AA6agR4l2OM/CRDacnL8BzKl/um3+vDau68loI42y/MN7h55SyHQg6SK4TQgP8a24ZbZ2Xutr4ASmQ==
X-Received: by 2002:a5d:64cf:0:b0:220:6d8e:1db0 with SMTP id f15-20020a5d64cf000000b002206d8e1db0mr25234695wri.564.1662449073608;
        Tue, 06 Sep 2022 00:24:33 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id g26-20020a7bc4da000000b003a54f49c1c8sm13152996wmk.12.2022.09.06.00.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 00:24:33 -0700 (PDT)
Message-ID: <79d045ca-38ac-7ad2-3944-e980f0cff0ed@smile.fr>
Date:   Tue, 6 Sep 2022 09:24:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: Unable to boot 6.0-rc3 on dra76
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     Nishanth Menon <nm@ti.com>, Linux-OMAP <linux-omap@vger.kernel.org>
References: <abf4d275-b732-b1d5-35f0-40d78ef09962@ideasonboard.com>
 <Yw9MAKJyZlonv9b3@atomide.com>
 <7a0d68b0-0458-9c12-0e8a-cb0ed402700a@ideasonboard.com>
 <Yxbd3xbv2elWZ6/I@atomide.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <Yxbd3xbv2elWZ6/I@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

Le 06/09/2022 à 07:42, Tony Lindgren a écrit :
> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [220831 12:22]:
>> On 31/08/2022 14:54, Tony Lindgren wrote:
>>> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [220831 11:35]:
>>>> Hi,
>>>>
>>>> I've been unable to boot 6.0-rc3 on dra76 evm with omap2plus_defconfig. I get no output from the kernel.
>>>> Enabling earlyprintk gives me the following. Any ideas?
>>>
>>> This series of fixes for deferred probe in Linux next should help:
>>>
>>> https://lore.kernel.org/linux-kernel/20220819221616.2107893-1-saravanak@google.com/
>>>
>>> Hopefully it will get merged to the mainline kernel soonish.
>>
>> Thanks Tony! This solves the issue.
> 
> Looks like the deferred probe fixes are now merged in v6.0-rc4 FYI.

Just to let you know, I had the same boot issue with the kernel v6.0-rc2 and I
reverted locally the series removing the driver_deferred_probe_check_state().

I'm using an AM5749 cpu on a custom board.

I'm glad to see the problem fixed for v6.0-rc4.

Best regards,
Romain


> 
> Tony

