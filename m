Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5EF9B5A216C
	for <lists+linux-omap@lfdr.de>; Fri, 26 Aug 2022 09:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245109AbiHZHGc (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 26 Aug 2022 03:06:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244935AbiHZHGb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 26 Aug 2022 03:06:31 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F98D25E9
        for <linux-omap@vger.kernel.org>; Fri, 26 Aug 2022 00:06:29 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id by6so720657ljb.11
        for <linux-omap@vger.kernel.org>; Fri, 26 Aug 2022 00:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=4wMiB10DWKAsIGrfK9n8/nTyZKEz22qtcMUofwVgOcU=;
        b=eNwzp1KzoyUMHWs4CjfO/mhp+UxQSAzBFS8Frd2G7osH5xdmeJNfkwHppcOKB7hkNy
         aBrcgFnafibpUUMV6G2DGA1hpcPlIbo3FnXJm12HZUFNcuayvcWdUsxOEoJbbdn/DEod
         +yAbjpASLAkAFrOHSYp4FbQ6k+U9rCNhw20ieoce9EC/b5JVUjdUALW7U27mTFW/K9du
         Lju+fU34EY9EiZjRK/bzwkoau9JKp6/aN/GCU/I7+fzXEfghlOuwQmjKPE07DWjGSwPx
         XVZwZqv3HVoHVxErm19gsPwPjRBZlSmZ9ckf+cfVNtRpauXpGPOAB7RyBCYwY9SaKVaK
         pvWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=4wMiB10DWKAsIGrfK9n8/nTyZKEz22qtcMUofwVgOcU=;
        b=fcrreWhSy8lvBabn3dvUuflBoqc5Rx0KRv6sLmso8RozLthlf7YpO7LZanjss+s/WO
         GkNSvHtJNFKeX2Z699Bfy3W4sfadgGfjVIftCf4X1b6ctYX2i+eaG2NKCgSo2r/CYy3T
         4kly9LZ0mMoqp8GEaapiRdm2RLe6jzZ5qDasJWr3fWsG1uZuWV2GivtuCIFSkK+U74Bg
         RPknIbLsoMc0zbdG5STV6raEWO6D/+9alT08lHxSADesAhBaJZ7ckPwYTtxz9NajIrjX
         wYgi5fCoxtOF3S3pxL3Ex+pkESltF8NldVANEnO5RPx3E3rpBpoZWutOsH3Y3WOkaYn0
         a1bw==
X-Gm-Message-State: ACgBeo0RVg+mNSQssf5WBWmBVvCX6Tz36670PZNiRvLX3YiOl/SmqRF7
        txoFzQvlgvmywoFUYoGnqVsYBQ==
X-Google-Smtp-Source: AA6agR6+X76BDtY4oCG20XVZf/XbydGFc7PDTeSFC5U9apBX5+w0myvGBkmD5YLKl5F1HOCKy0wFCA==
X-Received: by 2002:a2e:a589:0:b0:261:b223:488b with SMTP id m9-20020a2ea589000000b00261b223488bmr2087361ljp.33.1661497588252;
        Fri, 26 Aug 2022 00:06:28 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id v20-20020a2e2f14000000b0025e60089f34sm336110ljv.52.2022.08.26.00.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 00:06:27 -0700 (PDT)
Message-ID: <4165f771-c983-b452-5730-d80532658aaf@linaro.org>
Date:   Fri, 26 Aug 2022 10:06:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 0/6] Add support for TI TPS65219 PMIC.
Content-Language: en-US
To:     Markus Schneider-Pargmann <msp@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Lee Jones <lee@kernel.org>, Tony Lindgren <tony@atomide.com>,
        nm@ti.com, kristo@kernel.org
Cc:     Jerome Neanne <jneanne@baylibre.com>, khilman@baylibre.com,
        narmstrong@baylibre.com, j-keerthy@ti.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
        linux-omap@vger.kernel.org
References: <20220825150224.826258-1-msp@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220825150224.826258-1-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 25/08/2022 18:02, Markus Schneider-Pargmann wrote:
> Hi everyone,
> 
> I am submitting this update for Jerome, he will probably do the next
> version again.
> 
> v4 is a lot smaller now as I squashed some patches as requested and
> some were applied. It is mainly the fixes of the things that Lee Jones
> pointed out in his review on v2, thanks for that.
> 
> It is now based on the regulator tree branch for-6.1:
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git

Instead please mention that bindings are already there... Otherwise you
might got premature nak for missing bindings.

Best regards,
Krzysztof
