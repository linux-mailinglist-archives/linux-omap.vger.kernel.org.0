Return-Path: <linux-omap+bounces-1301-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CC84E8B4F55
	for <lists+linux-omap@lfdr.de>; Mon, 29 Apr 2024 03:58:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 83005281F6B
	for <lists+linux-omap@lfdr.de>; Mon, 29 Apr 2024 01:58:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E21FE7FD;
	Mon, 29 Apr 2024 01:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com header.i=@inadvantage.onmicrosoft.com header.b="wa8l19/o"
X-Original-To: linux-omap@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2121.outbound.protection.outlook.com [40.107.237.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3EF7F;
	Mon, 29 Apr 2024 01:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714355918; cv=fail; b=M2QyyK2bhmdKaGWU2RVE9MjyG4iHdgxCCi/cg1AMXfBl7RidD0dFlS0ot8fDMXHpnfyl/7e3eTgLtBJyQ95YPUpkwwcPRd3cDjErzb8VT/Nsv946MRqtUicJ/PCRp5ny6BnFPA1CswDC8GAS3DGcovnoPX1QXqn78/a4BOIn7Ks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714355918; c=relaxed/simple;
	bh=koVIneP8Rd33VJ/sZs9KPWAd2pDJEljQttXfPdz+GzU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=ZT+H/CWaif6Zno+Pgr8VZ5G6fXk9h1vx/ehXVFCq31f1+HCGPFiMa4WHoWKcARVm2vTT79bY1uJmBZhOFNdxRQijjLVsJcuOsvNSjW5ba652tpJmOmHGNW/sH+cVaFQxw8qm8G7M5FttjGfAhuU3lJGXPAaOJ/yei+bNQZYNndI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=inadvantage.onmicrosoft.com header.i=@inadvantage.onmicrosoft.com header.b=wa8l19/o; arc=fail smtp.client-ip=40.107.237.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PYOX8BWIF51G6xDG7SAU86vUTvnAMXwE9mB5QIWDLwVzzrz5SutcH5jDUXrGI1KSBkbAuaPt+Cw3B6wAc6R1HWUiEW4tOx0t2vdQxCFgThgZDJyQG2SpOQ2a7+JOPcXzAE7jr1OLOhtEtVhwjZC9M12gcFRVJMGGO0UwnLTnAtXrEYwxW+c0ilXdmgf9KtOaxSljjVhvxAvZ3wpem+oNs9QoteScDyyhEdNIfIv6YkvAhFzlYY8au5jZRqzHMHoJR2xAyhj+2g8oKU8XbF33N6lTe1+/qCmBfEje5zRhkhN4mNsN4MFuXCIJ95nfW1oZ+3M9Bwn1Yp805A0PtFqXkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYqsZXqv42Z3OAL43ShNL0nRQSRZ8qqLnk38+YSb9c0=;
 b=PhvPYmJqCDsFoUbjAAgekELiUHI264/SwnFFMrt4j5aGtHwdD9/urWlZv8du42sbtQOTNs46l9ZG+GdTBymrD4Xwc5aAA3iro4/JlfzHVbWbp8QY7x3mAfZW7LEEJyAU+GyH2gkrMPkPMISQeCjl7lGJVTkTiyacxWg5O8V0U70h+VhedudUR9Jrq290kDGwACiY/lI6v7DZ+uLyXgu9bvD1u9/d7l3LqZ3ycdcil8bafWqij4cOnOu0MvPszCRgLRwXI/2QWdEHAl/w4Uxunsmk+2VEEeIAcl81uAtKQlZNADfgslcD+0eP6S4G2+rFgIoLKd4Gi/qiPcFozVH3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYqsZXqv42Z3OAL43ShNL0nRQSRZ8qqLnk38+YSb9c0=;
 b=wa8l19/oLDHPbm8r4xw6ClJ9Ly3UzDPYoiOLTHNjLnO9KKipWwypf+Kq6bucIqGWVDw1Jfg4WULE16reZGUmOCEAo167GR4fmYm9OwNTpaSUi3CBLBMGf2ddC59nZZLQRnU5ydksML89CikgrxWdVK10xOPMNp/NiVZcGc/pABg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from DS0PR10MB6974.namprd10.prod.outlook.com (2603:10b6:8:148::12)
 by DS7PR10MB4960.namprd10.prod.outlook.com (2603:10b6:5:38c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Mon, 29 Apr
 2024 01:58:33 +0000
Received: from DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::1e22:8892:bfef:6cb6]) by DS0PR10MB6974.namprd10.prod.outlook.com
 ([fe80::1e22:8892:bfef:6cb6%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 01:58:33 +0000
Date: Sun, 28 Apr 2024 20:58:30 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: Beaglebone Ethernet Probe Failure In 6.8+
Message-ID: <Zi7+xqp1GG6Jl/kU@colin-ia-desktop>
References: <Zh/tyozk1n0cFv+l@euler>
 <53a70554-61e5-414a-96a0-e6edd3b6c077@lunn.ch>
 <Zicyc0pj3g7/MemK@euler>
 <c11817a2-d743-4c27-a129-dd644c23110f@lunn.ch>
 <3kpvqcg3twpifzkxkrvhqew3cjuq2imgo4d4b775oypguik55g@npe75wf7rpdr>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3kpvqcg3twpifzkxkrvhqew3cjuq2imgo4d4b775oypguik55g@npe75wf7rpdr>
X-ClientProxiedBy: BL1PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:208:256::9) To DS0PR10MB6974.namprd10.prod.outlook.com
 (2603:10b6:8:148::12)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR10MB6974:EE_|DS7PR10MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: 03907b9f-27a5-4fa7-68eb-08dc67efdfd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+yQIKqzjFgyDIU04QNv453krfP14E+XeDxojQBDQnOsJp6dSq/y/b7ZT5582?=
 =?us-ascii?Q?wAU/xEk3jT/U0lTcot7Fyvhx/8W50LO57csjX/3fRNhk3YYG8bJ2Z5zLKSmE?=
 =?us-ascii?Q?R7aSGCvrNzKLrFBk4YDw7t7pM0ziu0F2tmsF0v3YneCTbLwXJ96ImHHZCqk6?=
 =?us-ascii?Q?r2DAln2X+EYEBSRTlvbHsy+HvPsabhxncbuIzDpRZOGV+duvoEEmlYIzUx9R?=
 =?us-ascii?Q?J3/JHLhKZtID/X3WEOvQJzSC6z4S3xu7jrXOQgV3nqHVW3KfTx7HjH4Jbtd6?=
 =?us-ascii?Q?Dbcv/o14dpwdp9WjTHhYPdEScSLPR/pcDEK+L+6WGFFN/4Byote8/6fcoz7W?=
 =?us-ascii?Q?CpfTKk8ZqpWCzoXp2jCCSLcl/1pxKl+cPBIoAxKeU94ORCFukm+4KgaSNush?=
 =?us-ascii?Q?LghVtwleXSiiwI7g3nlaGh0YGSeGjub28waiBhSCZqN6ufScIw8kTVpvG/+Y?=
 =?us-ascii?Q?WheTLQHA6bTHvM+C3oU95UJogLlIl7oatkcvmViu+NBi9kweZQ77FXpxeMdx?=
 =?us-ascii?Q?JCdUVD2CWPGOKiD0L/YGv+LL6/cxWudaPA7K/cl/+sk8+PfYfXTjPEAFLe6P?=
 =?us-ascii?Q?RRt8Ut/jC2X96t+2ueDHjSmoxSOmgYQiTUai1oxvtdzyM9Xh9YQOlm5KuG2G?=
 =?us-ascii?Q?oU+AUaws1m6ZO0IZH1++dD2vL8rUsdApW/p/v0WVP2yB7K9fvY36dRctO/sr?=
 =?us-ascii?Q?1KEDpYhceRSjCVdNP3mfLP3GcJ8YA9gKrXV8hne7n8tEcj22rUujLnCld9No?=
 =?us-ascii?Q?vdMouFdaqc6qgm7XAg9a0luE4pRfsS5lLb6TLPRKzxJHOPTmo3+zO2Th8lsM?=
 =?us-ascii?Q?q0HMnPr+mNYg9PWNyJ4+iLFJkd4xRYsxjnH/n+StHTT27FROe1faLqDxvKis?=
 =?us-ascii?Q?TQPRda8thdOAbhDGewK4zpoofX34I8xdDko+FJFZqDXdmPUoT7dI6X9iApv+?=
 =?us-ascii?Q?oFP/cy3pF0KQ2ik10snDv5EBA2ZFRle242f0C8RkX/bABEE3ajPFboWPxDDB?=
 =?us-ascii?Q?ZmtuejXouprhr1jMF0Rmo4inBBctkiw83UTwEUAyzMwS9jeMLTm6f79rkOly?=
 =?us-ascii?Q?AYEK6kLTPMFkEOlIgprhoUFTMwTej/aeOaEe5cNCEeo5ZTJXBwk992YqLUfX?=
 =?us-ascii?Q?fbhJrzE3JmCs2jjpVUrbv8fFfS4wVaVGJ40jaM0eM7pGrNXzqcU4oooIttEO?=
 =?us-ascii?Q?gChxrcFWYFcA/p5Ru7JXfQIOn5cxc3b+CtpRzeQbXoxI4TCOXE4MCGD+sPE?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR10MB6974.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(1800799015);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IPmu6+OYV5gnj0p163WhF54QI4p3XPwitDHKoh028zN5n+p8QqS1vBMe6Ibj?=
 =?us-ascii?Q?UHTIVxWL/zAg37C6Whuxq5T3kIxU/Pe+1LL7u5zsBF9xT9r0hxQUCY7Gx03H?=
 =?us-ascii?Q?Rk6Fht/6EkQF42SjyH1X0ta7qKUgrn8n9WiMdRspHtpJROC3rvYxpJPlloqs?=
 =?us-ascii?Q?8isYAE0w3Nb5U85F6a3pF+UbDaiR26t8uDbFXQknlSk8Ycs9uLl2yHGYA1pv?=
 =?us-ascii?Q?0CEpAiwpPWeMdUYvzKzHwIRSk5OI4UaXRtDCn3nJum5/58veJbVimfsyvezD?=
 =?us-ascii?Q?Zb1L2BTIVAsD5sl6zBmC0dvFFP7dHFjnsqnWZC6s+ELUQPwrflhN/KZXDHlY?=
 =?us-ascii?Q?Gmw4CGk3Mjz3ND4VELzmoF+xkHJrijLM4oOCXb1vVykLAcBe6sVl/Er/j3/o?=
 =?us-ascii?Q?oJXDH4Pfw1PIC53ii7JNk9zWHfLTnYluEe3rjaqUq16FdqMcu7r/XyPAV4fU?=
 =?us-ascii?Q?p6b+vO6ASQdDS89KLjnXB0AESBePkRPZ3IVQY4xQLmvehNkyPWUUYsC4Vv8J?=
 =?us-ascii?Q?pZlfed0QoEV+CdRtAJovmJTP0q1vMblAeb0Sk4dDdz/VSZz+jvSawGJF+JUS?=
 =?us-ascii?Q?ypT4HJ1EgucyvuX8nZeR9SqQ/kXfa2iyelmNI9eFtEUHVcDSTqMDokBbaw2W?=
 =?us-ascii?Q?UKolZUFd2FJEWxvVBgWhY6B5v2mT9gbH6B6DpHswik4yD5F3IhVilJy9gKRa?=
 =?us-ascii?Q?MsU5aG9TnhxF3Tjj3eB8WFuM2PBA8rcKwruVunobQqsGVUN9GC9mGfHvZDdU?=
 =?us-ascii?Q?tKzlYcXYUAU6c9PPjtBsFWOLFBssxwXh1M4lkMLdTUkj6KUwXsQSWihAKROJ?=
 =?us-ascii?Q?whwLW4ebr0074DfdMRyaM0LjR08TeSzOleYB1tj94nnEUaq27eioddXAtWo+?=
 =?us-ascii?Q?V2cFuNvU1oonAv3yf5yqatFD2kx+K698NJr6fuLR+CVDHbzjpCPpwg9HG/b1?=
 =?us-ascii?Q?sXPPCLXmc2AYZWI3gsjRi3K1kBhazoNMK3znctw84+hR8LPQSgXlaBeCNXqd?=
 =?us-ascii?Q?gdR58JUB7CEQQEW8yk+JvMVXBeLyMOy7frFwlaR8+kcID94O32TpxoqYCdC2?=
 =?us-ascii?Q?jwra41RS+SS5ZFRpnRm4ga8FmNmbQ9chDxCKpt5WfjuK/fpTWZYPYMk5aXDY?=
 =?us-ascii?Q?yX1Y4Xm15sq55+V4DgklL8aq6go086LFf2tmqM5tl9HWAZsq0T2vkzf97XKp?=
 =?us-ascii?Q?YEoJ8dMYwEYe9att+klMejUfY7YDcSWga0IxRl+0joqk4Zx2l0A7bLZWHsvU?=
 =?us-ascii?Q?iYaheSUVb+z4OwV2Urs36zViupSvrkvPHevgf5OGzlZt3Uik/2IACVSNOysV?=
 =?us-ascii?Q?MS0smV5E0xSBoT0ghzioTw49gSlobICS0XiAN5ed+ATmhgkiIT/GoEyOAUGs?=
 =?us-ascii?Q?qB21TuhMni++6b+F0NR5/oxHcFYm1Mxjri6vGcz77DxZj4XMoGQ6IAsxrj46?=
 =?us-ascii?Q?0nKKSbbv63EI4iyj4AaDye6LQ2o0ErD6SerREhVN/htwlTYRRKyDmTAErEjr?=
 =?us-ascii?Q?oIsiqYmuWjMwY6Az0Y/JyLiPuAI6wVeaNsU/eMATLIYoPK01ow2ALPtMkugb?=
 =?us-ascii?Q?oIEiYusGlzZvsy6/QuSfWyzGIxZPCWkG/oeGhBpe2AVqAntkmuBqbnFliezR?=
 =?us-ascii?Q?F5B6zQeuCtVUebz1cAdDJHc=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03907b9f-27a5-4fa7-68eb-08dc67efdfd8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR10MB6974.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 01:58:33.2258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yEfUYS1jbjrsa12qbmuuMuy40cu7MZ2ARTO8m06Ei5Il8SgeMKpkRPWcgG++v90gVVgj7VgF9QbVTPMHQEadm5sCu+0UP8nV8hUXLCmcyFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4960

Hi Andrew L and Andrew H,

Sorry for the delayed response. I couldn't get to testing anything until
just now.

On Tue, Apr 23, 2024 at 03:07:15PM -0500, Andrew Halaney wrote:
> On Tue, Apr 23, 2024 at 03:52:35PM +0200, Andrew Lunn wrote:
> > On Mon, Apr 22, 2024 at 11:00:51PM -0500, Colin Foster wrote:
> > 
> > In these two last transactions, the ACK bit is not set.
> > 
> > > [    1.550471] SMSC LAN8710/LAN8720: probe of 4a101000.mdio:00 failed with error -5
> > > [    1.550592] davinci_mdio 4a101000.mdio: phy[0]: device 4a101000.mdio:00, driver SMSC LAN8710/LAN8720
> > > 
> > > Without the mdiodev->reset_state patch, I see the following:
> > > 
> > > [    1.537817] davinci_mdio 4a101000.mdio: davinci mdio revision 1.6, bus freq 1000000
> > > [    1.538165] davinci mdio reg is 0x20400007
> > > [    1.538426] davinci mdio reg is 0x2060c0f1
> > 
> > Same as above.
> > 
> > > [    1.558442] davinci mdio reg is 0x23a00090
> > > [    1.558717] davinci mdio reg is 0x20207809
> > > [    1.559681] davinci mdio reg is 0x21c0ffff
> > 
> > In all these cases, we see the ACK bit set. 
> > 
> > So the PHY is responding to registers 2 and 3, the ID registers. But
> > it seems to be failing to respond to other registers. At a guess, i
> > would say it is still coming out of reset. Does the datasheet for the
> > LAN8710/LAN8720 say anything about how long a reset takes? Can you get
> > a logic analyser onto the reset line and MDIO bus and see how
> > different the timing is? It might be you need to add some delay values
> > to the reset in DT.

I don't think I'll be able to get onto those lines. But I do think this
is the right tree to bark up. I also found some kernelci logs that
suggest I'm not the only one seeing this issue:

https://storage.kernelci.org/mainline/master/v6.9-rc5/arm/multi_v7_defconfig/gcc-10/lab-cip/baseline-beaglebone-black.html

There might be ways to navigate the kernelci database that I'm not aware
of, but I couldn't reasonably say "before 6.8 it didn't happen, and
after 6.8 it did." I'm not sure that matters at this point though.

> 
> For what its worth, I think that this theory makes sense if reverting the patch
> highlighted above makes this go away. Before that patch, you'd see a
> flow like this:
> 
>     net: phy: mdio_device: Reset device only when necessary
> 
>     Currently the phy reset sequence is as shown below for a
>     devicetree described mdio phy on boot:
> 
>     1. Assert the phy_device's reset as part of registering
>     2. Deassert the phy_device's reset as part of registering
>     3. Deassert the phy_device's reset as part of phy_probe
>     4. Deassert the phy_device's reset as part of phy_hw_init
> 
> Which means whatever the deassert time was tripled in
> practice before you got around to phy_hw_init() (which if I understand
> is when things start reporting no ACK above).
> 
> I am not sure what devicetree upstream would be the one to look at for
> your beaglebone, but microchip's datasheet for the LAN8720A has
> "TABLE 5-8: POWER-ON NRST & ..." section detailing some reset requirements:
> 
>     https://ww1.microchip.com/downloads/en/devicedoc/00002165b.pdf
> 
> If I read it right, assert time needs to be >= 100 us, and
> deassert... is not so clear to me unfortunately. Maybe for starters
> triple your value and see if things work ok (just based on the 3
> repeated deasserts going down to 1 with the patch applied)? Hopefully
> longer term the actual deassert timing can be confirmed.

I went all in and did a 100ms delay before returning from the resets of
3 and 4 you mention. Sure enough, everything worked! It certainly should
be understood and optimized. I added the linux-omap list to this thread
(please let me know if there were others I should've CC'd on any of
these emails).

Either way, thank you both for helping me understand this! I hope to be
able to fix the issue, but at the very least I hope it is considered
"reported".


Colin Foster

