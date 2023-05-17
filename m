Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430277075CA
	for <lists+linux-omap@lfdr.de>; Thu, 18 May 2023 01:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjEQXCu (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 17 May 2023 19:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjEQXCt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Wed, 17 May 2023 19:02:49 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0174A44A8
        for <linux-omap@vger.kernel.org>; Wed, 17 May 2023 16:02:47 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAP-0007j9-9U; Thu, 18 May 2023 01:02:45 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAN-000wnZ-18; Thu, 18 May 2023 01:02:43 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1pzQAM-005UVF-2k; Thu, 18 May 2023 01:02:42 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Prashanth K <quic_prashk@quicinc.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joel Stanley <joel@jms.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Lei YU <yulei.sh@bytedance.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        Henry Tian <tianxiaofeng@bytedance.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Al Cooper <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        Gaosheng Cui <cuigaosheng1@huawei.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Paolo Abeni <pabeni@redhat.com>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        Kalle Valo <kvalo@kernel.org>, Kang Chen <void0red@gmail.com>,
        Shaomin Deng <dengshaomin@cdjrlc.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Richard Leitner <richard.leitner@linux.dev>,
        Colin Ian King <colin.i.king@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Zheng Wang <zyytlz.wz@163.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Rob Herring <robh@kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Haotien Hsu <haotienh@nvidia.com>, Jim Lin <jilin@nvidia.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        Sing-Han Chen <singhanc@nvidia.com>,
        Piyush Mehta <piyush.mehta@amd.com>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>,
        Darren Stevens <darren@stevens-zone.net>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Olav Kongas <ok@artecdesign.ee>,
        Artur Bujdoso <artur.bujdoso@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Francesco Dolcini <francesco.dolcini@toradex.com>,
        Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
        Jean Delvare <jdelvare@suse.de>,
        Dongliang Mu <mudongliangabcd@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Dan Carpenter <error27@gmail.com>,
        =?utf-8?q?Samuel_=C4=8Cavoj?= <samuel@cavoj.net>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>
Cc:     linux-usb@vger.kernel.org, kernel@pengutronix.de,
        Roger Quadros <rogerq@kernel.org>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, Andrew Jeffery <andrew@aj.id.au>,
        linux-aspeed@lists.ozlabs.org,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        openbmc@lists.ozlabs.org,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-mediatek@lists.infradead.org, Hongren Zheng <i@zenithal.me>
Subject: [PATCH 00/97] usb: Convert to platform remove callback returning void
Date:   Thu, 18 May 2023 01:01:02 +0200
Message-Id: <20230517230239.187727-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=13896; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fqdhPP54usEi8baXSoJI3FzPlkc2fS3jhA8DcZSCQuk=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkZVvo7YCpz/3hjEBffLjdT8PvX4si+92iw+jNb Tz6v0ULfQiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGVb6AAKCRCPgPtYfRL+ TlYMCACAXHsbcSe2/YxZgpBERFMM+jw4JinGM2u2mtbpocRgDWydlQkNFy06NXz1h2u2LDPPSIk iwAWSLfyjZF5lILnnr1YPqSGMAud+fjVygVXeafiHtV2ZVmijZlE5qO5hIdvYYfYPm00rV346M1 0n6/klc5RNf6vwRbm5bfbW4TL9w/yh7gjm3FhYVqzy2qnbyWjW2RI51VigjlXmPY0yu7Fc+E3/g 977tkeVRRvrmYhF1SBhLzzklWCnQ98bnL+n69yxGNr1WiQY2NG+etq4cDuF0q8cOAYWpmmIt5MX nmIPrvIgStBnrRfZ8cNeWWPjB9kFO+x2K8B7eEv8WwwsqITu
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-omap@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

this series convers the drivers below drivers/usb to the .remove_new()
callback of struct platform_driver(). The motivation is to make the
remove callback less prone for errors and wrong assumptions. See commit
5c5a7680e67b ("platform: Provide a remove callback that returns no
value") for a more detailed rationale.

All drivers converted here already returned zero unconditionally in their
.remove() callback, so converting them to .remove_new() is trivial.

Best regards
Uwe

Uwe Kleine-König (97):
  usb: c67x00-drv: Convert to platform remove callback returning void
  usb: cdns3-imx: Convert to platform remove callback returning void
  usb: cdns3-plat: Convert to platform remove callback returning void
  usb: cdns3-ti: Convert to platform remove callback returning void
  usb: chipidea/ci_hdrc_imx: Convert to platform remove callback
    returning void
  usb: chipidea/ci_hdrc_msm: Convert to platform remove callback
    returning void
  usb: chipidea/ci_hdrc_tegra: Convert to platform remove callback
    returning void
  usb: chipidea/ci_hdrc_usb2: Convert to platform remove callback
    returning void
  usb: chipidea/core: Convert to platform remove callback returning void
  usb: common: usb-conn-gpio: Convert to platform remove callback
    returning void
  usb: dwc2/platform: Convert to platform remove callback returning void
  usb: core: Convert to platform remove callback returning void
  usb: dwc3-am62: Convert to platform remove callback returning void
  usb: dwc3-exynos: Convert to platform remove callback returning void
  usb: dwc3-imx8mp: Convert to platform remove callback returning void
  usb: dwc3-keystone: Convert to platform remove callback returning void
  usb: dwc3-meson-g12a: Convert to platform remove callback returning
    void
  usb: dwc3-of-simple: Convert to platform remove callback returning
    void
  usb: dwc3-omap: Convert to platform remove callback returning void
  usb: dwc3-qcom: Convert to platform remove callback returning void
  usb: dwc3-st: Convert to platform remove callback returning void
  usb: dwc3-xilinx: Convert to platform remove callback returning void
  usb: fotg210: Convert to platform remove callback returning void
  usb: gadget: hid: Convert to platform remove callback returning void
  usb: gadget: aspeed: Convert to platform remove callback returning
    void
  usb: gadget/atmel_usba_udc: Convert to platform remove callback
    returning void
  usb: gadget/bcm63xx_udc: Convert to platform remove callback returning
    void
  usb: bdc: Convert to platform remove callback returning void
  usb: gadget/dummy_hcd: Convert to platform remove callback returning
    void
  usb: gadget/fsl_qe_udc: Convert to platform remove callback returning
    void
  usb: gadget/fusb300_udc: Convert to platform remove callback returning
    void
  usb: gadget/m66592-udc: Convert to platform remove callback returning
    void
  usb: gadget/mv_u3d_core: Convert to platform remove callback returning
    void
  usb: gadget/mv_udc_core: Convert to platform remove callback returning
    void
  usb: gadget/net2272: Convert to platform remove callback returning
    void
  usb: gadget/omap_udc: Convert to platform remove callback returning
    void
  usb: gadget/pxa27x_udc: Convert to platform remove callback returning
    void
  usb: gadget/r8a66597-udc: Convert to platform remove callback
    returning void
  usb: gadget/renesas_usb3: Convert to platform remove callback
    returning void
  usb: gadget/renesas_usbf: Convert to platform remove callback
    returning void
  usb: gadget/rzv2m_usb3drd: Convert to platform remove callback
    returning void
  usb: gadget/snps_udc_plat: Convert to platform remove callback
    returning void
  usb: gadget/tegra-xudc: Convert to platform remove callback returning
    void
  usb: gadget/udc-xilinx: Convert to platform remove callback returning
    void
  usb: ehci-atmel: Convert to platform remove callback returning void
  usb: ehci-brcm: Convert to platform remove callback returning void
  usb: ehci-exynos: Convert to platform remove callback returning void
  usb: ehci-fsl: Convert to platform remove callback returning void
  usb: ehci-grlib: Convert to platform remove callback returning void
  usb: ehci-mv: Convert to platform remove callback returning void
  usb: ehci-npcm7xx: Convert to platform remove callback returning void
  usb: ehci-omap: Convert to platform remove callback returning void
  usb: ehci-orion: Convert to platform remove callback returning void
  usb: ehci-platform: Convert to platform remove callback returning void
  usb: ehci-ppc-of: Convert to platform remove callback returning void
  usb: ehci-sh: Convert to platform remove callback returning void
  usb: ehci-spear: Convert to platform remove callback returning void
  usb: ehci-st: Convert to platform remove callback returning void
  usb: ehci-xilinx-of: Convert to platform remove callback returning
    void
  usb: fsl-mph-dr-of: Convert to platform remove callback returning void
  usb: isp116x-hcd: Convert to platform remove callback returning void
  usb: isp1362-hcd: Convert to platform remove callback returning void
  usb: octeon-hcd: Convert to platform remove callback returning void
  usb: ohci-at91: Convert to platform remove callback returning void
  usb: ohci-da8xx: Convert to platform remove callback returning void
  usb: ohci-exynos: Convert to platform remove callback returning void
  usb: ohci-nxp: Convert to platform remove callback returning void
  usb: ohci-omap: Convert to platform remove callback returning void
  usb: ohci-platform: Convert to platform remove callback returning void
  usb: ohci-ppc-of: Convert to platform remove callback returning void
  usb: ohci-pxa27x: Convert to platform remove callback returning void
  usb: ohci-s3c2410: Convert to platform remove callback returning void
  usb: ohci-sm501: Convert to platform remove callback returning void
  usb: ohci-spear: Convert to platform remove callback returning void
  usb: ohci-st: Convert to platform remove callback returning void
  usb: oxu210hp-hcd: Convert to platform remove callback returning void
  usb: r8a66597-hcd: Convert to platform remove callback returning void
  usb: sl811-hcd: Convert to platform remove callback returning void
  usb: uhci-grlib: Convert to platform remove callback returning void
  usb: uhci-platform: Convert to platform remove callback returning void
  usb: xhci-histb: Convert to platform remove callback returning void
  usb: xhci-mtk: Convert to platform remove callback returning void
  usb: xhci-plat: Convert to platform remove callback returning void
  usb: xhci-tegra: Convert to platform remove callback returning void
  usb: isp1760: Convert to platform remove callback returning void
  usb: misc: eud: Convert to platform remove callback returning void
  usb: misc: usb3503: Convert to platform remove callback returning void
  usb: renesas_usbhs: Convert to platform remove callback returning void
  usb: roles: intel_xhci: Convert to platform remove callback returning
    void
  usb: typec: mux: gpio-sbu: Convert to platform remove callback
    returning void
  usb: typec: intel_pmc_mux: Convert to platform remove callback
    returning void
  usb: typec: qcom-pmic-typec: Convert to platform remove callback
    returning void
  usb: typec: tcpci_mt6360: Convert to platform remove callback
    returning void
  usb: typec: tcpci_mt6360: Convert to platform remove callback
    returning void
  usb: typec: wcove: Convert to platform remove callback returning void
  usb: typec: ucsi: acpi: Convert to platform remove callback returning
    void
  usbip: vhci_hcd: Convert to platform remove callback returning void

 drivers/usb/c67x00/c67x00-drv.c                |  6 ++----
 drivers/usb/cdns3/cdns3-imx.c                  |  6 ++----
 drivers/usb/cdns3/cdns3-plat.c                 |  5 ++---
 drivers/usb/cdns3/cdns3-ti.c                   |  6 ++----
 drivers/usb/chipidea/ci_hdrc_imx.c             |  6 ++----
 drivers/usb/chipidea/ci_hdrc_msm.c             |  6 ++----
 drivers/usb/chipidea/ci_hdrc_tegra.c           |  6 ++----
 drivers/usb/chipidea/ci_hdrc_usb2.c            |  6 ++----
 drivers/usb/chipidea/core.c                    |  6 ++----
 drivers/usb/common/usb-conn-gpio.c             |  6 ++----
 drivers/usb/dwc2/platform.c                    |  6 ++----
 drivers/usb/dwc3/core.c                        |  6 ++----
 drivers/usb/dwc3/dwc3-am62.c                   |  5 ++---
 drivers/usb/dwc3/dwc3-exynos.c                 |  6 ++----
 drivers/usb/dwc3/dwc3-imx8mp.c                 |  6 ++----
 drivers/usb/dwc3/dwc3-keystone.c               |  6 ++----
 drivers/usb/dwc3/dwc3-meson-g12a.c             |  6 ++----
 drivers/usb/dwc3/dwc3-of-simple.c              |  6 ++----
 drivers/usb/dwc3/dwc3-omap.c                   |  6 ++----
 drivers/usb/dwc3/dwc3-qcom.c                   |  6 ++----
 drivers/usb/dwc3/dwc3-st.c                     |  6 ++----
 drivers/usb/dwc3/dwc3-xilinx.c                 |  6 ++----
 drivers/usb/fotg210/fotg210-core.c             |  6 ++----
 drivers/usb/gadget/legacy/hid.c                |  6 ++----
 drivers/usb/gadget/udc/aspeed-vhub/core.c      |  8 +++-----
 drivers/usb/gadget/udc/atmel_usba_udc.c        |  6 ++----
 drivers/usb/gadget/udc/bcm63xx_udc.c           |  6 ++----
 drivers/usb/gadget/udc/bdc/bdc_core.c          |  5 ++---
 drivers/usb/gadget/udc/dummy_hcd.c             | 11 ++++-------
 drivers/usb/gadget/udc/fsl_qe_udc.c            |  6 ++----
 drivers/usb/gadget/udc/fusb300_udc.c           |  6 ++----
 drivers/usb/gadget/udc/m66592-udc.c            |  5 ++---
 drivers/usb/gadget/udc/mv_u3d_core.c           |  6 ++----
 drivers/usb/gadget/udc/mv_udc_core.c           |  6 ++----
 drivers/usb/gadget/udc/net2272.c               |  6 ++----
 drivers/usb/gadget/udc/omap_udc.c              |  6 ++----
 drivers/usb/gadget/udc/pxa27x_udc.c            |  6 ++----
 drivers/usb/gadget/udc/r8a66597-udc.c          |  6 ++----
 drivers/usb/gadget/udc/renesas_usb3.c          |  6 ++----
 drivers/usb/gadget/udc/renesas_usbf.c          |  6 ++----
 drivers/usb/gadget/udc/rzv2m_usb3drd.c         |  6 ++----
 drivers/usb/gadget/udc/snps_udc_plat.c         |  8 +++-----
 drivers/usb/gadget/udc/tegra-xudc.c            |  6 ++----
 drivers/usb/gadget/udc/udc-xilinx.c            |  6 ++----
 drivers/usb/host/ehci-atmel.c                  |  6 ++----
 drivers/usb/host/ehci-brcm.c                   |  5 ++---
 drivers/usb/host/ehci-exynos.c                 |  6 ++----
 drivers/usb/host/ehci-fsl.c                    |  6 ++----
 drivers/usb/host/ehci-grlib.c                  |  6 ++----
 drivers/usb/host/ehci-mv.c                     |  6 ++----
 drivers/usb/host/ehci-npcm7xx.c                |  6 ++----
 drivers/usb/host/ehci-omap.c                   |  6 ++----
 drivers/usb/host/ehci-orion.c                  |  6 ++----
 drivers/usb/host/ehci-platform.c               |  6 ++----
 drivers/usb/host/ehci-ppc-of.c                 |  6 ++----
 drivers/usb/host/ehci-sh.c                     |  6 ++----
 drivers/usb/host/ehci-spear.c                  |  6 ++----
 drivers/usb/host/ehci-st.c                     |  6 ++----
 drivers/usb/host/ehci-xilinx-of.c              |  6 ++----
 drivers/usb/host/fsl-mph-dr-of.c               |  5 ++---
 drivers/usb/host/isp116x-hcd.c                 |  7 +++----
 drivers/usb/host/isp1362-hcd.c                 |  6 ++----
 drivers/usb/host/octeon-hcd.c                  |  6 ++----
 drivers/usb/host/ohci-at91.c                   |  5 ++---
 drivers/usb/host/ohci-da8xx.c                  |  6 ++----
 drivers/usb/host/ohci-exynos.c                 |  6 ++----
 drivers/usb/host/ohci-nxp.c                    |  6 ++----
 drivers/usb/host/ohci-omap.c                   |  5 ++---
 drivers/usb/host/ohci-platform.c               |  6 ++----
 drivers/usb/host/ohci-ppc-of.c                 |  6 ++----
 drivers/usb/host/ohci-pxa27x.c                 |  5 ++---
 drivers/usb/host/ohci-s3c2410.c                |  5 ++---
 drivers/usb/host/ohci-sm501.c                  |  6 ++----
 drivers/usb/host/ohci-spear.c                  |  5 ++---
 drivers/usb/host/ohci-st.c                     |  6 ++----
 drivers/usb/host/oxu210hp-hcd.c                |  6 ++----
 drivers/usb/host/r8a66597-hcd.c                |  5 ++---
 drivers/usb/host/sl811-hcd.c                   |  5 ++---
 drivers/usb/host/uhci-grlib.c                  |  6 ++----
 drivers/usb/host/uhci-platform.c               |  6 ++----
 drivers/usb/host/xhci-histb.c                  |  6 ++----
 drivers/usb/host/xhci-mtk.c                    |  6 ++----
 drivers/usb/host/xhci-plat.c                   |  6 ++----
 drivers/usb/host/xhci-tegra.c                  |  6 ++----
 drivers/usb/isp1760/isp1760-if.c               |  6 ++----
 drivers/usb/misc/qcom_eud.c                    |  6 ++----
 drivers/usb/misc/usb3503.c                     |  6 ++----
 drivers/usb/renesas_usbhs/common.c             |  6 ++----
 drivers/usb/roles/intel-xhci-usb-role-switch.c |  6 ++----
 drivers/usb/typec/mux/gpio-sbu-mux.c           |  6 ++----
 drivers/usb/typec/mux/intel_pmc_mux.c          |  6 ++----
 drivers/usb/typec/qcom-pmic-typec.c            |  6 ++----
 drivers/usb/typec/tcpm/tcpci_mt6360.c          |  5 ++---
 drivers/usb/typec/tcpm/tcpci_mt6370.c          |  6 ++----
 drivers/usb/typec/tcpm/wcove.c                 |  6 ++----
 drivers/usb/typec/ucsi/ucsi_acpi.c             |  6 ++----
 drivers/usb/usbip/vhci_hcd.c                   |  6 ++----
 97 files changed, 199 insertions(+), 379 deletions(-)


base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

