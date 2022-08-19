Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E41C1599BA5
	for <lists+linux-omap@lfdr.de>; Fri, 19 Aug 2022 14:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347538AbiHSMIo (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 Aug 2022 08:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348696AbiHSMIn (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 19 Aug 2022 08:08:43 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C14240BEF
        for <linux-omap@vger.kernel.org>; Fri, 19 Aug 2022 05:08:33 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id z20so4351391ljq.3
        for <linux-omap@vger.kernel.org>; Fri, 19 Aug 2022 05:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=gYlvSOH2ZR9yG5YZYS73Kks2lSHpxherM/3sStGglc4=;
        b=AKhBopHyjkUUD476uCKPXZ5kZ6ivNsGEekgLzlL5gUSf/81dCqgMambzpDHAL/7k+U
         bmJR+ty8AhG9TfyVnceVHuxsvUVa0KEmCGn564GbAPcm1aVr5HhPyadAbJR2WK3EwxYQ
         e51htsDMYPPnUu2KrhJHVjHR/mNFY74nJCIeZMMnUbzaizyKvRZ+7b1fusxNapEgV5rf
         +lG4t90FG+3BAn1/beHjVzbM2KENz/91MLkC1YBXlHS+KtEKapadviz6+bw16RgFNZOU
         2RYCThIzGC0hwZ5q+m1YpfZ5NaVbe25AIQ1Edoi4rX+cERbQLsG7L/FCw0EboKYDEzki
         UsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=gYlvSOH2ZR9yG5YZYS73Kks2lSHpxherM/3sStGglc4=;
        b=DATvR1+tUyABmbOtwn2gaWsDySyrONQC00XvMi+C3Y9GXvXxJ72+OnhF7y1urDydi4
         xLgOhfz4xGNxmvgFJOc8d45OPuB027Z2y+0Ur0rILYjxKrMxpxKzBxWf3r9YaJkSCPB9
         tM13J/jrbp7XHuTtzKS2PDKvtnfbm2R2Ya0j+YcuCx+s7HqclvmzVo343ikyKZy4H8PD
         EH+j43rT9YK5wW/g4x5fc6t/OL2VnNfxBf44jOADbqZlwQKQz2hn/19x/ewoEKx74jDE
         qWpxuDVCIW6H782wEUJmZu9MkXlo26KMtBcMhQlLsbtwKPbiY2GUe7Fkyn1O2wdvcazQ
         5Ong==
X-Gm-Message-State: ACgBeo094dwL6zlUdYESZm7CZNe5YA1uNZ1Ns5YuVDxQFXd+mj7xXP3N
        MY7mnrNOjjL+ZwduhZMWk8p7Kw==
X-Google-Smtp-Source: AA6agR4BSkJikacdrzsgi9+x3yFGN1+/XRQnM3CVNSTuiVQe3d9K9BmB1TO0kshDrImlqJDE9oUeKA==
X-Received: by 2002:a2e:a44c:0:b0:25e:7181:dc7a with SMTP id v12-20020a2ea44c000000b0025e7181dc7amr2026838ljn.504.1660910911386;
        Fri, 19 Aug 2022 05:08:31 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id i9-20020a198c49000000b0048b31fa9f3asm616101lfj.179.2022.08.19.05.08.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:08:30 -0700 (PDT)
Message-ID: <a2d671da-ff4d-5c7e-7136-63cd51098207@linaro.org>
Date:   Fri, 19 Aug 2022 15:08:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 1/3] driver: input: matric-keypad: switch to gpiod
Content-Language: en-US
To:     Gireesh.Hiremath@in.bosch.com, linux-omap@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org, bcousson@baylibre.com,
        tony@atomide.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, dmitry.torokhov@gmail.com,
        mkorpershoek@baylibre.com, davidgow@google.com,
        m.felsch@pengutronix.de, swboyd@chromium.org,
        fengping.yu@mediatek.com, y.oudjana@protonmail.com,
        rdunlap@infradead.org, colin.king@intel.com
Cc:     sjoerd.simons@collabora.co.uk, VinayKumar.Shettar@in.bosch.com,
        Govindaraji.Sivanantham@in.bosch.com, anaclaudia.dias@de.bosch.com
References: <20220819065946.9572-1-Gireesh.Hiremath@in.bosch.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819065946.9572-1-Gireesh.Hiremath@in.bosch.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 19/08/2022 09:59, Gireesh.Hiremath@in.bosch.com wrote:
> From: Gireesh Hiremath <Gireesh.Hiremath@in.bosch.com>
> 
> Switch from gpio API to gpiod API
> 
> Signed-off-by: Gireesh Hiremath <Gireesh.Hiremath@in.bosch.com>
> 
> Gbp-Pq: Topic apertis/guardian
> Gbp-Pq: Name driver-input-matric-keypad-switch-gpio-to-gpiod.patch

What's that? I don't recall such tags in Linux kernel process... Is it
documented anywhere?

Best regards,
Krzysztof
