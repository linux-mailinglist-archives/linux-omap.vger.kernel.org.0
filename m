Return-Path: <linux-omap+bounces-517-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C9584C127
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 01:05:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDE6A1C2366A
	for <lists+linux-omap@lfdr.de>; Wed,  7 Feb 2024 00:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E48028E8;
	Wed,  7 Feb 2024 00:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="E/lz5sfg"
X-Original-To: linux-omap@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2070.outbound.protection.outlook.com [40.107.113.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0494D15E88;
	Wed,  7 Feb 2024 00:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707264347; cv=fail; b=UZZxO3L7ch/aKdWZaa4oNlex50whd2Ia0594I1hBR0lWiuqa6niO7dH+JIzU4yZi+nDa3TC2WhBBGTDCr0wT7aOvt4XHJw/HiUA2SU9MdeXbNPwV+ugwZDe8NnrGj1QfVCYp8uQkF/u05jAkkwTaCBpDhfNAMH1wb14W45EvRmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707264347; c=relaxed/simple;
	bh=yWknXOPghtY6x4xRPzOwDgahrpczpQAhFli/RrKy2gE=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TcEMejbWqNWVQMCjjFf5vY6+HTnExHPHUDbbm2nYBX9bctsMeozmLElXVq3jlSdk+M+xb6g72OWDUXOQdnrEM32T4uy1gNLF0I+BM7AA0QpNnpy8Rn5AVbrhQ/R1YQGvabo/csv9eO1hBwzRZEmToW+thiNhT5n06grVeSXiI3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=E/lz5sfg; arc=fail smtp.client-ip=40.107.113.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XN4n/Ld2cwpowkqUrI8ym8dArJaI+GlcsoqF+VS23NZUB+6kCT4sLtUUoKMvRLMyiAN+5dZZj0hdHvRixqo4pe2+1FBmFWcdD1lUp0bdNVRyO4QZ+pdQHIssZ0XbmNX2QmBqIGYR5vankfLcQCzc92YwKCENUnRdrnIQiLW7eIkHld/l0oawiJn599qAklfHRoU2v8pmh1UpR9cEWu9ud55ggfzHQOJW/Q+WLXdZZaU0GIvcveXV2VfYzYTNUedsD6VBLUNURI0lZ0OEY16vkeIS4LEIx1nzJHmdFE3rd/kNZjmovIkoseYcutl8iIeaeu/UoAd1Rpp7ez/KMWrzSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LeXJD5u8Orq+ZyP3+g3ib6eNMCbIxpGaYSM1J8gg+Vw=;
 b=Nbijg6s4llxgcG9POdHRQmAw3bmGmor6/M+pGsBQSiFuFQMNkcz6aYgBc70JcdJWq9u/hTdhvKIThLQSe7S86sllCF5YLToHnMMiuHCWI/F1u+mmUppl0mckhbgFnEqUgz6uylXvzleMk9s8lwLiVke1kazg7WuGzGJwmGekjtpNMh/UbWxbPXxEQmlVOwzIwTrtAu2PXreI5GoC2OrPpOoJqltVFTpkO6qTaFFkgJb0VbpoHrP2yoRoYR1ddkSwT9C0yOx8MIkT/uXMyKtEckhAYmdWfKWFk8LnzYjJwrOcU58fYUCOhaIteJIvh6kQ8bfysx+bauzlIVF82xL7qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LeXJD5u8Orq+ZyP3+g3ib6eNMCbIxpGaYSM1J8gg+Vw=;
 b=E/lz5sfgZZAul+iD9njNB4k8Hx7jIkA68K17H4EwghV96scD/RGC9CA8vbJ8h7RuMZq+L0jqEz8KB2KkxS3qvwcMwrSZcbG+alNpCGRyVo5KUm5iwi3KXt82goDc5/nk+QHecoMkyEZlQOpHw3NOVj6jgEYkhcw+Fh4jQk8UEaE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSYPR01MB5400.jpnprd01.prod.outlook.com
 (2603:1096:604:8d::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.36; Wed, 7 Feb
 2024 00:05:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::4d0b:6738:dc2b:51c8%6]) with mapi id 15.20.7249.035; Wed, 7 Feb 2024
 00:05:42 +0000
