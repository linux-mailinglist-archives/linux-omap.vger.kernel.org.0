Return-Path: <linux-omap+bounces-714-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2D38622FA
	for <lists+linux-omap@lfdr.de>; Sat, 24 Feb 2024 07:54:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 900641C21B20
	for <lists+linux-omap@lfdr.de>; Sat, 24 Feb 2024 06:54:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37533DF67;
	Sat, 24 Feb 2024 06:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GnYXEgOO"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51DA06119
	for <linux-omap@vger.kernel.org>; Sat, 24 Feb 2024 06:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708757668; cv=none; b=NWr0wt/xdWti+InsAn2G5yQGH38gs8qlFGGPtzwukwPH98pZM4a2Wr/ZdolRwuHeElsKlD+MWhB5D12f9XTNT4BpIL5H3lII33meDv6I2RJOqyuFkEiYs5RvbFzLFezKMKGnNNX7vQtB4W2hlQOdgm/Q8fL2zxbO4QtlZWQ9aR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708757668; c=relaxed/simple;
	bh=x754MZuCG5B4tIf+C0S5CY+BH4+h4u4WEZxh/Gpxfvg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jPNIX8gvXKXEekIlqwu9yo1J8V8V7La7AhpbjrjzHoua9X4hypMU457PhOMMwFd74jE1wa6091AxO0yTdlwUA2a7v7bCXG3VrLCziSvnVVTUuuZp8swQWorHmXDdqT/7EiAFfGPkvJ2/vFb56hb960qjzUFnoG72jA1v4mPoW/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GnYXEgOO; arc=none smtp.client-ip=209.85.161.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-5a04bbe0a18so503340eaf.1
        for <linux-omap@vger.kernel.org>; Fri, 23 Feb 2024 22:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708757665; x=1709362465; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GWgl52BYCJ4PwBk/V86UifQusawgYoQTONtG8UzIO9M=;
        b=GnYXEgOOc5xlZKy0UQfJUzDot5toSA1U5mYw/ANbhN0qnQAU27mF61lg2tgR5XH1ZA
         rcbb/lflS8VrBmGhuBIdvIOzBO4iq1qfQBLzJYNRzMVS9bSC6XhxLkV7d/BFa12zPD9n
         ygAFWD1QwNVLPCzeUrSpB6sHB0GvhT9a+MIC0DE6HZo4RIDu5u5msrJKUZpsq6m5OzIq
         P8o37Ki2S4CBGB2wyWtmWNnvR6JtdV52tuI2eUtrt0DUH8e7KtFGt1qflg9wfjHFfERu
         dXPTyWDlIBZszXY9AjUeF9K4ObZGIWkpg2UxxGTDgAOGeu9454cMrTtNPUDhMVGI7Laq
         4JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708757665; x=1709362465;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWgl52BYCJ4PwBk/V86UifQusawgYoQTONtG8UzIO9M=;
        b=MvEf7LlsC1jfAMg6A3TtmFfPAFgp0uQUn2N/PTGbByoDw75sWQxP9mEdqBF1hn5EYU
         ZaxCMTVOtkwUnrAVOJ5RDVTilRVthD290kZRvpjOdUcZgev9gX8Poq30rg6H9/a6AXe7
         8ls2k3tSdOK1BcEfUvkU3iP7cwOfMWBpuuvwq4jVS9aRAChFjEAS0ae3dz8lILafJma+
         sPYkK4hMbSAed6GojelB0oOmtwX+ygH73e0t/Pvu3GT7Kad4p5+1QY/XvX6kaBncHiMg
         CmrdiGPXUAT2YYRc9cdOzVHQtT0RJUMDV0OAcbNa6qlOZ5oSjv8Q8q+Tao2xO2dcnYyl
         9LXw==
X-Forwarded-Encrypted: i=1; AJvYcCW8pKaQksABgIuiRZ7dIlwZWogTZi6EfQ7u7qkxgVncv2xRyw8d0RflnS8/r9I6MVc2NB1Rq5JWB2iyugmEcMvpTaPeCsI91tAwog==
X-Gm-Message-State: AOJu0Ywc8VgH/HxNAiBYW27GIGpFKrxakpOjEMNltfkw2aNBJtyIAkt3
	YPIj0rVLXwjn3CIm7cICEpSyGcbWb1yRbi86RKcjNKgCkUGGtrNytBTVpggV5A==
