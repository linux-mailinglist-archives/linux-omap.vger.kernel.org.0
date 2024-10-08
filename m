Return-Path: <linux-omap+bounces-2342-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7F399486B
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 14:13:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D2CF1C2589D
	for <lists+linux-omap@lfdr.de>; Tue,  8 Oct 2024 12:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3D01DED6F;
	Tue,  8 Oct 2024 12:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AQe2tRxY"
X-Original-To: linux-omap@vger.kernel.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2047.outbound.protection.outlook.com [40.107.223.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A86861DE88F;
	Tue,  8 Oct 2024 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728389557; cv=fail; b=mp2MR9FPHhDpZETsJ2vO3FTlKbHvWu8+N4p3jLotjOe59aYUSQAX8HlzmUfXycsD8DN0m7+1YlEaykwXfFj3VohEhuCFXav4f5uFyse7oj4FXWnHvRioE975GKUsblmmHxFk+DjTUHYHXv07CXAcw0l8LnSBe1kRrh1FDWHOZGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728389557; c=relaxed/simple;
	bh=tNpsqqb1RjameF+sBEsygT1scOW1/j29d7NBKC14StY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RoDCskivRXaPqm19ytmRGU+tIOMVQ47mPSAexg6I1m33aLx/RhNHHRaGpnOZ6DoRe1eSpredPKw/t5cGXB4lt1ObOY107WPW1jJSJYRrvu/zrzt7mBXOiiGNOhjSTH2yRUZ1F2vHf5OE35zwc5/UmbOHBpKZqfjrM/Znfu/lCSU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AQe2tRxY; arc=fail smtp.client-ip=40.107.223.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZ3P64kLM0UxO8Q20RT0uMEEG0tIS5TxTM2HjLljvtYzM8agLPeu66LwlXVMCMN+afMtfOhLd3TF/hmHYxSrttVzp1ptSSJJuhWk1WoFon9b4PX9ec9Mte7Gu92VvkJwVPtK7F/FxTN34dRopbZYDAdzLUuqST8DB3/L6tGhN28tfbLUwuTmDG/qBmdtWndirjioLV9U3izYjnzhKBUnaUPZ4DH09+9iW1FflABgdao5XOeeHsU0p6BPYLS5cybCc5zIvu7EuyEs49OtF+SGViwKfz84kAWNHWh7GyABcXmCxDOBYQ4XacATW9MXuFanXrGwAM3MfuC+yz9zmDkoSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7JGxZWFz+xIaC6uNNlq2Uzt4mmXsrAKVHcjS2C3DWAM=;
 b=HvfNNMO0NLB1PCJErkT91hxL6cx9ROc3RvY0EYfHsxTBgLDjxLc0XOEhhDy9c75lPBy8q7+bsNR4423DASLHoYlUGyiTb2viEIIxOU++i/IRr944+jQ9FIsD9VOhITnoQLG0BpM+DJeQgtQfCDk1ga9sy7OU08zuoY6s8Y+8bysWc5odWwYPHugTvXLvMmJ1AVTvw6PfLheYy8lbvFVZN+QMu5DorRfMOhBfGrryOzypAboXotaYNWsuxLXZA7DPprbEOhYxkcCRHK9oDs++NnWJnl2MDD3BDIq9nitvR/rI4kXNMzv7t0e3jXPagIuQ35RiMJkr0YISuj/z+49EHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7JGxZWFz+xIaC6uNNlq2Uzt4mmXsrAKVHcjS2C3DWAM=;
 b=AQe2tRxYPtKuiED3ZVrNf9pmGiRcsmD92OKPeTt8AOfYrESX8YTgtz1A65VQMMzFthwHPKX8+v/VHG+mSJQgy+Q9ta6RiA8NDnq9jv+tnWIjp/KJ8yBUa6yBp19O4Z+n3dGGbkeqhAxQUITzDtI0r6/ZxmOlIbd7m/sB+81wa67CRB2SSzTt50es4H5Gju+/xx8yMjxXs2J1v0cOrdZhszMaBgECbTmdiZ4aa3vPmpwGEPHzul0mf72eZvC0efc4LGjnh11SVJLolKmNL0bLIVE3R9/1DE+LPAVojZ6cG/GHmJjMggwLw3iSOdp8r+EUW23I7g2RJOozEcsdk/VDjQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by PH7PR12MB7940.namprd12.prod.outlook.com (2603:10b6:510:275::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.19; Tue, 8 Oct
 2024 12:12:32 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 12:12:32 +0000
Date: Tue, 8 Oct 2024 09:12:31 -0300
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
Message-ID: <20241008121231.GF1365916@nvidia.com>
References: <A7C284A9-33A5-4E21-9B57-9C4C213CC13F@goldelico.com>
 <20241007121543.GM1365916@nvidia.com>
 <66572BFA-4501-4087-8B2D-83DB30247CFC@goldelico.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <66572BFA-4501-4087-8B2D-83DB30247CFC@goldelico.com>
X-ClientProxiedBy: BN9PR03CA0675.namprd03.prod.outlook.com
 (2603:10b6:408:10e::20) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|PH7PR12MB7940:EE_
X-MS-Office365-Filtering-Correlation-Id: 83632482-97b7-4ab1-afbd-08dce7927c78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IjLexM7hvLHgCb2Si5SS7I043jztlVz4kIqD6FW14IlOHDBlghCDskU/1k2d?=
 =?us-ascii?Q?qt6lgDGjz662eebQiZ7awnAzNLhMXLTY6AVVDsD8uKVbCOfFGdz7lkB33O2H?=
 =?us-ascii?Q?Wof3TW/2KoCR3S0zot3Xt4VtNjjoHsP/SF/B8z7NLl1uZimnl5s7VTqKN7HA?=
 =?us-ascii?Q?7xXU4CWYja6kObO45ceEgxnLOHDwUSRyvwZpAj7BwNq8of9ry9UQ729ArcNg?=
 =?us-ascii?Q?nOTSSmzGOA7YhMBUXyH2Vx403quF2qaDM0V0v9CjFumD2AkawBUu1RJqBiDq?=
 =?us-ascii?Q?rVRdf712mRA3ZNf5VLjeP5KH8vcpNIp3ygV/sDbf5nRhax6byCPcdz+2w0Vc?=
 =?us-ascii?Q?exYhmVLfI37xEwbWaDd9pOljRLjaZxU4XqiyACThVyC1T1kuMsi5bMUK+In1?=
 =?us-ascii?Q?MFJZcmk7bIoG7UwgV9T0kZyaTjEGOt2sIqDsDXgP0WI7P6VIEhX5B3OJZ4v7?=
 =?us-ascii?Q?hpJpbC33Z24JNPPSeZLzAYYP+51lXy6fItSL+lJUWvjbh4aClAzdcKjfHD6t?=
 =?us-ascii?Q?6LYBSjzCnPE4Qp1RlXRRRvB/Mvl3ko6qqDZEOz1CNVlwzSVxOxR3AIVmvJ9q?=
 =?us-ascii?Q?0dDp9kSNYPtolumtfe1ANi/b0L6UX6r9W6OhqYw7tD4+GwnWIN0oEUyJ7KLb?=
 =?us-ascii?Q?h/41VxPRQS5cnk7XnrNgWZtbHLQ9uF9NfM80vMDTzOrzvGJMf7sj9Ai4cllb?=
 =?us-ascii?Q?Frm4Qp6UW0TlzYb6DdebK7OsTK6GiWz0LwrCqvQxhwdX2NyJdOZtb4YQkg5K?=
 =?us-ascii?Q?zeAstP4+sLShp+kd5R3FbkFuDF+ujQYjEUqVDUAlb1zsj1Qcj/5v9EhZbhXe?=
 =?us-ascii?Q?dsNKaH0g0gFWoin2jIyN6tBcqy8CICjc1nydYUlq43+uqOndhkpjR1eV2gor?=
 =?us-ascii?Q?gUjpy5OQZnvaOjvHyto7k33ebiInY38GBl7a4oUP0fsfDf8JwBsrz+e46HX1?=
 =?us-ascii?Q?psOfAYZemSzPre7CVCVsXE7Z0LIFlRX9VHM8XoXLIq9/+3IXh31p0prHhpie?=
 =?us-ascii?Q?kdrlHuGIv+sGAgxqpf9GEQtR9TmWR4eleE1LV1iAPooLtqp5a9hqgeQkIStv?=
 =?us-ascii?Q?4ShWovFNHgSmlsvXAd2nybHK3bzrUp5gmf3O+tzxWwzCbdChUWPL9A7OaVxJ?=
 =?us-ascii?Q?Ia8C/r0uTFDk19tkxmg0yOu0MR2DCkHG21Fq0hrEPhc90FLiEyvaw9xFMhvq?=
 =?us-ascii?Q?BPVW0nU7+dtVCL301e2famNtH2w5+ushBLMDxv4eyetihIXApV/BtHuT5hGi?=
 =?us-ascii?Q?RgXJ2x+vG/o5CnOGSYVDPEWnP82xXsb2NcRAfhi97w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7F9/21EfB1pKioWNzSbVe6XMgyi/4ORz3BRLcJ9KmANVKcXagdrhwR4PZ8M4?=
 =?us-ascii?Q?uXG1bY8tFh4ujvQu72qZ87peBjqTZrr6s1N542wAQZrXJwTkOsCkd4DgLvQ+?=
 =?us-ascii?Q?gOxebjG9zgB57RjfMg19uSbZtYi6//H4PVWM5GtAecboFTzZKqxhV6Amp6s7?=
 =?us-ascii?Q?Q2qNHNbPx6gPBfs/OJ+HswYl34DFXUkkPiz8EZ5qsU+udWjfAvsGnhwkBlYF?=
 =?us-ascii?Q?cJqW4BAQTk84QfNZN5XEDe6QaMmn2UiT2noTb0EyDPImMVyLp+8wR5P46BnT?=
 =?us-ascii?Q?HS+F7LfQnVIL15ZMaT6gCyx6D7RsxWkWzq4W90wv9quegrelFHLGo5AhFm3G?=
 =?us-ascii?Q?B2+9fmdLh0UpFyf6kfPheZ769UALxr3hM+YMPXLpKB3h5/neFo5/DiFoOK7N?=
 =?us-ascii?Q?hIdMzgWnr03MXhiHrRK9KDaFVbQV7NvWwK8AFLfEDjWqxxF8ZA1Q8B+6cHzN?=
 =?us-ascii?Q?ci8omjoxN+IvrfYD6KE6SmGbGLVC72v556KuKbSJJqDV5up/dz20CxCLUpEL?=
 =?us-ascii?Q?Z41br/6R2jQHraFpaUR+TAAsmAoiwhONILAdCgPVqRyW49Sk+ChmyCxOr9jQ?=
 =?us-ascii?Q?+32jXYpJTdvcK9uohkoPTZ4QnPJ1HrrjFFPIHzGXkFaAzgYMrc1gqaBSEEcp?=
 =?us-ascii?Q?b2/NH4PRivsahWavy6p41/5WEBtWXAnWuOF86/hGx3XhBVZobK4HYP8cPBC0?=
 =?us-ascii?Q?TR/kBKDWXQCn8Fv+rdBMDobUUqKAZMgWp76zDmV973+BiKohzLEAP6nWZO91?=
 =?us-ascii?Q?Iea5/qb8322/YhNzpTLaegqeuOkRYBDKV64+XPRS3nvGX0upu9wR7hnoMAcI?=
 =?us-ascii?Q?ia5h/HfLKs7JAgrSJ4ctVMmYxDTVvUoJnD5lhIdsWzkQsPNhtuujygLoHBVu?=
 =?us-ascii?Q?bOmoqvm4QUfQtQOpNf2d6iaiFgZSgE1fkIYi2jyElI7BS4y8mDJBb1n0DapH?=
 =?us-ascii?Q?oX1UG9ULh0nWkynLt9hUFkxXkzTW/BSr1FRTBeM1ZIlN2J3j/NCQa5HsPXI5?=
 =?us-ascii?Q?t8Z6s09PzcHtkN6vXFjwKxF/owIQCiqHKRG23ekRKJzAi6gpkfRtbk9buOBE?=
 =?us-ascii?Q?UdHMJ9+Duldk5NmaEBeOK4lvZ1iS+xPgHQ7M0Wy/TulReXxhlqyJhdNKJm3U?=
 =?us-ascii?Q?JoSAgpej+bHpokn0cuKOnCze+66ksSe8kMQED5cBDIjGiwKKkXB8EVfGdUYL?=
 =?us-ascii?Q?BYDKAk7dhBZ9jah1m7lrw6y4HB9k0mlRo9EcR4RW7vvXwv+Uc5gi/Nfopq/J?=
 =?us-ascii?Q?JWH2UmvJkgmDCLNvaw/GU/VW+6l6ZosyGjaUo16+aPVE4BeSitykC4y72oHP?=
 =?us-ascii?Q?v00gk2eQKmx/pR1dXs0l2zLhQILunzJCz6e6mWewoXv8PptVLtF326J55VeN?=
 =?us-ascii?Q?d5o6XlERjJVlFsE3VIOXLJF+IbvWq3NIevJWAYR+Yi5hywPszRpbTE9onICa?=
 =?us-ascii?Q?IctfdNUdOnhfp/p9ICSnpAU5177KERmd2549QmKq+UKCpALWhcxIenwZMF6Q?=
 =?us-ascii?Q?W71bcU832cI6Hm96i0rhXRyRPgsNRHS4Sk9h/TPUFpiFzwEKxmU7OYOigLIM?=
 =?us-ascii?Q?KOYr1yANojVoLZ7FsGQ=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83632482-97b7-4ab1-afbd-08dce7927c78
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 12:12:32.0403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bbUC64XUNhd+iaPXoqR1WjajFwdbPV3J2MnNKuAiLjGCsUnFWDPNVRCLuOycv1w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7940

On Tue, Oct 08, 2024 at 10:08:27AM +0200, H. Nikolaus Schaller wrote:
> Hi Jason,
> 
> > Am 07.10.2024 um 14:15 schrieb Jason Gunthorpe <jgg@nvidia.com>:
> > 
> > On Sun, Oct 06, 2024 at 09:40:00AM +0200, H. Nikolaus Schaller wrote:
> >> Hi,
> >> 
> >> I found that the camera on our OMAP3 based system (GTA04) stopped working with v6.8-rc1.
> >> There was no bug in the camera driver but the OMAP3 ISP (image signal processor) emits
> >> 
> >> [   14.963684] omap3isp 480bc000.isp: failed to create ARM IOMMU mapping
> >> [   15.010192] omap3isp 480bc000.isp: unable to attach to IOMMU
> >> [   15.023376] omap3isp 480bc000.isp: isp_xclk_set_rate: cam_xclka set to 24685714 Hz (div 7)
> >> [   15.065399] omap3isp: probe of 480bc000.isp failed with error -12
> >> 
> >> Deeper analyses lead to this patch breaking operation. It is not fixed up to v6.12-rc1.
> >> 
> >> What seems to happen (in 6.8-rc1 code):
> >> 
> >> - omap_iommu_probe() passes &omap_iommu_ops to iommu_device_register()
> >> - iommu_device_register() stores the ops in iommu->ops (only)
> >> - __iommu_probe_device tries to read the ops from some fw_spec but not iommu->ops
> > 
> > Maybe like this?
> > 
> > @@ -1233,6 +1233,12 @@ static int omap_iommu_probe(struct platform_device *pdev)
> >               err = iommu_device_register(&obj->iommu, &omap_iommu_ops, &pdev->dev);
> >               if (err)
> >                       goto out_sysfs;
> > +               /*
> > +                * omap has a DT reprensetation but can't use the common DT
> > +                * code. Setting fwnode to NULL causes probe to be called for
> > +                * every device.
> > +                */
> > +               obj->iommu.fwnode = NULL;
> >               obj->has_iommu_driver = true;
> >       }
> 
> Doesn't seem to solve the problems:
> 
> root@letux:~# uname -a
> Linux letux 6.8.0-rc1-letux+ #19506 SMP PREEMPT Tue Oct  8 08:48:26 CEST 2024 armv7l GNU/Linux
> root@letux:~# dmesg|fgrep iommu
> [    0.402862] iommu: Default domain type: Translated
> [    0.402893] iommu: DMA domain TLB invalidation policy: strict mode
> [    0.405303] omap-iommu 480bd400.mmu: 480bd400.mmu registered
> [    0.405944] platform 480bc000.isp: Adding to iommu group 0

This seems like the isp device was bound to the iommu if the group was
create and the device attached to it? Does that mean it got past this problem:

	ops = iommu_fwspec_ops(dev_iommu_fwspec_get(dev));
	if (!ops)
		return -ENODEV;
?

> [   24.829071] omap3isp 480bc000.isp: iommu configuration for device failed with -ETIMEDOUT

This is strange? It is not upstream? Seems worth investigating what
this is..

Jason

