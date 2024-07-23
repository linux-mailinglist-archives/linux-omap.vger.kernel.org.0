Return-Path: <linux-omap+bounces-1780-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019A93A88D
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2024 23:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DACE6284414
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jul 2024 21:10:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41D9F1448DA;
	Tue, 23 Jul 2024 21:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Yc60Ouc3"
X-Original-To: linux-omap@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2618142631;
	Tue, 23 Jul 2024 21:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721769027; cv=fail; b=E3DdBhiMuouKSse7ct7HfCf7YprSDsd4+BeDSURypyIyA9vScGLYRMlxxsKHx6pJSPptNefushOxUFbH2RmpBmIUnM2pdj3gWx0YMckMOrog9GEDkcN/p5K2KJEPZgWTEMxcqxYjZVHn5vvXQsxS6x1Br7pPwjkB2lyb1SYw4Eg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721769027; c=relaxed/simple;
	bh=W9In+c2tLncAuuWULl8D/wZKJMK9KWqXck8rtjc6NCE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=paqwHOQq4zGeU3+CCLpr7T+esbatgvIF9zFOWRAIMEIlENjCJYMTuRFXSDP5sVi+KruFGb3VO7j3QFPHPy2z6pgn2nIc2xRl1NgGN/G2B01BcduY2G53UZrGcH2OBFkBtirTXgDaAefmPX9bKVAr00nJ/l0n0g8NVEHYGiyUfDo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Yc60Ouc3; arc=fail smtp.client-ip=40.107.236.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbCac5BavqmadeOF44qu/zxGst8DxQoeeMq8taocN0b5yGVYsrlkZ08ha01ndzUgu8ijELPcoiZSvdmlFYYVTidG/VkYeOa8a4fKUmM9hi7VHXPCdp55vuwDVpOdagO9a+yNqz43DXlVNXMAxLw/OMxkSHigFUSx6PKOl8G2qF0KveqzHrqATQgTqqfGSBDk7MSfA9cynTQex12UulXaTprxaM6Xu4yuRzB8o0ZmO36lvDPU/MveOWpp9vUxsVzG67By8Hdi/xw0V9jhbpyBuHzk9JsK564AEt6JinrLBZk8LpaqBwmST5yB3mjDtD0WcLJh+SfOEvdS4eWS8HOVgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCEiRwWSOS5xeA9DcxGVZtjH/F4L4XNHrSEFlQ7+cmA=;
 b=GsA98CcMMnPPKhZ6iIDqyJU75MK2+3Ktgp/YuOzEST+EGa1mLbNzvmKhha74OTsZ2363PHUWgw4bOvGnJqmDCt3GPNUkqz9UzfaTLhL4bTu/369arkaiLhCstU1U0KM4IZgomrTMc7emeOjQ4HZWRzzcN9qALrvPldM5Y8oofgZ/qIcZbbW1f88aXTmcyNj44satM8bHoMgb8CNQDvRSSe/hx0yLhYKce6mft7CR5spf7rM4VHr2eRFV1bNdCHnwN50w+kBOCtlcyK+V9R4hXrmVnzsJPvQo5xq+fb91Dzb1kIos/gpz9kdYd8wH4t+0cj+3kPGvAxAHZNHVcp6x2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCEiRwWSOS5xeA9DcxGVZtjH/F4L4XNHrSEFlQ7+cmA=;
 b=Yc60Ouc3UGrXVytTzCqbbcn7ZJg8X6At3RumoeMrodPHtJWRGJzipUG7xHYg5M7wk07MAGfypTSJ2M6mYLZ2JIHuCgexVuhRlXMhHuy1H7TYUZA0LLSvD9o34HMRYVRH34hACdK6JIkfmlbc2UuQat+cgtoRKnyRtBwDf5ZVses=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH0PR12MB7982.namprd12.prod.outlook.com (2603:10b6:510:28d::5)
 by SN7PR12MB7954.namprd12.prod.outlook.com (2603:10b6:806:344::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Tue, 23 Jul
 2024 21:10:22 +0000
Received: from PH0PR12MB7982.namprd12.prod.outlook.com
 ([fe80::bfd5:ffcf:f153:636a]) by PH0PR12MB7982.namprd12.prod.outlook.com
 ([fe80::bfd5:ffcf:f153:636a%4]) with mapi id 15.20.7762.027; Tue, 23 Jul 2024
 21:10:21 +0000
Message-ID: <2a1b2099-e1c4-4d04-bc97-9ff7e0621275@amd.com>
Date: Tue, 23 Jul 2024 14:10:18 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3 1/6] net: ethernet: ti: am65-cpsw: Introduce
 multi queue Rx