X-Google-Smtp-Source: AGHT+IF06E9v7eucC47KNmijoQVmhjzoq9rivDk5iXaa+yfwLA6gzHHWi6ef9Qq7OZDo1ytULmGgdQ==
X-Received: by 2002:a05:6358:7618:b0:17b:304f:b3d with SMTP id r24-20020a056358761800b0017b304f0b3dmr2293513rwg.23.1708757665005;
        Fri, 23 Feb 2024 22:54:25 -0800 (PST)
Received: from [127.0.1.1] ([120.138.12.46])
        by smtp.gmail.com with ESMTPSA id r5-20020aa78b85000000b006e4cb7f4393sm502932pfd.165.2024.02.23.22.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Feb 2024 22:54:24 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v8 00/10] PCI: dwc: ep: Fix DBI access failure for drivers
 requiring refclk from host
Date: Sat, 24 Feb 2024 12:24:06 +0530
Message-Id: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI6S2WUC/x3MMQqAMAxA0auUzAZKFLFeRRxsjRoELSmoULy7x
 fEN/2dIrMIJepNB+ZIk51HQVQbCNh0ro8zFQJYaS9RgDIKzF1S+T93REzs3teRqG6BEUXmR5x8
 O4/t+RAjzGGAAAAA=
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
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 Niklas Cassel <cassel@kernel.org>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=4532;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=x754MZuCG5B4tIf+C0S5CY+BH4+h4u4WEZxh/Gpxfvg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBl2ZKQE8Qt4hWcXaLPZGKeHcZfe3X7OduUiUiV0
 oFeVosxH6eJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCZdmSkAAKCRBVnxHm/pHO
 9Tg+B/9h+50d00vh+TLHKGgy9bamVqprezEgWpVebuQtbPLH+0qaZ/yinkzuIHcFOSIYsepmyoF
 oxctWzI4aBO+ljYpcYNwRyR0U9rV/u4BaiB/PSHZyb/rV2K80Rnhwpg1H9T0rgaW5J9euOgIDYs
 QG2g/9pkqHm/o6enI9UHI1m4SNbYFo+qJGtSy8sWX0kPlfITYqKbKoMsJiT13Uo8mJIK9m32aLx
 XUeyXu7WaeT6766mCCWMuM04zRG+wA8qsTIEdw/DgXK0GfQa3HctlA/x04RvKdeIIqqzW+y6Vz3
 ys9mXnb7Q06Mk0kRPmzAWj3CCFOqVHo4+1bh2WFBOiVr7dkh
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
Manivannan Sadhasivam (10):
      PCI: dwc: ep: Remove deinit() callback from struct dw_pcie_ep_ops
      PCI: dwc: ep: Rename dw_pcie_ep_exit() to dw_pcie_ep_deinit()
      PCI: dwc: ep: Introduce dw_pcie_ep_cleanup() API for drivers supporting PERST#
      PCI: dwc: ep: Fix DBI access failure for drivers requiring refclk from host
      PCI: dwc: ep: Rename dw_pcie_ep_init_complete() to dw_pcie_ep_init_registers()
      PCI: dwc: ep: Call dw_pcie_ep_init_registers() API directly from all glue drivers
      PCI: dwc: ep: Remove "core_init_notifier" flag
      PCI: dwc: ep: Add a generic dw_pcie_ep_linkdown() API to handle LINK_DOWN event
      PCI: qcom-ep: Use the generic dw_pcie_ep_linkdown() API to handle LINK_DOWN event
      PCI: dwc: ep: Add Kernel-doc comments for APIs

 drivers/pci/controller/dwc/pci-dra7xx.c           |   9 +
 drivers/pci/controller/dwc/pci-imx6.c             |  10 +
 drivers/pci/controller/dwc/pci-keystone.c         |  11 +
 drivers/pci/controller/dwc/pci-layerscape-ep.c    |   9 +
 drivers/pci/controller/dwc/pcie-designware-ep.c   | 307 +++++++++++++++-------
 drivers/pci/controller/dwc/pcie-designware-plat.c |  11 +
 drivers/pci/controller/dwc/pcie-designware.h      |  19 +-
 drivers/pci/controller/dwc/pcie-qcom-ep.c         |   6 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       |  28 +-
 drivers/pci/controller/dwc/pcie-tegra194.c        |   5 +-
 drivers/pci/controller/dwc/pcie-uniphier-ep.c     |  15 +-
 drivers/pci/endpoint/functions/pci-epf-test.c     |  18 +-
 include/linux/pci-epc.h                           |   3 -
 13 files changed, 321 insertions(+), 130 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240224-pci-dbi-rework-b2e99a62930c

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


