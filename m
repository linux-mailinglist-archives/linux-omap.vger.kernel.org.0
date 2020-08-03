Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2B723AEDD
	for <lists+linux-omap@lfdr.de>; Mon,  3 Aug 2020 23:01:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729343AbgHCVB0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Aug 2020 17:01:26 -0400
Received: from mail-il1-f194.google.com ([209.85.166.194]:32825 "EHLO
        mail-il1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728889AbgHCVBZ (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Aug 2020 17:01:25 -0400
Received: by mail-il1-f194.google.com with SMTP id p16so21555130ile.0;
        Mon, 03 Aug 2020 14:01:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bKkfbqtFs4Kbwg3DVrwD4EpvIH0b0CJsDrYNB8t8wYc=;
        b=K4K81kwhURZLjBoN5skJTJbRLhzsDfzeasnLbCI5VohAbnP5ZH+/SfT0Vm9Bu+p09N
         muOOqweLvp0EjYPJPsDSMi4w/sQIDQW11EMhUQXaXw1ZXRT66qCMDsitu9isybSc2uW6
         Q/dgho82FhzK4tgYVxcy+q4Eq2yFci6fWIHFEvMcDUU8CIIarmSOK5kTffI5Knwt/hzs
         nlJ4TnjplXj9KsSV3MWjyTtUylkh3zr375+zzcxKuDvFl1mlTF0numuNjFDaBwOfM4jX
         GO2gCYSakP5dmo9iFEPd/sa1s3TtwjanXGL98hA4jqsAY3QXnUEJ55YaRxPZaWTqvzp5
         gvTg==
X-Gm-Message-State: AOAM532hLjx2c/TyIX1/luReVd8P2M8XEiF4ODujkPWBaIMuIMWkTpXK
        vB81LwUKgQBFIgIprq1YSg==
X-Google-Smtp-Source: ABdhPJw4WMAKi84yjvuB4NlTKVq4hN/CQshetql5tZed0XuQCt7CLqL/x/eQ7de+2ioPLWoU6nJ9fg==
X-Received: by 2002:a92:a112:: with SMTP id v18mr1292705ili.124.1596488484082;
        Mon, 03 Aug 2020 14:01:24 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.252])
        by smtp.googlemail.com with ESMTPSA id r6sm9292280iod.7.2020.08.03.14.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 14:01:23 -0700 (PDT)
From:   Rob Herring <robh@kernel.org>
To:     Bjorn Helgaas <bhelgaas@google.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Binghui Wang <wangbinghui@hisilicon.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jesper Nilsson <jesper.nilsson@axis.com>,
        Jonathan Chocron <jonnyc@amazon.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-tegra@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Murali Karicheri <m-karicheri2@ti.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Pratyush Anand <pratyush.anand@gmail.com>,
        Richard Zhu <hongxing.zhu@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Xiaowei Song <songxiaowei@hisilicon.com>,
        Yue Wang <yue.wang@Amlogic.com>
Subject: [RFC 02/27] PCI: dwc: Use DBI accessors instead of own config accessors
Date:   Mon,  3 Aug 2020 15:00:51 -0600
Message-Id: <20200803210116.3132633-3-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200803210116.3132633-1-robh@kernel.org>
References: <20200803210116.3132633-1-robh@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

The Designware DBI space contains the root bus bridge config space.
Platforms needing custom {rd,wr}_own_conf functions are also the ones
needing custom {read,write}_dbi ops functions and the access sequences
are the same.

Replace all dw_pcie_{rd,wr}_own_conf() calls with the DBI variants in
preparation to remove dw_pcie_{rd,wr}_own_conf().

Cc: Jingoo Han <jingoohan1@gmail.com>
Cc: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../pci/controller/dwc/pcie-designware-host.c | 55 +++++++------------
 1 file changed, 19 insertions(+), 36 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 0a4a5aa6fe46..6232aefbbdb4 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -82,13 +82,13 @@ irqreturn_t dw_handle_msi_irq(struct pcie_port *pp)
 	unsigned long val;
 	u32 status, num_ctrls;
 	irqreturn_t ret = IRQ_NONE;
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 
 	num_ctrls = pp->num_vectors / MAX_MSI_IRQS_PER_CTRL;
 
 	for (i = 0; i < num_ctrls; i++) {
-		dw_pcie_rd_own_conf(pp, PCIE_MSI_INTR0_STATUS +
-					(i * MSI_REG_CTRL_BLOCK_SIZE),
-				    4, &status);
+		status = dw_pcie_readl_dbi(pci, PCIE_MSI_INTR0_STATUS +
+					   (i * MSI_REG_CTRL_BLOCK_SIZE));
 		if (!status)
 			continue;
 
@@ -148,6 +148,7 @@ static int dw_pci_msi_set_affinity(struct irq_data *d,
 static void dw_pci_bottom_mask(struct irq_data *d)
 {
 	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	unsigned int res, bit, ctrl;
 	unsigned long flags;
 
@@ -158,8 +159,7 @@ static void dw_pci_bottom_mask(struct irq_data *d)
 	bit = d->hwirq % MAX_MSI_IRQS_PER_CTRL;
 
 	pp->irq_mask[ctrl] |= BIT(bit);
-	dw_pcie_wr_own_conf(pp, PCIE_MSI_INTR0_MASK + res, 4,
-			    pp->irq_mask[ctrl]);
+	dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_MASK + res, pp->irq_mask[ctrl]);
 
 	raw_spin_unlock_irqrestore(&pp->lock, flags);
 }
@@ -167,6 +167,7 @@ static void dw_pci_bottom_mask(struct irq_data *d)
 static void dw_pci_bottom_unmask(struct irq_data *d)
 {
 	struct pcie_port *pp = irq_data_get_irq_chip_data(d);
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	unsigned int res, bit, ctrl;
 	unsigned long flags;
 
@@ -177,8 +178,7 @@ static void dw_pci_bottom_unmask(struct irq_data *d)
 	bit = d->hwirq % MAX_MSI_IRQS_PER_CTRL;
 
 	pp->irq_mask[ctrl] &= ~BIT(bit);
-	dw_pcie_wr_own_conf(pp, PCIE_MSI_INTR0_MASK + res, 4,
-			    pp->irq_mask[ctrl]);
+	dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_MASK + res, pp->irq_mask[ctrl]);
 
 	raw_spin_unlock_irqrestore(&pp->lock, flags);
 }
