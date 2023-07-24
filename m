Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5B5F75EC40
	for <lists+linux-omap@lfdr.de>; Mon, 24 Jul 2023 09:10:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjGXHKv (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Jul 2023 03:10:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbjGXHKu (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Jul 2023 03:10:50 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1B13138
        for <linux-omap@vger.kernel.org>; Mon, 24 Jul 2023 00:10:48 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-997c4107d62so591343366b.0
        for <linux-omap@vger.kernel.org>; Mon, 24 Jul 2023 00:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690182647; x=1690787447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QNUo0Kn9Aa2Dgdj2gFIhpNrROHE/bncbbpqnizXf6ac=;
        b=XBUONx0XrgqCY9fZgz3fyLS7sx1wucVYmBIqDiE1WVjoXmXrD5hnDdky2dwBz5wqbl
         wMg5GMkY+wnsGC2EsGFUHcD4mQn5Ioyc/Dvre6LvhEaIF7hvZAnisPUrEX4+wV28NPu5
         WgiomtlgNaDO4CK03pmYWtD5bd9C7jhmZjiy3MMNbCJIdkA4ysFNKjrAWuaY/wJ0cOa1
         aTQk5unjVkodxc555cQ+5rCu+GH8M31LFuEtiZHP9sMQ6YubOLkSgO25cTn+2dXxjqzE
         moQ/3tvLkXOwz4yja8gWW0d+YP9SPOKyjeaCvZ28INSnuBkr2/WNLrh90TsIctezV5JY
         u5ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690182647; x=1690787447;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QNUo0Kn9Aa2Dgdj2gFIhpNrROHE/bncbbpqnizXf6ac=;
        b=AxCc38ixJMrQfXZHteItJaF46ueYdFZ2GeCBHoMq7ED+XRNYTVt+3plHpIgN2z7vYT
         A+XRJllw6WcJQj2l9UzxlO1Umff2e76z3epC6O1JoQDu7ZVUMf8yf0ul3Fxj6DxM9ICX
         EGSMH7E8LhK8KreHZs1LMT474eM2qoVyovoioCuw4NxpQ5IiYhQNQb8ef2eKe1VDQi4n
         4NGZ92mv3miNWMnyLk+Aect8cuPsqzDgLOflup51e0SNKcVDmJdr3e74cnFZ50EGQACN
         hn/vqqNHsY0iqFfiiv20oprjq2b0P/vPOt92ze/PxLc8uuT/V/sAnSWgFQ8V15JlEF5k
         iS/g==
X-Gm-Message-State: ABy/qLbKVrNBndQzJR9WZpHenqkpX+vcLVhRZ4ZrvuXMaF9grYZ62CKk
        q3ph2CX9j5T/yf5nmxe7t2WTEQ==
X-Google-Smtp-Source: APBJJlGqjMKUoeRrImKQFupGiJ2uC2XkQKoD01CqdLe354F8gMvelSbPPWaIJVuA9pyFDHsmHhcJ7g==
X-Received: by 2002:a17:907:75e5:b0:993:a379:6158 with SMTP id jz5-20020a17090775e500b00993a3796158mr8298544ejc.17.1690182647475;
        Mon, 24 Jul 2023 00:10:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id kk7-20020a170907766700b0098df7d0e096sm6294662ejc.54.2023.07.24.00.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 00:10:47 -0700 (PDT)
Message-ID: <e0897453-54b0-2a2c-2bf0-1f771c0c6565@linaro.org>
Date:   Mon, 24 Jul 2023 09:10:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 2/2] arm64: dts: Replace deprecated extcon-usb-gpio
 id-gpio/vbus-gpio properties
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20230721081948.1185360-1-alexander.stein@ew.tq-group.com>
 <20230721081948.1185360-2-alexander.stein@ew.tq-group.com>
 <c3ea2edb-1b3e-2c39-ccf6-333e3c8b9020@linaro.org>
 <3251040.44csPzL39Z@steina-w>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3251040.44csPzL39Z@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 24/07/2023 08:05, Alexander Stein wrote:
> Hi,
> 
> Am Freitag, 21. Juli 2023, 14:22:06 CEST schrieb Krzysztof Kozlowski:
>> On 21/07/2023 10:19, Alexander Stein wrote:
>>> Use id-gpios and vbus-gpios instead.
>>>
>>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>>> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
>>> Reviewed-by: AngeloGioacchino Del Regno
>>> <angelogioacchino.delregno@collabora.com> Acked-by: Shawn Guo
>>> <shawnguo@kernel.org>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> ---
>>> Changes in v3:
>>> * Rebased to next-20230721
>>> * Split from bindings patch
>>
>> I think you wanted to split it per subsystem, right? That's why you
>> resent/v3? But the split did not happen.
> 
> Yes, I split it into dt bindings and DT changes patches. Is this not correct?

We talked about DTS patch - this one. It was already split between
bindings and DTS, so this would not have been a topic at all.

> 
>> If you decide not to split,
>> then try to figure out: who should pick up this patchset?
> 
> Well, intention was one patch for DT bindings maintainers and these two 
> patches for imx maintainer (Shawn AFAIK).

You touch there much more than IMX, so if you intend that you need to be
pretty clear. I see there around 5% of changes from IMX, so targeting
IMX is a weird choice.


> I've send patches separated by arch/
> arm and arch/arm64 in one series, so I'm slightly confused now.

So telling you second time - don't. Split per subsystem.

Best regards,
Krzysztof

