Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3003712951
	for <lists+linux-omap@lfdr.de>; Fri,  3 May 2019 09:58:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725798AbfECH5a (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 3 May 2019 03:57:30 -0400
Received: from smtp-out.xnet.cz ([178.217.244.18]:44678 "EHLO smtp-out.xnet.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727144AbfECH4v (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 3 May 2019 03:56:51 -0400
Received: from meh.true.cz (meh.true.cz [108.61.167.218])
        (Authenticated sender: petr@true.cz)
        by smtp-out.xnet.cz (Postfix) with ESMTPSA id D67AB3580;
        Fri,  3 May 2019 09:56:46 +0200 (CEST)
Received: by meh.true.cz (OpenSMTPD) with ESMTP id e74a7e0f;
        Fri, 3 May 2019 09:56:44 +0200 (CEST)
From:   =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To:     netdev@vger.kernel.org, devicetree@vger.kernel.org,
        Andreas Larsson <andreas@gaisler.com>,
        Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Vince Bridgers <vbridger@opensource.altera.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Sunil Goutham <sgoutham@cavium.com>,
        Robert Richter <rric@kernel.org>,
        Fugang Duan <fugang.duan@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Vitaly Bordug <vbordug@ru.mvista.com>,
        Claudiu Manoil <claudiu.manoil@freescale.com>,
        Li Yang <leoyang.li@nxp.com>,
        Yisen Zhuang <yisen.zhuang@huawei.com>,
        Salil Mehta <salil.mehta@huawei.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Mirko Lindner <mlindner@marvell.com>,
        Stephen Hemminger <stephen@networkplumber.org>,
        Felix Fietkau <nbd@openwrt.org>,
        John Crispin <john@phrozen.org>,
        Sean Wang <sean.wang@mediatek.com>,
        Nelson Chang <nelson.chang@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Byungho An <bh74.an@samsung.com>,
        Girish K S <ks.giri@samsung.com>,
        Vipul Pandya <vipul.pandya@samsung.com>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Wingman Kwok <w-kwok2@ti.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>,
        Anirudha Sarangi <anirudh@xilinx.com>,
        John Linn <John.Linn@xilinx.com>,
        "David S. Miller" <davem@davemloft.net>
Cc:     Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH v3 05/10] net: ethernet: support of_get_mac_address new ERR_PTR error
Date:   Fri,  3 May 2019 09:56:02 +0200
Message-Id: <1556870168-26864-6-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556870168-26864-1-git-send-email-ynezz@true.cz>
References: <1556870168-26864-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

There was NVMEM support added to of_get_mac_address, so it could now
return NULL and ERR_PTR encoded error values, so we need to adjust all
current users of of_get_mac_address to this new fact.

While at it, remove superfluous is_valid_ether_addr as the MAC address
returned from of_get_mac_address is always valid and checked by
is_valid_ether_addr anyway.

Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 drivers/net/ethernet/aeroflex/greth.c                 | 2 +-
 drivers/net/ethernet/allwinner/sun4i-emac.c           | 2 +-
 drivers/net/ethernet/altera/altera_tse_main.c         | 2 +-
 drivers/net/ethernet/arc/emac_main.c                  | 2 +-
 drivers/net/ethernet/aurora/nb8800.c                  | 2 +-
 drivers/net/ethernet/broadcom/bcmsysport.c            | 2 +-
 drivers/net/ethernet/broadcom/bgmac-bcma.c            | 2 +-
 drivers/net/ethernet/broadcom/bgmac-platform.c        | 2 +-
 drivers/net/ethernet/broadcom/genet/bcmgenet.c        | 2 +-
 drivers/net/ethernet/cavium/octeon/octeon_mgmt.c      | 2 +-
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c     | 2 +-
 drivers/net/ethernet/davicom/dm9000.c                 | 2 +-
 drivers/net/ethernet/ethoc.c                          | 2 +-
 drivers/net/ethernet/ezchip/nps_enet.c                | 2 +-
 drivers/net/ethernet/freescale/fec_main.c             | 2 +-
 drivers/net/ethernet/freescale/fec_mpc52xx.c          | 2 +-
 drivers/net/ethernet/freescale/fman/mac.c             | 2 +-
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 2 +-
 drivers/net/ethernet/freescale/gianfar.c              | 2 +-
 drivers/net/ethernet/freescale/ucc_geth.c             | 2 +-
 drivers/net/ethernet/hisilicon/hisi_femac.c           | 2 +-
 drivers/net/ethernet/hisilicon/hix5hd2_gmac.c         | 2 +-
 drivers/net/ethernet/lantiq_xrx200.c                  | 2 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c            | 2 +-
 drivers/net/ethernet/marvell/mvneta.c                 | 2 +-
 drivers/net/ethernet/marvell/pxa168_eth.c             | 2 +-
 drivers/net/ethernet/marvell/sky2.c                   | 2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.c           | 2 +-
 drivers/net/ethernet/micrel/ks8851.c                  | 2 +-
 drivers/net/ethernet/micrel/ks8851_mll.c              | 2 +-
 drivers/net/ethernet/microchip/enc28j60.c             | 2 +-
 drivers/net/ethernet/nxp/lpc_eth.c                    | 2 +-
 drivers/net/ethernet/qualcomm/qca_spi.c               | 2 +-
 drivers/net/ethernet/qualcomm/qca_uart.c              | 2 +-
 drivers/net/ethernet/renesas/ravb_main.c              | 2 +-
 drivers/net/ethernet/renesas/sh_eth.c                 | 2 +-
 drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c   | 2 +-
 drivers/net/ethernet/socionext/sni_ave.c              | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     | 2 +-
 drivers/net/ethernet/ti/cpsw.c                        | 2 +-
 drivers/net/ethernet/ti/netcp_core.c                  | 2 +-
 drivers/net/ethernet/wiznet/w5100.c                   | 2 +-
 drivers/net/ethernet/xilinx/ll_temac_main.c           | 2 +-
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c     | 2 +-
 drivers/net/ethernet/xilinx/xilinx_emaclite.c         | 2 +-
 net/ethernet/eth.c                                    | 2 +-
 46 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/net/ethernet/aeroflex/greth.c b/drivers/net/ethernet/aeroflex/greth.c
index 47e5984..ce4d2a5 100644
--- a/drivers/net/ethernet/aeroflex/greth.c
+++ b/drivers/net/ethernet/aeroflex/greth.c
@@ -1459,7 +1459,7 @@ static int greth_of_probe(struct platform_device *ofdev)
 		const u8 *addr;
 
 		addr = of_get_mac_address(ofdev->dev.of_node);
-		if (addr) {
+		if (!IS_ERR_OR_NULL(addr)) {
 			for (i = 0; i < 6; i++)
 				macaddr[i] = (unsigned int) addr[i];
 		} else {
diff --git a/drivers/net/ethernet/allwinner/sun4i-emac.c b/drivers/net/ethernet/allwinner/sun4i-emac.c
index e1acafa..9708199 100644
--- a/drivers/net/ethernet/allwinner/sun4i-emac.c
+++ b/drivers/net/ethernet/allwinner/sun4i-emac.c
@@ -870,7 +870,7 @@ static int emac_probe(struct platform_device *pdev)
 
 	/* Read MAC-address from DT */
 	mac_addr = of_get_mac_address(np);
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		memcpy(ndev->dev_addr, mac_addr, ETH_ALEN);
 
 	/* Check if the MAC address is valid, if not get a random one */
diff --git a/drivers/net/ethernet/altera/altera_tse_main.c b/drivers/net/ethernet/altera/altera_tse_main.c
index aa1d1f5..99a5149 100644
--- a/drivers/net/ethernet/altera/altera_tse_main.c
+++ b/drivers/net/ethernet/altera/altera_tse_main.c
@@ -1537,7 +1537,7 @@ static int altera_tse_probe(struct platform_device *pdev)
 
 	/* get default MAC address from device tree */
 	macaddr = of_get_mac_address(pdev->dev.of_node);
-	if (macaddr)
+	if (!IS_ERR_OR_NULL(macaddr))
 		ether_addr_copy(ndev->dev_addr, macaddr);
 	else
 		eth_hw_addr_random(ndev);
diff --git a/drivers/net/ethernet/arc/emac_main.c b/drivers/net/ethernet/arc/emac_main.c
index ff3d685..b4bf803 100644
--- a/drivers/net/ethernet/arc/emac_main.c
+++ b/drivers/net/ethernet/arc/emac_main.c
@@ -960,7 +960,7 @@ int arc_emac_probe(struct net_device *ndev, int interface)
 	/* Get MAC address from device tree */
 	mac_addr = of_get_mac_address(dev->of_node);
 
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		memcpy(ndev->dev_addr, mac_addr, ETH_ALEN);
 	else
 		eth_hw_addr_random(ndev);
diff --git a/drivers/net/ethernet/aurora/nb8800.c b/drivers/net/ethernet/aurora/nb8800.c
index 6f56276..30af865 100644
--- a/drivers/net/ethernet/aurora/nb8800.c
+++ b/drivers/net/ethernet/aurora/nb8800.c
@@ -1461,7 +1461,7 @@ static int nb8800_probe(struct platform_device *pdev)
 	dev->irq = irq;
 
 	mac = of_get_mac_address(pdev->dev.of_node);
-	if (mac)
+	if (!IS_ERR_OR_NULL(mac))
 		ether_addr_copy(dev->dev_addr, mac);
 
 	if (!is_valid_ether_addr(dev->dev_addr))
diff --git a/drivers/net/ethernet/broadcom/bcmsysport.c b/drivers/net/ethernet/broadcom/bcmsysport.c
index bc3ac36..c0a8c3c 100644
--- a/drivers/net/ethernet/broadcom/bcmsysport.c
+++ b/drivers/net/ethernet/broadcom/bcmsysport.c
@@ -2548,7 +2548,7 @@ static int bcm_sysport_probe(struct platform_device *pdev)
 
 	/* Initialize netdevice members */
 	macaddr = of_get_mac_address(dn);
-	if (!macaddr || !is_valid_ether_addr(macaddr)) {
+	if (IS_ERR_OR_NULL(macaddr)) {
 		dev_warn(&pdev->dev, "using random Ethernet MAC\n");
 		eth_hw_addr_random(dev);
 	} else {
diff --git a/drivers/net/ethernet/broadcom/bgmac-bcma.c b/drivers/net/ethernet/broadcom/bgmac-bcma.c
index 6fe074c..34d1830 100644
--- a/drivers/net/ethernet/broadcom/bgmac-bcma.c
+++ b/drivers/net/ethernet/broadcom/bgmac-bcma.c
@@ -132,7 +132,7 @@ static int bgmac_probe(struct bcma_device *core)
 		mac = of_get_mac_address(bgmac->dev->of_node);
 
 	/* If no MAC address assigned via device tree, check SPROM */
-	if (!mac) {
+	if (IS_ERR_OR_NULL(mac)) {
 		switch (core->core_unit) {
 		case 0:
 			mac = sprom->et0mac;
diff --git a/drivers/net/ethernet/broadcom/bgmac-platform.c b/drivers/net/ethernet/broadcom/bgmac-platform.c
index 894eda5..2cd7387 100644
--- a/drivers/net/ethernet/broadcom/bgmac-platform.c
+++ b/drivers/net/ethernet/broadcom/bgmac-platform.c
@@ -193,7 +193,7 @@ static int bgmac_probe(struct platform_device *pdev)
 	bgmac->dma_dev = &pdev->dev;
 
 	mac_addr = of_get_mac_address(np);
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		ether_addr_copy(bgmac->net_dev->dev_addr, mac_addr);
 	else
 		dev_warn(&pdev->dev, "MAC address not present in device tree\n");
diff --git a/drivers/net/ethernet/broadcom/genet/bcmgenet.c b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
index 983245c..8f45c6b 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmgenet.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmgenet.c
@@ -3476,7 +3476,7 @@ static int bcmgenet_probe(struct platform_device *pdev)
 
 	if (dn) {
 		macaddr = of_get_mac_address(dn);
-		if (!macaddr) {
+		if (IS_ERR_OR_NULL(macaddr)) {
 			dev_err(&pdev->dev, "can't find MAC address\n");
 			err = -EINVAL;
 			goto err;
diff --git a/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c b/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
index 5359c10..5bc2d61 100644
--- a/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
+++ b/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
@@ -1503,7 +1503,7 @@ static int octeon_mgmt_probe(struct platform_device *pdev)
 
 	mac = of_get_mac_address(pdev->dev.of_node);
 
-	if (mac)
+	if (!IS_ERR_OR_NULL(mac))
 		memcpy(netdev->dev_addr, mac, ETH_ALEN);
 	else
 		eth_hw_addr_random(netdev);
diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index 673c57b..d29ece0 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1484,7 +1484,7 @@ static int bgx_init_of_phy(struct bgx *bgx)
 			break;
 
 		mac = of_get_mac_address(node);
-		if (mac)
+		if (!IS_ERR_OR_NULL(mac))
 			ether_addr_copy(bgx->lmac[lmac].mac, mac);
 
 		SET_NETDEV_DEV(&bgx->lmac[lmac].netdev, &bgx->pdev->dev);
diff --git a/drivers/net/ethernet/davicom/dm9000.c b/drivers/net/ethernet/davicom/dm9000.c
index c2586f4..30945da 100644
--- a/drivers/net/ethernet/davicom/dm9000.c
+++ b/drivers/net/ethernet/davicom/dm9000.c
@@ -1412,7 +1412,7 @@ static struct dm9000_plat_data *dm9000_parse_dt(struct device *dev)
 		pdata->flags |= DM9000_PLATF_NO_EEPROM;
 
 	mac_addr = of_get_mac_address(np);
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		memcpy(pdata->dev_addr, mac_addr, sizeof(pdata->dev_addr));
 
 	return pdata;
diff --git a/drivers/net/ethernet/ethoc.c b/drivers/net/ethernet/ethoc.c
index 0f3e7f2..eaf9377 100644
--- a/drivers/net/ethernet/ethoc.c
+++ b/drivers/net/ethernet/ethoc.c
@@ -1153,7 +1153,7 @@ static int ethoc_probe(struct platform_device *pdev)
 		const void *mac;
 
 		mac = of_get_mac_address(pdev->dev.of_node);
-		if (mac)
+		if (!IS_ERR_OR_NULL(mac))
 			ether_addr_copy(netdev->dev_addr, mac);
 		priv->phy_id = -1;
 	}
diff --git a/drivers/net/ethernet/ezchip/nps_enet.c b/drivers/net/ethernet/ezchip/nps_enet.c
index 659f1ad..5ab8c7e 100644
--- a/drivers/net/ethernet/ezchip/nps_enet.c
+++ b/drivers/net/ethernet/ezchip/nps_enet.c
@@ -616,7 +616,7 @@ static s32 nps_enet_probe(struct platform_device *pdev)
 
 	/* set kernel MAC address to dev */
 	mac_addr = of_get_mac_address(dev->of_node);
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		ether_addr_copy(ndev->dev_addr, mac_addr);
 	else
 		eth_hw_addr_random(ndev);
diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index a96ad20..145c611 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -1655,7 +1655,7 @@ static void fec_get_mac(struct net_device *ndev)
 		struct device_node *np = fep->pdev->dev.of_node;
 		if (np) {
 			const char *mac = of_get_mac_address(np);
-			if (mac)
+			if (!IS_ERR_OR_NULL(mac))
 				iap = (unsigned char *) mac;
 		}
 	}
diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net/ethernet/freescale/fec_mpc52xx.c
index c1968b3..3b323bb 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
@@ -902,7 +902,7 @@ static int mpc52xx_fec_probe(struct platform_device *op)
 	 * First try to read MAC address from DT
 	 */
 	mac_addr = of_get_mac_address(np);
-	if (mac_addr) {
+	if (!IS_ERR_OR_NULL(mac_addr)) {
 		memcpy(ndev->dev_addr, mac_addr, ETH_ALEN);
 	} else {
 		struct mpc52xx_fec __iomem *fec = priv->fec;
diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
index 3c21486..f7cfe40 100644
--- a/drivers/net/ethernet/freescale/fman/mac.c
+++ b/drivers/net/ethernet/freescale/fman/mac.c
@@ -724,7 +724,7 @@ static int mac_probe(struct platform_device *_of_dev)
 
 	/* Get the MAC address */
 	mac_addr = of_get_mac_address(mac_node);
-	if (!mac_addr) {
+	if (IS_ERR_OR_NULL(mac_addr)) {
 		dev_err(dev, "of_get_mac_address(%pOF) failed\n", mac_node);
 		err = -EINVAL;
 		goto _return_of_get_parent;
diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index 7c548ed..be70f9e 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -1014,7 +1014,7 @@ static int fs_enet_probe(struct platform_device *ofdev)
 	spin_lock_init(&fep->tx_lock);
 
 	mac_addr = of_get_mac_address(ofdev->dev.of_node);
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		memcpy(ndev->dev_addr, mac_addr, ETH_ALEN);
 
 	ret = fep->ops->allocate_bd(ndev);
diff --git a/drivers/net/ethernet/freescale/gianfar.c b/drivers/net/ethernet/freescale/gianfar.c
index 45fcc96..7e33122 100644
--- a/drivers/net/ethernet/freescale/gianfar.c
+++ b/drivers/net/ethernet/freescale/gianfar.c
@@ -872,7 +872,7 @@ static int gfar_of_init(struct platform_device *ofdev, struct net_device **pdev)
 
 	mac_addr = of_get_mac_address(np);
 
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		memcpy(dev->dev_addr, mac_addr, ETH_ALEN);
 
 	if (model && !strcasecmp(model, "TSEC"))
diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index eb3e65e..d125836 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3910,7 +3910,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	}
 
 	mac_addr = of_get_mac_address(np);
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		memcpy(dev->dev_addr, mac_addr, ETH_ALEN);
 
 	ugeth->ug_info = ug_info;
diff --git a/drivers/net/ethernet/hisilicon/hisi_femac.c b/drivers/net/ethernet/hisilicon/hisi_femac.c
index 2c28088..7e46dc9 100644
--- a/drivers/net/ethernet/hisilicon/hisi_femac.c
+++ b/drivers/net/ethernet/hisilicon/hisi_femac.c
@@ -870,7 +870,7 @@ static int hisi_femac_drv_probe(struct platform_device *pdev)
 			   phy_modes(phy->interface));
 
 	mac_addr = of_get_mac_address(node);
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		ether_addr_copy(ndev->dev_addr, mac_addr);
 	if (!is_valid_ether_addr(ndev->dev_addr)) {
 		eth_hw_addr_random(ndev);
diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
index e5d853b..ed4a3d2 100644
--- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
+++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
@@ -1229,7 +1229,7 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
 	}
 
 	mac_addr = of_get_mac_address(node);
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		ether_addr_copy(ndev->dev_addr, mac_addr);
 	if (!is_valid_ether_addr(ndev->dev_addr)) {
 		eth_hw_addr_random(ndev);
diff --git a/drivers/net/ethernet/lantiq_xrx200.c b/drivers/net/ethernet/lantiq_xrx200.c
index d29104d..2308479 100644
--- a/drivers/net/ethernet/lantiq_xrx200.c
+++ b/drivers/net/ethernet/lantiq_xrx200.c
@@ -478,7 +478,7 @@ static int xrx200_probe(struct platform_device *pdev)
 	}
 
 	mac = of_get_mac_address(np);
-	if (mac && is_valid_ether_addr(mac))
+	if (!IS_ERR_OR_NULL(mac))
 		ether_addr_copy(net_dev->dev_addr, mac);
 	else
 		eth_hw_addr_random(net_dev);
diff --git a/drivers/net/ethernet/marvell/mv643xx_eth.c b/drivers/net/ethernet/marvell/mv643xx_eth.c
index 292a668..aa35f72 100644
--- a/drivers/net/ethernet/marvell/mv643xx_eth.c
+++ b/drivers/net/ethernet/marvell/mv643xx_eth.c
@@ -2749,7 +2749,7 @@ static int mv643xx_eth_shared_of_add_port(struct platform_device *pdev,
 	}
 
 	mac_addr = of_get_mac_address(pnp);
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		memcpy(ppd.mac_addr, mac_addr, ETH_ALEN);
 
 	mv643xx_eth_property(pnp, "tx-queue-size", ppd.tx_queue_size);
diff --git a/drivers/net/ethernet/marvell/mvneta.c b/drivers/net/ethernet/marvell/mvneta.c
index c0a3718..117bcf4 100644
--- a/drivers/net/ethernet/marvell/mvneta.c
+++ b/drivers/net/ethernet/marvell/mvneta.c
@@ -4563,7 +4563,7 @@ static int mvneta_probe(struct platform_device *pdev)
 	}
 
 	dt_mac_addr = of_get_mac_address(dn);
-	if (dt_mac_addr) {
+	if (!IS_ERR_OR_NULL(dt_mac_addr)) {
 		mac_from = "device tree";
 		memcpy(dev->dev_addr, dt_mac_addr, ETH_ALEN);
 	} else {
diff --git a/drivers/net/ethernet/marvell/pxa168_eth.c b/drivers/net/ethernet/marvell/pxa168_eth.c
index 35f2142..ce037e8 100644
--- a/drivers/net/ethernet/marvell/pxa168_eth.c
+++ b/drivers/net/ethernet/marvell/pxa168_eth.c
@@ -1461,7 +1461,7 @@ static int pxa168_eth_probe(struct platform_device *pdev)
 	if (pdev->dev.of_node)
 		mac_addr = of_get_mac_address(pdev->dev.of_node);
 
-	if (mac_addr && is_valid_ether_addr(mac_addr)) {
+	if (!IS_ERR_OR_NULL(mac_addr)) {
 		ether_addr_copy(dev->dev_addr, mac_addr);
 	} else {
 		/* try reading the mac address, if set by the bootloader */
diff --git a/drivers/net/ethernet/marvell/sky2.c b/drivers/net/ethernet/marvell/sky2.c
index 8b3495e..821177f 100644
--- a/drivers/net/ethernet/marvell/sky2.c
+++ b/drivers/net/ethernet/marvell/sky2.c
@@ -4808,7 +4808,7 @@ static struct net_device *sky2_init_netdev(struct sky2_hw *hw, unsigned port,
 	 * 2) from internal registers set by bootloader
 	 */
 	iap = of_get_mac_address(hw->pdev->dev.of_node);
-	if (iap)
+	if (!IS_ERR_OR_NULL(iap))
 		memcpy(dev->dev_addr, iap, ETH_ALEN);
 	else
 		memcpy_fromio(dev->dev_addr, hw->regs + B2_MAC_1 + port * 8,
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 549d364..03cb59a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2027,7 +2027,7 @@ static int __init mtk_init(struct net_device *dev)
 	const char *mac_addr;
 
 	mac_addr = of_get_mac_address(mac->of_node);
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		ether_addr_copy(dev->dev_addr, mac_addr);
 
 	/* If the mac address is invalid, use random mac address  */
diff --git a/drivers/net/ethernet/micrel/ks8851.c b/drivers/net/ethernet/micrel/ks8851.c
index 7849119..b1b2896 100644
--- a/drivers/net/ethernet/micrel/ks8851.c
+++ b/drivers/net/ethernet/micrel/ks8851.c
@@ -425,7 +425,7 @@ static void ks8851_init_mac(struct ks8851_net *ks)
 	const u8 *mac_addr;
 
 	mac_addr = of_get_mac_address(ks->spidev->dev.of_node);
-	if (mac_addr) {
+	if (!IS_ERR_OR_NULL(mac_addr)) {
 		memcpy(dev->dev_addr, mac_addr, ETH_ALEN);
 		ks8851_write_mac_addr(dev);
 		return;
diff --git a/drivers/net/ethernet/micrel/ks8851_mll.c b/drivers/net/ethernet/micrel/ks8851_mll.c
index c946841..d44a094 100644
--- a/drivers/net/ethernet/micrel/ks8851_mll.c
+++ b/drivers/net/ethernet/micrel/ks8851_mll.c
@@ -1327,7 +1327,7 @@ static int ks8851_probe(struct platform_device *pdev)
 	/* overwriting the default MAC address */
 	if (pdev->dev.of_node) {
 		mac = of_get_mac_address(pdev->dev.of_node);
-		if (mac)
+		if (!IS_ERR_OR_NULL(mac))
 			memcpy(ks->mac_addr, mac, ETH_ALEN);
 	} else {
 		struct ks8851_mll_platform_data *pdata;
diff --git a/drivers/net/ethernet/microchip/enc28j60.c b/drivers/net/ethernet/microchip/enc28j60.c
index 8f72587..f8d5fd3 100644
--- a/drivers/net/ethernet/microchip/enc28j60.c
+++ b/drivers/net/ethernet/microchip/enc28j60.c
@@ -1588,7 +1588,7 @@ static int enc28j60_probe(struct spi_device *spi)
 	}
 
 	macaddr = of_get_mac_address(spi->dev.of_node);
-	if (macaddr)
+	if (!IS_ERR_OR_NULL(macaddr))
 		ether_addr_copy(dev->dev_addr, macaddr);
 	else
 		eth_hw_addr_random(dev);
diff --git a/drivers/net/ethernet/nxp/lpc_eth.c b/drivers/net/ethernet/nxp/lpc_eth.c
index 89d1739..336b6aa 100644
--- a/drivers/net/ethernet/nxp/lpc_eth.c
+++ b/drivers/net/ethernet/nxp/lpc_eth.c
@@ -1368,7 +1368,7 @@ static int lpc_eth_drv_probe(struct platform_device *pdev)
 
 	if (!is_valid_ether_addr(ndev->dev_addr)) {
 		const char *macaddr = of_get_mac_address(np);
-		if (macaddr)
+		if (!IS_ERR_OR_NULL(macaddr))
 			memcpy(ndev->dev_addr, macaddr, ETH_ALEN);
 	}
 	if (!is_valid_ether_addr(ndev->dev_addr))
diff --git a/drivers/net/ethernet/qualcomm/qca_spi.c b/drivers/net/ethernet/qualcomm/qca_spi.c
index 97f9295..def5192 100644
--- a/drivers/net/ethernet/qualcomm/qca_spi.c
+++ b/drivers/net/ethernet/qualcomm/qca_spi.c
@@ -966,7 +966,7 @@
 
 	mac = of_get_mac_address(spi->dev.of_node);
 
-	if (mac)
+	if (!IS_ERR_OR_NULL(mac))
 		ether_addr_copy(qca->net_dev->dev_addr, mac);
 
 	if (!is_valid_ether_addr(qca->net_dev->dev_addr)) {
diff --git a/drivers/net/ethernet/qualcomm/qca_uart.c b/drivers/net/ethernet/qualcomm/qca_uart.c
index db6068c..ae78066 100644
--- a/drivers/net/ethernet/qualcomm/qca_uart.c
+++ b/drivers/net/ethernet/qualcomm/qca_uart.c
@@ -351,7 +351,7 @@ static int qca_uart_probe(struct serdev_device *serdev)
 
 	mac = of_get_mac_address(serdev->dev.of_node);
 
-	if (mac)
+	if (!IS_ERR_OR_NULL(mac))
 		ether_addr_copy(qca->net_dev->dev_addr, mac);
 
 	if (!is_valid_ether_addr(qca->net_dev->dev_addr)) {
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 8154b38..77e9b02 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -111,7 +111,7 @@ static void ravb_set_buffer_align(struct sk_buff *skb)
  */
 static void ravb_read_mac_address(struct net_device *ndev, const u8 *mac)
 {
-	if (mac) {
+	if (!IS_ERR_OR_NULL(mac)) {
 		ether_addr_copy(ndev->dev_addr, mac);
 	} else {
 		u32 mahr = ravb_read(ndev, MAHR);
diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index e33af37..e89ba82 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -3193,7 +3193,7 @@ static struct sh_eth_plat_data *sh_eth_parse_dt(struct device *dev)
 	pdata->phy_interface = ret;
 
 	mac_addr = of_get_mac_address(np);
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		memcpy(pdata->mac_addr, mac_addr, ETH_ALEN);
 
 	pdata->no_ether_link =
diff --git a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
index fbd00cb..d2bc941 100644
--- a/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
+++ b/drivers/net/ethernet/samsung/sxgbe/sxgbe_platform.c
@@ -124,7 +124,7 @@ static int sxgbe_platform_probe(struct platform_device *pdev)
 	}
 
 	/* Get MAC address if available (DT) */
-	if (mac)
+	if (!IS_ERR_OR_NULL(mac))
 		ether_addr_copy(priv->dev->dev_addr, mac);
 
 	/* Get the TX/RX IRQ numbers */
diff --git a/drivers/net/ethernet/socionext/sni_ave.c b/drivers/net/ethernet/socionext/sni_ave.c
index bb6d5fb..4194ef7 100644
--- a/drivers/net/ethernet/socionext/sni_ave.c
+++ b/drivers/net/ethernet/socionext/sni_ave.c
@@ -1599,7 +1599,7 @@ static int ave_probe(struct platform_device *pdev)
 	ndev->max_mtu = AVE_MAX_ETHFRAME - (ETH_HLEN + ETH_FCS_LEN);
 
 	mac_addr = of_get_mac_address(np);
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		ether_addr_copy(ndev->dev_addr, mac_addr);
 
 	/* if the mac address is invalid, use random mac address */
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 4871243..d3664e6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4262,7 +4262,7 @@ int stmmac_dvr_probe(struct device *device,
 	priv->wol_irq = res->wol_irq;
 	priv->lpi_irq = res->lpi_irq;
 
-	if (res->mac)
+	if (!IS_ERR_OR_NULL(res->mac))
 		memcpy(priv->dev->dev_addr, res->mac, ETH_ALEN);
 
 	dev_set_drvdata(device, priv->dev);
diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index a591583..6aaacaf 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -3344,7 +3344,7 @@ static int cpsw_probe_dt(struct cpsw_platform_data *data,
 
 no_phy_slave:
 		mac_addr = of_get_mac_address(slave_node);
-		if (mac_addr) {
+		if (!IS_ERR_OR_NULL(mac_addr)) {
 			memcpy(slave_data->mac_addr, mac_addr, ETH_ALEN);
 		} else {
 			ret = ti_cm_get_macid(&pdev->dev, i,
diff --git a/drivers/net/ethernet/ti/netcp_core.c b/drivers/net/ethernet/ti/netcp_core.c
index d847f67..c413637 100644
--- a/drivers/net/ethernet/ti/netcp_core.c
+++ b/drivers/net/ethernet/ti/netcp_core.c
@@ -2045,7 +2045,7 @@ static int netcp_create_interface(struct netcp_device *netcp_device,
 		devm_release_mem_region(dev, res.start, size);
 	} else {
 		mac_addr = of_get_mac_address(node_interface);
-		if (mac_addr)
+		if (!IS_ERR_OR_NULL(mac_addr))
 			ether_addr_copy(ndev->dev_addr, mac_addr);
 		else
 			eth_random_addr(ndev->dev_addr);
diff --git a/drivers/net/ethernet/wiznet/w5100.c b/drivers/net/ethernet/wiznet/w5100.c
index d8ba512..b0052933 100644
--- a/drivers/net/ethernet/wiznet/w5100.c
+++ b/drivers/net/ethernet/wiznet/w5100.c
@@ -1164,7 +1164,7 @@ int w5100_probe(struct device *dev, const struct w5100_ops *ops,
 	INIT_WORK(&priv->setrx_work, w5100_setrx_work);
 	INIT_WORK(&priv->restart_work, w5100_restart_work);
 
-	if (mac_addr)
+	if (!IS_ERR_OR_NULL(mac_addr))
 		memcpy(ndev->dev_addr, mac_addr, ETH_ALEN);
 	else
 		eth_hw_addr_random(ndev);
diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
index 44efffb..937dca0 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_main.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
@@ -1077,7 +1077,7 @@ static int temac_of_probe(struct platform_device *op)
 
 	/* Retrieve the MAC address */
 	addr = of_get_mac_address(op->dev.of_node);
-	if (!addr) {
+	if (IS_ERR_OR_NULL(addr)) {
 		dev_err(&op->dev, "could not find MAC address\n");
 		rc = -ENODEV;
 		goto err_iounmap_2;
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 4041c75..55f9d1b 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -1596,7 +1596,7 @@ static int axienet_probe(struct platform_device *pdev)
 
 	/* Retrieve the MAC address */
 	mac_addr = of_get_mac_address(pdev->dev.of_node);
-	if (!mac_addr) {
+	if (IS_ERR_OR_NULL(mac_addr)) {
 		dev_err(&pdev->dev, "could not find MAC address\n");
 		goto free_netdev;
 	}
diff --git a/drivers/net/ethernet/xilinx/xilinx_emaclite.c b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
index b03a417..b7c0058 100644
--- a/drivers/net/ethernet/xilinx/xilinx_emaclite.c
+++ b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
@@ -1143,7 +1143,7 @@ static int xemaclite_of_probe(struct platform_device *ofdev)
 	lp->rx_ping_pong = get_bool(ofdev, "xlnx,rx-ping-pong");
 	mac_address = of_get_mac_address(ofdev->dev.of_node);
 
-	if (mac_address) {
+	if (!IS_ERR_OR_NULL(mac_address)) {
 		/* Set the MAC address. */
 		memcpy(ndev->dev_addr, mac_address, ETH_ALEN);
 	} else {
diff --git a/net/ethernet/eth.c b/net/ethernet/eth.c
index f7a3d7a..b8c126c 100644
--- a/net/ethernet/eth.c
+++ b/net/ethernet/eth.c
@@ -554,7 +554,7 @@ int eth_platform_get_mac_address(struct device *dev, u8 *mac_addr)
 	addr = NULL;
 	if (dp)
 		addr = of_get_mac_address(dp);
-	if (!addr)
+	if (IS_ERR_OR_NULL(addr))
 		addr = arch_get_platform_mac_address();
 
 	if (!addr)
-- 
1.9.1

