Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CE7B0564440
	for <lists+linux-omap@lfdr.de>; Sun,  3 Jul 2022 06:19:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbiGCD73 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 2 Jul 2022 23:59:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232523AbiGCD6d (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 2 Jul 2022 23:58:33 -0400
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 664C0B1F2
        for <linux-omap@vger.kernel.org>; Sat,  2 Jul 2022 20:57:40 -0700 (PDT)
Received: by mail-ot1-x32d.google.com with SMTP id e14-20020a9d018e000000b00618ca3183a0so4448740ote.13
        for <linux-omap@vger.kernel.org>; Sat, 02 Jul 2022 20:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dQGA0bu3AQWCuC1GbwRKa+75S+e6lFO1n+xYI6b2Lfw=;
        b=tZaTCT5agJ/W5MTY4ChPtc1XDLJKp4CctBpnrCUIhKNgpN1H67etzBdwWcVgqTh3p5
         Rpws6+KCerTtj8KDgj208++uOAUUNYbZwIshCcigdKA1eDiRz/QItFe1rMw5+GiscOar
         FrzEPYhzQinS0Z91zyAbjw85CcRTp2ENtnixsfT6WRN+TNRS0m0FM6MNH1rMOOCyJxsC
         5P51RWagk0utaomYGvqdFoITuFnEhDzq2tWG4Glt2KJgrHX/T3lrPdg/lUIzBClJzInl
         r208u28GA8/rpcp88qsLSJJlP4Ui0QQT6y6QxDAa5Nnm0OjV33BJKsy7H06YpCqUhiI8
         y4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dQGA0bu3AQWCuC1GbwRKa+75S+e6lFO1n+xYI6b2Lfw=;
        b=gmfbXe7TfMF/iisMSO4qA5FG2Gn/8YTU3llXPJ5AxOdnnMhq/IMbWZTSfCM2WgAa2r
         f9XVGWJOAcMfutl8KISmvl4nwWFNUpIueA4AxHnkol7ok7Z3JwkZ6uZ8f8PVqj/khghf
         vLWg4MlKo6y2FbBv6TMY+sPES9sckhKIkRQHOLdop/8r0pVCtrbb2BEhIUBoSXQ2bUkS
         J2RpPmJBct7S+CE+FgdZubBN7d8+lrq9s9hYUfMzqdXcXaTVjfblMiHjIMmKgyUa/LQr
         eck0l2dT4nDSnF5tQq65pXnXSLWcyKpn6aFByySrpXFX3uCvx5VdDY44wJyIWVL5wPSL
         GBmw==
X-Gm-Message-State: AJIora9PcVTl5JC0QpNffen5afrldAgRIhKrTB6uZborhVYkgq1/aKaI
        aGVJTtmKTaHYOMvg+wf6ZkWGEQ==
X-Google-Smtp-Source: AGRyM1unb+4uUOF604hLcm6sxUx99v9VtXWGjmIJ3dnzzgB49ZjQEqsHZ3kaRUHP0jg6yWxEYqFcqQ==
X-Received: by 2002:a05:6830:1b79:b0:616:af56:2fe7 with SMTP id d25-20020a0568301b7900b00616af562fe7mr9513926ote.262.1656820653608;
        Sat, 02 Jul 2022 20:57:33 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:33 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        arm@kernel.org, Arnd Bergmann <arnd@arndb.de>
Cc:     Li Yang <leoyang.li@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Joel Stanley <joel@jms.id.au>,
        Thierry Reding <thierry.reding@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Tero Kristo <kristo@kernel.org>,
        linux-rockchip@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        linux-gpio@vger.kernel.org, Fabio Estevam <festevam@gmail.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Heiko Stuebner <heiko@sntech.de>, Nishanth Menon <nm@ti.com>,
        Peter Rosin <peda@axentia.se>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Wei Xu <xuwei5@hisilicon.com>, openbmc@lists.ozlabs.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-omap@vger.kernel.org, linux-input@vger.kernel.org,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Andy Gross <agross@kernel.org>,
        linux-mediatek@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: (subset) [PATCH v3 00/40] dt-bindings: input: gpio-keys: rework matching children
Date:   Sat,  2 Jul 2022 22:56:27 -0500
Message-Id: <165682055968.445910.13332143476289618470.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, 15 Jun 2022 17:52:24 -0700, Krzysztof Kozlowski wrote:
> Merging
> =======
> 1. dt-bindings: rebased on top of Rob's:
>    https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/
> 
> 2. DTS patches are independent. They can be picked up directly by sub-arch
>    maintainers, by Arnd or Olof, or eventually by me (if you wish).
> 
> [...]

Applied, thanks!

[25/40] ARM: dts: qcom: align gpio-key node names with dtschema
        commit: 9c17baaa97c89379cbd89e36115b7fb6aba43518

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
