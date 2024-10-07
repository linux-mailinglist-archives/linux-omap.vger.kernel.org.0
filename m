Return-Path: <linux-omap+bounces-2330-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0FD992B57
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2024 14:16:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F3913285473
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2024 12:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA431D2794;
	Mon,  7 Oct 2024 12:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tsDUJidU"
X-Original-To: linux-omap@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0AC1B81C1;
	Mon,  7 Oct 2024 12:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728303349; cv=fail; b=CPLT3KRNiak0Gb6ki9AjSUEIOE8vwegVXQN+EIteldXOaLxtuZxzBbhsZamXqrdAgMnyPUc5fJgF9Pvkv/E59S8oenEr+E39OsjAmOJYqz4Aga/JUN9DPYWdONcJyYRkDpVpJBOsyLZgbq3VIHfAiP3Mg1BYC4hvYRGObdLNMlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728303349; c=relaxed/simple;
	bh=UNTRSTA/XlpkC1H75bY/10cQFwMb0dsPhyWf6aewBK8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=TRX7dGs4xjAE+qQMevObbgBVREUUAceON+6vI7FtIPKcziz0SIKbKI07+uUgYP/DW+O6U+aSGIkhr3kkA5Z2BZ8UmCbAdpVDUL1q8v+nj6IuHX4/4dHyzP0ljg63hYan+Dl+Qudt/FZiZxlzic2Otg+EdnesOPIhsWZXPn6qXVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tsDUJidU; arc=fail smtp.client-ip=40.107.236.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cgp2dsN8rQsft7fbtFhXqr0dN6K5c8XCyyzuk9eTqY+HOnYbucGe/Lcuf3Q74aMZxh+84Y5Aqvnjqfx33dELH6OMbmDrs5YUCmAr3sQEPLw2dDWpemb2ETb2vRlc3HAciD3c03hWpjyQB65Bp3wBejQzgKxkUbvrQ19kNYUQIb6jJeHfYDh+M6vy4jtjR0bUosBEkHMcPt0JlyK2p2IKf2wrMhk5oojee+TIx5+73/BEAGwA/CPMHFbASFNvav9zxvCxH2SYBJaaYPr6gE2ewp5eLuWLsUfEmU47GCN50SsBJ/XeUpcrnV8cd1cMnNXdJTY73e/T98a8sDyc4VYp+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tz5vBI55gKEhG4ElI8FWRIV1kIgbKGtjhYY9P24Uo6I=;
 b=qk5JNZ4FQA4E555nxMuV7yhnAyiWcPICKaDYJEAw5RMXAPa2ntvtRnC6H4X+VLaC8uN2brIeObWtSSWDXx+E2AKtHvpPJ7rabGd/wbrwoamK1X0JrVwE935gag62Fqc+2N0U+Ii8tnGj8Hz71f2XohTrrNRPoHorlXvIGW1kkKDQ3ZaelZIhFHiRJ+msnItRcfNSTM9A6VZT3RvpJzzSBMbYeE9iWhg0YIuJca8AL6S7yFpZ1Vvknmnyhy34oo4Q5HpMnTIq9N56ARr7IXuG3skPk/HcpLIDj7croeUh+mZOsMQweySSxoVT1oJ5rhAI1BYoYpXY55kY2JCC8WLv9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tz5vBI55gKEhG4ElI8FWRIV1kIgbKGtjhYY9P24Uo6I=;
 b=tsDUJidUWyYB4Fcc7mivAibr+q8rK90IiiO4eiW8G+nyCGKqf1W5Mspy+sJB8bjy+pfgTYBD0deWROoO93Q9G/qBBMZYFIje4SskTGafWMUM1jBH3I0MD/4Y7YiOPtHOE4PO/wFzpDVaTMDkJm92w7jFKA4b5IZv2VCR3K381S/pBXDGnZqNd/NADUmEel80ZMS3xaLiPNndGA+OUVwr1ipgj8rQlaDoB7QvT/dYjuORfh/XY2J9h3qjCKje2CXM54+4nn5+WIJ0fcmqudPR8Fsk5MLCJq2NV5yCdsTKyZFehSRCVeOGbDFO/u2BN9bgwzelIWDjdDgWrX8yn9yKYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Mon, 7 Oct
 2024 12:15:44 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 12:15:44 +0000
