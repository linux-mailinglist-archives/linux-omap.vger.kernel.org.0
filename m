Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88FD375F38D
	for <lists+linux-omap@lfdr.de>; Mon, 24 Jul 2023 12:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230162AbjGXKkP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 24 Jul 2023 06:40:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjGXKkO (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 24 Jul 2023 06:40:14 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31BED10CB;
        Mon, 24 Jul 2023 03:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1690195189; x=1721731189;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/kATrrWVYVgcfj/srzQQkHMxx2dvHMHic6hEFaMECqg=;
  b=OSMeMsvYt9SG2h17U4uV0W4sHPBmU/axsgaDHftypZq8/EKm60sfYdFh
   st/YN6hbcPGgboTk04t4c/l+4VE+l4dNVlvC6VPmkMDxYnp5s9zhtidvd
   Q/0mUeerTUTWNzKFC8qu5a7d5Ls7wrcThd8pcQDU2VniVXAWmgCAFWbqM
   ke1jMZBFwmIIrH3NAa4iJOBH/7AYRRRjaEvGIW+54LOCd+3peu9BjPzLK
   UVmDOwcA8Ob19MkZBQhNDmTd/Skc3b2GLQkJTknUCTW1RRiNCeCbVrxSJ
   wKB/MYeX+8+1GA/9sCP/Dhe4fzSpcRyBgk4V94R1KSNlm5Ib+7OEu3Eaj
   w==;
X-IronPort-AV: E=Sophos;i="6.01,228,1684792800"; 
   d="scan'208";a="32078481"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 24 Jul 2023 12:39:17 +0200
Received: from steina-w.tq-net.de (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id DAEBC280078;
        Mon, 24 Jul 2023 12:39:16 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: [PATCH v4 0/6] extcon-usb-gpio YAML conversion
Date:   Mon, 24 Jul 2023 12:39:07 +0200
Message-Id: <20230724103914.1779027-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

after some misunderstanding on my side, sorry for that and the noise, v4
series now includes now all the changes for the bindings and DT in
individual patches.
I've transferred the R-b and A-b tags to the individual patches in the
arch/arm64 patches. Only to specific patches, e.g. mediatek, if sent with
#mediatek inidicator, to all patches otherwise. arch/arm has still yet to
receive feedback.

Changes in v4:
* Put bindings and DT changes back into a single series
* Split patches per SoC family

Best regards,
Alexander

Alexander Stein (6):
  dt-bindings: extcon-usb-gpio: convert to DT schema format
  ARM: dts: ti/omap: Replace deprecated extcon-usb-gpio
    id-gpio/vbus-gpio properties
  ARM: dts: nxp/imx: Replace deprecated extcon-usb-gpio
    id-gpio/vbus-gpio properties
  arm64: dts: freescale: Replace deprecated extcon-usb-gpio
    id-gpio/vbus-gpio properties
  arm64: dts: mediatek: Replace deprecated extcon-usb-gpio
    id-gpio/vbus-gpio properties
  arm64: dts: qcom: Replace deprecated extcon-usb-gpio id-gpio/vbus-gpio
    properties

 .../bindings/extcon/extcon-usb-gpio.txt       | 21 --------
 .../bindings/extcon/extcon-usb-gpio.yaml      | 51 +++++++++++++++++++
 .../arm/boot/dts/nxp/imx/imx6qdl-colibri.dtsi |  2 +-
 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi   |  2 +-
 arch/arm/boot/dts/ti/omap/am571x-idk.dts      |  4 +-
 .../boot/dts/ti/omap/am5729-beagleboneai.dts  |  2 +-
 .../boot/dts/ti/omap/am572x-idk-common.dtsi   |  4 +-
 .../arm/boot/dts/ti/omap/dra7-evm-common.dtsi |  4 +-
 arch/arm/boot/dts/ti/omap/dra71-evm.dts       |  4 +-
 .../boot/dts/ti/omap/dra72-evm-common.dtsi    |  4 +-
 arch/arm/boot/dts/ti/omap/dra76-evm.dts       |  4 +-
 .../boot/dts/freescale/imx8mp-msc-sm2s.dtsi   |  2 +-
 .../dts/freescale/imx8mq-tqma8mq-mba8mx.dts   |  2 +-
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts   |  4 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts   |  2 +-
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts      |  2 +-
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts   |  4 +-
 .../boot/dts/qcom/msm8916-acer-a1-724.dts     |  2 +-
 .../boot/dts/qcom/msm8916-alcatel-idol347.dts |  2 +-
 .../boot/dts/qcom/msm8916-gplus-fl8005a.dts   |  2 +-
 .../arm64/boot/dts/qcom/msm8916-huawei-g7.dts |  2 +-
 .../boot/dts/qcom/msm8916-longcheer-l8910.dts |  2 +-
 .../dts/qcom/msm8916-wingtech-wt88047.dts     |  2 +-
 .../qcom/msm8939-sony-xperia-kanuti-tulip.dts |  2 +-
 .../qcom/msm8996-sony-xperia-tone-dora.dts    |  2 +-
 .../dts/qcom/msm8996-sony-xperia-tone.dtsi    |  2 +-
 .../boot/dts/qcom/msm8998-fxtec-pro1.dts      |  2 +-
 .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi |  4 +-
 .../boot/dts/qcom/sda660-inforce-ifc6560.dts  |  2 +-
 .../dts/qcom/sdm630-sony-xperia-nile.dtsi     |  2 +-
 .../boot/dts/qcom/sdm660-xiaomi-lavender.dts  |  2 +-
 .../qcom/sm6125-sony-xperia-seine-pdx201.dts  |  2 +-
 .../dts/qcom/sm6125-xiaomi-laurel-sprout.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi |  2 +-
 34 files changed, 92 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.txt
 create mode 100644 Documentation/devicetree/bindings/extcon/extcon-usb-gpio.yaml

-- 
2.34.1