To: Roger Quadros <rogerq@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Julien Panis <jpanis@baylibre.com>
Cc: Simon Horman <horms@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 srk@ti.com, vigneshr@ti.com, danishanwar@ti.com, pekka Varis
 <p-varis@ti.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-omap@vger.kernel.org
References: <20240703-am65-cpsw-multi-rx-v3-0-f11cd860fd72@kernel.org>
 <20240703-am65-cpsw-multi-rx-v3-1-f11cd860fd72@kernel.org>
Content-Language: en-US
From: Brett Creeley <bcreeley@amd.com>
In-Reply-To: <20240703-am65-cpsw-multi-rx-v3-1-f11cd860fd72@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0056.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::31) To PH0PR12MB7982.namprd12.prod.outlook.com
 (2603:10b6:510:28d::5)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB7982:EE_|SN7PR12MB7954:EE_
X-MS-Office365-Filtering-Correlation-Id: 21de1d4b-7670-46ea-baeb-08dcab5bdcdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TkhRS21Fa2tVbm9oem9idXlKTW5FcngvYVNtbFhXblAzUkFFdC9KT1RJdFdi?=
 =?utf-8?B?dEh0ZVBuU2VzUXF3UGNRUWErVVRZWDlpTjBiNHFXV1BTMjB2VmgxRUVrc0VE?=
 =?utf-8?B?bGVmK0p5WlE4anByREN1NzlZQmUrWjZ5QkhUQ0VxR0JkRytjbHFoL2dDZyt1?=
 =?utf-8?B?cnRsUjNKSE5kM3JWc054TUc4YW9KQmFFMk1kSmhyaXJETUQ4UW1mYWt3aUF5?=
 =?utf-8?B?ZzBuQ0lTRXFXTFBJZ3VPa1BPQk5memNEQm5CbHh0MHFtKzZmd2JWZExLTnZw?=
 =?utf-8?B?ZmRLUktVOHZ0OXRlWldpekNVVThHNG93dnJTcnlkYnVCaVUyNmRMZHVTWFE1?=
 =?utf-8?B?RlpSVDVIb1d4WnJGUDhKRk0vTzhyV0oxVE9ISDFuTm5BTjQ3bFpEOUxVNzJs?=
 =?utf-8?B?eUlNRTBneE82Q2d2KzUvRnViWFo4ckxKUDZrNCtUMkl2UnZncU5pT01LVWNR?=
 =?utf-8?B?emhPK2NyS1NPZFZjbVcwcjlFT1RlTVMwWUE4RE95ZlJwcUtOMHhPa3dZOFZG?=
 =?utf-8?B?MDNQQUFLVzZLemNoRW1kYjFTc2t5K3NjaGdsV1dYbXBBRkNXR1VuMm1qV2tL?=
 =?utf-8?B?TlZ1bSthZlZhZVdLQjNWeFFXb3I5WkJwV3dLdWJXRUZCMmYzOFlMUXR0STMy?=
 =?utf-8?B?SGIxbWNCUkhZUWh1Rm9ZZjcrOXlvYlhtdEZ5QS9ISnNJbC91NjJSWXZGWVJs?=
 =?utf-8?B?eFlucEFCVUNOYk9rK3Y1SU9MK0lEU0s4NWpKanZ6dHNXNGlTY0ltc1NyQjJH?=
 =?utf-8?B?SFFXMnJGa2hiV0I3VkRlZXRGa1JqSUlZTi9aM0dFaEJ2dDgxbU0zdGtublUx?=
 =?utf-8?B?UHhqWGJML2lVYXBxbWVpSkJsN2dKWkFGTlliUHlPN1hlZDRwcDBYN1BCc1Nt?=
 =?utf-8?B?ajVxT1dpcGthdFptV0dFK0xjeWVZUGFSem11dkg2LzBNUTFZWm1zSU9PTll2?=
 =?utf-8?B?eW5oRVlnRzZnbGI4RENDaUJtNUNjRktmRXVYQ2pZTDRCb3VmN3FWM3hPbmxm?=
 =?utf-8?B?MVRQSDFENTErd1lnb25aVTFUUUxUbDB2ZlNTbkhycXB3YW1RYjlWZEp2bnZU?=
 =?utf-8?B?R3hRZ0dhSzkyVnM3aVhLZXVIRTVka1JjQS9ERlREMHhPSVRxVFRIbTA3OXd0?=
 =?utf-8?B?V3hyR2VuM1JyMmRPQWVHd3VtbDBmeis0OTlzV2grck9RNzR1eUpvMVBSTWNl?=
 =?utf-8?B?VnJRaVF1RUd1MzJtTW8rRDRRYzVsdi9jaG0vS1dISktjVm8wMEFFNkt5eWZj?=
 =?utf-8?B?UUpSK1ltd0NZbHhQNlV6eEUwMC9XV3NhTldXOVQ4d0VnZEtLOWFUanZwR3Yw?=
 =?utf-8?B?QTczcFk5cmljV1pJbWxGQmFRdWFkYmdRMjBSRWpUR25sOEpwR3FNb1VHb2pI?=
 =?utf-8?B?K2JSL3crdnVoZGdvZzJBbVlnK3UvU0UwV3NyeUZSejlDTTNsUHlRNXF0dUFt?=
 =?utf-8?B?eVltVDFibXBtOTUzWm9hdTZUTHU3cld6WnMwR05TRUJ3YVZNYTBpcUJFM2ls?=
 =?utf-8?B?dDMvb0ZiSUw0SFVpSnhYZG83cnFZdWRXWlRYU0d4NTNsY0xIN0JQRUxNRkxT?=
 =?utf-8?B?MURmQzZLcHJ5bzlHVnpiVHYwR3NmNVZWejJOaURiZHFnVVkwUTUveVZ0bnBF?=
 =?utf-8?B?YlkrUllWa0J3dXdtZzhFbjlSVXNDV0htNEZqNnhJOEVNaSt0V2M5Y0V1UElq?=
 =?utf-8?B?eC9QNXhNM01VUGlRbzZjWHNqb0pxOVpQblduR0xIdGZGZGt5V0M3VUljaUVa?=
 =?utf-8?B?cnJPTjAzMVdxSXRHUTZ5MGh1S1BqVFFkaXdMOXpDNmFUMHlOelR0RVJYNTlj?=
 =?utf-8?B?b0t4dWZEcFBTc2E1NEhBdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR12MB7982.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K1hDT202MkJ2UHVDQnZaQ0d5NVZxdGxBdGNKSVBMUlRsVTdySmlNd3RWMUpL?=
 =?utf-8?B?U0VkOVEvSnBDd1VxQXBnOUpxMGEwRU9oZEk3b0FCMTJsSEVaS0doOG9Ldk5U?=
 =?utf-8?B?REpUMExFeVR1V3g4dzhqRFFBcnNSMU9jV1BvMlNxeWRkVWQrQzd1bTMwUGdF?=
 =?utf-8?B?V1dzVy9ydlFqdXFzdzJPZlBVMER3ajB6NCtXSUt5T3lxYTZMZkVGNGlWcTFm?=
 =?utf-8?B?MG9xV09mOFpQM2paa004QUxGU05PTFVYcnlrcVlsdDlRUFc0VmJmTDRWOXNK?=
 =?utf-8?B?NFJJM3owOGVXN3NRY2lESHR5bmlwUksvRFJGR1kvSEMzZGYzMzgwU2xORWg5?=
 =?utf-8?B?Y2dlSkhCT21tKzVHemowaVY5dmVzbWZDYk1vNzlQalFnVHBub2pObFlLdFRq?=
 =?utf-8?B?a0hCQkkzYXEvK3FCdEh3aUpSOTBzNmlML0FaWmhIeGtLRE9CV0RJb2JxUS9n?=
 =?utf-8?B?ZEJiNGhHRnFXdEVPM095VDNTQTNFWHNtNUpMSG9xOFBaUlBkSFVJbjR0akJq?=
 =?utf-8?B?NUxsN3VIc0xlY3FpWHo4dFY0N2xwMGNBWmZnUUhQNnRyQ2tTSFJPOWp6ZE1L?=
 =?utf-8?B?Q1AwOWpXUCtBbG5sN3RaMjFYODhHcHkwR1lnSHdiVml6SkxZYkhDTFVBYWxF?=
 =?utf-8?B?YnBCZ084Y1JBbWtWZkY2aTc0a2NVS2IwL3JJc3ZNV2JNc2lFSDZWK2lva2hY?=
 =?utf-8?B?aVV4TUZqKzhyU0lJLzd1UW5UcEpQUFF1NWhRVk9lWUh2UVR3SFNGU2NGTmhH?=
 =?utf-8?B?ZkVkZjZzV0N5Q0o3MDlLWmZKcGFxZUd2QWtMVFZGTmZ3ZzlPc2ZoNHB0a0V3?=
 =?utf-8?B?aUN5ZWgzTXlPTXYxOWlxYnJBb05pWkc2MlUya1RxdWpSZ3hrdFV6QnZFeWdI?=
 =?utf-8?B?bkIzekhLVEd3REhWaXVRTG1RYjhmTmNXcXROTm0wZ3JJVUJscHdXOFZTWGhp?=
 =?utf-8?B?VnBMTmJnU2sxc2cvUnpnQlo2NTc5bXVtd2tSNkl3VExUR0k1Z2hOUVpvWU1x?=
 =?utf-8?B?UUtGakljM2NmRlNwSEgwb3FYWVZ4YU9ETTE3a1BmczQ3QTlvSU9UeHhGc0h0?=
 =?utf-8?B?R2JwMVc2Skd0VGNZTjc5WllEdEt4MlA4YWMvZHZXQVlrM2NQOUMrRWVESk0z?=
 =?utf-8?B?TG5MejFoODFNNmk2dmZJOXRGZjF2Ynh5UW81T1pSWjQvSllwaklTeE41UVNV?=
 =?utf-8?B?c05hVDhaV2hvTkJGOUk2R2FPc2E1STZ4MElxVkcyS0JtU29NRnl4NEdGRFIw?=
 =?utf-8?B?ZjNhQ28vSHZ2d2N6ZXlMVHArcXRqMUc4c0JFTitEVldxY0kzbnFQOEgxdVZr?=
 =?utf-8?B?V2ZleDl4eVFtNmdqbjNUVzVyS21IaG5TUFZRd3RFUjJmc1Mvbk5PVEVwMzJX?=
 =?utf-8?B?VWVQYThMT0c4S3dESVhMdHdKYjVEbFNUckV5VFJnSEVxZEVsbEdFYzdjVEcy?=
 =?utf-8?B?c3lMbkk4cFIwdXdSRndjSlFkRnhqM1JaeS9NYTU3MXR6SE9xRGxXeDhSZENh?=
 =?utf-8?B?eW53TmFXcnZ0dTZncEJ0eFhXdzROcHVteXY2eEV4Zmw3Umh4bWljNkVlY3I5?=
 =?utf-8?B?RVl2a0ZzK1RMVUlvOThJOTdoT0NZdi9XdE9JelZna2t1UFJ5L0dibHQ2V0R5?=
 =?utf-8?B?MjNicmFuMU9RcG92cGpGR3BnWitpek1FZGdueXNMLzhsWk10cEFuTTNwclZz?=
 =?utf-8?B?c3lSb1hONjg2VGFqUjlDLy9ZNlcyNG9ZMTI2bUdMQzdMSUZWZmljaW1xZExh?=
 =?utf-8?B?UU9zME5aN2pZM0I3cVp0K1JFclU4citnNXZpRnNRdGY4OFVCenVsaWxXTTlw?=
 =?utf-8?B?SWE4SWRUa2NwRUJwSWh1REkyeGdSL0JKTjZFMk1MYmg2SWNxQjhuWlFzeHlG?=
 =?utf-8?B?WHIycmVUMnJPT0NWMWJCRkFrdTRCQzYwbjNOVHFqZmVNb1ExbXhoTFkwTHFi?=
 =?utf-8?B?Wk1QamdNNEJQMFpXRWt4TGV0VFd6QXlXS2ovUlFIbzZ4NVNLcksyZUUrUmZa?=
 =?utf-8?B?OCszakJOY1VZVVJMSXNTaTQzRDZteFI5b3YwQ0JTOHpVeFVMMTVFWHBJYmJo?=
 =?utf-8?B?eGdlTGsvVFRja3MvN3NBRzZ6Y1ZON0N4MVlpN3BZUi91UzBabEhCL3pvZXF3?=
 =?utf-8?Q?gt0I3TJbclXaBi8g+C7XLXO5I?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21de1d4b-7670-46ea-baeb-08dcab5bdcdc
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB7982.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 21:10:21.6704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIcvLfI89jbQHoaPLl4vKtnOwYfuGu3f1mISZCBizNgbZyWlhz6hUQsOsz17fd/T4AWbbFEUlnLQs24bn2E8Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7954



