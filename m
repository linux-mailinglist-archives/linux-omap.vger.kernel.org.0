Return-Path: <linux-omap+bounces-733-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D2E867CA3
	for <lists+linux-omap@lfdr.de>; Mon, 26 Feb 2024 17:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 217751F23596
	for <lists+linux-omap@lfdr.de>; Mon, 26 Feb 2024 16:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB47B12C81A;
	Mon, 26 Feb 2024 16:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="jlKz9H1S"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2072.outbound.protection.outlook.com [40.107.20.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C06112C55F;
	Mon, 26 Feb 2024 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708966288; cv=fail; b=HN1xe2yz+/bXBJX3ryX03hJDHSzTHzwa6tXGHC4rQxn6EQqjwAn7Ps/ZZG38wfZEqzLZ7i+leoXA7Dg9YnQCDM9gPKvzEGkxoJ7V0V6ToN6eoOhlu5mjXDxM1t7mYI6TW7Uyn846z66Ussa+kONGmSbJYr71gbMajAsWildYbwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708966288; c=relaxed/simple;
	bh=2T3ENUhWYiSAk7YmQwPcGWKFxUocOBvZyMv2oofvO74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fREqfPiYSwAXH5AErnsj2jVP+n9KTWF80OunBvV11lVIudtZvcRmwYL05oLhw69ZgatqGqsRqLu1MQAR1VNLGU6FCt/sMq6XBpNN+kXGbHG1ADLR++0alpf3Eb31IzqCkwXbf/B2B0dmcnoWj1HsvN8cmfKJiy8HrYJ5u/XflRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=jlKz9H1S; arc=fail smtp.client-ip=40.107.20.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=esLqgqBYfP61wS5s4aqwOMyhuI0kbokLX6i/Q8p9R0Qfgij7gXR1KyanfClOffwRcjEHn2oCr9H0ClMZncp4ETphS2jZ+mHbhvGEFiJPWHxAun1nFDsVa0m0P8ZzVfm/UxGRr7w/EfX6cTZHO2vchqRy96aamUUps+XDx+vZ1wy+ka64Yq6AwrEru6TOl/kAx85u5ON77F9Bhdqqmgb5AXRZoaMyi1cWE6m4gxZ+yJeKSDajAYF8K/7Ai01/2J7Ru+fgOADAOtKDdw0NZnvLolaOFB2nN0QE0HE0J1sQI1mPUqVeG9korVC4cUmp7cea6i86KBaOEQaFTRcPN0ffqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1sm66aYEPGsEd/x9L5axEINTAgSnIhQpMB+/7Qw98PQ=;
 b=ByvMIbWtijsX+G4tDNDUzt9f6pvKzRdPKSBtFuT2+0EV6DJai/xdU7bGD1SUTtWczRKU1O3gG7jHrJ+wmUK2n3K6XU06+ceh/2BLcsPXmwJL5cuaI86ubBjHDkS54DIpuybhu0rW0MUKWm2ufb6j0L0H6xSZx8HcXr8yNlawmBIMuj7cIfMHReFoWdxBf6+LmQU8pwE8gjtygERHsoc7qXMFpBaqyt1nBiv7ODYTnT0JFyyj67LII0H/ZbI5L+6zxRw8CL2iH9ELNo7Iq+xMQQr0eML1hDQ7QQ6Q75//lnpOUz37LFj1ig5VhjiTAeQSDHIiuWyiNhR4b1Ef1yBNFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1sm66aYEPGsEd/x9L5axEINTAgSnIhQpMB+/7Qw98PQ=;
 b=jlKz9H1SJhI5SBqVyZcWXTZ98BGsTUVF0xR3Sx43DCI6zPf/ND4IO2aW4QCCPGZlBnzGwjmKm+IZ/w4cVICYFDr9Od0eNpxMQ6PbLIEneJfs3zJ13UvYFCWDuIQ1Wj8JK0o3KOLvvEWVsS0VW4HZQ4SiaVTzGKg0dOAzGcoiYQI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS1PR04MB9455.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 16:51:23 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9af4:87e:d74:94aa%7]) with mapi id 15.20.7316.032; Mon, 26 Feb 2024
 16:51:23 +0000
Date: Mon, 26 Feb 2024 11:51:10 -0500
From: Frank Li <Frank.li@nxp.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	Niklas Cassel <cassel@kernel.org>
Subject: Re: [PATCH v8 02/10] PCI: dwc: ep: Rename dw_pcie_ep_exit() to
 dw_pcie_ep_deinit()
Message-ID: <ZdzBfi51cFzipzcH@lizhi-Precision-Tower-5810>
References: <20240224-pci-dbi-rework-v8-0-64c7fd0cfe64@linaro.org>
 <20240224-pci-dbi-rework-v8-2-64c7fd0cfe64@linaro.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240224-pci-dbi-rework-v8-2-64c7fd0cfe64@linaro.org>
