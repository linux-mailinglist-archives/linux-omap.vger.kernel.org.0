Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59AC52CFD7E
	for <lists+linux-omap@lfdr.de>; Sat,  5 Dec 2020 19:53:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726116AbgLESfE (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Sat, 5 Dec 2020 13:35:04 -0500
Received: from mx.baikalchip.ru ([94.125.187.42]:53356 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727534AbgLESTm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Sat, 5 Dec 2020 13:19:42 -0500
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        Vineet Gupta <vgupta@synopsys.com>,
        Rafal Milecki <zajec5@gmail.com>,
        Wei Xu <xuwei5@hisilicon.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Jason Cooper <jason@lakedaemon.net>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Benoit Cousson <bcousson@baylibre.com>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Ripard <mripard@kernel.org>,
        Khuong Dinh <khuong@os.amperecomputing.com>,
        Andy Gross <agross@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Hauke Mehrtens <hauke@hauke-m.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Amelie Delaunay <amelie.delaunay@st.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Paul Cercueil <paul@crapouillou.net>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Kukjin Kim <kgene@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jun Li <lijun.kernel@gmail.com>,
        <linux-snps-arc@lists.infradead.org>,
        <bcm-kernel-feedback-list@broadcom.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mips@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linuxppc-dev@lists.ozlabs.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH RESEND v3 00/10] dt-bindings: usb: Harmonize xHCI/EHCI/OHCI/DWC3 nodes name
Date:   Sat, 5 Dec 2020 18:56:11 +0300
Message-ID: <20201205155621.3045-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

As the subject states this series is an attempt to harmonize the xHCI,
EHCI, OHCI and DWC USB3 DT nodes with the DT schema introduced in the
framework of the patchset [1].

Firstly as Krzysztof suggested we've deprecated a support of DWC USB3
controllers with "synopsys,"-vendor prefix compatible string in favor of
the ones with valid "snps,"-prefix. It's done in all the DTS files,
which have been unfortunate to define such nodes.

Secondly we suggest to fix the snps,quirk-frame-length-adjustment property
declaration in the Amlogic meson-g12-common.dtsi DTS file, since it has
been erroneously declared as boolean while having uint32 type. Neil said
it was ok to init that property with 0x20 value.

Thirdly the main part of the patchset concern fixing the xHCI, EHCI/OHCI
and DWC USB3 DT nodes name as in accordance with their DT schema the
corresponding node name is suppose to comply with the Generic USB HCD DT
schema, which requires the USB nodes to have the name acceptable by the
regexp: "^usb(@.*)?". Such requirement had been applicable even before we
introduced the new DT schema in [1], but as we can see it hasn't been
strictly implemented for a lot the DTS files. Since DT schema is now
available the automated DTS validation shall make sure that the rule isn't
violated.

Note most of these patches have been a part of the last three patches of
[1]. But since there is no way to have them merged in in a combined
manner, I had to move them to the dedicated series and split them up so to
be accepted by the corresponding subsystem maintainers one-by-one.

[1] Link: https://lore.kernel.org/linux-usb/20201014101402.18271-1-Sergey.Semin@baikalelectronics.ru/
Changelog v1:
- As Krzysztof suggested I've created a script which checked whether the
  node names had been also updated in all the depended dts files. As a
  result I found two more files which should have been also modified:
  arch/arc/boot/dts/{axc003.dtsi,axc003_idu.dtsi}
- Correct the USB DWC3 nodes name found in
  arch/arm64/boot/dts/apm/{apm-storm.dtsi,apm-shadowcat.dtsi} too.

Link: https://lore.kernel.org/linux-usb/20201020115959.2658-1-Sergey.Semin@baikalelectronics.ru
Changelog v2:
- Drop the patch:
  [PATCH 01/29] usb: dwc3: Discard synopsys,dwc3 compatibility string
  and get back the one which marks the "synopsys,dwc3" compatible string
  as deprecated into the DT schema related series.
- Drop the patches:
  [PATCH 03/29] arm: dts: am437x: Correct DWC USB3 compatible string
  [PATCH 04/29] arm: dts: exynos: Correct DWC USB3 compatible string
  [PATCH 07/29] arm: dts: bcm53x: Harmonize EHCI/OHCI DT nodes name
  [PATCH 08/29] arm: dts: stm32: Harmonize EHCI/OHCI DT nodes name
  [PATCH 16/29] arm: dts: bcm5301x: Harmonize xHCI DT nodes name
  [PATCH 19/29] arm: dts: exynos: Harmonize DWC USB3 DT nodes name
  [PATCH 21/29] arm: dts: ls1021a: Harmonize DWC USB3 DT nodes name
  [PATCH 22/29] arm: dts: omap5: Harmonize DWC USB3 DT nodes name
  [PATCH 24/29] arm64: dts: allwinner: h6: Harmonize DWC USB3 DT nodes name
  [PATCH 26/29] arm64: dts: exynos: Harmonize DWC USB3 DT nodes name
  [PATCH 27/29] arm64: dts: layerscape: Harmonize DWC USB3 DT nodes name
  since they have been applied to the corresponding maintainers repos.
- Fix drivers/usb/dwc3/dwc3-qcom.c to be looking for the "usb@"-prefixed
  sub-node and falling back to the "dwc3@"-prefixed one on failure.

Link: https://lore.kernel.org/linux-usb/20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru
Changelog v3:
- Drop the patches:
  [PATCH v2 04/18] arm: dts: hisi-x5hd2: Harmonize EHCI/OHCI DT nodes name
  [PATCH v2 06/18] arm64: dts: hisi: Harmonize EHCI/OHCI DT nodes name
  [PATCH v2 07/18] mips: dts: jz47x: Harmonize EHCI/OHCI DT nodes name
  [PATCH v2 08/18] mips: dts: sead3: Harmonize EHCI/OHCI DT nodes name
  [PATCH v2 09/18] mips: dts: ralink: mt7628a: Harmonize EHCI/OHCI DT nodes name
  [PATCH v2 11/18] arm64: dts: marvell: cp11x: Harmonize xHCI DT nodes name
  [PATCH v2 12/18] arm: dts: marvell: armada-375: Harmonize DWC USB3 DT nodes name
  [PATCH v2 16/18] arm64: dts: hi3660: Harmonize DWC USB3 DT nodes name
  since they have been applied to the corresponding maintainers repos.

Cc: Vineet Gupta <vgupta@synopsys.com>
Cc: Rafal Milecki <zajec5@gmail.com>
Cc: Wei Xu <xuwei5@hisilicon.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Jason Cooper <jason@lakedaemon.net>
Cc: Santosh Shilimkar <ssantosh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Benoit Cousson <bcousson@baylibre.com>
Cc: Patrice Chotard <patrice.chotard@st.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Khuong Dinh <khuong@os.amperecomputing.com>
Cc: Andy Gross <agross@kernel.org>
Cc: Alexey Brodkin <abrodkin@synopsys.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@st.com>
Cc: Amelie Delaunay <amelie.delaunay@st.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Andrew Lunn <andrew@lunn.ch>
Cc: Gregory Clement <gregory.clement@bootlin.com>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: Kukjin Kim <kgene@kernel.org>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: Jun Li <lijun.kernel@gmail.com>
Cc: linux-snps-arc@lists.infradead.org
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: linux-stm32@st-md-mailman.stormreply.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mips@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: linux-omap@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Serge Semin (10):
  arm: dts: keystone: Correct DWC USB3 compatible string
  arm64: dts: amlogic: meson-g12: Set FL-adj property value
  arc: dts: Harmonize EHCI/OHCI DT nodes name
  arm: dts: lpc18xx: Harmonize EHCI/OHCI DT nodes name
  powerpc: dts: akebono: Harmonize EHCI/OHCI DT nodes name
  arm: dts: keystone: Harmonize DWC USB3 DT nodes name
  arm: dts: stih407-family: Harmonize DWC USB3 DT nodes name
  arm64: dts: apm: Harmonize DWC USB3 DT nodes name
  usb: dwc3: qcom: Detect DWC3 DT-nodes with "usb"-prefixed names
  arm64: dts: qcom: Harmonize DWC USB3 DT nodes name

 arch/arc/boot/dts/axc003.dtsi                     | 4 ++--
 arch/arc/boot/dts/axc003_idu.dtsi                 | 4 ++--
 arch/arc/boot/dts/axs10x_mb.dtsi                  | 4 ++--
 arch/arc/boot/dts/hsdk.dts                        | 4 ++--
 arch/arc/boot/dts/vdk_axs10x_mb.dtsi              | 2 +-
 arch/arm/boot/dts/keystone-k2e.dtsi               | 6 +++---
 arch/arm/boot/dts/keystone.dtsi                   | 4 ++--
 arch/arm/boot/dts/lpc18xx.dtsi                    | 4 ++--
 arch/arm/boot/dts/stih407-family.dtsi             | 2 +-
 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi | 2 +-
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi        | 4 ++--
 arch/arm64/boot/dts/apm/apm-storm.dtsi            | 6 +++---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi      | 4 ++--
 arch/arm64/boot/dts/qcom/ipq8074.dtsi             | 4 ++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi             | 4 ++--
 arch/arm64/boot/dts/qcom/msm8998.dtsi             | 2 +-
 arch/arm64/boot/dts/qcom/qcs404-evb.dtsi          | 2 +-
 arch/arm64/boot/dts/qcom/qcs404.dtsi              | 4 ++--
 arch/arm64/boot/dts/qcom/sc7180.dtsi              | 2 +-
 arch/arm64/boot/dts/qcom/sdm845.dtsi              | 4 ++--
 arch/arm64/boot/dts/qcom/sm8150.dtsi              | 2 +-
 arch/powerpc/boot/dts/akebono.dts                 | 6 +++---
 drivers/usb/dwc3/dwc3-qcom.c                      | 3 ++-
 23 files changed, 42 insertions(+), 41 deletions(-)

-- 
2.29.2

