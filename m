Return-Path: <linux-omap+bounces-1437-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F258D6913
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2024 20:38:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87E9A1C26535
	for <lists+linux-omap@lfdr.de>; Fri, 31 May 2024 18:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6B3717D37D;
	Fri, 31 May 2024 18:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com header.i=@inadvantage.onmicrosoft.com header.b="ufcnUbOU"
X-Original-To: linux-omap@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2103.outbound.protection.outlook.com [40.107.244.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA937D3E3;
	Fri, 31 May 2024 18:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717180719; cv=fail; b=tXkGFsBxBo28vbaxheZOyBXRTjjjS4FY8xk0dIgO0JTxyVxUe1sXwagLkT6cWYY4qJrVhQQUIWkSktpSeO61zpQ8eIRGZevrFc4DoSfuSabsyaSGUz6sF7JEdYvii2x7EYAh7Er2ZJ6Oj4ZoczPlrdoK3LmkczEnXfsb09Q0V3A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717180719; c=relaxed/simple;
	bh=mS2BxN9GCPBcQ3PTtDXyfj2UisVXbAMtzCUcXmudPP8=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=CjHVm3UEKRNBTwH2qS/voOiJOu2rscuBuREPQmH/RgC4I9ier4qbg5i2uq2JRQoBaVeD1iPo1H5vcZjV85F1nwTgkNPapceQmKlqhF7K2HxKspZafSGv/zsnU33yLkcz+4QKoVyjPjua32c5HyayOUK2oCbJg6J3bkX/r04qPM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com header.i=@inadvantage.onmicrosoft.com header.b=ufcnUbOU; arc=fail smtp.client-ip=40.107.244.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjk4Jyb3iyHYrVG3b3UDQ/gzZ24LsrPuJzl1vXp5oDkJ6EP9dLXtv1sX907Pv51Pm2cujniusm19OwOLXBibgbv8Hn9GApO08+8/hGQcnfDV0DhFyA5S3U3osjLvFWPYXWuXS1gilFUe3xsLSdoaCLSIyHtK8Aj+sxFg7hOzgzjmvkU1aqpXOnzb8fY+8naawwUL6je9lAGQMoAqXr2qi2F9UDmm1axw0tY4TdlWCh8kKKV/V4pY2Q7yhPGmsPKMS5f/PDdWUR0HWfhUFVdhIVoXXrxyO0iWAS2v6go6D8kfag1EIQMy8TNitaAHplMMIuqdhg2uM9YrySrP0EbqUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yQPghxWP00ElA4k3p9w18uUvPEIrEKXopJu+aN58cjA=;
 b=T7L2H9QFxKxzgnirXaLsa2kMQaSYHBCoM5r7y+Is33CCZ5GkaRv3DC6Una2ayfoNq+61Rd3S8DP/77E8ZCSICsav8s9XCVowhXOMogwTw8FAj/nL0x6hNwyUBz6pi3WA++C8DtiXgKAZ3Qd1GfOWkg2KAnQYGi9CSdS5o53U4QcsTx9gHCV4K2X02mWHQWj7W/m1BBevHewjvWHrujG/Q+0uiDE5BnpNSV10BFtzc202rBGoz2F/Z4tMdAhHm8roxxv/+qN3AJBNe4Y5yZ+VrGQUKInLdjEQr67Wav6HHeMWW2bMe8FzjByNUzKi9ofvx/43KQgdht79+HuYV4pHng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yQPghxWP00ElA4k3p9w18uUvPEIrEKXopJu+aN58cjA=;
 b=ufcnUbOU8bWk2bWI35nBlm6LLxDnR8+sZIjFaihYWO9psmZKsbjlVWmJaJeP/lVGEBZLk93SSGIxwp12XjRqrAGC82C0QfCmphlIqlUtAMWCdB78RHs7IbEZGsJ0vl8rWcoI4gIeqzt2wIUWEL7cz0FIxzW/0/Ud0g0EPF4M+AQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by MW4PR10MB6654.namprd10.prod.outlook.com (2603:10b6:303:22f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.25; Fri, 31 May
 2024 18:38:35 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::7603:d234:e4ab:3fea%7]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 18:38:34 +0000
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-omap@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Andrew Halaney <ahalaney@redhat.com>
Subject: [PATCH V1] ARM: dts: am335x-bone-common: Increase MDIO reset deassert time
Date: Fri, 31 May 2024 13:38:17 -0500
Message-Id: <20240531183817.2698445-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0004.namprd22.prod.outlook.com
 (2603:10b6:208:238::9) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|MW4PR10MB6654:EE_
X-MS-Office365-Filtering-Correlation-Id: 38b370d9-300e-4fc3-b25a-08dc81a0e089
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|366007|376005|1800799015|7416005|52116005|38350700005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?4wME6jvLYDQPmgpSDfvYZQvp/tM9/Hpo+a6gKXDtvGP7RPSP7S7DPEgQs/zB?=
 =?us-ascii?Q?z2CBkSHkZqHFIYBnMlV0l3hw+QBTyZSR7+KA0HPV1E3O2QdxNz8qFZtErhI5?=
 =?us-ascii?Q?O5Ywr5J/B631iAE84ACG7JUVVG9AshBKISzkV4A1YiP9gUaCaUz4AW9oHQsF?=
 =?us-ascii?Q?w+YQBmMhGDCMk0LMlgRRMAatakJECHxT/lJStSpunqkCGQggagZo315WHKvj?=
 =?us-ascii?Q?Io5hbAXeTyEwTJvqDUIojyMizJPzZSfIYO8mc+duaLM5GbDxfSNNE43aHAGt?=
 =?us-ascii?Q?+bWod2ESPVvgcNKSBeFnVecISXsazvxZ4K0COdHLIPm8SlG7ii/MHdkgvDDY?=
 =?us-ascii?Q?x+knktLT9tcEjnCPwbrT1kX8JgTlAdRd90LsgZgPeiZPIveuRVv0itjJfBgm?=
 =?us-ascii?Q?nq80c2C/j4FmobapECO5s/sUeKHqn8eciDTX9dcCsBCAxM/DqUnx7nNP/0Et?=
 =?us-ascii?Q?vkg2wBH32KwaiyM1BUNgvPxMUnnolpJQ6CkLjgFrvaMATai+U0bhuuzHP1Fq?=
 =?us-ascii?Q?Y0FBzMhv+lmkQ7x3QZF9OotWLyRK53gRV/LcKfpZt0YhSVt6gPu/6gJhNBrw?=
 =?us-ascii?Q?qy6+IHzjkm3DxZ/mCapvEYJtUqSsLqIrLPrcQm0IswhlACHy52bgxo0AsQOP?=
 =?us-ascii?Q?2FWgqoujOhZ1fcg3NJNSM2Tazac0PyymYVHWaUXAK2emvy5+NvpeA3+XdtcE?=
 =?us-ascii?Q?QJNx1JD4mNYJMKFKeMtw5edFvKa/BSoad4rmuBSDlRXJOhzctLDsGIC4jMLR?=
 =?us-ascii?Q?iJmkwUmhiLhBYojPldDIJm8ze5KJhNl36o2H1s2F0V+1DQF+jvp0dDOcCRyR?=
 =?us-ascii?Q?Lv//DyiybsrCYhbJDsQfv7rxDEuV3UVABtBXdBAqbwDV35WBX7aiHzVR5gVd?=
 =?us-ascii?Q?aLFmJy4GWivYnVBguSkPqzT5Rv8CfF4EoSscA4wbdcyQixhIv/PT01txJGcA?=
 =?us-ascii?Q?HFPABYW1Qi5VdFsdfS25UTE2GJsbV+C2xwyXk8HtePTWWNJdAi6DUQ4jsYoa?=
 =?us-ascii?Q?c1CZIqBpMczSiSXYc5rSE6HbjsXm+DPRlTzf1uhlj3tKK58J+sgIWkeP3ODR?=
 =?us-ascii?Q?62oFo53iM8XtEfNZspk/q81ck0QyCFGdS1qFFV56osfqT5+IRjMYerC1I3Sp?=
 =?us-ascii?Q?onXye+K/EBcZuQyZNvvBDSmDtH4weTYTKoSlT0dJSyXsIMoFLWZDdS31KLJP?=
 =?us-ascii?Q?xIxfRJ1FYYOfSh6Mjgml6Ytbd04qBi7GOYMjH9ZC7A2EX8T5IICRQQ7SLAsY?=
 =?us-ascii?Q?QdZU3lxi/tq/A63gvYvSwtoac7OLbailMi7SR1Mlhq+jzp4BSQe6uDFKOwV/?=
 =?us-ascii?Q?f5J2DstXSNXJR1fEGW8PZmpechTMcQhcQwr8/IZpQF5P9Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6974.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(376005)(1800799015)(7416005)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Lw66FY8EscFquDcCUnGtczZzIQsXm+REnE1pcGpGN/TAIX9Oh1B5PGwBepSW?=
 =?us-ascii?Q?ntZgvbfKwXvD+UC2+k/45UQbNkfXJ/aq9fmTZfncociDMV/pICTZXy98ABMY?=
 =?us-ascii?Q?7d11IL1bKDmokbKTwIIblAF+PbDRNvJXqcv/p172dYclu8NtHMUTSAYtdCpK?=
 =?us-ascii?Q?Uxbqe1xlNmt6w9cvFd/OTwik81HaUVVDit9wfNsjClxSoMAWJGcNf8SRay/Y?=
 =?us-ascii?Q?8+uA4HijUz8mPT7c65GevGuiLovLd/Xgqn/Q/nVbD2J6J5yvnze17QArqq7i?=
 =?us-ascii?Q?yG/6NRFRLUkCci1YhH3SFicuSH/t/R1Z3EM+dR6asgguq9qPjrRZFEDBq4gf?=
 =?us-ascii?Q?VGfD4JWCfVy8mo2x5xzq+xfoPL/nbeqnrSa1vHzS8I79pkLsymce9R9v/+Mt?=
 =?us-ascii?Q?AUgQIR5k+FuX7Hp459BRgcarLTherFI1WFLEhis66qNI+2IqsNzHXIeHQ1Y7?=
 =?us-ascii?Q?KI4argSlOpDpirOpkPX1Ord27a2A9CE3Gw9iuNqNZKJ9G3QZtoeedWyShaT7?=
 =?us-ascii?Q?28zhBXDieaM6P/riYQtaiOz5SlAZwZ7jv8hx7F7GADOQx0rehRaXiOquLWYS?=
 =?us-ascii?Q?qjSrf8bxhgFKnrZB/n/nj4HpIOfAd6XEKHCExr84cDgWZlcjMucN+ivKkeg7?=
 =?us-ascii?Q?eAYXkhFthbwnZ/rg1AFq58VfN+c2ECnMLfR7wV3nZNHEteREjdE68ssya4gr?=
 =?us-ascii?Q?cbxR6sEZZOrIdw33IWotXJ5Rh56ucv+wkGrIpMnqChKWiP2iXlmUDC/abWRM?=
 =?us-ascii?Q?GxSijOHwTC8TsD/8PK94X4fqLOOktd+1iEl0gVe6s3g8l2hG6VOM4IVl5OQq?=
 =?us-ascii?Q?RgI4VqC4Lj6JZjSeqGURp6WwAE7uALB8uHpF4xMDs81xvZbouX8Q+Rg+exIJ?=
 =?us-ascii?Q?krGwvrLA4+4D77K3mNpD16gS1Bz7fB/h5yWnI21QLyxfFSTQeWJ8rpMaMeZD?=
 =?us-ascii?Q?xjF+lC+Upv3J5jFobs6Rghjv1gjn4hNtLBbVeX5gWMVC4HRW1OmlTANu9xqD?=
 =?us-ascii?Q?Upq8bQ1K50i/rG5VNvNU6cX/DCGPWm6CVyOaBmlZ45defc87pDfKV6esB+ls?=
 =?us-ascii?Q?PByfOC+PfO2QQQEC6ZGTyOrVNFYUZFCV7cZB7cD730WgQ4X6SI6NPE6mYKKH?=
 =?us-ascii?Q?FDpjqArciPmuwumslBE+jF7VsJpyuhMTyjls72MVgqhSLgvEzVxF/EBq/07X?=
 =?us-ascii?Q?kVF6x24xfGMKDD4gzdqPaRca05TbyHr+7y0fhrzfHsyvLdhPasD5i+x3Fllo?=
 =?us-ascii?Q?IUDl4Xr7aeEKzCdy52xMgMq5ypiGS/aDVIyPacfIyw+4a48cw8zie+pNqWlD?=
 =?us-ascii?Q?CeDyf4NzgTg/VFWdozcIkgk7+/DWcDhHHe3kRN85wCs64Uvs90DBlYFcz/9E?=
 =?us-ascii?Q?y/oV9xK4QfARegG9y+f013wqX/oqUeqhU+YZltW0AMXdaGO427L0nP1U/m8Y?=
 =?us-ascii?Q?0qut+fApWhXmBF932jLSb2jxOk4Yi8fVKUrH6ADhCBQcGCZbery5opP7KHoe?=
 =?us-ascii?Q?BcpVshbEE4jDh9+G2gWnqVWfjqmWvr4HUW359ClYD2KZgOyR+JloSsSsM/ZO?=
 =?us-ascii?Q?YYdBrnuBy4lppNeDulM2klC6R9tefsql/JmDyEHbdlw0Vw8y6IdcJeDkdOdR?=
 =?us-ascii?Q?EwO4++NrAvn6gXCbK3t49C8=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38b370d9-300e-4fc3-b25a-08dc81a0e089
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 18:38:34.3587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXjfY64EwEC8Rg3FetO+3+u2SSJJr7++vCQtP1zRWSnuSp3IJR5KghomzMr8oLMSCMu5lf1RG+Da4rqRRAjNqrd5Jj5lKkG7gHASiHTqZ/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6654

Prior to commit df16c1c51d81 ("net: phy: mdio_device: Reset device only
when necessary") MDIO reset deasserts were performed twice during boot.
Now that the second deassert is no longer performed, device probe
failures happen due to the change in timing with the following error
message:

SMSC LAN8710/LAN8720: probe of 4a101000.mdio:00 failed with error -5

Restore the original effective timing, which resolves the probe
failures.

Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
---
 arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
index f08f116bf75a..56418baa3e86 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
@@ -385,7 +385,7 @@ ethphy0: ethernet-phy@0 {
 		/* Support GPIO reset on revision C3 boards */
 		reset-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
 		reset-assert-us = <300>;
-		reset-deassert-us = <6500>;
+		reset-deassert-us = <13000>;
 	};
 };
 
-- 
2.34.1