X-ClientProxiedBy: SJ0PR03CA0136.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::21) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS1PR04MB9455:EE_
X-MS-Office365-Filtering-Correlation-Id: 12112e3f-a8ba-40cb-c8f7-08dc36eb2a38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BZWPMJP5AvQhJ+cFuDTcZQt/bMuxC8KI8/r7GGs6l0wnw3lDR8URIaNnxoyIC5rdZdEX7ubfhyWJ7CFEnfAg1ub0kGY9bOFMh6Psz0PR3FCzfD27XsA5i9UTpX6FQ4xThR/yW7l5yA4FcJRWb0QvrsWrRLchYt6DIJoqoIyfL03wRPfaODyvHxla7MM1tq+FFpN5sHJ38T2srshTeXYuxXZRHgu/TIU0XUpePdmwj0MKrNqmORIK4aLeCgCqfAtxriGPRJ8fD8QCOtAHnnSY+N6/c67JpovbFUnUHqUiESLpI7eByYeWtBsFk5+lrTB3d79xe252ZAGUZltyPlzTO6DgGVML8nrzdn8FmyaomsXGatc75JXFhFgWDLPWB8o7cdR5XDcFyEXzwe+v6cly8xb3wulnxJBzPofDZUwFkc0BkEU9lpLgWgNJC1m/e7zULYne8Ccoit6FLFIiqXeAIGVUMF1UMWzR2LExVV1mA9ogFi4lPoOQsOQJ5GI91wdmF4sTPQVPHEluoiu2v2DJENrBlaDPR//v0uYQo8qJHP63wXTnZ1XUUK4N6bippRWIj/LMUVLTNMO/F/gXs3lN8sc/ERdyQ5sX71ZCB12tqZnk1yRCcOSvNotkc/C7ZGHnt3XLxtvudu5YTpfyCp7HhzQgSCx38sP6SvjL04zmzRCnGXbM/yXQYswF2GGEeCZgbGR1d3YS0GuLE4ILytDKnTRSmghlfZbn5H1JOWfX9y0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HPsZBI2s5+shqWxqKnL79wDLlnKCkklxxFz498nHkqLsSFbv2PPPCPo64cLx?=
 =?us-ascii?Q?h9mBjYHyL0/BbGGk9kYeBKTs95imVLJ92oPcRli9UJrg27jpwV3WUHjAdoyz?=
 =?us-ascii?Q?h5Y2WvichObreQXNU5RJ3CToAXtoicAUEyLVlDYIWhsiN8I5B/NHOSuCtl8n?=
 =?us-ascii?Q?7Aj10uat5EHC7PA/Pla0ReHqLCzoapVfGnC5rqHpV9PZGDxW8YewEUEH8w7e?=
 =?us-ascii?Q?m2DUTezwwG645ZbBcNBM4LpXwXx1mnak/STx03NIQINlXzzcw88bDTNmYX4E?=
 =?us-ascii?Q?6Bf9qOgj3v9SbyvB4oAjm55BQkqsodZQL+lioE5yC+RUQ4xwC3vN6AU/hZq7?=
 =?us-ascii?Q?j4SVxxR4ABZT4LWg1eu+bDdsCGiMfJQ8LK2cvsGDzNmC6SK9sUdFdO3TBhoL?=
 =?us-ascii?Q?mi5gNNi5XO2Gds7pYiuPfcWrGcPsS9H/SsmIv/R8CpQsKDjceWHDb+F6ZS2X?=
 =?us-ascii?Q?3NOdfAA5SkeN1qO0IMXl/qXkaYlL+M1NSkcAJbcwHgvu1Jh6ppoUwXC8lhx1?=
 =?us-ascii?Q?vyyp22R7v/BaBSMQTWj9/lpYMFjDmuzvuV4S19L5nRp4XmmDK7mrvrnFijmv?=
 =?us-ascii?Q?3XNWmNDyDXmTT5pQNPes9TZWDMiB1jFu/fS2X2gkwZafMYMG2H7MG7EqN74T?=
 =?us-ascii?Q?Znr6C4kI65oO0BMa4h2og2z7zH5h7jmzguZqJg6CO/SsyG1y4yeVHuRoaESb?=
 =?us-ascii?Q?Ygs3kGix7yxTiqpwKcP4dRy08lVWRZJX5Gb5MmWZ9zx6cMfqv+wisiZQ40Rn?=
 =?us-ascii?Q?mi3QTIzeqYEM0PtbsHpFN85RIOBvEEVsIgOLVRRx9Rt97k3AJTZOXBUGDS+X?=
 =?us-ascii?Q?JlAIcS/2mVJAH3PjdGR0JhXHkm/L+PDdFatVrD7mfIYCS3J3f9MfdL1HJIaN?=
 =?us-ascii?Q?uH78LuI4wqVsduqysMbiEa8gmce1C9aWjBGp6Cgc97HcRrGyRhPJjWRhuYv2?=
 =?us-ascii?Q?5Zbgf9b/xCmz+IOGuu6F0R4PPFtXtjUVLwWEDjxgHL30F5laQqE0w1lKCRE1?=
 =?us-ascii?Q?B+sN+OxB1rIy53G874SoD99hNYmGaH2zywV3L5htv2cd6b8Et6PFS6rswv+0?=
 =?us-ascii?Q?SpOkk+l9e6vMYM8kcnXjqZ5Kupmv96Uq6iYQUPV36n4+hZptREDlhGPT38aw?=
 =?us-ascii?Q?0N4xpjsRHNKy6+3mwqX4WfqRfQt1qBSfHT/nN6i5NEAstV2RedE856a5tz2C?=
 =?us-ascii?Q?Cmo1IbGmDd318aM1rEr1CJGnrkuGaLlVRNLR/S94zfQrZL01R/KKCq5jVG4+?=
 =?us-ascii?Q?1DhWTWmAPRHfxdDIgs60qi6PB5/I9i7pKadbIT4fei82A9Go2hSpc8qJGDaf?=
 =?us-ascii?Q?egmMTGliJTRK/JjDcUvBdjwliM+bJM74vJCSHa5G5jTWz4gI1IM7SxIzhHSg?=
 =?us-ascii?Q?PkdUVxSsxIoZ0M//P5Xy/h2MZTUkqZsreVSfN3VB+MJ5tURrrF7Zf0OrycTc?=
 =?us-ascii?Q?VYThSJp46ZugJ5YCe4In3IgtwiuX22W54tXv9edryvEzivZiOVnHcusMrmWD?=
 =?us-ascii?Q?AgVkFr5jjd9xHYrtMg/J+Qk1s9ieC002ekbzKVoVbgUioA2euOTOqd19xKT/?=
 =?us-ascii?Q?CJj9SnCvU8RDIdQvhdE=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12112e3f-a8ba-40cb-c8f7-08dc36eb2a38
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 16:51:23.4799
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXiQdcgydfbCZevyUn6XQwAWaIzUbfoWEXDmeKddvp8MDbEbMczlML6knuelZ3gh35yXzpkjvtXLMLfsdHLbZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9455

