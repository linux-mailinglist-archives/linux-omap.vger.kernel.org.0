Return-Path: <linux-omap+bounces-3379-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DFF3A5DDF2
	for <lists+linux-omap@lfdr.de>; Wed, 12 Mar 2025 14:26:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B385516E6E0
	for <lists+linux-omap@lfdr.de>; Wed, 12 Mar 2025 13:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7123C2459CD;
	Wed, 12 Mar 2025 13:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eH/7yXtG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C66822ACD1;
	Wed, 12 Mar 2025 13:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741786004; cv=fail; b=QDjjjgb73J3DoyExb/jsu6yYgWF6Wg1biJ7bM2kUMunrBiYk3YV4bR1sq5+5sU+gpH25PC4rSj4ZE9sAIpG572j78Cfa57lyY6BQO7kT9PAASnzGj0MkVG4tvN6bDkJa/uo6LUbD24Gp2fVbQVPfKeT/J+q8xr4VS3as6WVhxhM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741786004; c=relaxed/simple;
	bh=krGknfycKwg/TQgMhNuKGzg6WiKYxWb/wOiluQJkHYs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=gg5QoY8cUtk8X+mnflKUoVayXKLvb4/fraITbDCoRGXJcvhehrp4LwLEHXasSjeod6S769R+Qq/6TTQ13UUpl3L6pxwUUsqp7z2wS2P5Kad1rAtdS8FYC9hN0hWbb+n1nr61AgjaxIpXPUvggKm69jFqji7AKW+YV0MlvrhkvCE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eH/7yXtG; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741786002; x=1773322002;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=krGknfycKwg/TQgMhNuKGzg6WiKYxWb/wOiluQJkHYs=;
  b=eH/7yXtGVabkqEjHpatJVRVhwHCPaOcodsIoZmCLWt32C+Hnx5UyoVhS
   bUIuHksHouZHE5EfxE1U92kY+JZiaKJ9BOm2RatMheNH4LERcPeSiYTch
   QtgSSFEJlh7MtvVjyEYEdu9ehUYy7rw+3RVFxiEcQ2o0S6STCA7puQvbn
   vpwrEa2FtEIHDG9ADw2tt8eVEAKLpY+TfwG5PBuj7oTqarT5vkqg39p1m
   GTw3IdeaJ/lgj4h9FGUOtfOVKZiO8wYDg3nE/wUc+5j+pGhpK0X5lrG07
   w1a5hPD9UXY5gJhl8aNPLQnjs265uELaildnL0lt9Hqqaqkv9NGvnOTNr
   Q==;
