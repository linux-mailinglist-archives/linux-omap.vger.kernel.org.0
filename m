Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33E0A6321C7
	for <lists+linux-omap@lfdr.de>; Mon, 21 Nov 2022 13:20:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbiKUMUM (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 21 Nov 2022 07:20:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbiKUMUJ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 21 Nov 2022 07:20:09 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DFFC58BF5
        for <linux-omap@vger.kernel.org>; Mon, 21 Nov 2022 04:20:08 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id s24so14260116ljs.11
        for <linux-omap@vger.kernel.org>; Mon, 21 Nov 2022 04:20:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ql/KD+IwohAy4hANtNq6VtkS/g5l0YL46q134Ct2/CQ=;
        b=DEOllv4S+jNllwcPXLBSevSZIai6grfaQa9nouhrZ/sAP/WiQgvK5JpZGD+R6tpxkh
         Y62xq/PkYMR6I/Babz+rY1rmbSNvy+YNKxPxKekKjK00GRS0TNTGRsDaE94qsBYkryhm
         nTvtfV/TgAbw1BXiIfBtIDbGeO5sOADvSQQCaLwl7kOC8Q6DFKlP5NbOURRCYyfnGixq
         NK8crUPBtVvQ05V1LJm2HVE4uHv1MF/Q8J+AfxfZWzdlZtRK2P6r6ZCknMiJRhlxt/yF
         opKLTjqrGBBKcm105xQsrLYoiePT6n7pytI9IJ/46SypEwnJa1OqSGZzuWFk9Iy3yZdt
         yDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ql/KD+IwohAy4hANtNq6VtkS/g5l0YL46q134Ct2/CQ=;
        b=a1tCZWLunDrFoyTnuKmmLxw57b6UKn04saD3kuV/0reBFE310vpVdsjw35kaFdaaBi
         WQlfRinWFS+LfVDQDqHvRR0SDULZiEz8Md9yGUxuZBmR1EOjlmxdW0kAKGaY1B+G1J+3
         fZZI0tR3xjmEGq/wYxZa25IBsH3k1YbMt89pzZEgpMOzgKFhEHkGq9ZSA3ryx0kjTGvu
         HrcwbPh2PSaAPNQi8XjjVCE3nzUPvR0L25U2DYtKe0mDILIwnjyj6gW5S8LkLPJtwfwb
         0vmkEPqVlcrCSmuky25r5vz2Y1RqJqYvs7zxgvPiHPaJUpwKm/RBaPgp0gIxq8Hfe14x
         8rtA==
X-Gm-Message-State: ANoB5pk9vNAfSuPZXa1IaXIENac/k1EAPcdz1IeoGbJu6b7fxfCNq6z+
        GngE+lp+fMVmKMbrS26f04Y/Ug==
X-Google-Smtp-Source: AA0mqf5JOTvlnWUH3mBmcBTIBo/ZJ7VuAbzEjnADDx3pGg35CQzJbb9EjqqMo9OrydJhdx2N9GQiGw==
X-Received: by 2002:a05:651c:2390:b0:277:3f37:a36b with SMTP id bk16-20020a05651c239000b002773f37a36bmr5777854ljb.324.1669033206457;
        Mon, 21 Nov 2022 04:20:06 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c12-20020a056512324c00b0048af3c090f8sm2007197lfr.13.2022.11.21.04.20.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 04:20:06 -0800 (PST)
Message-ID: <072068b2-9d98-af27-353d-de8608db0591@linaro.org>
Date:   Mon, 21 Nov 2022 13:20:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: Allow decimal format in addition
 to hex format
Content-Language: en-US
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20221121115525.36362-1-tony@atomide.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221121115525.36362-1-tony@atomide.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/11/2022 12:55, Tony Lindgren wrote:
> Let's allow node numbering in decimal format too.
> 
> Simple human-readable increments/IDs are usually decimal, hex is only for
> addresses as noted by Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>.
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Tony Lindgren <tony@atomide.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