Date: Wed, 07 Feb 2024 09:05:42 +0900
Message-ID: <8734u5t9yh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org, linux-omap@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 4/4] video: fbdev: replace of_graph_get_next_endpoint()
In-Reply-To: <20240206164429.GD2827@pendragon.ideasonboard.com>
References: <20240206164429.GD2827@pendragon.ideasonboard.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
X-ClientProxiedBy: TY2PR0101CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::26) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSYPR01MB5400:EE_
X-MS-Office365-Filtering-Correlation-Id: 380df5ac-a68b-4c15-3919-08dc2770865f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hsiPUFOQS1DtrXhEUboAVwty5jPL24A12KmSnLmxDGSUVAyfwgboR7HW8EvH9gqu7MuwLlcYHQdo8rqX5R5mXKAgnrME6sMAkHVAYQTEe+/4KERUaGovHa9Lp7ULgcj1qq0zV6BOBZwQJTsI2jpvIrcAsh+zVlE/fSLESpn/n1bSrbJXX86AwlPEFK9pbmq5NKBgvfVgzqc1Ko5F4wchyxALfpSYCLNZT3umepLIeBXDECUabu/qgPzydprQ45JRVnuOdl8sSU5miiMz3k+GFcESYLTxlncLi9rBtmPuWUNRx+f0gmfyPM2BgiegzZKY0fAroVvqNis9MptY5yFjVdy8dmBKgOkoMaCxHJHYG53v1aNqc4puNny0rjmAD5xcDGnJbIvmv46/P4cdbuq7lStw2WtE60z1I2O9vrgqeW0Nlt+qtI3acu9ZJRf1w3XC47eCRUvOdD/bJ9HJpT3Epf65Vxo/2f4dno0jeZAhoBi0bPASLirHyWb3e7rzfZNLARuCZ3IzBAXA/7g0BZabaaPNBOpqIiTMVQaaaN9/5lLipw1C+IR0cjSFFkktWi+Nfmup2K4ljEqokZSH4g4qIGt5P/0WA8Qs+VBqEYAW4alFhaYVIJ8ltO7KiUud8Zyk
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(38100700002)(41300700001)(36756003)(478600001)(6512007)(6486002)(4744005)(2906002)(5660300002)(38350700005)(66946007)(66556008)(66476007)(316002)(6916009)(52116002)(2616005)(8676002)(83380400001)(26005)(86362001)(6506007)(4326008)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?oUmxLFPfAjkBuPbHIOULCTtvuFgpr9fL1FK+KD2w3bcMCsxwAYFsNyZ7K4cg?=
 =?us-ascii?Q?IXQSs1H5xN9CRClgLZuET+fYEwVFX4lvebznB7GaGT4oDldXwEIY4UBjUUGN?=
 =?us-ascii?Q?nsMNahUtBaQ2xJ0FYwKICtRTJ/k3vbextUEKuVVe9sUN6suo9sgSXfGZ4dCe?=
 =?us-ascii?Q?MDOmTe5D3uaGnLpRt6vJ7Bsw2yJ594iCNPHa/SAlrWB5kVsgmzYJTA7icv8P?=
 =?us-ascii?Q?4DuftMxhilDDTsQspOa1OIiujL5UOHni8zTBvzcsp9OhGExH9kjcP9FpjanP?=
 =?us-ascii?Q?/qePH/dFvu9Wt5Nq9f4KmI4+z+liT25bUKZ3j5tDTIcosGFjE0kSosG5YEHF?=
 =?us-ascii?Q?YdFVLKTqESAZd+9BKgsXeFLI1UHVxZbHFFvy5yEiFyuN2gplmmWpztlgGTfp?=
 =?us-ascii?Q?jID4VE3oni81QlMB0JXINl0jtaTxCMS5y2dKhz+OiSyPIg7eW7+Jyha7u5u8?=
 =?us-ascii?Q?Vsjc1EZGuqg8cT88mnpRnGNcspAzZ8GaIjb9giPorXvEQ45oBcHd0daynkpD?=
 =?us-ascii?Q?/03NheSqivFSwzl89xlbF+wJn+xjQr6UMLiPVyKfomaVq4r+Uiyr+/QxExcT?=
 =?us-ascii?Q?PBlyg6pd/fFjKqe+3RBp6w/o6zbqDoGgPoCvfg4S6Bg6DbenbpHWubf4t3gS?=
 =?us-ascii?Q?U96R6d8KKXnm3m2uOBRO1Pvg01gQlIbNg3xHlnvawjmn/HMvOvOq6DPVDbPt?=
 =?us-ascii?Q?KrI4pJBdPLvZGVaiox221HO5C0EoCWC+zY2OTWZYLnro+uDRZx481SyBONNZ?=
 =?us-ascii?Q?CnZaILzsh6z+9zp3a6cJX5FCd9AzO8lqoXD0dE5868wr59njsa1PZnhE2BNn?=
 =?us-ascii?Q?i/gZGbUVLaeyJXenaIs+KZFLcRhR3PLlerm0CNll6O9Ij1FjE6xGHn+rOedk?=
 =?us-ascii?Q?V2yIUpnxpaZbFKz2fjBdVG0B8qEBemewABBAtV2kKrXxpQeqnILMYFbPNiWw?=
 =?us-ascii?Q?nCpUJq0xgpRow0kRSTHDEVE2unpG6M9o37ntKI4TFFp7Uy9fmsiHrWngGDOR?=
 =?us-ascii?Q?PedWkWqdIw0FnGYN7Ts+emxI0fl0KxvBnbgLJfu2EsIFYMj09j38KYBlXPF8?=
 =?us-ascii?Q?8ejtr7YgRM/CvB3ILdeCqjkYGBLAfP9ioERkjVxI7kkb8ETgoFlX87eDjNCx?=
 =?us-ascii?Q?2uA8oG7zepWJx4ghLCrBazXp5YbscJyvE8fYaD8Dm1VbYZ/+8PTQSkoEM3p0?=
 =?us-ascii?Q?T2JZGZhEjVJKhD7CU10KwkUmdHKBmF7prcV9zDql8NZEmg3Zk2xkzLAETd05?=
 =?us-ascii?Q?RbWWli0Aet33nslg+e3lQBI4sLB54bZfa4rKClfMSK5BwsOMq/DbKT9P7rOq?=
 =?us-ascii?Q?pa5ToR9xXc7YTpKfao6FHYiNo7dzuIb/8rLVYsfD8t7YxBrdk8Gpl7zekEvm?=
 =?us-ascii?Q?nZeIJuhELARaEjTaLhSUXPF5ZYPV1OSSC5UyzaOBaiPscovysigd9udTodzf?=
 =?us-ascii?Q?aCCaAcgrIKGaTTYNbabzWhKuG9FW3P4bJoZVhQlfvmXkgC/yx3vOUqMvyPSu?=
 =?us-ascii?Q?jJ63EZyLDxq1xDdLRob7gAN7Mf1MizoWpYbU8mlqdTizkMizo1o3nbMzwCe+?=
 =?us-ascii?Q?HFdd/j84GDib3oCiVQaOLecENZd7O2AsK3UvOmMatvGzXNG0zVJqlsN1zD1n?=
 =?us-ascii?Q?NQBh9AxYwG0p6GBliR6iFps=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 380df5ac-a68b-4c15-3919-08dc2770865f
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 00:05:42.5192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uMM6qQ5JMhvVZxMdX2SYry7MXpG2iN+Qp3ola3GV1V28VMvrgbN5TsMmkAZE2CQlhHd4R9W14qzYDr0CCjtq57ybcjtYLGuF3HadRdGrIzE1ii2e3rCXrOL15pixyHz2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSYPR01MB5400


Hi Laurent

Thank you for the review

> > From DT point of view, in general, drivers should be asking for a
> > specific port number because their function is fixed in the binding.
> > 
> > of_graph_get_next_endpoint() doesn't match to this concept.
> > 
> > Simply replace
> > 
> > 	- of_graph_get_next_endpoint(xxx, NULL);
> > 	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);
(snip)
> > --- a/drivers/video/fbdev/amba-clcd.c
> > +++ b/drivers/video/fbdev/amba-clcd.c
> 
> This driver has been deleted in v6.8-rc1.

Thank you for pointing it.
I will rebase to latest of branch in v2


Thank you for your help !!

Best regards
---
Renesas Electronics
Ph.D. Kuninori Morimoto

