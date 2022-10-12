Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 251C05FCA18
	for <lists+linux-omap@lfdr.de>; Wed, 12 Oct 2022 19:56:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229454AbiJLR4H (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Oct 2022 13:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229587AbiJLR4H (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Oct 2022 13:56:07 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 258F2D73E2
        for <linux-omap@vger.kernel.org>; Wed, 12 Oct 2022 10:56:03 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id q10-20020a17090a304a00b0020b1d5f6975so2807936pjl.0
        for <linux-omap@vger.kernel.org>; Wed, 12 Oct 2022 10:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=rn/UDIcscu5abOpP3v+WUHTT/jflHG0HmbSWAfN3l54=;
        b=4uAbc7fbIErK5qUn9SAy5Jkng45r6O6mebcOQfFPXDS9n30sCnvMd2bwu66lRPOFKN
         XTKsR/xQAfifYS1nMUKITEX9xpFSYVcZMEq/LSWrJAQY6lWma5wLwE4d+OZkYtIe8Or+
         5/uvyXEjFfQmFRVROMktn/nNrZSrQoDJ2fHnzgwti4B/C0sXkDmi2dWoGBl+eEkUBYuy
         Oo0NLkrKyf7qVI6YWXhdS+9JFEkj22AUtFeB9PIOcx7btBOOqspiVy6ibskfNJ2YzOGd
         JMd/zxLaLtZkiwscZcR69ubsR4sVifHLLmIY9VtxgMpqfkTFSxER1TCwhm5gOVmWDd/p
         btXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rn/UDIcscu5abOpP3v+WUHTT/jflHG0HmbSWAfN3l54=;
        b=f1L8EHmup3BCsuywflgtSdtq+SZ97TtX/qXj1eLRqYXnxPTp4KxuvxjCFoIzy5epb/
         2YQpm5ddANywX3aG4s+FHYEyNOCe834XEC8k2AgUU20rK7mvgTd/W/sj9XeThVsIXhna
         njkFT31rnBUQuWWBav0GqKyxQFWM81HNCYCYbjg/UO6WUEqkHKrD0mHwOLMu3R+r2UAG
         lTZHfY28asSs/gBf3YR8fXhVkqjtz0rssBzjtRmTGKWgd91obOHYCyl9QSIto9Qjhe0s
         7HL2TPMjLLhhOeqjqmMKcwjwtsvMFY2ePXKGKpW+ZyCtLSoDYRi9rduX0pm6bsSeTaeY
         jEQg==
X-Gm-Message-State: ACrzQf1bY5mwjM0nDe0Ilp76/byxsJ3eav8okaZjLybY0vgmzpmCeHwu
        qsOy2/F03Ermr4PVqVX0aJGhxw==
X-Google-Smtp-Source: AMsMyM7zr66pcJj/ae8owjpIzOJuITFx/A8rJzNZeOjMKqUvNZKR6cxqEkmXqJO5rLkZ/6ZIhCu+MA==
X-Received: by 2002:a17:90b:17cf:b0:20d:72eb:fd0c with SMTP id me15-20020a17090b17cf00b0020d72ebfd0cmr6377751pjb.217.1665597362585;
        Wed, 12 Oct 2022 10:56:02 -0700 (PDT)
Received: from localhost ([75.172.140.17])
        by smtp.gmail.com with ESMTPSA id l6-20020a170902f68600b0017f92246e4dsm11047925plg.181.2022.10.12.10.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 10:56:01 -0700 (PDT)
From:   Kevin Hilman <khilman@baylibre.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        jerome Neanne <jneanne@baylibre.com>, lgirdwood@gmail.com,
        broonie@kernel.org, robh+dt@kernel.org, nm@ti.com,
        kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        bjorn.andersson@linaro.org, shawnguo@kernel.org,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, arnd@arndb.de, jeff@labundy.com
Cc:     afd@ti.com, narmstrong@baylibre.com, msp@baylibre.com,
        j-keerthy@ti.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v6 6/6] arm64: defconfig: Add tps65219 as modules
In-Reply-To: <fc1e5799-20ea-de37-6693-e2ea0fb87f13@linaro.org>
References: <20221011140549.16761-1-jneanne@baylibre.com>
 <20221011140549.16761-7-jneanne@baylibre.com>
 <72b9809e-d6d7-862a-26b8-221d14ea4322@linaro.org>
 <60507e87-cf92-13d9-29d0-83f18a648f4b@baylibre.com>
 <fc1e5799-20ea-de37-6693-e2ea0fb87f13@linaro.org>
Date:   Wed, 12 Oct 2022 10:56:00 -0700
Message-ID: <7hzge1hqof.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> On 12/10/2022 04:39, jerome Neanne wrote:
>>> You explained what you did, which is easily visible. You did not explain
>>> why you are doing it.
>>>
>>> Best regards,
>>> Krzysztof
>>>
>> Thanks for pointing me to the detailed guidelines
>> I'm new to upstream and not well aware of all good practices.
>> 
>> Would below commit message be more suitable:
>> 
>> Add support for the TPS65219 PMIC by enabling MFD, regulator and 
>> power-button drivers.  All drivers enabled as modules.
>
> This still says only what you did. I still does not explain why.

Jerome, maybe adding a bit of preamble like:

"Development boards from TI include the TPS65219 PMIC.  Add support..."

Krzysztof, I'm the first to argue for descriptive/verbose changelogs,
but IMO, this is getting a little bit nit-picky.

The series adds a new driver, DTS and defconfig patches to enable
support the new driver.  The "why" for changes to defconfig changes like
this are kind of implied/obvious, and there is lots of precedent for
changelogs of defconfig changes for simple drivers to simply say "enable
X and Y".

If my above suggesion is not enough, please make a suggestion for what
you think would qualify as an appropritate changelong that answers "why"
for a simple driver change.

Kevin




