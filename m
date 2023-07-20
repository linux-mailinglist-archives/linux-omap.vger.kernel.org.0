Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7BE75B10C
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jul 2023 16:19:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjGTOTP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 20 Jul 2023 10:19:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbjGTOTO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 20 Jul 2023 10:19:14 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 177812130
        for <linux-omap@vger.kernel.org>; Thu, 20 Jul 2023 07:19:13 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-992ca792065so145554266b.2
        for <linux-omap@vger.kernel.org>; Thu, 20 Jul 2023 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689862751; x=1690467551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4VuudQmBIXj4G0El46CDTssIhACcrhRIJLPm+Fr5SvU=;
        b=YUoIJB6FDGB8GH6BIYgP+Xi7qygbtlqRaQMXpJ8nIt5EfJ4IG0kcGSVG4mlUxNGjuR
         RGJKmG3FrqEwGeEAGnQDGgBZh2YVjfXwg2IMB7x4FBAmay2AD1xf9anc+HWpid9xoKIM
         9ENuARx2QLT4Y9COjylUEwuQ2HzwhSHCqOWNxoXcLoA3s37p3EaANaE1IGkf1CrkJXXR
         zIj4vBQIzWYlLOzZw1YI0zDqXtXPSOxHCdYMhzoQrqinFEBJQAOYkdQ1MpQsTaN0vIGV
         Ng0dWG8Ah9Zh7Kgws3UWA40f4oc6bI9z3JleFA0bXrHriGW+IeVaTOxhztBnwnA8DCzm
         iXQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689862751; x=1690467551;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4VuudQmBIXj4G0El46CDTssIhACcrhRIJLPm+Fr5SvU=;
        b=e2DNfeIJTAIgYmxO/zeCtyT+BF5CtV5DKnDhaTKhkxlr346+2DBb0pH29bhyXH99tQ
         3L+Dp4OheYEVvuy2dBGUyC8LVjDzD0YjIm8/Y5NRtajDatU7og4aVOSNMcvFNV2Vb73/
         y+4cwTZUxUlP5KWFmlMoZpsnJgSziTjQrg+9y4CFweYANTFWx7gIrlNzRpOCutvgxTPT
         Yz976+Zwl0sO2yaxKzT85ZLZmNMMi8Z25M0olkArI9nmMygvoLvwFE4Bqjj+1Gx4+MwT
         GVnc9q+Zl70OHuvLnUowm9T60vHFqBvfjg0yLHHRXAQn19wnCjmJ2ZyGFfPvSR51GDJY
         hKmg==
X-Gm-Message-State: ABy/qLZnYJfCwwC5nyGyUTF5IrzInbRclw1wRYKDnKr+muaEgKCnMeUP
        7V0tI7UCzB8zbBA86HmmBk3vMg==
X-Google-Smtp-Source: APBJJlGyP/7Ze5TkvrXGj9vY7+AQiDo9OUwh/zphiMxDAR0ol/ibJovtW4iJbyYqEu1ISpX4rU7FNQ==
X-Received: by 2002:a17:906:3055:b0:94a:9f9a:b3c4 with SMTP id d21-20020a170906305500b0094a9f9ab3c4mr5162736ejd.49.1689862751345;
        Thu, 20 Jul 2023 07:19:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id rk15-20020a170907214f00b009927a49ba94sm765690ejb.169.2023.07.20.07.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 07:19:10 -0700 (PDT)
Message-ID: <4b6faf13-e611-ac9a-0365-5eb9661dd309@linaro.org>
Date:   Thu, 20 Jul 2023 16:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 3/3] arm64: dts: Replace deprecated extcon-usb-gpio
 id-gpio/vbus-gpio properties
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
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
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-rockchip@lists.infradead.org
References: <20230615145838.1526919-1-alexander.stein@ew.tq-group.com>
 <20230615145838.1526919-3-alexander.stein@ew.tq-group.com>
 <qezb3o5wsluf5tgbqoe37ibhanhgm3fsflgqpbqiw2t6fycdeb@2xbxbkpybz74>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <qezb3o5wsluf5tgbqoe37ibhanhgm3fsflgqpbqiw2t6fycdeb@2xbxbkpybz74>
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

On 10/07/2023 06:02, Bjorn Andersson wrote:
> On Thu, Jun 15, 2023 at 04:58:38PM +0200, Alexander Stein wrote:
>> Use id-gpios and vbus-gpios instead.
>>
>> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
>> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
> 
> Any objections to me taking this through the qcom tree?

None from me:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