@@ -186,13 +186,14 @@ static void dw_pci_bottom_unmask(struct irq_data *d)
 static void dw_pci_bottom_ack(struct irq_data *d)
 {
 	struct pcie_port *pp  = irq_data_get_irq_chip_data(d);
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	unsigned int res, bit, ctrl;
 
 	ctrl = d->hwirq / MAX_MSI_IRQS_PER_CTRL;
 	res = ctrl * MSI_REG_CTRL_BLOCK_SIZE;
 	bit = d->hwirq % MAX_MSI_IRQS_PER_CTRL;
 
-	dw_pcie_wr_own_conf(pp, PCIE_MSI_INTR0_STATUS + res, 4, BIT(bit));
+	dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_STATUS + res, BIT(bit));
 }
 
 static struct irq_chip dw_pci_msi_bottom_irq_chip = {
@@ -310,10 +311,8 @@ void dw_pcie_msi_init(struct pcie_port *pp)
 	msi_target = (u64)pp->msi_data;
 
 	/* Program the msi_data */
-	dw_pcie_wr_own_conf(pp, PCIE_MSI_ADDR_LO, 4,
-			    lower_32_bits(msi_target));
-	dw_pcie_wr_own_conf(pp, PCIE_MSI_ADDR_HI, 4,
-			    upper_32_bits(msi_target));
+	dw_pcie_writel_dbi(pci, PCIE_MSI_ADDR_LO, lower_32_bits(msi_target));
+	dw_pcie_writel_dbi(pci, PCIE_MSI_ADDR_HI, upper_32_bits(msi_target));
 }
 EXPORT_SYMBOL_GPL(dw_pcie_msi_init);
 
@@ -327,7 +326,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 	struct pci_bus *child;
 	struct pci_host_bridge *bridge;
 	struct resource *cfg_res;
-	u32 hdr_type;
 	int ret;
 
 	raw_spin_lock_init(&pci->pp.lock);
@@ -458,21 +456,6 @@ int dw_pcie_host_init(struct pcie_port *pp)
 			goto err_free_msi;
 	}
 
-	ret = dw_pcie_rd_own_conf(pp, PCI_HEADER_TYPE, 1, &hdr_type);
-	if (ret != PCIBIOS_SUCCESSFUL) {
-		dev_err(pci->dev, "Failed reading PCI_HEADER_TYPE cfg space reg (ret: 0x%x)\n",
-			ret);
-		ret = pcibios_err_to_errno(ret);
-		goto err_free_msi;
-	}
-	if (hdr_type != PCI_HEADER_TYPE_BRIDGE) {
-		dev_err(pci->dev,
-			"PCIe controller is not set to bridge type (hdr_type: 0x%x)!\n",
-			hdr_type);
-		ret = -EIO;
-		goto err_free_msi;
-	}
-
 	pp->root_bus_nr = pp->busn->start;
 
 	bridge->dev.parent = dev;
@@ -651,12 +634,12 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 		/* Initialize IRQ Status array */
 		for (ctrl = 0; ctrl < num_ctrls; ctrl++) {
 			pp->irq_mask[ctrl] = ~0;
-			dw_pcie_wr_own_conf(pp, PCIE_MSI_INTR0_MASK +
+			dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_MASK +
 					    (ctrl * MSI_REG_CTRL_BLOCK_SIZE),
-					    4, pp->irq_mask[ctrl]);
-			dw_pcie_wr_own_conf(pp, PCIE_MSI_INTR0_ENABLE +
+					    pp->irq_mask[ctrl]);
+			dw_pcie_writel_dbi(pci, PCIE_MSI_INTR0_ENABLE +
 					    (ctrl * MSI_REG_CTRL_BLOCK_SIZE),
-					    4, ~0);
+					    ~0);
 		}
 	}
 
@@ -698,14 +681,14 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
 						  pp->io_bus_addr, pp->io_size);
 	}
 
-	dw_pcie_wr_own_conf(pp, PCI_BASE_ADDRESS_0, 4, 0);
+	dw_pcie_writel_dbi(pci, PCI_BASE_ADDRESS_0, 0);
 
 	/* Program correct class for RC */
-	dw_pcie_wr_own_conf(pp, PCI_CLASS_DEVICE, 2, PCI_CLASS_BRIDGE_PCI);
+	dw_pcie_writew_dbi(pci, PCI_CLASS_DEVICE, PCI_CLASS_BRIDGE_PCI);
 
-	dw_pcie_rd_own_conf(pp, PCIE_LINK_WIDTH_SPEED_CONTROL, 4, &val);
+	val = dw_pcie_readl_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL);
 	val |= PORT_LOGIC_SPEED_CHANGE;
-	dw_pcie_wr_own_conf(pp, PCIE_LINK_WIDTH_SPEED_CONTROL, 4, val);
+	dw_pcie_writel_dbi(pci, PCIE_LINK_WIDTH_SPEED_CONTROL, val);
 
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
-- 
2.25.1