On Sat, Feb 24, 2024 at 12:24:08PM +0530, Manivannan Sadhasivam wrote:
> dw_pcie_ep_exit() API is undoing what the dw_pcie_ep_init() API has done
> already (at least partly). But the API name dw_pcie_ep_exit() is not quite
> reflecting that. So let's rename it to dw_pcie_ep_deinit() to make the
> purpose of this API clear. This also aligns with the DWC host driver.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 4 ++--
>  drivers/pci/controller/dwc/pcie-designware.h    | 4 ++--
>  drivers/pci/controller/dwc/pcie-rcar-gen4.c     | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index d305f9b4cdfe..2b11290aab4c 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -564,7 +564,7 @@ int dw_pcie_ep_raise_msix_irq(struct dw_pcie_ep *ep, u8 func_no,
>  	return 0;
>  }
>  
> -void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
> +void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_ep(ep);
>  	struct pci_epc *epc = ep->epc;
> @@ -576,7 +576,7 @@ void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
>  
>  	pci_epc_mem_exit(epc);
>  }
> -EXPORT_SYMBOL_GPL(dw_pcie_ep_exit);
> +EXPORT_SYMBOL_GPL(dw_pcie_ep_deinit);
>  
>  static unsigned int dw_pcie_ep_find_ext_capability(struct dw_pcie *pci, int cap)
>  {
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index ab7431a37209..61465203bb60 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -671,7 +671,7 @@ void dw_pcie_ep_linkup(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_init(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_init_complete(struct dw_pcie_ep *ep);
>  void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep);
> -void dw_pcie_ep_exit(struct dw_pcie_ep *ep);
> +void dw_pcie_ep_deinit(struct dw_pcie_ep *ep);
>  int dw_pcie_ep_raise_intx_irq(struct dw_pcie_ep *ep, u8 func_no);
>  int dw_pcie_ep_raise_msi_irq(struct dw_pcie_ep *ep, u8 func_no,
>  			     u8 interrupt_num);
> @@ -701,7 +701,7 @@ static inline void dw_pcie_ep_init_notify(struct dw_pcie_ep *ep)
>  {
>  }
>  
> -static inline void dw_pcie_ep_exit(struct dw_pcie_ep *ep)
> +static inline void dw_pcie_ep_deinit(struct dw_pcie_ep *ep)
>  {
>  }
>  
> diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> index ac97d594ea47..9d9d22e367bb 100644
> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> @@ -430,7 +430,7 @@ static int rcar_gen4_add_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
>  
>  static void rcar_gen4_remove_dw_pcie_ep(struct rcar_gen4_pcie *rcar)
>  {
> -	dw_pcie_ep_exit(&rcar->dw.ep);
> +	dw_pcie_ep_deinit(&rcar->dw.ep);
>  	rcar_gen4_pcie_ep_deinit(rcar);
>  }
>  
> 
> -- 
> 2.25.1
> 