On 7/3/2024 6:51 AM, Roger Quadros wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
> 
> 
> am65-cpsw can support up to 8 queues at Rx.
> Use a macro AM65_CPSW_MAX_RX_QUEUES to indicate that.
> As there is only one DMA channel for RX traffic, the
> 8 queues come as 8 flows in that channel.
> 
> By default, we will start with 1 flow as defined by the
> macro AM65_CPSW_DEFAULT_RX_CHN_FLOWS.
> 
> User can change the number of flows by ethtool like so
> 'ethtool -L ethx rx <N>'
> 
> All traffic will still come on flow 0. To get traffic on
> different flows the Classifiers will need to be set up.
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> Reviewed-by: Simon Horman <horms@kernel.org>
> ---
> Changelog:
> v3:
> - style fixes: reverse xmas tree and checkpatch.pl --max-line-length=80
> - typo fix: Classifer -> Classifier
> - added Reviewed-by Simon Horman
> ---
>   drivers/net/ethernet/ti/am65-cpsw-ethtool.c |  62 +++--
>   drivers/net/ethernet/ti/am65-cpsw-nuss.c    | 367 ++++++++++++++++------------
>   drivers/net/ethernet/ti/am65-cpsw-nuss.h    |  36 +--
>   3 files changed, 284 insertions(+), 181 deletions(-)
> 
> diff --git a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
> index a1d0935d1ebe..01e3967852e0 100644
> --- a/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
> +++ b/drivers/net/ethernet/ti/am65-cpsw-ethtool.c
> @@ -429,7 +429,7 @@ static void am65_cpsw_get_channels(struct net_device *ndev,
> 
>          ch->max_rx = AM65_CPSW_MAX_RX_QUEUES;
>          ch->max_tx = AM65_CPSW_MAX_TX_QUEUES;
> -       ch->rx_count = AM65_CPSW_MAX_RX_QUEUES;
> +       ch->rx_count = common->rx_ch_num_flows;
>          ch->tx_count = common->tx_ch_num;
>   }
> 
> @@ -448,8 +448,10 @@ static int am65_cpsw_set_channels(struct net_device *ndev,
>                  return -EBUSY;
> 
>          am65_cpsw_nuss_remove_tx_chns(common);
> +       am65_cpsw_nuss_remove_rx_chns(common);
> 
> -       return am65_cpsw_nuss_update_tx_chns(common, chs->tx_count);
> +       return am65_cpsw_nuss_update_tx_rx_chns(common, chs->tx_count,
> +                                               chs->rx_count);
>   }
> 
>   static void
> @@ -920,11 +922,13 @@ static int am65_cpsw_get_coalesce(struct net_device *ndev, struct ethtool_coales
>                                    struct netlink_ext_ack *extack)
>   {
>          struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
> +       struct am65_cpsw_rx_flow *rx_flow;
>          struct am65_cpsw_tx_chn *tx_chn;
> 
>          tx_chn = &common->tx_chns[0];
> +       rx_flow = &common->rx_chns.flows[0];
> 
> -       coal->rx_coalesce_usecs = common->rx_pace_timeout / 1000;
> +       coal->rx_coalesce_usecs = rx_flow->rx_pace_timeout / 1000;
>          coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
> 
>          return 0;
> @@ -934,14 +938,26 @@ static int am65_cpsw_get_per_queue_coalesce(struct net_device *ndev, u32 queue,
>                                              struct ethtool_coalesce *coal)
>   {
>          struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
> +       struct am65_cpsw_rx_flow *rx_flow;
>          struct am65_cpsw_tx_chn *tx_chn;
> 
> -       if (queue >= AM65_CPSW_MAX_TX_QUEUES)
> +       if (queue >= AM65_CPSW_MAX_TX_QUEUES &&
> +           queue >= AM65_CPSW_MAX_RX_QUEUES)
>                  return -EINVAL;
> 
> -       tx_chn = &common->tx_chns[queue];
> +       if (queue < AM65_CPSW_MAX_TX_QUEUES) {
> +               tx_chn = &common->tx_chns[queue];
> +               coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
> +       } else {
> +               coal->tx_coalesce_usecs = ~0;
> +       }
> 
> -       coal->tx_coalesce_usecs = tx_chn->tx_pace_timeout / 1000;
> +       if (queue < AM65_CPSW_MAX_RX_QUEUES) {
> +               rx_flow = &common->rx_chns.flows[queue];
> +               coal->rx_coalesce_usecs = rx_flow->rx_pace_timeout / 1000;
> +       } else {
> +               coal->rx_coalesce_usecs = ~0;
> +       }

Minor nit, but after removing the dead code below the check for queue 
being greater than max values, I think am65_cpsw_get_coalesce() and 
am65_get_per_queue_coalesce() are identical except the "u32 queue" argument.

I think you could do something like the following:

static int am65_cpsw_get_per_queue_coalesce(struct net_device *ndev,
				  struct ethtool_coalesce *coal,
				  struct netlink_ext_ack *extack)
{
	return __am65_cpsw_get_coalesce(ndev, coal, 0);
}

static int am65_cpsw_get_coalesce(struct net_device *ndev, u32 queue,
				  struct ethtool_coalesce *coal,
				  struct netlink_ext_ack *extack,
				  u32 )
{
	return __am65_cpsw_get_coalesce(ndev, coal, queue);
}

> 
>          return 0;
>   }
> @@ -951,9 +967,11 @@ static int am65_cpsw_set_coalesce(struct net_device *ndev, struct ethtool_coales
>                                    struct netlink_ext_ack *extack)
>   {
>          struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
> +       struct am65_cpsw_rx_flow *rx_flow;
>          struct am65_cpsw_tx_chn *tx_chn;
> 
>          tx_chn = &common->tx_chns[0];
> +       rx_flow = &common->rx_chns.flows[0];
> 
>          if (coal->rx_coalesce_usecs && coal->rx_coalesce_usecs < 20)
>                  return -EINVAL;
> @@ -961,7 +979,7 @@ static int am65_cpsw_set_coalesce(struct net_device *ndev, struct ethtool_coales
>          if (coal->tx_coalesce_usecs && coal->tx_coalesce_usecs < 20)
>                  return -EINVAL;

Why does this return -EINVAL here, but 
am65_cpsw_set_per_queue_coalesce() prints a dev_info() and then set the 
value to 20?

Would it better to have consistent behavior? Maybe I'm missing some 
context or reasoning here?

> 
> -       common->rx_pace_timeout = coal->rx_coalesce_usecs * 1000;
> +       rx_flow->rx_pace_timeout = coal->rx_coalesce_usecs * 1000;
>          tx_chn->tx_pace_timeout = coal->tx_coalesce_usecs * 1000;
> 
>          return 0;
> @@ -971,20 +989,36 @@ static int am65_cpsw_set_per_queue_coalesce(struct net_device *ndev, u32 queue,
>                                              struct ethtool_coalesce *coal)
>   {
>          struct am65_cpsw_common *common = am65_ndev_to_common(ndev);
> +       struct am65_cpsw_rx_flow *rx_flow;
>          struct am65_cpsw_tx_chn *tx_chn;
> 
> -       if (queue >= AM65_CPSW_MAX_TX_QUEUES)
> +       if (queue >= AM65_CPSW_MAX_TX_QUEUES &&
> +           queue >= AM65_CPSW_MAX_RX_QUEUES)
>                  return -EINVAL;
> 
> -       tx_chn = &common->tx_chns[queue];
> +       if (queue < AM65_CPSW_MAX_TX_QUEUES) {
> +               tx_chn = &common->tx_chns[queue];
> +
> +               if (coal->tx_coalesce_usecs && coal->tx_coalesce_usecs < 20) {
> +                       dev_info(common->dev, "defaulting to min value of 20us for tx-usecs for tx-%u\n",
> +                                queue);
> +                       coal->tx_coalesce_usecs = 20;
> +               }
> 
> -       if (coal->tx_coalesce_usecs && coal->tx_coalesce_usecs < 20) {
> -               dev_info(common->dev, "defaulting to min value of 20us for tx-usecs for tx-%u\n",
> -                        queue);
> -               coal->tx_coalesce_usecs = 20;
> +               tx_chn->tx_pace_timeout = coal->tx_coalesce_usecs * 1000;
>          }
> 
> -       tx_chn->tx_pace_timeout = coal->tx_coalesce_usecs * 1000;
> +       if (queue < AM65_CPSW_MAX_RX_QUEUES) {
> +               rx_flow = &common->rx_chns.flows[queue];
> +
> +               if (coal->rx_coalesce_usecs && coal->rx_coalesce_usecs < 20) {
> +                       dev_info(common->dev, "defaulting to min value of 20us for rx-usecs for rx-%u\n",
> +                                queue);

Would it make more sense to just return -EINVAL here similar to the 
standard "set_coalesce"?

> +                       coal->rx_coalesce_usecs = 20;
> +               }
> +
> +               rx_flow->rx_pace_timeout = coal->rx_coalesce_usecs * 1000;
> +       }
> 
>          return 0;
>   }

I think my comment to the "get" and "get_per_queue" versions of these 
functions also applies here, but only if the behavior of returning 
-EINVAL or setting a value for the user is the same between the "set" 
and "set_per_queue".

Thanks,

Brett

<snip>


