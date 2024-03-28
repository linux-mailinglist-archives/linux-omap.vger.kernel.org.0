Return-Path: <linux-omap+bounces-985-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0732488D674
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 07:36:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D0131F2A7F6
	for <lists+linux-omap@lfdr.de>; Wed, 27 Mar 2024 06:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53BEC2376A;
	Wed, 27 Mar 2024 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NZ3nP8BX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 162E618E01
	for <linux-omap@vger.kernel.org>; Wed, 27 Mar 2024 06:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711521391; cv=none; b=XUO7nrjusx/g4t0eCxQlSzRP8jS4nJLbpgw2RlaMySvlEupEYqv44MIaTn5v2c0oKR2w3P/pEdtTJx8u5UB1hLu8SKwV9B+FS2ODBKFpTcrvUf2UZW31OfLHvd/dMIZGpSArJlEefmFbOuBAyZ0j2cwUvDOcl1Ra1YjjHNjJYxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711521391; c=relaxed/simple;
	bh=yMM+3zwLZxZ/ZMbIohXyczKS5iSP3NxVqCs+OJ3J4VE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mWKGfaGJXDdJCdNTiSoDk/WqKpmGyXMGuymsCItCSBsZ5Y8acbCPZeERR7G11eUhm1Bs6yU/lv0OTt4pQoVg5nm7mQRRblQ5qDS0sqbdrv2ZlWd7lLpKc6eGjLD9zbthE9A/sJObvQBcQY6I4ANyzeH+yx/0z+DT+83ra7BmxbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NZ3nP8BX; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dee5daa236so48196365ad.0
        for <linux-omap@vger.kernel.org>; Tue, 26 Mar 2024 23:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711521387; x=1712126187; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sCWUmDmCH+GQ0xn+LUsgyEMH7SBuxLLCLIMaC6UU5kI=;
        b=NZ3nP8BXpHEC06/n7tDCbzCgJVe+BWSaIahayiwzSZG1lIA+ar+8sKNQnhQDLMR6px
         wwLSlrdt4BBNTH4YhPTvKP3bK1+i37+oEUrJmZIK/vJir0cdyj7Lt+ds/fF8YMaBmjsF
         w/Oj3/cxFGvqvChnP1Lk8T7olfp9lpUBdN+gbF1RcyNLN0aoWFxr/4Wzrt9QS+4IsDdv
         IZSC+Coon5fOMddRceX9tW4dZThj7UagAoQjHVB6g5QeeneZ+Vd1Cd8PZla754Cj5Of5
         Uzx4Gv6tkKh9WgiPaSwVMnqLPtCvTf0OAz89gIyx8gsCsIznJbAba9qFdfohwC/nMNP2
         CXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521387; x=1712126187;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCWUmDmCH+GQ0xn+LUsgyEMH7SBuxLLCLIMaC6UU5kI=;
        b=gEisQSO3vn/M/r6V4FpXoebEM5Sgy3wmTK8C3ESYBjnTC2srSRgkY4sAAU2la0xdGV
         JEzYG1nM05rbjEucvhF3R07jmxlXzytZx5+vJQ4hhQad4a7zPcHn/K0zhDAxTF1yrpLM
         CrNu1XJ36Ar37tL6Qv3TinETNCtiZ1VpzaquvaOil/SSC74NN2EI0ifXpO5W2cS6PDWO
         97PLxUeb5oxOadbcGAklnj4lG39i0f/Kb3q+kIOKcLrw7XXXtlH38G0KWL6J5RKwEH4h
         mxrCvncMOMAyjaNdlcWYu/cycjIdqa92u2kEFXnF12nAxqgV2yzEbuDb/jA0OS9jPAfl
         Cjhg==
X-Forwarded-Encrypted: i=1; AJvYcCWAcjiWRHezRZR5oesBJYmwXLkNFqlQ/T6+C/XhA7Khszxll88GtQI2F27ae4+/JcFSyiDjBWoHwPrJGkNdzO0EDY643a3kiYhTTQ==
X-Gm-Message-State: AOJu0YwAty7oifAIK6BFb4qKXQteq3YhLj/RaqdKiPdc0JtYYklN0aov
	D6cLcUAHRKu29RCELA887QYS66c7XDesd/ZWU9yupDhEQjHkgLWfLhi57s008Q==
X-Google-Smtp-Source: AGHT+IFU2aVu/o/a7HuGj5L45J8l/QbHm52NB4CMAbQfe5WPM/LgOp4Wt9TIFyG4jSoSkw7HvI19cQ==
X-Received: by 2002:a17:902:dacd:b0:1e0:a615:c2f with SMTP id q13-20020a170902dacd00b001e0a6150c2fmr2295467plx.27.1711521387186;
        Tue, 26 Mar 2024 23:36:27 -0700 (PDT)
