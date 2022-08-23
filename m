Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B365259D22F
	for <lists+linux-omap@lfdr.de>; Tue, 23 Aug 2022 09:33:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240978AbiHWHaR (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 23 Aug 2022 03:30:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240982AbiHWHaP (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 23 Aug 2022 03:30:15 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93ECA62ABA
        for <linux-omap@vger.kernel.org>; Tue, 23 Aug 2022 00:30:14 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id n23-20020a7bc5d7000000b003a62f19b453so5971114wmk.3
        for <linux-omap@vger.kernel.org>; Tue, 23 Aug 2022 00:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=LZrIFrN3SNQD6tiftJvxuBxB+MNTx9yr6sqKxGhpEiE=;
        b=PJoPNJ2Owcaqj98zwHMiQFlHnIkKefGRL40Bc3CSftn70hIZA9pKMTYdFy19mo7E5P
         nYshQTM8m4RCYDKcy/egBQEbQopRf8KwrXPo0k9IWLgL93u/U5SlsN6t1djJz915KO1j
         9ruVkdiCA8HbnJ84Bm8DsJWELz0IHiENvHVxmtYEdB/fOjNJ8dtVGFY9nDlgNXumLJFv
         RunYMWcpAxsaclWQSAjF+YnxhO8FunGFuxYLfJqU3TThSwohYpn4/GERMIluMuQGFi0V
         hKm6Okztzj3TF7b+ocTcYhm5o6VbqcFJjHq6EzkpQxsN/41D9bNbd1++EaTW6R+xX9ql
         yG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LZrIFrN3SNQD6tiftJvxuBxB+MNTx9yr6sqKxGhpEiE=;
        b=dMas7i0UBxsKcZvcSiw1NHOgDLY6uEXPBHDzHTH/nmW/bXSS0rwEHCqlZ6/SGgkOqN
         8/30UIuvbOOCTQmWSEEg5ePQfgIL/GdLlhE8bgck8mPiHpD7sM3Sd1RPFghdRtM3mfAa
         6o09HuSm5shRx2GhMYDIUE6C6i1UXzs4sWedkfXj4QJKkeP6WUBn+4WhzJu4KN14U1M9
         pxbLUaiS5l1VmmxvApUij5tIvGXmxSQGexLnDKvcDHZXcPOHsS42IVVK0QCDh9u7SzWw
         qHar7ByyW13q/HZEWXIruAx/uru0mZ1w3Ibc2+Lf22PELziFNmA4p9aCrkiRCEzjpZ3Q
         7Siw==
X-Gm-Message-State: ACgBeo1napnU6HNWyjkyW1pGZH++58nBL0eMPHE81489w+rq9uoaQbeF
        77oWCT8EcEBK+enUpYgCn5/n6Nk5u2T41A==
X-Google-Smtp-Source: AA6agR7zoBJT9bvrKFfjs6gzyftOTc8OegY6JlWZEGCivnxsRG5sEjWe/366w2U2xIuKQ3enGluYXg==
X-Received: by 2002:a05:600c:2104:b0:3a5:40c4:bab6 with SMTP id u4-20020a05600c210400b003a540c4bab6mr1209359wml.119.1661239812995;
        Tue, 23 Aug 2022 00:30:12 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id s16-20020a5d4ed0000000b002207a5d8db3sm13713315wrv.73.2022.08.23.00.30.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 00:30:12 -0700 (PDT)
Message-ID: <0755522b-8981-9827-28c8-9bc2e81e984a@smile.fr>
Date:   Tue, 23 Aug 2022 09:30:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] ARM: dts: am5748: keep usb4_tm disabled
Content-Language: fr
To:     Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        bcousson@baylibre.com, Romain Naour <romain.naour@skf.com>,
        Roger Quadros <rogerq@ti.com>
References: <20220822154625.52160-1-romain.naour@smile.fr>
 <YwRrVI0asWtyyorZ@atomide.com>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <YwRrVI0asWtyyorZ@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

Le 23/08/2022 à 07:53, Tony Lindgren a écrit :
> Hi,
> 
> * Romain Naour <romain.naour@smile.fr> [220822 15:39]:
>> From: Romain Naour <romain.naour@skf.com>
>>
>> From [1]
>> AM5 and DRA7 SoC families have different set of modules in them so the
>> SoC sepecific dtsi files need to be separated.
>>
>> e.g. Some of the major differences between AM576 and DRA76
>>
>> 		DRA76x	AM576x
>>
>> USB3		x
>> USB4		x
>> ATL		x
>> VCP		x
>> MLB		x
>> ISS		x
>> PRU-ICSS1		x
>> PRU-ICSS2		x
>>
>> But commit [2] removed usb4_tm part from am5748.dtsi and introcuded new
>> ti-sysc errors in dmesg.
> 
> OK makes sense to me. Can you please update your patch to use proper
> Fixes tags and commit descriptions? This way the patch will get
> automatically picked up for stable kernels as a fix.
> 
> So something like this instead of listing URLs to commits:
> 
> Commit bcbb63b80284 ("ARM: dts: dra7: Separate AM57 dtsi files") blah
> blah, then commit 176f26bcd41a ("ARM: dts: Add support for dra762 abz
> package") blah blah...
> 
> Fixes: 176f26bcd41a ("ARM: dts: Add support for dra762 abz package")

Thanks for the review!

I just sent a new patch with updated commit log.

Best regards,
Romain


> 
> Regards,
> 
> Tony

