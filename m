Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E6A66A57A2
	for <lists+linux-omap@lfdr.de>; Tue, 28 Feb 2023 12:18:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbjB1LSu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 28 Feb 2023 06:18:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231481AbjB1LSs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 28 Feb 2023 06:18:48 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 816067A91
        for <linux-omap@vger.kernel.org>; Tue, 28 Feb 2023 03:18:44 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id h14so9324574wru.4
        for <linux-omap@vger.kernel.org>; Tue, 28 Feb 2023 03:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xVoyC8wrd+bTb+TPTb4Bl/kNMNJ5socmwXem2vdIaJo=;
        b=NHhkM6XWjGereQscqBrss1KgjdsC4Uw7hMUfqTgTCppgDbPYH4HmZvWHbf1YptSK2v
         RY2HNVoOcTiJwSKMta9OCE1XR6dozHgkeOdm1pUhcWqbAIygIsF49f8wrQaFJCmcmKtw
         SLGt+1Drnm5QJqtXw7gdHTBVOvQh4pFmPtyCC8iljFLSiSTLJe7/LQaSL7Jv4kmFHDCd
         8UnCNtmZN/5ZKldUT3wIRCokoLwDsY+YrCz2365mu+thrNSg4rJME8cDHNRVIzl7ajmf
         qTr1RLxYhEQM5eCRjVDnbYlyeVHD3INXy/NlGNUi2XgJ6moIIQ9R8zm48HaisrQqTeqk
         CFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xVoyC8wrd+bTb+TPTb4Bl/kNMNJ5socmwXem2vdIaJo=;
        b=Rgyft6gU1x5VAS1FQ2Ko+HIGE6nuHTysyiJ4StP01LFvuNqv8kab/TYp/T87Pcg6+s
         00M3pG13FvWLLRMlSSRDYivG4VdWICby8Rd8wvVhAhO5iT5Qj+ojZ3U9l+8L/4XfUcsF
         oIwJP8/OmZfVL1+RZrm4e3xDMxN9nEtQkJleCoPAfAICz8NZwxL+8Igy+ZEjwGY+bBgi
         G2u7KfUPvKxU7SQUO4SrdNkpJOAIjDxvESlc2BV7N1djWCs+XpoWwz3YvD5iqbwsFmzb
         lH4xxOabPKUjYQr7IQGM9bwip5LEflTaNg1B18Z8/iLiorzwopCfHUcPbfz5ckORfUfx
         ulSQ==
X-Gm-Message-State: AO0yUKVu3AmECUxc4sUV6RaVe/6HHVJwFi9ZH1tlMIzz4ESRvN3Xezs8
        cOnUOq6PeTj5tAPC+o4gLrlqTBWD+O0kHnid+hE4ZA==
X-Google-Smtp-Source: AK7set8SssAP4PkOqN8PR49y6R5vCMxua5W3zRYjs7yGeGL5s0LFqTaxTjp7CcBvtRCJSDHFZSLQiw==
X-Received: by 2002:a5d:4b87:0:b0:2c9:a8c7:b48d with SMTP id b7-20020a5d4b87000000b002c9a8c7b48dmr1857468wrt.10.1677583122951;
        Tue, 28 Feb 2023 03:18:42 -0800 (PST)
Received: from [10.2.4.117] (lfbn-nic-1-295-18.w90-116.abo.wanadoo.fr. [90.116.132.18])
        by smtp.gmail.com with ESMTPSA id j14-20020a5d464e000000b002c558869934sm9633925wrs.81.2023.02.28.03.18.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 03:18:42 -0800 (PST)
Message-ID: <741eb8c3-ad05-19e2-2604-9cd9c97c4ef4@baylibre.com>
Date:   Tue, 28 Feb 2023 12:18:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] gpio: tps65219: add GPIO support for TPS65219 PMIC
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jon Cormier <jcormier@criticallink.com>
Cc:     linus.walleij@linaro.org, brgl@bgdev.pl, tony@atomide.com,
        lee@kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org
References: <20230224113837.874264-1-jneanne@baylibre.com>
 <20230224113837.874264-2-jneanne@baylibre.com> <Y/iqhsEIvHgnZ+5l@surfacebook>
 <CADL8D3bm82+=LwYnve04FB2zsSJ6ceKQHycV9oNWoYFiOQnVCA@mail.gmail.com>
 <CAHp75Vc52cqPaTFTvi2E-3Gg6gAsDWc7wSWjn7wMuhcxWqFXBA@mail.gmail.com>
From:   jerome Neanne <jneanne@baylibre.com>
In-Reply-To: <CAHp75Vc52cqPaTFTvi2E-3Gg6gAsDWc7wSWjn7wMuhcxWqFXBA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 27/02/2023 20:51, Andy Shevchenko wrote:
>>>> Signed-off-by: Jonathan Cormier<jcormier@criticallink.com>
>>>> Signed-off-by: Jerome Neanne<jneanne@baylibre.com>
>>> Not sure how to interpet this along with the From line.
>> Are two sign-offs not allowed/expected?  I wrote the initial
>> implementation of this driver and Jerome updated it and is handling
>> submitting it since he did the rest of the TPS65219 drivers.
> 1. Submitter's SoB must be the last SoB in the chain.
> 2. Developers also need to be marked with Co-developed-by.
Got it! My mistake. I'll fix following your instructions.