Received: from [127.0.1.1] ([117.207.28.168])
        by smtp.gmail.com with ESMTPSA id r9-20020a170902be0900b001e14807c7dfsm602553pls.86.2024.03.26.23.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 23:36:26 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v11 0/8] PCI: dwc: ep: Fix DBI access failure for drivers
 requiring refclk from host
Date: Wed, 27 Mar 2024 12:05:46 +0530
Message-Id: <20240327-pci-dbi-rework-v11-0-6f5259f90673@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEK+A2YC/3XNTQ6CMBCG4auQrq3pH8i48h7GRWkHmGgoKQY1h
 Ltb2KghLr9J3mcmNmAkHNgxm1jEkQYKXRpS7jLmWts1yMmnA1NCGaGU4b0j7iviER8hXnmlEMA
 WCrRwLEV9xJqeq3i+pN3ScA/xtT4Yy+X6lxpLLnhh3KH2wtVYmNONOhvDPsSGLdYIn16LbQ+pV
 +CN1h7AebvppfgC5BaQIgnSWJO73IIu8UeY5/kNGub/wzABAAA=
To: Jingoo Han <jingoohan1@gmail.com>, 
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
 Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vidya Sagar <vidyas@nvidia.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Richard Zhu <hongxing.zhu@nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
 Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>, 
 Roy Zang <roy.zang@nxp.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Jesper Nilsson <jesper.nilsson@axis.com>, 
 Srikanth Thokala <srikanth.thokala@intel.com>, 
 Shawn Lin <shawn.lin@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, linux-arm-kernel@axis.com, 
 linux-rockchip@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=6062;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=yMM+3zwLZxZ/ZMbIohXyczKS5iSP3NxVqCs+OJ3J4VE=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBmA75PRAvut4GbfcNsOr4y/V32q37nFAF+YZu53
 +o8TlaUvPKJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZgO+TwAKCRBVnxHm/pHO
 9SJxB/9V/tinXUTW2Xk1kfas89qjE+hGIr9jXEdxVzlKGfYRBaAm1j8tDXPX3CuzreCu1mB3ZFc
 DtR64Qp+7iM/z1nCyBKukHTcSBx7eYzJZTVyfsn06A+5W9xU0pLgAydgXls8c3jn/q3yXZd8QKW
 yOfvvjsyrPCMzEcBJ6rbN2fOIEEM/XvqCh/2fd5JxL+GelMpxbGI6tzcwJ3+vPvc90MaCon6mbm
 tKCV4EA7kj35oQwUUpVG1l7Q2Arm50d0IplQYGgiYeu+NKoKkKiR8P6RKqZ01gHTsJmEB7RwteU
 +s5uhU6QAkrc80JovyU/H6eoSKldzEA+nJmHnIxIPPAE5JzK
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

Hello,

This series is the continuation of previous work by Vidya Sagar [1] to fix the
issues related to accessing DBI register space before completing the core
initialization in some EP platforms like Tegra194/234 and Qcom EP.

Since Vidya is busy, I took over the series based on his consent (off-list
discussion).

NOTE
====

Based on the comments received in v7 [2], I've heavily modified the series
to fix several other issues reported by Bjorn and Niklas. One noticeable
change is getting rid of the 'core_init_notifer' flag added to differentiate
between glue drivers requiring refclk from host and drivers getting refclk
locally.

By getting rid of this flag, now both the DWC EP driver and the EPF drivers
can use a single flow and need not distinguish between the glue drivers.

We can also get rid of the 'link_up_notifier' flag in the future by following
the same convention.

Testing
=======

I've tested the series on Qcom SM8450 based dev board that depends on refclk
from host with EPF_MHI driver. It'd be good to test this series on platforms
that generate refclk locally and also with EPF_TEST driver.

- Mani

[1] https://lore.kernel.org/linux-pci/20221013175712.7539-1-vidyas@nvidia.com/
[2] https://lore.kernel.org/linux-pci/20231120084014.108274-1-manivannan.sadhasivam@linaro.org/

Changes in v11:
- Minor cleanups reported by Niklas
- 'epc->init_complete = false' is set in dw_pcie_ep_cleanup() to avoid
  triggering init complete notification before refclk. This will be moved to EPC
  core in the following series adding deinit notifier.
- Collected review tags.
- Link to v10: https://lore.kernel.org/r/20240314-pci-dbi-rework-v10-0-14a45c5a938e@linaro.org

