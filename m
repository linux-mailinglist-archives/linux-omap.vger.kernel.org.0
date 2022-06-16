Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9531954D64A
	for <lists+linux-omap@lfdr.de>; Thu, 16 Jun 2022 02:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241758AbiFPAwl (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 15 Jun 2022 20:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245322AbiFPAwj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 15 Jun 2022 20:52:39 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F4151C117
        for <linux-omap@vger.kernel.org>; Wed, 15 Jun 2022 17:52:35 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id z17so101710pff.7
        for <linux-omap@vger.kernel.org>; Wed, 15 Jun 2022 17:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bS44KlBALAfqkwqt9ygLgULcU5dF5vLqiaHLdQBQ0Ho=;
        b=b9HGWtDf4VC1WlcJOpckJNAQ818E19qKR4Cmmaw9dq6l1RKROoGAGdwAQuJHY1TWzl
         9d8UZDXsbJLBco0Mb1u8qunkkNeEz8p4YKAoIRVKgfXsjQdlFnTGFE+PYWdYNqfnpTwx
         G+J3rXn0XoOuWzwcp8JMscWAXzWTkpgqnPwEe+lKQ64ysrFqwMeUg0yemLdbkBJGvuwP
         LsXg1e2Lbq9VWPQ4XXtA8Kd5rr41LFaMju2+8COMibvyvqvNhWQN136z8IHVg2yzC6Gu
         0K6LVJJTdtsPOVTB9JiJcfwGEuF4qNujG40m5c8szT7s4EtSBB0pNd4iXuyGO8yejkja
         kxJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bS44KlBALAfqkwqt9ygLgULcU5dF5vLqiaHLdQBQ0Ho=;
        b=O/WsJXowdZGAATCrGTsGWEcXxg9j8eF3F4MSiu1jUvMs+VCkcjfdGUYRYAILOxM4Aq
         ulPYvJf4j8cmnrt0f5I91w7Fy1dHVOAf0ETmi3cO48kMttlHYgHrFEYhtsal+AD/+8aq
         F6mmDoa6pJvsrykU7khp61n898qpg0EQBONsnzb8Cf71ABGZ/oIdIkwyeaarJu3EFzpe
         8NBxGnfi5DthKwp6LAZO3MEdGCubLot+DfiY4hTs0EbnUoS9/X/puVvmni2iPpGzTQBy
         QhrGc9NGtsZK5DkYnJrqkTK+Z7WeTLqamQuLWdEUN8WUbwRRyYCO4vFzM8b3OtN2OUGL
         aC8g==
X-Gm-Message-State: AJIora/vK/vGbGNttAic8dKI4muWdeMpPa/eeIbP6ffL09N610wt5EwH
        mqlbprnMyJntz8zKEd1Bh+mIDA==
X-Google-Smtp-Source: AGRyM1v62iQJ4p2NmntVYp97jTJ8PjxTfuDqjP+lKe8IZ2Y04aHEh7obpS0MtR3CR9vlb8lk311VYA==
X-Received: by 2002:a63:814a:0:b0:3fc:ee2c:340f with SMTP id t71-20020a63814a000000b003fcee2c340fmr2189807pgd.380.1655340755007;
        Wed, 15 Jun 2022 17:52:35 -0700 (PDT)
Received: from krzk-bin.. ([192.77.111.2])
        by smtp.gmail.com with ESMTPSA id g26-20020aa7875a000000b005183f333721sm259504pfo.87.2022.06.15.17.52.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jun 2022 17:52:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     arm@kernel.org, soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Peter Rosin <peda@axentia.se>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-tegra@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 00/40] dt-bindings: input: gpio-keys: rework matching children
Date:   Wed, 15 Jun 2022 17:52:24 -0700
Message-Id: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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

Hi,

Merging
=======
1. dt-bindings: rebased on top of Rob's:
   https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/

2. DTS patches are independent. They can be picked up directly by sub-arch
   maintainers, by Arnd or Olof, or eventually by me (if you wish).

Changes since v2
================
1. Few node renamings according to comments (at91, rockchip, nuvoton,wpcm450-pinctrl.yaml).
2. Add Rb tags.
3. Drop applied patches: allwinner, amlogic, broadcom and samsung.

