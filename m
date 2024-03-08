Return-Path: <linux-omap+bounces-870-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E3E876ABB
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 19:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C285282003
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 18:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C4C58230;
	Fri,  8 Mar 2024 18:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHqTgAPZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554A857878;
	Fri,  8 Mar 2024 18:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709922395; cv=fail; b=kzT8hN4vJI4JgdUioeVxNSFljLBj0EMda9CBBk3NFIUzXUOcuUSRJjeAky8ahKk9ORlb9AVQmUQdbh1Iws3BlheTf33niSGyi1mVHkTIuaehHE0nYyToEH/3ytZL/ltEcoOCOwOcEZgCl3uWj2ffyu/aQV44T2+2Fyky/M2cEew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709922395; c=relaxed/simple;
	bh=iDnLy1u+JYcdwX3RxKRXB3HV8bHG+bno9khvqhB/jdc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KA/Trf04bdNchwRh9dKwp/E+7gmlSqvIU3vgB70OT/J073qxLl2b/MWcbJ8kD8KaQnNPAj6SiV5TPDelLqa+zPFvfk1eHIHfO+McY6TAWXcRnk6ZbxAiiHzbbf+nw4CT18v3nnkW+mwk8l79wAdTQG+HWck4ss0PlNeOa4tzFfs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHqTgAPZ; arc=fail smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709922393; x=1741458393;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=iDnLy1u+JYcdwX3RxKRXB3HV8bHG+bno9khvqhB/jdc=;
  b=YHqTgAPZoaSJVbAZ1LCTnSTa8I1drBH90lzUV/KQ9IHTQev8cqOz8Aaf
   pKI7xzLphc42yCneKtSpJov6MLwybtZt7QAs+D+deBDNzpwj5DHkAJbX+
   dlCts2cbK/h5aKF7yeoHtSU0SOgcvnhW0VHZpWhQmDNAGCO9xDcrycG21
   q36f79a85bEeOXQf46C422ps+8w6LlTxVwxxQX8pX/Rtq8vZj+ZCO8Rry
   A7j87i4aAwMnh4eyZTq/bnS9R/wkZN+eXS8kK6ALw6/QFlPdA53vcuODK
   3WttZ7mQ7xFX2ZJtI24AWZIN7sG0NJEYaIbndnNxGN7nUHxYSnkCgk3hi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="5252321"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="5252321"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 10:26:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="15027162"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 08 Mar 2024 10:26:32 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 10:26:32 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 8 Mar 2024 10:26:31 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 8 Mar 2024 10:26:31 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 8 Mar 2024 10:26:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WXpeNseSw8sF6FVm9vVm2p6301GXRycdBXAd5iOcDy7AaNQ2qu1dYP1mU35X+BK3dNkF0dbqIRkNLI0jkJTzls2oRN5UmRLwIPoPXXo9hO7EStF8VjAW+7kFo7+kKxNZJibuDBor+sMD25YoiKXP20CNHfCf118F9h3epmtutnOp+uCzDdE+bH9cUyIsQ0T58FDA1km2hC28/irwg9ZlrVgxcTMvr4C5bEkTgiBbAMKG+RWwJdIJr3Mw7IK1fBbz1gfW1SYtXc+fDP7MpXMvErjT9nNVwaf7qeCCOc/qtVjJDua8An1C4RwJhNyxJ9CSvXNGSCLosw+TH5SNBwFhKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hSyr0r71Z5ZpBpwsIOzmt6JQMKxBhxNFqvyo7z1Lvl8=;
 b=E/+h7P0V3zbpCCQvsS4sLKOWHNQs3XlvkjOwpf2GR6Eo3866W9AtKcB19VvZSK1iT+jVnHApgo9TszZRZRhW73IftCDhAbnRj4XsoP6Ne0K3AvpfxMc1LTdUYVFF6ShEkg6TrFeeZVKuQU65FYbPKzxVG1kfbYKc+ZKYlKZjWBwNcWYlOm9wfU6c4Fyv9jy/wTe+F73MZhhqpEQuPRcEkecqSZPE54BhALOQcqGRSScMBIKEzPoSV6CrrXzj11vT1+h9tuOL5F+Wl5Jq15GQQTeVluNONCV8h9hyffs45iEa+3/BabF3/BMklxKC2h2DcAxT/XLjWa2WAWjaAUXRAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6435.namprd11.prod.outlook.com (2603:10b6:208:3bb::9)
 by MW3PR11MB4731.namprd11.prod.outlook.com (2603:10b6:303:2f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.12; Fri, 8 Mar
 2024 18:26:26 +0000
Received: from BL3PR11MB6435.namprd11.prod.outlook.com
 ([fe80::9c80:a200:48a2:b308]) by BL3PR11MB6435.namprd11.prod.outlook.com
 ([fe80::9c80:a200:48a2:b308%4]) with mapi id 15.20.7362.019; Fri, 8 Mar 2024
 18:26:26 +0000
Message-ID: <f13db290-72db-9b43-725f-4c43d7a8e839@intel.com>
Date: Fri, 8 Mar 2024 10:26:22 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-wired-lan] [linux-next:master] BUILD REGRESSION
 8ffc8b1bbd505e27e2c8439d326b6059c906c9dd