Date: Mon, 7 Oct 2024 09:15:43 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Joerg Roedel <jroedel@suse.de>, tony Lindgren <tony@atomide.com>,
	Andreas Kemnade <andreas@kemnade.info>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: BUG: "iommu: Retire bus ops" breaks omap-iommu and omap3isp
Message-ID: <20241007121543.GM1365916@nvidia.com>
References: <A7C284A9-33A5-4E21-9B57-9C4C213CC13F@goldelico.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A7C284A9-33A5-4E21-9B57-9C4C213CC13F@goldelico.com>
X-ClientProxiedBy: BN9P222CA0014.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::19) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|IA1PR12MB7709:EE_
X-MS-Office365-Filtering-Correlation-Id: f6faadde-23e3-43f7-9c62-08dce6c9c4b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GkWhjCOl0V2UzJ/h4Q6+s3VnWXAJS9IzW/V4aYOIHX7ZACmD4luUTTFXP441?=
 =?us-ascii?Q?zD8CzwI9dE57BUDI9dWT+5f4sCZjGU9UvZocwrzMwGobMrcyT1pPLiRpWwl6?=
 =?us-ascii?Q?guFcz4rNdiS37xmStb3vEhFdQptrPV8MkY+tD6iDZTHfq3SkBTR316q5j00K?=
 =?us-ascii?Q?VU7IxhPe35idNyroQXLtYFS3iGRZQBwDdLAboi0S1OmpeAUXVoK7pYq7E62E?=
 =?us-ascii?Q?WFKamyMPX8onsCwo+2Q+PkyQ81ceju38s62ptUOnTbIFlSbGU4dW7QcwLGqO?=
 =?us-ascii?Q?RRYmirZdxS7MWK3TqoyinanM/mANODg/kRTgznkqYdZZYweqPfDDFJ8KiwiD?=
 =?us-ascii?Q?zGZ4oFUm4jVRVwGEqmzaguNjP4MJy2FoJJ0ekCnKdJKZD2C+pTWoot8CW+OZ?=
 =?us-ascii?Q?o5ukpNCuRth2q+ltwd4oidInEUQFrVUa/Dm5I/vVZxA5jGU4J7WaJirM018g?=
 =?us-ascii?Q?nrnfhQU3zY75DmIgBB8B/45H+OGbxcMqHMXdzjyYlWonnaJJ7AaKTtQY3eB9?=
 =?us-ascii?Q?LvzcLnw3s0+dzxmwz0EDOsKZJCBK61nuZxatyylRQK/xYZ18GH3ouc3G++PS?=
 =?us-ascii?Q?2ip0w/8RTMQ3AY01te+lJNi/xI5ES8xH8U2L9kU1RiZ7pVwz3P2CBy16EHCp?=
 =?us-ascii?Q?I4uM8yNj7HbKFVhu+CQRGPKjF9XJ1lbyaNC8Wb2o4jGWik80UnA5fVAnIgRW?=
 =?us-ascii?Q?uVcKToTNGNMR/J7x8TAoNMZlVQMU3xLd3rx/nBMEtLlfEn2hNqIMtmpESBOZ?=
 =?us-ascii?Q?ypHjot26IHib60+x1BmPOn7lVRDoK08fShws0I472Ow3OGTRNZlvgqRTDiRt?=
 =?us-ascii?Q?+dHrupho91ISzLm6Br3IaIoo4iDOJJjnqoE7Grelu7PCtoz5b+71AyS1woIY?=
 =?us-ascii?Q?ltC8Vg0eRzsmCbIWwaR5p1gqGrhVsx0+thGrFr0dremNYWSuVHdUNIULmgS6?=
 =?us-ascii?Q?RlC+LTT6ogI//qgL0OPVpi+PUv9uj0oIbNDjORvUUPF1eiTxkoek5Zf3lmtL?=
 =?us-ascii?Q?LmUStGywtJmBeoCUq30F2915UBBTXKHdn1sy0Shz9E00LuyxO7jgGIR46psJ?=
 =?us-ascii?Q?81trgeJKZPPaoELbx3/L4PO321FzDoct/E8cCmcQ8YJf+XcaytaeEdO8coho?=
 =?us-ascii?Q?VJkDN3k99Vi/WN4V9JBBBPRStTPaT99rnBelHFAqoC/GWgoPCuLGyH8Y358z?=
 =?us-ascii?Q?A1wDx2GEk7yILSiCmLAvBrljf3XaRalNFVaipVVF4YP2ST4gDr8YVcdjPc4v?=
 =?us-ascii?Q?75THWXllul/4b7PJFsyiBwXR1q6BqukSNno64860NQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7Dbl/f38tNUOA34RNNU33bKtIxu2g3bo6UZfU/OD/CXJFTVy5unz7Qmk672p?=
 =?us-ascii?Q?b4QZvKIdURwiHzQjhBlH3Bdn3DXBuEnrIABAJykY5aUSrjPJn/hmy/ZTFFsw?=
 =?us-ascii?Q?qfSz4A56FJbtc6shrTbbBo3fxFimv3wjClQhs0XAXoHi2bpSWz2hBFOJr9LK?=
 =?us-ascii?Q?0faENcxwtor0OxOG65gvyknrK+2tOFzfeKbNcNJsZeGhU3hTJEMJShaubaHH?=
 =?us-ascii?Q?zgDBVHPF/jf6r6+X48qOS4agmVbgIkkhxQZVthqhSjt3fasiKgWvKIk38nWy?=
 =?us-ascii?Q?kFolExhRp13WVRYlCgW1yU5FmIU24uFeKaix2AX0CAgoxcWENzX5e/LJf/Or?=
 =?us-ascii?Q?K4tJCPk/BoStKHoTXAqLBFmXfCPxJeGFHTTwQN2Vp6H6xpAdaBSgq3asBX7Q?=
 =?us-ascii?Q?6R/jdLGgJ3i+7EVHgfen6sVbLxVkqCUVzpm8SUW1N5Fufpcmgq+2h9fiO2oW?=
 =?us-ascii?Q?94V4RvTeh/I+MRDaS26IXfmlJrPJzhNuJAOAfTvfxzFu4WjQPyi0d8WFXGVE?=
 =?us-ascii?Q?+PLvNegPK/dyaAFIzyQ8gV3y6h/YdCcg76Eddpu+qW7txVCQ27PwWiCLMxnP?=
 =?us-ascii?Q?NhtCWoFmF0sPUSn7lC1q9WADj3iGgJi54o1nqCQcPFx8KEuoRDv9uw4wGjWy?=
 =?us-ascii?Q?cRfX/NlQUg2Q2QqrcZ+duBV2n94nlnN/nMbA36qUyD+HeZvwEzP0BZPSwxYk?=
 =?us-ascii?Q?p/Cl0b1qOq7Zh1KXex72dZgV0C8qXaYlGDwvQOdto8AJGP6wItVv8peYoaGC?=
 =?us-ascii?Q?jCjcuH3IsyIBLObik26DKBKSrmhevpBFJ6ViJLu2ns+eXkUODZcufKr/zoYz?=
 =?us-ascii?Q?SPDv40QK5udXt7Eh7Z2/uMkrwQrJPpx1urW//ZdfqcMLsMMlKUSJ/8ap6IsU?=
 =?us-ascii?Q?LDWcJZK1TZnPZsW21bEIAxkcpWHQb5dv41iBtIfCV3yP0HrAGDu8OB9RX2L8?=
 =?us-ascii?Q?BzDDiZdvunJfvNBFrBhLd1LZjLTae940P4mCHLITe62zq8VQ8VEFVlcZDLSk?=
 =?us-ascii?Q?/4DM8tpQbogLsluhH2tzNnGcBHfqoSYkRfNk1Z2lQhVHVQGHMVh1575HeYp9?=
 =?us-ascii?Q?ShnYEXtTXFcVepRuXNUiQH1NpUq/VFahruFdiKBRwRYU+KhHvkyxeMqIVi9I?=
 =?us-ascii?Q?fRTYXSb9I22yBeZTuxQoYXU0copSWasgeLBQHLgB0jM+vgzkIEVr/XXwLS1j?=
 =?us-ascii?Q?WBIqBrXVhOD3J6vp48OQ+BEXTLwWQUGINh2q7cp0+KWs2YH4stRKn/vEapdv?=
 =?us-ascii?Q?6iehtP6pcfJeFS2AeuP7F0Gv3qYXILuN0rxcPO4BcbvRKilMeAkBTUT0Djal?=
 =?us-ascii?Q?amp9yEale4WkT/I4q9wvTjCXaM1JbxVW4ZkzKDgMtaqtM5hvv1G9v/hEkR9L?=
 =?us-ascii?Q?TNf2TLhsA3j6t8EyvbmfGSRB+HzjWSciyf21n8PXPqKPO2XjXpTgNB60qtQ3?=
 =?us-ascii?Q?r5uiCH6uTaLOLrGN2ZZDWSHIMVU9PqhFkygHvFZTilkqkczukT95KS8PyZ7g?=
 =?us-ascii?Q?smZSjKDT0yc+sz2XMty+e9ZWVD9h3D0P/ByeDb27ellZmJiWT1IYY5PTCmxL?=
 =?us-ascii?Q?0SHN1YOrrllBBDCEFyU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6faadde-23e3-43f7-9c62-08dce6c9c4b7
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 12:15:44.4741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SUaTYtXyrm+W+C7O2D+4zg5WqiU8f3a2kfJetBtpWcRKOaFyDuXtFO/AxTbLB7cz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7709