Changes since v1
================
Patch 1: Extend gpio-keys nodes pattern to cover buttons, events and switches (Jeff).
Patch 2: Include input.yaml (Dmitry, Rob).
Patch 3: New patch.
New DTS patches.

Best regards,
Krzysztof

Krzysztof Kozlowski (40):
  dt-bindings: input: gpio-keys: enforce node names to match all
    properties
  dt-bindings: input: gpio-keys: reference input.yaml and document
    properties
  dt-bindings: input: gpio-keys: accept also interrupt-extended
  dt-bindings: pinctrl: nuvoton,wpcm450-pinctrl: align key node name
  arm64: dts: apm: correct gpio-keys properties
  arm64: dts: broadcom: align gpio-key node names with dtschema
  arm64: dts: freescale: align gpio-key node names with dtschema
  arm64: dts: freescale: align led node names with dtschema
  arm64: dts: hisilicon: align gpio-key node names with dtschema
  arm64: dts: hisilicon: correct gpio-keys properties
  arm64: dts: marvell: align gpio-key node names with dtschema
  arm64: dts: marvell: armada-3720: align lednode names with dtschema
  ARM: dts: marvell: align gpio-key node names with dtschema
  ARM: dts: marvell: correct gpio-keys properties
  arm64: dts: mediatek: align gpio-key node names with dtschema
  arm64: dts: mediatek: mt7622-bananapi-bpi-r64: align led node names
    with dtschema
  arm64: dts: mediatek: mt7622-rfb1: correct gpio-keys properties
  ARM: dts: mediatek: align gpio-key node names with dtschema
  arm64: dts: tegra: align gpio-key node names with dtschema
  ARM: dts: tegra: align gpio-key node names with dtschema
  arm64: dts: qcom: align gpio-key node names with dtschema
  arm64: dts: qcom: correct gpio-keys properties
  arm64: dts: qcom: sdm630-sony-xperia-nile: drop unneeded status from
    gpio-keys
  arm64: dts: qcom: align led node names with dtschema
  ARM: dts: qcom: align gpio-key node names with dtschema
  arm64: dts: rockchip: align gpio-key node names with dtschema
  ARM: dts: rockchip: align gpio-key node names with dtschema
  ARM: dts: rockchip: rk3288-tinker: correct gpio-keys properties
  arm64: dts: ti: align gpio-key node names with dtschema
  arm64: dts: xilinx: align gpio-key node names with dtschema
  ARM: dts: xilinx: align gpio-key node names with dtschema
  ARM: dts: omap: align gpio-key node names with dtschema
  ARM: dts: omap: correct gpio-keys properties
  ARM: dts: animeo: align gpio-key node names with dtschema
  ARM: dts: animeo: correct gpio-keys properties
  ARM: dts: aspeed: align gpio-key node names with dtschema
  ARM: dts: aspeed: correct gpio-keys properties
  ARM: dts: at91: align gpio-key node names with dtschema
  ARM: dts: at91: correct gpio-keys properties
  ARM: dts: at91: drop unneeded status from gpio-keys

 .../devicetree/bindings/input/gpio-keys.yaml  | 159 +++++++++---------
 .../pinctrl/nuvoton,wpcm450-pinctrl.yaml      |   2 +-
 arch/arm/boot/dts/am335x-evm.dts              |   8 +-
 arch/arm/boot/dts/am335x-guardian.dts         |   2 -
 .../boot/dts/am335x-moxa-uc-2100-common.dtsi  |   4 +-
 .../boot/dts/am335x-moxa-uc-8100-common.dtsi  |   4 +-
 arch/arm/boot/dts/am335x-pcm-953.dtsi         |   4 +-
 arch/arm/boot/dts/am335x-pepper.dts           |   8 +-
 arch/arm/boot/dts/am335x-shc.dts              |   6 +-
 arch/arm/boot/dts/am3517-evm-ui.dtsi          |  20 +--
 arch/arm/boot/dts/am3517-evm.dts              |  18 +-
 arch/arm/boot/dts/am437x-idk-evm.dts          |   6 +-
 arch/arm/boot/dts/animeo_ip.dts               |  10 +-
 arch/arm/boot/dts/armada-370-c200-v2.dts      |   8 +-
 arch/arm/boot/dts/armada-370-rd.dts           |   2 -
 .../boot/dts/armada-370-seagate-nas-xbay.dtsi |   8 +-
 .../armada-370-seagate-personal-cloud.dtsi    |   8 +-
 .../boot/dts/armada-381-netgear-gs110emx.dts  |   2 +-
 .../arm/boot/dts/armada-385-clearfog-gtr.dtsi |   4 +-
 arch/arm/boot/dts/armada-385-linksys.dtsi     |   4 +-
 .../arm/boot/dts/armada-388-clearfog-base.dts |   2 +-
 arch/arm/boot/dts/armada-388-clearfog.dts     |   2 +-
 arch/arm/boot/dts/armada-xp-axpwifiap.dts     |   6 +-
 arch/arm/boot/dts/armada-xp-linksys-mamba.dts |   8 +-
 .../boot/dts/armada-xp-openblocks-ax3-4.dts   |   6 +-
 .../arm/boot/dts/aspeed-bmc-ampere-mtjade.dts |  30 ++--
 .../boot/dts/aspeed-bmc-bytedance-g220a.dts   |  48 +++---
 arch/arm/boot/dts/aspeed-bmc-ibm-everest.dts  |  10 +-
 arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts  |  14 +-
 .../boot/dts/aspeed-bmc-inspur-fp5280g2.dts   |  22 +--
 arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts   |  23 +--
 arch/arm/boot/dts/aspeed-bmc-opp-mowgli.dts   |  20 +--
 arch/arm/boot/dts/aspeed-bmc-opp-nicole.dts   |   2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-palmetto.dts |   2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-romulus.dts  |   2 +-
 arch/arm/boot/dts/aspeed-bmc-opp-swift.dts    |  30 ++--
 arch/arm/boot/dts/aspeed-bmc-opp-tacoma.dts   |  14 +-
 arch/arm/boot/dts/aspeed-bmc-opp-vesnin.dts   |   4 +-
 .../boot/dts/aspeed-bmc-opp-witherspoon.dts   |  16 +-
 arch/arm/boot/dts/aspeed-bmc-opp-zaius.dts    |   4 +-
 arch/arm/boot/dts/at91-foxg20.dts             |   4 +-
 arch/arm/boot/dts/at91-gatwick.dts            |   2 +-
 arch/arm/boot/dts/at91-kizbox.dts             |   8 +-
 arch/arm/boot/dts/at91-kizbox2-common.dtsi    |  10 +-
 arch/arm/boot/dts/at91-kizbox3-hs.dts         |  12 +-
 arch/arm/boot/dts/at91-kizboxmini-common.dtsi |   6 +-
 arch/arm/boot/dts/at91-nattis-2-natte-2.dts   |   2 +-
 arch/arm/boot/dts/at91-qil_a9260.dts          |   4 +-
 arch/arm/boot/dts/at91-sam9x60ek.dts          |   5 +-
 arch/arm/boot/dts/at91-sama5d27_som1_ek.dts   |   4 +-
 arch/arm/boot/dts/at91-sama5d27_wlsom1_ek.dts |   5 +-
 arch/arm/boot/dts/at91-sama5d2_icp.dts        |   5 +-
 arch/arm/boot/dts/at91-sama5d2_ptc_ek.dts     |   4 +-
 arch/arm/boot/dts/at91-sama5d2_xplained.dts   |   4 +-
 arch/arm/boot/dts/at91-sama5d3_xplained.dts   |   4 +-
 arch/arm/boot/dts/at91-sama5d4_xplained.dts   |   4 +-
 arch/arm/boot/dts/at91-sama5d4ek.dts          |   4 +-
 arch/arm/boot/dts/at91-sama7g5ek.dts          |   4 +-
 arch/arm/boot/dts/at91-wb45n.dts              |   7 +-
 arch/arm/boot/dts/at91-wb50n.dts              |  10 +-
 arch/arm/boot/dts/at91sam9260ek.dts           |   6 +-
 arch/arm/boot/dts/at91sam9261ek.dts           |  10 +-
 arch/arm/boot/dts/at91sam9263ek.dts           |   6 +-
 arch/arm/boot/dts/at91sam9g20ek_common.dtsi   |   6 +-
 .../dts/at91sam9g25-gardena-smart-gateway.dts |   2 +-
 arch/arm/boot/dts/at91sam9m10g45ek.dts        |  16 +-
 arch/arm/boot/dts/at91sam9n12ek.dts           |   4 +-
 arch/arm/boot/dts/at91sam9rlek.dts            |   6 +-
 arch/arm/boot/dts/mt7623a-rfb-emmc.dts        |   4 +-
 arch/arm/boot/dts/mt7623a-rfb-nand.dts        |   4 +-
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts |   4 +-
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts        |   4 +-
 arch/arm/boot/dts/mt7629-rfb.dts              |   4 +-
 .../boot/dts/qcom-apq8064-asus-nexus7-flo.dts |   4 +-
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   |   8 +-
 arch/arm/boot/dts/qcom-ipq4018-ap120c-ac.dtsi |   2 +-
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts     |   4 +-
 arch/arm/boot/dts/qcom-ipq8064-v1.0.dtsi      |   6 +-
 .../qcom-msm8974-lge-nexus5-hammerhead.dts    |   4 +-
 .../dts/qcom-msm8974-sony-xperia-rhine.dtsi   |   8 +-
 .../dts/qcom-msm8974pro-fairphone-fp2.dts     |   6 +-
 .../boot/dts/qcom-msm8974pro-samsung-klte.dts |   6 +-
 ...-msm8974pro-sony-xperia-shinano-castor.dts |   8 +-
 arch/arm/boot/dts/rk3066a-bqcurie2.dts        |   4 +-
 arch/arm/boot/dts/rk3066a-rayeager.dts        |   2 +-
 arch/arm/boot/dts/rk3188-bqedison2qc.dts      |   4 +-
 arch/arm/boot/dts/rk3188-px3-evb.dts          |   2 +-
 arch/arm/boot/dts/rk3188-radxarock.dts        |   2 +-
 arch/arm/boot/dts/rk3229-evb.dts              |   2 +-
 arch/arm/boot/dts/rk3288-evb.dtsi             |   2 +-
 arch/arm/boot/dts/rk3288-firefly-reload.dts   |   2 +-
 arch/arm/boot/dts/rk3288-firefly.dtsi         |   2 +-
 arch/arm/boot/dts/rk3288-phycore-rdk.dts      |   4 +-
 arch/arm/boot/dts/rk3288-popmetal.dts         |   2 +-
 arch/arm/boot/dts/rk3288-r89.dts              |   2 +-
 arch/arm/boot/dts/rk3288-rock2-square.dts     |   2 +-
 arch/arm/boot/dts/rk3288-tinker.dtsi          |   4 +-
 .../boot/dts/rk3288-veyron-chromebook.dtsi    |   2 +-
 arch/arm/boot/dts/rk3288-veyron-minnie.dts    |   4 +-
 arch/arm/boot/dts/rk3288-veyron-pinky.dts     |   2 +-
 arch/arm/boot/dts/rk3288-veyron.dtsi          |   2 +-
 arch/arm/boot/dts/tegra114-asus-tf701t.dts    |   8 +-
 arch/arm/boot/dts/tegra114-dalmore.dts        |   8 +-
 arch/arm/boot/dts/tegra114-roth.dts           |   6 +-
 arch/arm/boot/dts/tegra114-tn7.dts            |   6 +-
 arch/arm/boot/dts/tegra124-apalis-eval.dts    |   2 +-
 .../boot/dts/tegra124-apalis-v1.2-eval.dts    |   2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts     |   2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi          |   4 +-
 arch/arm/boot/dts/tegra124-venice2.dts        |   2 +-
 .../boot/dts/tegra20-acer-a500-picasso.dts    |   8 +-
 arch/arm/boot/dts/tegra20-asus-tf101.dts      |   8 +-
 arch/arm/boot/dts/tegra20-colibri-eval-v3.dts |   2 +-
 arch/arm/boot/dts/tegra20-colibri-iris.dts    |   2 +-
 arch/arm/boot/dts/tegra20-harmony.dts         |   2 +-
 arch/arm/boot/dts/tegra20-paz00.dts           |   2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts        |   4 +-
 arch/arm/boot/dts/tegra20-trimslice.dts       |   2 +-
 arch/arm/boot/dts/tegra20-ventana.dts         |   2 +-
 arch/arm/boot/dts/tegra30-apalis-eval.dts     |   2 +-
 .../arm/boot/dts/tegra30-apalis-v1.1-eval.dts |   2 +-
 .../tegra30-asus-nexus7-grouper-common.dtsi   |   8 +-
 .../dts/tegra30-asus-transformer-common.dtsi  |  10 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi         |   6 +-
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts |   2 +-
 arch/arm/boot/dts/tegra30-ouya.dts            |   2 +-
 .../arm/boot/dts/tegra30-pegatron-chagall.dts |  10 +-
 arch/arm/boot/dts/zynq-zc702.dts              |   4 +-
 arch/arm/boot/dts/zynq-zturn-common.dtsi      |   2 +-
 arch/arm64/boot/dts/apm/apm-merlin.dts        |   2 +-
 arch/arm64/boot/dts/apm/apm-mustang.dts       |   2 +-
 .../bcm4906-tplink-archer-c2300-v1.dts        |   8 +-
 .../bcm4908/bcm4908-asus-gt-ac5300.dts        |   8 +-
 .../boot/dts/freescale/fsl-ls1088a-ten64.dts  |  10 +-
 .../boot/dts/freescale/imx8mm-mx8menlo.dts    |   4 +-
 .../dts/freescale/imx8mm-var-som-symphony.dts |   6 +-
 .../dts/freescale/imx8mm-venice-gw700x.dtsi   |   8 +-
 .../dts/freescale/imx8mm-venice-gw7901.dts    |   8 +-
 .../dts/freescale/imx8mm-venice-gw7902.dts    |   8 +-
 .../dts/freescale/imx8mm-venice-gw7903.dts    |   6 +-
 .../boot/dts/freescale/imx8mm-verdin.dtsi     |   2 +-
 .../dts/freescale/imx8mn-var-som-symphony.dts |   6 +-
 .../dts/freescale/imx8mn-venice-gw7902.dts    |   8 +-
 .../boot/dts/freescale/imx8mp-verdin.dtsi     |   2 +-
 .../dts/freescale/imx8mq-librem5-devkit.dts   |   6 +-
 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   4 +-
 .../boot/dts/freescale/imx8mq-nitrogen.dts    |   2 +-
 .../freescale/imx8qxp-colibri-eval-v3.dtsi    |   2 +-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi     |   6 +-
 .../boot/dts/hisilicon/hi3660-hikey960.dts    |   2 +-
 arch/arm64/boot/dts/hisilicon/hip05-d02.dts   |   6 +-
 .../dts/marvell/armada-3720-turris-mox.dts    |   4 +-
 .../marvell/armada-8040-clearfog-gt-8k.dts    |   4 +-
 .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  |  11 +-
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts  |   5 +-
 .../dts/mediatek/mt8173-elm-hana-rev7.dts     |   6 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  |  10 +-
 .../dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |   4 +-
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |   2 +-
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   2 +-
 .../boot/dts/mediatek/pumpkin-common.dtsi     |   4 +-
 .../arm64/boot/dts/nvidia/tegra132-norrin.dts |   4 +-
 .../boot/dts/nvidia/tegra186-p2771-0000.dts   |   6 +-
 .../nvidia/tegra186-p3509-0000+p3636-0001.dts |   6 +-
 .../boot/dts/nvidia/tegra194-p2972-0000.dts   |   4 +-
 .../boot/dts/nvidia/tegra194-p3509-0000.dtsi  |   4 +-
 .../arm64/boot/dts/nvidia/tegra210-p2597.dtsi |   6 +-
 .../arm64/boot/dts/nvidia/tegra210-p2894.dtsi |   2 +-
 .../boot/dts/nvidia/tegra210-p3450-0000.dts   |   4 +-
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts |  10 +-
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts |   6 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts      |   4 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts   |   6 +-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts |   2 +-
 .../arm64/boot/dts/qcom/msm8916-asus-z00l.dts |   4 +-
 .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts |   2 +-
 .../boot/dts/qcom/msm8916-longcheer-l8150.dts |   2 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts |   2 +-
 .../qcom/msm8916-samsung-a2015-common.dtsi    |   6 +-
 .../boot/dts/qcom/msm8916-samsung-j5.dts      |   4 +-
 .../dts/qcom/msm8916-samsung-serranove.dts    |   6 +-
 .../dts/qcom/msm8916-wingtech-wt88047.dts     |   2 +-
 .../boot/dts/qcom/msm8992-xiaomi-libra.dts    |   6 +-
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  |  10 +-
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    |  12 +-
 .../boot/dts/qcom/msm8996-xiaomi-common.dtsi  |   6 +-
 .../boot/dts/qcom/msm8998-fxtec-pro1.dts      |  26 ++-
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi |   6 +-
 .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi |   8 +-
 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |   2 +-
 arch/arm64/boot/dts/qcom/sc7280-idp.dtsi      |   2 +-
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     |  11 +-
 .../boot/dts/qcom/sdm632-fairphone-fp3.dts    |   2 +-
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  |   2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |   2 +-
 arch/arm64/boot/dts/qcom/sdm845-db845c.dts    |  10 +-
 .../boot/dts/qcom/sdm845-oneplus-common.dtsi  |   4 +-
 .../boot/dts/qcom/sdm845-shift-axolotl.dts    |   2 +-
 .../dts/qcom/sdm845-sony-xperia-tama.dtsi     |   2 +-
 .../boot/dts/qcom/sdm845-xiaomi-beryllium.dts |   2 +-
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |   4 +-
 .../qcom/sm6125-sony-xperia-seine-pdx201.dts  |   4 +-
 .../boot/dts/qcom/sm7225-fairphone-fp4.dts    |   2 +-
 arch/arm64/boot/dts/qcom/sm8150-hdk.dts       |   4 +-
 .../dts/qcom/sm8150-microsoft-surface-duo.dts |   4 +-
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts       |   4 +-
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi |   2 +-
 .../dts/qcom/sm8350-sony-xperia-sagami.dtsi   |   2 +-
 arch/arm64/boot/dts/rockchip/rk3308-evb.dts   |   2 +-
 .../boot/dts/rockchip/rk3326-odroid-go2.dts   |  32 ++--
 .../boot/dts/rockchip/rk3328-nanopi-r2s.dts   |   2 +-
 arch/arm64/boot/dts/rockchip/rk3368-evb.dtsi  |   2 +-
 .../boot/dts/rockchip/rk3368-geekbox.dts      |   2 +-
 .../dts/rockchip/rk3368-orion-r68-meta.dts    |   2 +-
 .../boot/dts/rockchip/rk3368-px5-evb.dts      |   2 +-
 arch/arm64/boot/dts/rockchip/rk3368-r88.dts   |   2 +-
 .../boot/dts/rockchip/rk3399-firefly.dts      |   2 +-
 .../dts/rockchip/rk3399-gru-chromebook.dtsi   |   2 +-
 .../boot/dts/rockchip/rk3399-gru-kevin.dts    |   2 +-
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi |   2 +-
 .../boot/dts/rockchip/rk3399-khadas-edge.dtsi |   2 +-
 .../boot/dts/rockchip/rk3399-nanopi-r4s.dts   |   4 +-
 .../boot/dts/rockchip/rk3399-nanopi4.dtsi     |   2 +-
 .../boot/dts/rockchip/rk3399-orangepi.dts     |   2 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts |   4 +-
 .../boot/dts/rockchip/rk3399-roc-pc.dtsi      |   2 +-
 .../boot/dts/rockchip/rk3399-rockpro64.dtsi   |   2 +-
 .../boot/dts/rockchip/rk3399-sapphire.dtsi    |   2 +-
 .../boot/dts/rockchip/rk3566-pinenote.dtsi    |   2 +-
 .../arm64/boot/dts/ti/k3-am654-base-board.dts |   4 +-
 .../dts/ti/k3-j721e-common-proc-board.dts     |   4 +-
 .../boot/dts/xilinx/zynqmp-sm-k26-revA.dts    |   2 +-
 .../boot/dts/xilinx/zynqmp-zcu100-revC.dts    |   2 +-
 .../boot/dts/xilinx/zynqmp-zcu102-revA.dts    |   2 +-
 .../boot/dts/xilinx/zynqmp-zcu106-revA.dts    |   2 +-
 .../boot/dts/xilinx/zynqmp-zcu111-revA.dts    |   2 +-
 236 files changed, 696 insertions(+), 757 deletions(-)

-- 
2.34.1

