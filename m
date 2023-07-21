Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A161175C6D4
	for <lists+linux-omap@lfdr.de>; Fri, 21 Jul 2023 14:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229936AbjGUMWN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 21 Jul 2023 08:22:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjGUMWM (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 21 Jul 2023 08:22:12 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6B8919B0
        for <linux-omap@vger.kernel.org>; Fri, 21 Jul 2023 05:22:10 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-521dbe5e09bso2295852a12.2
        for <linux-omap@vger.kernel.org>; Fri, 21 Jul 2023 05:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689942129; x=1690546929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BWpxgzm4YyqLL1nxw3+KtSqa8xTPS4Bh1HLxz27Ca48=;
        b=A0cs1EZJ3USdSwmD8Zmh3BHe8ECUz3i/LDYB6rwgMenjXjzKol6h9cQafGd3mIi/N8
         KDogdbP7gvOQK1svPbOI6mX7JR7l19JqTN97JPSpqhLrjOUlknE3puy0ugR0398ZLYo8
         naxgj7qN3ZGNjf5lbDutUFiPL5qXCYetmt9kl5B2AWKvU4VWJ/ZZd9h5YVosYSWqiRjt
         W8cq6p8Jyrf5Xrr+g9tereb1+qx1zhbITLmoTVBuYFWR/UOP1naRde+doexBATL0CiJj
         TIqszl/alN3axDgU8rNVOlfgYsyyEbTRdlyyC/Wk2EnMo63bLN3ekuvj+bMT0APDQZgu
         1btA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689942129; x=1690546929;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BWpxgzm4YyqLL1nxw3+KtSqa8xTPS4Bh1HLxz27Ca48=;
        b=NlxlnrW+EGSHPJkbXvebcJgr7MCaXcMGjgNFTJoqJtmQI6Q86eWELELaSAoI99CzuL
         hyrQa8yFlGVAne88RSYhf82H/G4PLYIrSz7whfkCTSwS9jTaQfRX2UsMuH80QEDSB77x
         KGi8cZMrl5fp+PvHnjjCILp1721dry/EuolDl1mZSNlqtseD7u2/o0luk9PlFJJvZvgz
         4l2C8f3vKikMHygqSVfG4pbtCZxXCNvYUd4jAuoXQ9CmIRBCCbFqSeJTFzMm2nyOFRLV
         92V4ZHhqcaSH4QqvqbRvy/Xs3t+mw4K7U3haI0znO7eQYlsaUCriZB43t/lI8u18cqXi
         8pMA==
X-Gm-Message-State: ABy/qLbTyAxQ9ahWc7Q/lcrCB/FjCW8FfWiHhNb62c+UY0N81r+Pxmf/
        crMwJTM6DIcFA6fw+FZ1ZekbuQ==
X-Google-Smtp-Source: APBJJlEgrr+oqGqdLHlHtx6ewGfVXW3b8XDYFP7oP/kY1KKgiXY6CgYY6m3yXZcmQOqvbmIY53YC/Q==
X-Received: by 2002:a05:6402:7c9:b0:51d:98d1:5337 with SMTP id u9-20020a05640207c900b0051d98d15337mr1478707edy.37.1689942129328;
        Fri, 21 Jul 2023 05:22:09 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id u11-20020a056402064b00b0051dfa2e30b2sm2042298edx.9.2023.07.21.05.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jul 2023 05:22:08 -0700 (PDT)
Message-ID: <c3ea2edb-1b3e-2c39-ccf6-333e3c8b9020@linaro.org>
Date:   Fri, 21 Jul 2023 14:22:06 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230721081948.1185360-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21/07/2023 10:19, Alexander Stein wrote:
> Use id-gpios and vbus-gpios instead.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Acked-by: Heiko Stuebner <heiko@sntech.de> #rockchip
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com> #mediatek
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Acked-by: Shawn Guo <shawnguo@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes in v3:
> * Rebased to next-20230721
> * Split from bindings patch

I think you wanted to split it per subsystem, right? That's why you
resent/v3? But the split did not happen. If you decide not to split,
then try to figure out: who should pick up this patchset?

Best regards,
Krzysztof

