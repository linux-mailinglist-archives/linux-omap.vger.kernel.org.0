Return-Path: <linux-omap+bounces-2333-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0D4992FC1
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2024 16:48:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 673E81F23AE2
	for <lists+linux-omap@lfdr.de>; Mon,  7 Oct 2024 14:48:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C3041D5ADE;
	Mon,  7 Oct 2024 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tfgklxh/"
X-Original-To: linux-omap@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2040.outbound.protection.outlook.com [40.107.243.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21F91D1748;
	Mon,  7 Oct 2024 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728312510; cv=fail; b=V/PwL6wKjMCpnCykdNjyhtIxsK1phvNGVOoDe1XC03aGW95GcWh+/yWGk9cmZLky3614U/Rp55pliaacGNdw0qQ0ewn8iqWp3f5QBsmwXQqT9Jf9x2fEUc+F1GXQJmoQ7sotKXBGSdQyknnF3QRauiOAhARoB14Fo8LADyWCDR0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728312510; c=relaxed/simple;
	bh=C2WXu28xE7JPB9sj0NwdD7hrXVUe24YG3SYgGgGAhTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=J63hv+gdx0nYuKvX5DX+NSTYiX3jYgxfl9tW9vH406Yc28xi2m+Ybz2bMuPlZWeVxpVLDCcJodLJcSnZxqQNpJsQQ1BoBKYPUon03koSwJVXvNiNa34qUS4NK2hsVKmRPqMQKuMCZGAHB+Gz1aPJhm2LmQiBHpZRG8ds15tJ7/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Tfgklxh/; arc=fail smtp.client-ip=40.107.243.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJa8ATITgGsDxlacFyENYlT7n5ahUtXw/sRdSIQaZ2Ka7SToHtQ9twGJQSTzU5444xpCYRSaQfikIO/9qfGDCzcQuxFO9+1BdRa/sT7mH+ZkNaqbZB176TdVbWOyV2EG2OlsD4XLZX1sKiIpCS9GCgit/QO7R0xTd7o9DMXBRAovtRc/bCd1yjUerPmnfDZS9XbOXqcBOAmHEV+xBWIa+af/XzDkgMiTLrQ1Uc31uBXA/BiMcpERRFEPN8YCov92Jwb+8Xh5Ue8mhLURye77Nu7HX84Q28FAhdvy2Y4Oear0JqEOuol1OL/mpjp0f2i7GndclARULHt7iyUk0JOkOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oOPGUEumQ+I55baSeHU+/nHAyBisuD/hBak1GZIiew=;
 b=aAsjgIXIqXjQaT2xBmh4TafvBW/uQ4Ue95nbwGDVj05l8qZceDp0Q4VI9AIvYrRs8kGGUWgGH774HEXbyz6uhxyGdpfpwjW/RRty4irUBeiwxZdhMqCVjSbJyVrjkzu44kZA9A05fe0fW8M+KzY1vQ0NN1PGJNm5cFIDYP7KblzNywnEeq8Cpq866N68LjFBLLjKQHi4WsiEHUQ66DgC4kt67IX97Vjpm3z0yAQyqobLEsuMo6QAo0FB2kRQXgN594g0gdxjol1/+2oGACcDp9MfNqSC5XKst3zt3IR3N8O9LBRlbzqty1o+KrnEHs7sZvmhKvyTlYbrLDKXqBhlZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oOPGUEumQ+I55baSeHU+/nHAyBisuD/hBak1GZIiew=;
 b=Tfgklxh/KijnPZDp5qTQen7wCxTbVpO4KgDdcThc0LBZULGkfQJw14hBF/VRBdRgUgpLrl9OTxyZ8cYKWoq1LBEpO6CUlqsSgx6A1RxCa1413WpGpiUS3Ly41KKxw5fgHqu3uIT0q6NRuqZ4DIAvVf+A85xcvO5bCU4hzfFovwiGn2uYdpmnYdAMvmhI3hcWsHECX6XdjVRvWxCJLy+s4cUGDH9I2I8BTYP+74t59DAI5rvhUomXRgvdGHNHyJ9e2fgdooH7i/b7S5GFkkSxn/Zw2hBTFJmSGGdMpesgUeuE4uIqDu/TnWvGYv5Zq2CP73CubkTg1Ehb7FKMC4baqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB6613.namprd12.prod.outlook.com (2603:10b6:8:b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 14:48:25 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%4]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 14:48:25 +0000
Date: Mon, 7 Oct 2024 11:48:24 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jerry Snitselaar <jsnitsel@redhat.com>,
	Joerg Roedel <jroedel@suse.de>, tony Lindgren <tony@atomide.com>,
	Linux-OMAP <linux-omap@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-media@vger.kernel.org
Subject: Re: BUG: "iommu: Retire bus ops" breaks omap-iommu and omap3isp
Message-ID: <20241007144824.GS1365916@nvidia.com>
References: <A7C284A9-33A5-4E21-9B57-9C4C213CC13F@goldelico.com>
 <20241007121543.GM1365916@nvidia.com>
 <20241007160117.55d6af74@akair>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007160117.55d6af74@akair>
X-ClientProxiedBy: BN0PR04CA0115.namprd04.prod.outlook.com
 (2603:10b6:408:ec::30) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB6613:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fa83008-ca16-48d7-3aac-08dce6df1930
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PPVvkQHRTRsjxOUOpmiGZjlGaVSRUXNLdANmHCdpbGZYqUxEtYRZdLIU5t9A?=
 =?us-ascii?Q?PPHV8PdNOiCXufbx8z8EjXuMP1bVl4cHDiweiJLcO0CLAkttwscyAK8txP2n?=
 =?us-ascii?Q?ZGkPUEN1s+S5jJ/EjQ5huM3EbRrQFo4vkXEJvikxaZjqAAn8scvSn16R9kzx?=
 =?us-ascii?Q?S5Vh9SWe0aIvDQRFbOHliz/jgt+v7/wFMqf1zKLO+NoEGEvnASoQ+10xkl0K?=
 =?us-ascii?Q?gRzN+zREEhl1YkmQdL+IHGWWQCPm5TyCtqBCZe+nSieiBmcka+uNhJaeVlO6?=
 =?us-ascii?Q?9IGiWS0KkwZ4Nvr1KkP7WtktwvTvtdKaIgMJhFxKu1WwMEHN5H0xPz11Bkwt?=
 =?us-ascii?Q?kDv4sqU8ELxjIACGKZCiNqMnZr+NQHvzEMEj1zAvZHv5RgtlLJN2goFHUF6g?=
 =?us-ascii?Q?jdoYVuqsvrM/ceblmyXJ8Xq4Y3gpmB8+W5ddd0ttiY9u/qu8Ri15p3PGuV+E?=
 =?us-ascii?Q?qLfnV5yathVDePlhyEVgJktOxD2pN4whX3gdRSWShpskFeLE068zn4OPWjY8?=
 =?us-ascii?Q?DgjdLaHkLYYFDf+MNtZVB5r77XjDRlHZaPD3L5drFP3419yzCTpPv6Lrhw6f?=
 =?us-ascii?Q?Nx/biDcxVWSABPVZ3qdo3zUrXvlLJqL2e2cKEEtHb5qVgisnpAWCF1k/qqAG?=
 =?us-ascii?Q?qKCb+2cmCg3dntAyKjY7dtRVYqXohrJysv+ndA137BCHvgjWx9D72DlAFbUh?=
 =?us-ascii?Q?1vDmRSUhWsnRx+zMv3yOzxPQ73PaSI/CYmGSh37po3hu1V2ARVBk5Ld8X9oU?=
 =?us-ascii?Q?so2ZCKOtHLy5L/scbWgSwuSH5z1ApQrUsNT19gnSB3ndK4v/Zv9S8XNJWcWF?=
 =?us-ascii?Q?6hoqoRJd3z1z3mfqpcrbWz6xT7jQZY4zMW8CO7thi/OglL5eulln8mNrmbgF?=
 =?us-ascii?Q?xg2JLrfNzST9rp/tvIp7C3zxci87RSUO/oG5EakmevCz5C/E21RcodhI9dEY?=
 =?us-ascii?Q?lmWLggWU170vRTinHeK4kJMmwjtcuMTAO+R7JHEIKZIdwBi8NLLdO25Y/Z2a?=
 =?us-ascii?Q?+sh+1TWblisX835WjgmadJBd7lyXd7YZ5S8xPhxU8Iev6a9Fr71y75pIzexz?=
 =?us-ascii?Q?DGGXT8rWhTSm6EnawlshwNvgPyI1PabzP6BFzutiIRr2zV02tAQ79bP+qXnS?=
 =?us-ascii?Q?hhxFPbBmiL7bnCHZrUT1y9/+Ua8hjDYY6gV5uyDRwQxhPkyPQ7Miesun4hdE?=
 =?us-ascii?Q?rdZ7MTLe3wErzED0zbUxP77uoVMuo1gH9PDWzHHWU4b11h5xAftSQ7fZg89Q?=
 =?us-ascii?Q?Ver9ThSAmxHd882l8HgSgO+Vm1Bcs+wQtHM1vJ3TYw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR12MB8659.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wzNdAgfxzdlMkc8wUMTfrnooYPponN7iVJ+NSTg9ay3o9yBhiAovzGldoI3U?=
 =?us-ascii?Q?+6yQertV2DSdCcMRSF/pWmNlbSR1g15yJDmkiR+u5QuYx5WBN7Q2sRxfohtL?=
 =?us-ascii?Q?m+wD5r7xNSkxgPvkBukGwT+Tn+mH7fFKT4Sa1hdJCqFakOdmw3O27BjnU0iB?=
 =?us-ascii?Q?Gvukl9JZfOVlOAfaRwXhCobVvoMLZhD3TOCrfRf0W43aSLuE+gSfLpruJlF/?=
 =?us-ascii?Q?CRNDBCYlBVKe6WU3bnr2gkUF47B4DEycHgpDxMOchVlz2x9JdDjzFT3kQQ03?=
 =?us-ascii?Q?Vc6VqDqK3YsDoOy+5ic0jrAt2mwQ0xDu4e2BYy8fI5f/JvwsGZmAjnYAvqZB?=
 =?us-ascii?Q?ugG0VQRaX+p6Sb2uWvkigvHe/8QnGRwifCc8nJmiWew5f9lq0/4LB8XAKxd0?=
 =?us-ascii?Q?2Znxja2qJ7gtzbrBiQB0/BmlRVER+4a9EigOX3KJl2NonruM2g6mrhvRZll2?=
 =?us-ascii?Q?+SqKOh4J+dG4IL3QGfzjv2O0/MvbwT/E+l/5mc6vHBTeXb8mWMRzBb3Wp01+?=
 =?us-ascii?Q?2WAM8K2y6Nk7493f8mebHuCZTlE95PXz/1pCMuzj0uJcAu1yIDlarXhLQJHf?=
 =?us-ascii?Q?n0ElX7OQfNQXNS3ntx2V66f1vHfQnSlxxPvh4ZxQ5qqXKe/jt/mGk4eM7S3U?=
 =?us-ascii?Q?mGy0sewpjTk2y96ZMZ18hfymgKrrOJNaw3jsry5FsiCS8n/QPtNxOFDKDtJL?=
 =?us-ascii?Q?UGzGu2YluIuDbPYXG3Z12xcjvrVVcx9lyXYS9M+Xyp+DxExUKeh5KP6EWEZX?=
 =?us-ascii?Q?9Yg14z5sLDGgLgPUKp/lE6BzCtzlt36Rt6J9WJPTSGQMQimGNAdG+py1acWf?=
 =?us-ascii?Q?PRC3FyYMvG5A5Sx4jnzSpWtX3ZiB6H4OnLFBP8Xeo3UKZ9Uk0uEbERhbg1Z+?=
 =?us-ascii?Q?HC2y+sT91FyVEcglF7IBt2abfFiXPzIu0DJUj8oB18y0fAlZsFd+5MBy6ale?=
 =?us-ascii?Q?f0gxoQTzUJbxfq+tTJ9Y1dqHRt55Nodt2xpP569iZwEATg6v3PbffXUPB00n?=
 =?us-ascii?Q?w5kW/LDvKsGw9TlAJJmk6zBIFcCGzXK/IyWcjOan8d4nqEX/w/4uQFk+CJXN?=
 =?us-ascii?Q?RCq0vR5g69skFlgGnTCpTwCGTLe/Qm80sIgKkFQfaAz6rYauzupNDJsM4S+Q?=
 =?us-ascii?Q?PrCUcKxcCNzd0fjmu+DAooL5KdUe2POB38j3/ZJORj4F/110j5Ng6BEPycAQ?=
 =?us-ascii?Q?tbsnjhml6Up1vNMS8Ned38OhQq5pwFycfdOm9ZUy6bzOQeTkhiMRjt0L6/0r?=
 =?us-ascii?Q?Pn//fJ41IuCMWJ71dna5WIBlXSBPnT8gVtLF6YePW3yrSGxpJggRys7gWa2u?=
 =?us-ascii?Q?ZoN05fFxro+XfB4A8WSAYSnxv/J2RxKU6mM5lBHXPAtXWUI2qIR0a+x1ENF6?=
 =?us-ascii?Q?8SxmL/YJpymX9M0Z4qcNoSVh/k0GWA9QczTSnoMjpNDseIPN1CayY8UBHEJS?=
 =?us-ascii?Q?ByuZsSVRB87ihU0/7RvFir1MwwcNqdm/AD4Mf/5qTbJUeWNtC1qocwObqzPc?=
 =?us-ascii?Q?VyAVTgEZRoWhSNYUNoSxj5YeHkja6XjP3saxdQoFZLImOZlfuOIdvIcPCPnB?=
 =?us-ascii?Q?sOm4XDNDjiZUp6aigxU=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fa83008-ca16-48d7-3aac-08dce6df1930
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2024 14:48:25.5600
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F/IF5/U8bYHL4nJe+raEIs5PPSD1wmG7IUxVoeHljZvEzYLTYsLtAI+KlgpBOH/U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6613

On Mon, Oct 07, 2024 at 04:01:17PM +0200, Andreas Kemnade wrote:
> > @@ -1233,6 +1233,12 @@ static int omap_iommu_probe(struct
> > platform_device *pdev) err = iommu_device_register(&obj->iommu,
> > &omap_iommu_ops, &pdev->dev); if (err)
> >                         goto out_sysfs;
> > +               /*
> > +                * omap has a DT reprensetation but can't use the
> > common DT
> > +                * code. Setting fwnode to NULL causes probe to be
> > called for
> > +                * every device.
> > +                */
> > +               obj->iommu.fwnode = NULL;
> >                 obj->has_iommu_driver = true;
> >         }
> > 
> hmm, that looks nice for a regression fix.
> 
> Does it make sense to adopt dt so that the common code can be used to
> ease future maintenance?

It would be nice, but I recall omap doesn't use the standard dt
layout?

Jason