On Sun, Oct 06, 2024 at 09:40:00AM +0200, H. Nikolaus Schaller wrote:
> Hi,
> 
> I found that the camera on our OMAP3 based system (GTA04) stopped working with v6.8-rc1.
> There was no bug in the camera driver but the OMAP3 ISP (image signal processor) emits
> 
> [   14.963684] omap3isp 480bc000.isp: failed to create ARM IOMMU mapping
> [   15.010192] omap3isp 480bc000.isp: unable to attach to IOMMU
> [   15.023376] omap3isp 480bc000.isp: isp_xclk_set_rate: cam_xclka set to 24685714 Hz (div 7)
> [   15.065399] omap3isp: probe of 480bc000.isp failed with error -12
> 
> Deeper analyses lead to this patch breaking operation. It is not fixed up to v6.12-rc1.
> 
> What seems to happen (in 6.8-rc1 code):
> 
> - omap_iommu_probe() passes &omap_iommu_ops to iommu_device_register()
> - iommu_device_register() stores the ops in iommu->ops (only)
> - __iommu_probe_device tries to read the ops from some fw_spec but not iommu->ops

Maybe like this?

@@ -1233,6 +1233,12 @@ static int omap_iommu_probe(struct platform_device *pdev)
                err = iommu_device_register(&obj->iommu, &omap_iommu_ops, &pdev->dev);
                if (err)
                        goto out_sysfs;
+               /*
+                * omap has a DT reprensetation but can't use the common DT
+                * code. Setting fwnode to NULL causes probe to be called for
+                * every device.
+                */
+               obj->iommu.fwnode = NULL;
                obj->has_iommu_driver = true;
        }

Jason