Changes in v10:
- Reordered the commits by moving the independent fixes/cleanups first (Niklas)
- Addressed several comments from Niklas
- Moved PTM register setting out of dw_pcie_ep_init_non_sticky_registers() (Niklas)
- Addressed the issue that EPF drivers were missing init notification after the
  removal of core_init_notifier (Niklas)
- Dropped a few cleanup patches to be clubbed with the follow up series
- Collected review tags
- Dropped the review tags for patch 8/8 as it got changed 
- Link to v9: https://lore.kernel.org/r/20240304-pci-dbi-rework-v9-0-29d433d99cda@linaro.org

Changes in v9:
- Incorporated changes for missing drivers (Niklas)
- Reworded the dw_pcie_ep_cleanup() API kdoc (Niklas)
- Reworded the description of patch 6/10 (Frank)
- Collected reviews
- Link to v8: https://lore.kernel.org/r/20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org

Changes in v8:

- Rebased on top of v6.8-rc1
- Removed the deinit callback from struct dw_pcie_ep_ops
- Renamed dw_pcie_ep_exit() to dw_pcie_ep_deinit()
- Introduced dw_pcie_ep_cleanup() API for drivers supporting PERST#
- Renamed dw_pcie_ep_init_complete() to dw_pcie_ep_init_registers()
- Called dw_pcie_ep_init_registers() API directly from all glue drivers
- Removed "core_init_notifier" flag
- Added a generic dw_pcie_ep_linkdown() API to handle LINK_DOWN event and used
  it in qcom driver
- Added Kernel-doc comments for DWC EP APIs

Changes in v7:

- Rebased on top of v6.7-rc1
- Kept the current dw_pcie_ep_init_complete() API instead of renaming it to
  dw_pcie_ep_init_late(), since changing the name causes a slight ambiguity.
- Splitted the change that moves pci_epc_init_notify() inside
  dw_pcie_ep_init_notify() to help bisecting and also to avoid build issue.
- Added a new patch that moves pci_epc_init_notify() inside
  dw_pcie_ep_init_notify().
- Took over the authorship and dropped the previous Ack as the patches are
  heavily modified.

Changes in v6:

- Rebased on top of pci/next (6e2fca71e187)
- removed ep_init_late() callback as it is no longer necessary

For previous changelog, please refer [1].

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Manivannan Sadhasivam (8):
      PCI: dwc: ep: Fix DBI access failure for drivers requiring refclk from host
      PCI: dwc: ep: Add Kernel-doc comments for APIs
      PCI: dwc: ep: Remove deinit() callback from struct dw_pcie_ep_ops
      PCI: dwc: ep: Rename dw_pcie_ep_exit() to dw_pcie_ep_deinit()
      PCI: dwc: ep: Introduce dw_pcie_ep_cleanup() API for drivers supporting PERST#
      PCI: dwc: ep: Rename dw_pcie_ep_init_complete() to dw_pcie_ep_init_registers()
      PCI: dwc: ep: Call dw_pcie_ep_init_registers() API directly from all glue drivers
      PCI: endpoint: Remove "core_init_notifier" flag

 drivers/pci/controller/cadence/pcie-cadence-ep.c  |   2 +
 drivers/pci/controller/dwc/pci-dra7xx.c           |   9 +
 drivers/pci/controller/dwc/pci-imx6.c             |  10 +
 drivers/pci/controller/dwc/pci-keystone.c         |  11 +
 drivers/pci/controller/dwc/pci-layerscape-ep.c    |   9 +
 drivers/pci/controller/dwc/pcie-artpec6.c         |  15 +-
 drivers/pci/controller/dwc/pcie-designware-ep.c   | 238 +++++++++++++++-------
 drivers/pci/controller/dwc/pcie-designware-plat.c |  11 +
 drivers/pci/controller/dwc/pcie-designware.h      |  14 +-
 drivers/pci/controller/dwc/pcie-keembay.c         |  18 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |   4 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  28 ++-
 drivers/pci/controller/dwc/pcie-tegra194.c        |   5 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  15 +-
 drivers/pci/controller/pcie-rcar-ep.c             |   2 +
 drivers/pci/controller/pcie-rockchip-ep.c         |   2 +
 drivers/pci/endpoint/functions/pci-epf-test.c     |  18 +-
 drivers/pci/endpoint/pci-ep-cfs.c                 |   9 +
 drivers/pci/endpoint/pci-epc-core.c               |  22 ++
 include/linux/pci-epc.h                           |   7 +-
 20 files changed, 338 insertions(+), 111 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240224-pci-dbi-rework-b2e99a62930c

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