To: Jakub Kicinski <kuba@kernel.org>, ivecera <ivecera@redhat.com>
CC: <netdev@vger.kernel.org>, Linux Memory Management List
	<linux-mm@kvack.org>, <intel-wired-lan@lists.osuosl.org>,
	<linux-mtd@lists.infradead.org>, Andrew Morton <akpm@linux-foundation.org>,
	<linux-omap@vger.kernel.org>, <bpf@vger.kernel.org>
References: <202403090150.0gkUdeIc-lkp@intel.com>
 <20240308100630.456498c4@kernel.org>
Content-Language: en-US
From: Tony Nguyen <anthony.l.nguyen@intel.com>
In-Reply-To: <20240308100630.456498c4@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0021.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::26) To BL3PR11MB6435.namprd11.prod.outlook.com
 (2603:10b6:208:3bb::9)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6435:EE_|MW3PR11MB4731:EE_
X-MS-Office365-Filtering-Correlation-Id: 6987da90-c6d2-4944-485b-08dc3f9d4425
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HULBBG5hTUqivkHKv9z6JEmDn4OZMX2XDvdQ1ImGq7PeeKaQIjXI0JFc5PuXXAXSot+fBbTtDcYpd9WFD5c6jvuh+kBxVcWANzjRLMIMzrEA33rWz/bkPxc2gQNBGSKCZzJWplnyI9hz1YnWzmZBruxmqaerEp4SRF5mkjVbk/vQIjH77DbeZ9qt+NZ4PffkI/v/o2L8eI5vzeA/+npVRDJ4BpfRU3343LilnQzclE4pmgCcGdxB9h6KAVyS3zMX9giUDJG7xjlzjqB6RIbruV3R5o/XyZtm2PcOCJlXdd0wU1jvdz9Ao3SRsYl75mG6mQjw1n+DBwxkXnuzjqBmwOazacYe8/b0jop/3XMw1dbSoO4izdKwY0D7odSVaGAlfF8g/rX1//JR6PgIdQk8bym6O0pOalmTmyK4Tfk58vpem8/pr5dBZ1/zCfNtKXL0UejPgWvXZgLvywZITVszpwqwLuMgC2Yl/3XPBvaRlX2KhVj8l4eBI611EZELFnEe5Pn7BYDLfz1jz5XVccnzh9mkA099OSv7mRI4AQY/wf+rEGSs+fVPCpoStbnBCzvNJ6gF4oiuVaa2H3zVCI5rBhVe490c/vjc74VuBIl46LM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL3PR11MB6435.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TW1PNWhFRjZGcU54WmNuREJIRkxWcnBkemYySm9iZTJFU3pZSXlTaFQxZjBr?=
 =?utf-8?B?TjFvWHBySGlUaXpqeDZUSHFUTXR1bFVIcVVVTmV3SmhVWkRuKysyWkN5ZTJS?=
 =?utf-8?B?T1A2dVk1ZjZ3dGVwdzV6b1ZqV1RXWmNGY3JZOURUK0Z0anpJU0lkWTJoOVZP?=
 =?utf-8?B?UE1zYlc2VjcwekFjR0ZYSEdmM251bzRtUmhnT05LRU53dmJaRVJESnJERkQ3?=
 =?utf-8?B?S2VSempldkhENUtCZVkxcDhsR3BRdmQrNkdoWDJEWWlXVmhadGlWNmtVV1Bz?=
 =?utf-8?B?cjF3Qm9tdHNGZjVUbHRZZjgyd2hHNVZEUGNKYWJDbmhnN1lkWklwbVV5WEJr?=
 =?utf-8?B?aEtDVHVqdWpOR05JMjgvbENrdE1WREJib3ljVlF3cnd5VGJJVWoxbUVVemNX?=
 =?utf-8?B?aUdDZ0sxRWpSMmp2UlZJRVhHRkREUVQ1NjZqVWVlQU9xemQxbWxqM2oyRnVn?=
 =?utf-8?B?L3NVZTdVdXA0RWlkbHlGc1F1UEZCQ0ZCZUZuYmhWdDB0WkRMNDNqcnpZOGhR?=
 =?utf-8?B?U1dIbitjemQ4SExsZXFDUjRqeUdZbW8vQ292M2Q5T0VxR0ZRWHdYUWlERDF2?=
 =?utf-8?B?YWlvWjJyK2JqQk1uT3k5aUJBd1B2eDhybWZnbEFmVndFTGdKR3NNSFdMRWpa?=
 =?utf-8?B?MkRNT1VJeXp1U3hsdW1GMnJUWEhMb0Q0KzRNNmFiZGIxS21qYkFmeXd4VFU0?=
 =?utf-8?B?WnJUTk5UT0JGVC9QK3JuNDZlalU4OXVoM3JVSWtOZkljaENCTk81VEZTRVp1?=
 =?utf-8?B?TXQ2NHltQnJvcWhDazdod2ZzSTRlYXZiVGR0TENKdFZOOHp2d3dNL2dWaGFr?=
 =?utf-8?B?U0tUbjlPanJXOXFrNG1nKy9GWmtlTWl6dUFacXRUSysvQ3d4cmVuRk1reUhC?=
 =?utf-8?B?SEYwRUxmOVIyTEE0bnZqNHA4UThRbG5VeWovdnRiZVN1Q056K0M0bE1DR1dW?=
 =?utf-8?B?WEUvd1NYcWxGMWtkZjM4a0lyR0R5U1hJdG8yM3B1RUkwV3RBTUJrUmdLQzRy?=
 =?utf-8?B?YWJlUU4xRTRnMGx1YzFjRGZncG1RNEh0OE9iNEhwaVI0KzdOMHJ0dzRZUUFH?=
 =?utf-8?B?NSsrOUxoUWlqSlFRWnhzdW5YRWVsMEZJajFTUmx0bnlVdlQxbVQvS2IrUFY0?=
 =?utf-8?B?UWdlaGJha0VjVmYrdG9vbUplVzY5UThCamdIYjcvT3U3MUxJb2UvaWVhQ0pL?=
 =?utf-8?B?VDhwT2dMcE1FSkdIVk9XKythSFNadDV0U2trQUtlWmpsbTNnNUs4cUI3NWtP?=
 =?utf-8?B?TnVEcmRYNGF6UzhjaW1ydmhlN1R5VG03UkF3MWl0UE5wNkRFYmluZFB4WUd4?=
 =?utf-8?B?aFUrZzFlQ2RsTXl5Z0Y3V2JvZm9FaHgxWDYvU293bUZVa3N3a3JHdlJlbksr?=
 =?utf-8?B?akk5Ym1tbVJaVlAxR1ZlVTREenpvTXRHUCt3ZWp2dWVpVEErdFJGdXFFNXph?=
 =?utf-8?B?Q0N1L0hXVzdZM2JHRTNjZzZLRkF3Z1lKZlQ3RVV0SDU2QXFrTzRpRGhrRDB1?=
 =?utf-8?B?SndrR2NaTnBmeHp5MERVa012dXhvT1VWTFk2QVh4ZVhXYmdWR3dka3lmTUkx?=
 =?utf-8?B?Y0s1aFNRRkVJQjNPZXdoNnJSV0l2NDh3RlgwT0pzN3BMUmVxVDgxVmVvdnJG?=
 =?utf-8?B?aFFzb3MxcVV1eXdxMkJ6VnVybURUaXljMVV3Q3FCNWhBSktGTnJPcndCNjli?=
 =?utf-8?B?RDl2OVd6SG5VUHYvbFg4dUxFbC9MTDczVFJmaDVGbmhBa3BBYWJIR2hBemFB?=
 =?utf-8?B?TG42ZnJRK1BGcE5xc0tKay8ycEdRcUJLWGN5S3pUNGFNdmRhdWVjUUY3c0Rz?=
 =?utf-8?B?UWZnZUxhWlFvK3BGRExTNkU5VGpsbXoxdzRpRjVXMVh1UDZRUkxCM0ZLL3Vo?=
 =?utf-8?B?V0syS2dXdGV0L0U2RTV0bEdnRllXTUZFZysvRGVXUVZRanUxSmpGYlYyRjZy?=
 =?utf-8?B?aWNIUTNHK1BkVjhhVlB5MGNxWVZNNUc1dThsb1BsdXl5Nys4KzJUOXBzSndw?=
 =?utf-8?B?ckpmeHZIL1UzeEhIZ3cvOFd1WUlIQWo5R0laVW0xaldvWjk4a201YTVTS0d0?=
 =?utf-8?B?K2xmVkR4dThsVVRvOWZDeWxsa2htNkIzTnUxbzZsTTcxaGVBcmsvWkhsRm1n?=
 =?utf-8?B?RFE5c3BnbXlOdUd6SlBINCtIaWhzWWM0SHdQay93Z3dwUEk1TWF5TFU1c1RZ?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6987da90-c6d2-4944-485b-08dc3f9d4425
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6435.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 18:26:26.7352
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDw5M4Zgoc/EF9Z3p8MFtltOr0dtbBrCAC+0O0cNb9XXpDkdHMHPsN3svcTDT6lyRS06oo5vLAA4fmipFZDAPXfli3CxU+apzPFrS5f1lzQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4731
X-OriginatorOrg: intel.com



On 3/8/2024 10:06 AM, Jakub Kicinski wrote:
> On Sat, 09 Mar 2024 01:52:56 +0800 kernel test robot wrote:
>> |-- i386-randconfig-141-20240308
>> |   `-- drivers-net-ethernet-intel-i40e-i40e_main.c-i40e_veb_release()-error:uninitialized-symbol-vsi-.
> 
> Hi Tony!
> 
> Is this one on your radar? I suspect netdev@ gets CCed on the reports
> because of it.

+ Ivan

I believe it's a false positive:
https://lore.kernel.org/intel-wired-lan/63bd858a-fe07-4eda-9835-d999e2905860@redhat.com/#t

