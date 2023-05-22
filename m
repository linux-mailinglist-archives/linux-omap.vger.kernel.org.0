Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5002570BC8C
	for <lists+linux-omap@lfdr.de>; Mon, 22 May 2023 13:58:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232890AbjEVL6C (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 22 May 2023 07:58:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233179AbjEVL56 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 22 May 2023 07:57:58 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A32C6
        for <linux-omap@vger.kernel.org>; Mon, 22 May 2023 04:57:49 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-309382efe13so3676671f8f.2
        for <linux-omap@vger.kernel.org>; Mon, 22 May 2023 04:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684756668; x=1687348668;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HHcEkVfjNMCd/aY73HBYifBSkk0ncK1u/s9ksPVcuck=;
        b=IgdPlVt4nG7px9jXOf01WXuTWGrW5wyMvYnQWzsr/MDfWomkoWKDe9TB0Bs9NfHL6f
         Yabxv3nQ4nOc+PbkjEOD0/NAD4n6blCWkbWHiLpZRqIKmQ8rzuf8u5MB5Kp5eD2WUKXm
         vBTWCKBgUmIm3aEY0xT1+XF5IHZoh1IZGaPJ5EMJcmUe6+NGnDXy5fNLZJwFJgozaKnT
         8K7PxG5N+lcwXRb7lXWEICcATFmnDzrp2Oe/cACn8TFJH0uxuK7XVG2RhiYZobd5KrVV
         /8OBX/9jTnfCcmtBcwV+LtqciKdo83ZQhrSuFwa7dLl7zK+gRfQZ71f4egFpinGUcdn0
         ROew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684756668; x=1687348668;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHcEkVfjNMCd/aY73HBYifBSkk0ncK1u/s9ksPVcuck=;
        b=Bql91ZmhNbDRQwh+ds785f4SgyEnP1ipIF4u+TawJoWUXbTBFy2Hq5FCu6pm88DytM
         qkNCScdlX9jmy5flSnRQNGdwh8TFCQHgWV48C+B+ALkgELo3dwZmGe5lm5NzB0q4Qvnv
         IVJT46tXOUponmBhpiJkrQxAoxa4xU1IRk7IwPgjGSey6fXz+gea0Cds9kOiYrFKAJ67
         Rv8Nf6hX5jwH/2B9u10XqW4qvhfNnEV+V8fwRBp0RkNrMWon4lm5qBlMMZBscJpzmRRc
         Ey88F5ou9+xv2tSCj8LTCI+kbAkdhpQKAJtZGRggrOoLMGngzOhRg5xRXJqSRkTu4EGH
         WsWg==
X-Gm-Message-State: AC+VfDypDoOs7E+tzHkpY4Ao1RYG2jv4vopZq1Tgr2b0lLTL2igRJOhB
        8pBKwWmpMixM5sxH5i/o/UWUKQ==
X-Google-Smtp-Source: ACHHUZ7f7u7OOpOaDCL+ah3IE7mbWLEGk6YsW0KHmPmbBuQ7fO1vU4CdZ+K6Z5hilhw9Ri2/snKboQ==
X-Received: by 2002:adf:f64c:0:b0:309:43cd:484d with SMTP id x12-20020adff64c000000b0030943cd484dmr7232040wrp.27.1684756667764;
        Mon, 22 May 2023 04:57:47 -0700 (PDT)
Received: from [192.168.1.91] (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id w4-20020adfee44000000b0030785b864f1sm7507400wro.65.2023.05.22.04.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 May 2023 04:57:47 -0700 (PDT)
Message-ID: <e8989a1a-97e0-3964-e588-a5e8115a1076@baylibre.com>
Date:   Mon, 22 May 2023 13:57:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v7 0/6] Add support for TI TPS65219 PMIC.
Content-Language: en-US
From:   jerome Neanne <jneanne@baylibre.com>
To:     Francesco Dolcini <francesco@dolcini.it>
Cc:     lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        shawnguo@kernel.org, geert+renesas@glider.be,
        dmitry.baryshkov@linaro.org, marcel.ziswiler@toradex.com,
        vkoul@kernel.org, biju.das.jz@bp.renesas.com, arnd@arndb.de,
        jeff@labundy.com, afd@ti.com, khilman@baylibre.com,
        narmstrong@baylibre.com, msp@baylibre.com, j-keerthy@ti.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
References: <20221104152311.1098603-1-jneanne@baylibre.com>
 <Y44ztV+2j4krM8mp@francesco-nb.int.toradex.com>
 <753775e9-33f6-031f-8da5-2f65894f44fe@baylibre.com>
In-Reply-To: <753775e9-33f6-031f-8da5-2f65894f44fe@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 06/12/2022 20:22, jerome Neanne wrote:
> 
> 
> On 05/12/2022 19:08, Francesco Dolcini wrote:
>> On Fri, Nov 04, 2022 at 04:23:05PM +0100, Jerome Neanne wrote:
>>> Hi everyone,
>> Hello Jerome,
>>
>> are you planning to have also gpio support added to the driver?

FYI, this is under review:
https://lore.kernel.org/lkml/20230511-tps65219-add-gpio-support-v2-0-60feb64d649a@baylibre.com/