X-CSE-ConnectionGUID: fiFAOonBSFCLWe5oHJtckw==
X-CSE-MsgGUID: 4TOaW5DMStOHHJQ02pvf4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42028792"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42028792"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 06:26:41 -0700
X-CSE-ConnectionGUID: RDkfQqxGT+mn8qwVG2TWzw==
X-CSE-MsgGUID: vpJZ0CTuQ76McW2UCbKT0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="120604007"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Mar 2025 06:26:41 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 06:26:40 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 06:26:40 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 06:26:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X0eNBm3RrgwW22S0mf5U/VfkJhLedywo8qSZtMqU7h4fvCIItfPraq9KALdO9gslRUgaSJOXfVI6Pn5H6IueEm7V7IhAH0z0EoO1ZOufZRWWwjHUYojMzYT11F2cJIwrZfLeH7RbZV5WdfMo3/2tjNNd4s5Uq6T0TkhVmdITPcvMgqA4Mglvg4wFSq8TK/TJHrz0NqTlGYzja6Yn6NsM9TU6YUdq2SHAaDb1JzHsrHftZiYoxFF5CAdtGe4bBoiVAxyHQHZce03z5higCoBRn5RlGYU0x5dV/W5lSoac6Ut8SSXGSgUGMevthAJz/K0GUCWy4qDxn0DKtaPBAle7VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NgJqlWEU+Snr4a5Vyu6kyUupx/KG6N8K7mnUhCv48is=;
 b=lJtkdBaWC4OdA0eOIyUUqeTUrlIXkGNJqME8Yj9mDNbDU4JAoweE53QeS/Udmr0I3dc/zmWM3F73dqx3Hu1ZPGonMpI35ed629OeyVWVDLL0JC66wtsxrmn9L+PUPxInijdXrL6obSs6t8jArqXCrNKRX5F73fWk41KtWvd5JPSsIEsVvhBLaDdZBHoD4rynGAOfN/JXl+GEsA4nzoo38hDXrTpI2XKqfCLbT+TkVYV0oQ1Lkxp3NRfEAFjUxlafCmumoWFb+7EgYfrb16rqqdNbcCJgHoM3pQ9NLsfcFlrwW5OEJ/ehhbKibixy2fBldgGa+kCZMb5lgB96uyiIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3605.namprd11.prod.outlook.com (2603:10b6:a03:f5::33)
 by SJ0PR11MB8270.namprd11.prod.outlook.com (2603:10b6:a03:479::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 13:26:05 +0000
Received: from BYAPR11MB3605.namprd11.prod.outlook.com
 ([fe80::1c0:cc01:1bf0:fb89]) by BYAPR11MB3605.namprd11.prod.outlook.com
 ([fe80::1c0:cc01:1bf0:fb89%4]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 13:26:05 +0000
Message-ID: <6d33b6fb-94a2-4740-9247-b51f9bc9feab@intel.com>
Date: Wed, 12 Mar 2025 15:25:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mmc: sdhci-omap: Disable MMC_CAP_AGGRESSIVE_PM for
 eMMC/SD
To: Ulf Hansson <ulf.hansson@linaro.org>, <linux-mmc@vger.kernel.org>,
	"Vignesh Raghavendra" <vigneshr@ti.com>
CC: Tony Lindgren <tony@atomide.com>, David Owens <daowens01@gmail.com>,
	Robert Nelson <robertcnelson@gmail.com>, Romain Naour
	<romain.naour@smile.fr>, Andrei Aldea <andrei@ti.com>, Judith Mendez
	<jm@ti.com>, <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<stable@vger.kernel.org>
References: <20250312121712.1168007-1-ulf.hansson@linaro.org>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: PL 281, 00181 Helsinki,
 Business Identity Code: 0357606 - 4, Domiciled in Helsinki
In-Reply-To: <20250312121712.1168007-1-ulf.hansson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI0P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:44::11) To BYAPR11MB3605.namprd11.prod.outlook.com
 (2603:10b6:a03:f5::33)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3605:EE_|SJ0PR11MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d92c35-2b67-4af1-f9dd-08dd616970ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Znp4UEl4T3ovWVhvbFYxOHRVbXdGTXVJRFFMekFYcnZpYTJNRnBXVjA2K2RQ?=
 =?utf-8?B?alk2b25kcUpDQ2lIeG1icUFsdnpVN21LSXlGUXYzU0N1bFZmcFdmLzh0VWtO?=
 =?utf-8?B?MFoyLytNckNQVEd1WkRYV2gzRnErYjZYQW1pSjZxVldTM1dMOGFrYnpnUyt2?=
 =?utf-8?B?QjU5eHlPN25KRUQvWS9xT2JmTTBwNzR3Y2MvZ05ZRXN4dXJhSWluc3NJRVRJ?=
 =?utf-8?B?dmVyeUVJV245VVMvRDBHOEFqWVJFQlBINFJSQ2dMSmZXSjFCV1ZnbmJ5YVFF?=
 =?utf-8?B?ekRpNkd5Z29WeFVKODQraWREa0RlVnZlUTByVUVqMnRmSnJWcnh0Rnp3a29K?=
 =?utf-8?B?QXhpQnlieWRqd0FsRGdTVmdVRjMrMnp4MDNuMlphY1puZDdydStsYkp4NG01?=
 =?utf-8?B?bERFSlc2NXZXODV3VmVsNlN4L21TNlRNSytOM2hkTzdLSStURFk5ODhScVNv?=
 =?utf-8?B?aXllZjRpMEZGY3IyU1pUbHBLV2ZRZFloeU94RnZiVmpKSm45c3p2TzU3UFhN?=
 =?utf-8?B?WW1rR1hDbUJnaUVUZXRMM2FFcWVxT2VhNUJwUVlmczVMbEVqSUVhdERzU2tO?=
 =?utf-8?B?d3RuUkp0WjlReVV3K3l3bkpaancxOUJtTGp4S1BoVVp2V0NJTHhtZHNSWEhv?=
 =?utf-8?B?a3lSTSt6dnBCdHRuejVrNXZoZmhLNFFLZEtyeGRzWFBRQkdGV3E1eUxCVVpj?=
 =?utf-8?B?elVrUUJrb0tmdlJaY2tSakxjYWRCRWFCekhQSWNMbVFadkJaNG9BRmhZbU1T?=
 =?utf-8?B?SEFVMkdiS2hjWGJQL3liYkpIc3B5MTFuaVZEK2JodkowNmtBVGc0NzQ3empE?=
 =?utf-8?B?eE53RDJoQ0wxQk9QazJsdEJBYzlpdTZKMGlsa2R4SVRGZy9KTVgzdEhWWjRQ?=
 =?utf-8?B?WFl2TWpuaTdJRGRVanBTNUtFUzcyZ3hSbFZEeW5MbmlGNm8rb1BtbjMxT1ZZ?=
 =?utf-8?B?eHJqL0d1MDlaRlppL3Fmc2VkVDdDOEdYOHNiaWUzNEpheFBIc3YrMG1POENu?=
 =?utf-8?B?ci9yYzVvSlIyNFhyeUlLSjAxT1RqZVh0aVBlNWdRQVBSTkQ5cXJ6NkxKMTdr?=
 =?utf-8?B?M1d0cmtSUDJpZHU3K2RFRERobXc5cHpIZVZYZ3Jwb05PSzBXa3UrV2FleUNk?=
 =?utf-8?B?dnk1NmJzclRqMHpoYVM2VndaR0haOUlRS0dCSVpZREhwZXlUTjYyZ2ZXT0dX?=
 =?utf-8?B?THI3NGxVdXh5bzlIdlA2YmE4WThzVkorZzBLaXU5NHNDd3ozZnVjOWlqTzVX?=
 =?utf-8?B?Z0FNRHBUeTlHWDg3bDNtVjVDb2gyMWtBcE9BN2M5QlRCR01ZOVhmZ0JaMnhz?=
 =?utf-8?B?eitSaW93eGltbnRUekJMSGNWSE9TQ1FrWEwwVDNvMExOY050SnNjbVFERXhs?=
 =?utf-8?B?M2p0UDUwc0xYYzh4UDVGTkZBYVRHdUJJTW95UkwyYTB5TUc4SGo3VXIvSkFS?=
 =?utf-8?B?Tml2dzNiaVVKMHdzUVRCK3RKaHdFalZvQzZWWFpTdUR4a0FGa2ZKd2ErTUg0?=
 =?utf-8?B?VFE4bnU0SWNVSWF2UEdyZFBaSWpBZGJHYWpHS2psSTNvYy83NEZybFBhcUpT?=
 =?utf-8?B?NmpOZnhlVTg3RVNWdVVTWnowTGp6MTNqVFo0NlY1TmRpSnRVZGd2eCtsVWUy?=
 =?utf-8?B?R0o3MFJ5S1VNK3NBVzh5NjhXYldVMUNTVVlTNlBMQ0hkNk5za3l3WWIweUoz?=
 =?utf-8?B?MFM0ckQrcS96R1MyZTFickZCbzF3V3FLRWc3MFE1UGxud3h3VFZlR2p4SUhk?=
 =?utf-8?B?MFRTVlhacHlnMU9UQ0hodkR5aUhmT0xFdGdOVzhDV1pvV2JZc05IYTQwMnRQ?=
 =?utf-8?B?d2xUZi9ZMUhSSVZnVU9FTU1oWXZIZmJqZ1RoSElHUU1RU3FzTDk2VjFqLy9W?=
 =?utf-8?Q?/9S8wrk6lYS/D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3605.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?emtZR2x3b0NWVHlkN201MkRnVTlSOUk2cHNYc2c1SWZRcEVTZEpHZ0xwcVNT?=
 =?utf-8?B?dlpML2lpZy8yUmRkR29UWjBGNDhoNzloSnhyOFlvZnIxMzNvd0d4TXNOeUdE?=
 =?utf-8?B?WGVQVmtsQWkvVGVIMVRuQ1JvVHZacy9vY3BPSjUzNG5LTXJZb0xpQXlNMUVB?=
 =?utf-8?B?RXN1aFJ6UzlzeXQ4WW11M0pPYVVoTG1ZcjlHWGJka1M2SmhoM1F5VzU5NzF5?=
 =?utf-8?B?VXZ2OUVscGZWd25qWUxLOGl2TE0zWTZSUUtZcHVTVDl5WE56ZFNMVlBYQ21Y?=
 =?utf-8?B?V1hhbEJVZ25GTG8zNFNZWnZNMzlUSTdvMDM0YTVmWDE2ZVdISlZCSWRrYzQv?=
 =?utf-8?B?NXNWWWhCS1puUzYyeGVHdmdZd3hZMmNhQk5tQTk1YTRVMFdMOEQ3eWJhWm13?=
 =?utf-8?B?emUrNGV5QjJRK3NGclVXcU0rc0lXRld6c1V5a1AyTWdYYTRUaTByeURIRXky?=
 =?utf-8?B?K3VDWi9iZ05DRFZ4N2hEdVE1WENOaVhnVXJwRDhoaUtrci9DS2MxVGtMWUdT?=
 =?utf-8?B?bnU1ZEN2eXRYcUp4bzJhVXlzMFFJSUY4cmxiMzhoeStPM3NaaEE3UTNFQlVU?=
 =?utf-8?B?V1hUaUs1dDRiaUdNN1FzUE9JV3dacUtKcXUvZVUrV2RKN0tMMUYzamRJMmFB?=
 =?utf-8?B?TWtHQisyTzRSUjNwWGR0WVlnTHV5a21waFlaUEJ3TW9zekFQUFJReisyZ1ZG?=
 =?utf-8?B?YXlyOFRwZ280clZvYzkyNTgzckxHM3ZCV3hSZ1NZSE4zdkdjSXhYeU9mcG1q?=
 =?utf-8?B?S1NUSVN1emhaOWRFTy9WWmwzMGh0RWVmRE5qYStUd0VHZVUvWmdiTjBIOU96?=
 =?utf-8?B?Z1pkeEdXV250OXhQbktMRDdieFZyb1NKc2FJbWcxK0UyZHE4TGdZcmpCa3hN?=
 =?utf-8?B?b3Y2dFlIalpmcWZ2Z0N6cnNjL0s2WTBGQlhqVHNLUFkyeUswWkVXY296Y3Rq?=
 =?utf-8?B?dHlha2dhRkVrN09oYWVOVWNyQlJJa3RhbExta3BicmsxMGp5Q08wWE04OFNh?=
 =?utf-8?B?cmJrZDhuRDlYQmVJbGF3MnBMUjQ0MUs1L2tieENodDBhbWRrOHpkWkdIOWFO?=
 =?utf-8?B?WnZsKzR4MWxFcTEwVlJqSHgyOHFXUmxhR2c2V3RKUFNwQ0p4V0ZtWkgwcjVh?=
 =?utf-8?B?THUzWG9OYTVNRUJQd0NsRUJ1K1paVm9HaU5yVzVHa0djS3ZoWUsvaXpUdE9C?=
 =?utf-8?B?TjJKcE1qS3BlT0t5OVIwVEhDaXdORld0Kzc3SWplNVZlMk1kY01pRTBFZEl1?=
 =?utf-8?B?OEJZbmFoUFplU3htaHF0cjQ2UXN5RGMyY1piTWV1SzBjUHlQMytwT3poTWkw?=
 =?utf-8?B?NWMvUTJFL3BaSTIrLzFOTWFqSzBkM05leHAxYUtMbnYrcjB2RExETVc3R3B0?=
 =?utf-8?B?OWRhOWNRY0QxaEZlZUgvaXZPUHBoTjlISm82emh1MXVnRUQ5WjRvamVETkhM?=
 =?utf-8?B?UDA2WSt3aysvQWMxNER2Vm9mUkRIOXFId05HdFhpOTRqV1NIVUs4TTBXTVNP?=
 =?utf-8?B?QVFLZ1FGaVVtREowTU1RVmQvNkNOc3lvdlduQ1VRU2FOUmJ4TzlsOGRTdllk?=
 =?utf-8?B?cXhTNnZPRC9NVktERzVseW1WQk9BUmZ0N0NVK0lvUE5LNVJHc1haVW5LTzdN?=
 =?utf-8?B?dEcxNmdITVB2dDcyc0s3WmdoVDBvc0w0YVFHd1RDVEc0RGZtOWtjRkhydGVV?=
 =?utf-8?B?bXNDell5QWNTQXEyS2t0NWkzd053bFhyRlpxQko5anFFVVV5c0dKVXlFZWV3?=
 =?utf-8?B?S1NiMXFQaENyT0Q0djhxR3lvSXB5QW9hSXJ2VlcwdU5YVWw3bXhjajErUEVa?=
 =?utf-8?B?M01ucWlxenVNZUZndjBxWnhGNXlJSFhWdTBSMkFZUjRNNHNZdXF5WDVFeGQ3?=
 =?utf-8?B?dmVSTElwUlVWT2kyZUl3Z3hsdTdrQ0ZCUjVYZnFtcjJiSGVoV1R5aTZZRDB2?=
 =?utf-8?B?TXNLaFpBVG9jNXV6Y2wyL1ZJNW1ZZjRDc2FKMUNwakc0QzBaRnBjb21YSUg3?=
 =?utf-8?B?cWRTTW1qMVFmMmlvMGNkVS9obXZIaFZUN0lld2lKaXJ4aXJkRTlLTzZraFls?=
 =?utf-8?B?cThzZWFENjhvUk1FblNwRnR4bXFNR3VCVkNFS0dsT1ZGVGpzNnBmelZZenRU?=
 =?utf-8?B?NVpEVGQzTHZOTk5XZ2lBYXpjcERDbFFzNDJVZ1ZEaVZPbHd0NVpDZ2d3RTl1?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d92c35-2b67-4af1-f9dd-08dd616970ac
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 13:26:04.9528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWf0A9CSFK4L+MCfo8IY9bVZfX2dHUJA294TgxVcrwaCqnB9Kj/uaUrr3upy8W7mdKJMHttfVdG8zW8lGFfI5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB8270
X-OriginatorOrg: intel.com

On 12/03/25 14:17, Ulf Hansson wrote:
> We have received reports about cards can become corrupt related to the
> aggressive PM support. Let's make a partial revert of the change that
> enabled the feature.
> 
> Reported-by: David Owens <daowens01@gmail.com>
> Reported-by: Romain Naour <romain.naour@smile.fr>
> Reported-by: Robert Nelson <robertcnelson@gmail.com>
> Tested-by: Robert Nelson <robertcnelson@gmail.com>
> Fixes: 3edf588e7fe0 ("mmc: sdhci-omap: Allow SDIO card power off and enable aggressive PM")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>


> ---
>  drivers/mmc/host/sdhci-omap.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> index 54d795205fb4..26a9a8b5682a 100644
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -1339,8 +1339,8 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>  	/* R1B responses is required to properly manage HW busy detection. */
>  	mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
>  
> -	/* Allow card power off and runtime PM for eMMC/SD card devices */
> -	mmc->caps |= MMC_CAP_POWER_OFF_CARD | MMC_CAP_AGGRESSIVE_PM;
> +	/*  Enable SDIO card power off. */
> +	mmc->caps |= MMC_CAP_POWER_OFF_CARD;
>  
>  	ret = sdhci_setup_host(host);
>  	if (ret)


