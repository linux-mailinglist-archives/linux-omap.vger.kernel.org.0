Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7F145FC221
	for <lists+linux-omap@lfdr.de>; Wed, 12 Oct 2022 10:39:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiJLIj1 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 12 Oct 2022 04:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229650AbiJLIjZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 12 Oct 2022 04:39:25 -0400
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBB2CB40E4
        for <linux-omap@vger.kernel.org>; Wed, 12 Oct 2022 01:39:21 -0700 (PDT)
Received: by mail-wm1-x330.google.com with SMTP id iv17so10019077wmb.4
        for <linux-omap@vger.kernel.org>; Wed, 12 Oct 2022 01:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hvXoD/VVs1JfrFZOMMsbQhdRyKbY5BarUuX5aidq38Y=;
        b=B+dmcHrOFnDJsNByaCqbLwnBYeVR0T8Bbjj3U7qdrXVj+1tlt6etlBxhzxZQD9fV7y
         ii2Wmb6253awru1Ql/zEWAvmzKzJMSRiDIypHxoeSWnJGwD8p+QROKqnaCRDTv4qm4Wj
         6klF17H7g7eUfj4mxwU+iQRgEx9+RUnam1+PgUNhAaIaYPXGydBlz0CP/1CdylTXQTtW
         1C9E8U+kkXhHAsPalclwWpNztwrDX3PhoQ8F5Up4H7ZjvVZo8RLx9LFOC9wPOJAVXM9E
         gmdlfbGdN6qK+2ZDVkRYaSfYvxJwBe5MJ7nkySW7VS4oZ+hN53V5Jo3+ySXIgvJDkEj7
         eDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hvXoD/VVs1JfrFZOMMsbQhdRyKbY5BarUuX5aidq38Y=;
        b=MWKlmgJAqCBGafj7WzYhjUy7RL9vMQmadPILV9x4EI2Kvmab9wObdVv8KxzxVv+Nb+
         Ag/x4ixVI/KIy4+vo/85Pdx8Vgclz0hUuOYbLPbALvTXrNOwZBrt8Jr5Pw74sBmKjJf0
         JNUUk+JwC7gdN5Lnk4EUJiFUfnq95E1/0OHXXcEPY6htiKFwMIqpKbLBjv5wvXYgwLWv
         0LUYh52djM4qL249QVTKIYClHy97mac2/f7C6C+dwqeLBESKxox2qndHYTypzxuqiw7Y
         EW5bLvUrqC/4cFD2LIWFBQz1GKhL8t+LxDf9egks71KAxM5OPK1bekGl+XnQCfj7bbnR
         SWWA==
X-Gm-Message-State: ACrzQf1DOoDFsrb3t95fv/z+7MBh2E6qUsn+h8oMNjY1wiWLGwBIGTRY
        GFk5Ff7s0UdnNbw9wTtg2T6ipA==
X-Google-Smtp-Source: AMsMyM4glDiV7BhepjKeAzqByR/Sam3MmgQWqu5AXGC5xtStDmrfsF0R1HiAZt9kVwUa0NaJu/4VSQ==
X-Received: by 2002:a05:600c:46c9:b0:3c6:d853:4cb7 with SMTP id q9-20020a05600c46c900b003c6d8534cb7mr79213wmo.77.1665563960276;
        Wed, 12 Oct 2022 01:39:20 -0700 (PDT)
Received: from [192.168.1.91] (192.201.68.85.rev.sfr.net. [85.68.201.192])
        by smtp.gmail.com with ESMTPSA id p1-20020a5d68c1000000b0022cce7689d3sm16438399wrw.36.2022.10.12.01.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 01:39:19 -0700 (PDT)
Message-ID: <60507e87-cf92-13d9-29d0-83f18a648f4b@baylibre.com>
Date:   Wed, 12 Oct 2022 10:39:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v6 6/6] arm64: defconfig: Add tps65219 as modules
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        nm@ti.com, kristo@kernel.org, dmitry.torokhov@gmail.com,
        krzysztof.kozlowski+dt@linaro.org, catalin.marinas@arm.com,
        will@kernel.org, lee@kernel.org, tony@atomide.com, vigneshr@ti.com,
        bjorn.andersson@linaro.org, shawnguo@kernel.org,
        geert+renesas@glider.be, dmitry.baryshkov@linaro.org,
        marcel.ziswiler@toradex.com, vkoul@kernel.org,
        biju.das.jz@bp.renesas.com, arnd@arndb.de, jeff@labundy.com
Cc:     afd@ti.com, khilman@baylibre.com, narmstrong@baylibre.com,
        msp@baylibre.com, j-keerthy@ti.com, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-input@vger.kernel.org, linux-omap@vger.kernel.org
References: <20221011140549.16761-1-jneanne@baylibre.com>
 <20221011140549.16761-7-jneanne@baylibre.com>
 <72b9809e-d6d7-862a-26b8-221d14ea4322@linaro.org>
From:   jerome Neanne <jneanne@baylibre.com>
In-Reply-To: <72b9809e-d6d7-862a-26b8-221d14ea4322@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 11/10/2022 16:48, Krzysztof Kozlowski wrote:
> On 11/10/2022 10:05, Jerome Neanne wrote:
>> This adds defconfig option to support TPS65219 PMIC, MFD, Regulators
> 
> Do not use "This commit/patch".
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
> 
>> and power-button.
> 
> You explained what you did, which is easily visible. You did not explain
> why you are doing it.
> 
> Best regards,
> Krzysztof
> 
Thanks for pointing me to the detailed guidelines
I'm new to upstream and not well aware of all good practices.

Would below commit message be more suitable:

Add support for the TPS65219 PMIC by enabling MFD, regulator and 
power-button drivers.  All drivers enabled as modules.

Best regards
Jerome
