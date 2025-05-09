Return-Path: <linux-omap+bounces-3687-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A56D8AB14F8
	for <lists+linux-omap@lfdr.de>; Fri,  9 May 2025 15:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C943542696
	for <lists+linux-omap@lfdr.de>; Fri,  9 May 2025 13:23:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F1402918CE;
	Fri,  9 May 2025 13:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="e5MAfAOX"
X-Original-To: linux-omap@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2061.outbound.protection.outlook.com [40.107.247.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2444C29117D;
	Fri,  9 May 2025 13:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796781; cv=fail; b=egmLQ2vNwWfmdER4Iafh2O/VgMmioVIoFzhDKqMfUqSuHAx/AvtXLXpQ9x+//x30H8bewUWEv5AiwDjWSdfiogMugl5PxxwZosTXWKjf7k6KnhqE0jfdTAhxEsBFyxbkzP9i+Zdyfqsm0jaG/vA5vhdi+5r6HAeU/wo9WSZcApY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796781; c=relaxed/simple;
	bh=1fpTfBUuqxeAXcBNckkTiEgsu3ELJiizhtmctr9PtPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=eGVZyqKWDJCtGLydBbXhhrOunTAm+iUPRRkzH3upZNOk3BlpZvboryEygF4KfB5rgG0TyL5zlL/K874XJusId6EV02JQALFs0ewgl/sZYelBDF/uNMlHhFlFw+X5NBCoF8gGZOQSPzfjUGG4qEwYQ0Z2PyEV7BIB/lxlc+ID/Ws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=e5MAfAOX; arc=fail smtp.client-ip=40.107.247.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzYT3pQpWZDBbtOgkYs3jBpvg/TcDomIEQBPoZYcU9itJ4RVNE5yfUNdx1yO0vSNQs/1pAxmD+aHUgdgoSQ0CuBUz9IAUPfMD0xJE371FdmKiLbsmcOy/3Sl88tqRBGV0oIhR+aR9if5k4EzH7dRJaFqdKfSuujJGQ0N7enpKDYLTMxzyh9kU86tbB1gNsaHkMRHvvVsPGP/OgryPVVajZjAdNBV1b7bVETA/nCO3R2VNJDUWTneTe1u0MmRV64PgfzDvWOpoaRqbT6mUGxIb8UaDMenW6Tpwk2x7LEo3Fczf6zNgwLykt3mH83jyc0B+IaqdI7VRjqIbvUvjQIyQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KfBqOaYOrb25hAPjgE+vdPhe4KHwpV6pniiIN4itXR0=;
 b=vgSDa5XYPE27JzklS/kkKPIXo83r1YWzpqPMia2gsNKK/Fv77W8YtSJnJ+lq2/ii01czUpAOJmqahkB+v7WpOQosEapnNWMPPuSA9hUfbfmMz9NBtfsf9XMUMtgWQobgflZ91LAWAtKAovbzQ/ZxmGKQ+v3V/WnchWV3oAhf7GvM6Ppq+y48ex1tmtmjhoWTuZ8fXedqtDBDMVqWhxnyTA+Pz2miQORR1gk25s7Xk/igZdV43vMNoAt82mmkvG6CkT8TydZRMbygXokHZkpRwN0+zHBI0HTHunojjza+7gs7Bka5egNedr+kOomWPKi22zvFBycSmJcQ3fIMcDTj0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KfBqOaYOrb25hAPjgE+vdPhe4KHwpV6pniiIN4itXR0=;
 b=e5MAfAOXJ1V9bVIR6nctqzympb9l+lvkcY/adQTyUA6hBTLhPIe/TBkIvuvEqjdCbt9PW9v82yqiOSAmAjxhEYlpkRE6y2Uz4GTcf7jKFEENHW9IPJdso7vh5XjR4oJ4folU4BdKwpAlztZ94ShNCPTSODS/RXd3tQEwjebh0Df9wwbn77Ox1Hh3VRld65OV2yTrNQfCnAJdlQSYZxC0Smo4i5T6v9uTmCo75TcDyXaKFuBMc9V1pXw1SRiR55vWihpPkJezqhx0aLLWaFCel5LVDEYjYbe5mWGpePkdDcYr8memzIp3s9QyojDbzQgdxwd9WhH6D/LEnqLBRjvHRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com (2603:10a6:20b:24b::14)
 by PA4PR04MB7789.eurprd04.prod.outlook.com (2603:10a6:102:c3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.23; Fri, 9 May
 2025 13:19:36 +0000
Received: from AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2]) by AM8PR04MB7779.eurprd04.prod.outlook.com
 ([fe80::7417:d17f:8d97:44d2%4]) with mapi id 15.20.8722.024; Fri, 9 May 2025
 13:19:36 +0000
Date: Fri, 9 May 2025 16:19:32 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc: netdev@vger.kernel.org,
	=?utf-8?B?S8ODwrZyeQ==?= Maincent <kory.maincent@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] net: cpsw: return proper RX timestamping
 filter in cpsw_hwtstamp_get()
Message-ID: <20250509131932.ymrlfbmcnznksxrg@skbuf>
References: <20250508194825.3058929-1-vladimir.oltean@nxp.com>
 <20250508194825.3058929-2-vladimir.oltean@nxp.com>
 <de814321-7ede-4325-be9e-3dd40be68391@linux.dev>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de814321-7ede-4325-be9e-3dd40be68391@linux.dev>
X-ClientProxiedBy: VI1PR08CA0265.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::38) To AM8PR04MB7779.eurprd04.prod.outlook.com
 (2603:10a6:20b:24b::14)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7779:EE_|PA4PR04MB7789:EE_
X-MS-Office365-Filtering-Correlation-Id: 740ec3a0-565f-4839-2455-08dd8efc2506
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gh/UWrz8/WiG++wRQTqKHLNJpdnb4pzL3YKE0ArGh2SNa6pMyWXgGAl1o7Ud?=
 =?us-ascii?Q?sI6XLKN5enogN7L0y7TN47VN+4p0PMKv+ExM5mGrwNfghJ3Z26WfdTDoYRIT?=
 =?us-ascii?Q?jtYcilnwlY0lselhODsayPRavtrWTjReyC+RtjIYMmoRE6X/IfsCh7xsCMzZ?=
 =?us-ascii?Q?OstF8RwO4yVIJ4fB6npgEJGPnpYlIbB8yncWRBNBgf7xQDIlHLKyaVqAdrK/?=
 =?us-ascii?Q?e+vOBxmeT+4KDDyjsotu+sujmOEjua9Ku5Hdmz4lBYi/Dp+5h08RInGG6qAs?=
 =?us-ascii?Q?GOXd2VwvnYXKdqMD9fNanEL8Znz9+f0Rt9jx7lR7PX5/sck6nYNHpYIzEbSU?=
 =?us-ascii?Q?2iYJjS7kiyDNAMRw39QPVg5iwt5wtt4S1OMH1uh+UoaBBb7OubWxUSoY2cl3?=
 =?us-ascii?Q?D/OYxA1LtTodD22B5N82z+FQKwsbtbssvw1dmhqGCrSeOcpiKcraG/yKYd77?=
 =?us-ascii?Q?sIP0Bgb/uiB9VfVlgWCB5JcITtVNQ5K8N/7Xnp71oASR/K2eL6O3PA0c1IOW?=
 =?us-ascii?Q?3OxAZ4TBAJGjr2TPK2UwGD+jkrOxDfJ5vrsAbBfTaf/Bp7renOnaO1OJeOm2?=
 =?us-ascii?Q?ybOVpxcT/HmrCey+qMPWDixmx1vP3bypte4GAjerVhsZYgtahg4EHXjMgTwm?=
 =?us-ascii?Q?WjWNm+xhjFKTJlbETYXsMUwGN66i59l0o7/t/irrUqIELMPxrAWgL8P4P7MU?=
 =?us-ascii?Q?NdZw1xfGTll/dUoQaK8RF1mxxF9E0DUy2KkDGSF/lEHNUsUq/9n6sx+G57PQ?=
 =?us-ascii?Q?KDErYWbmlxwNS6AGtf07kBg/MP267g2wUu2q3NDbpPEHzQsj3IAHW8jZGsHd?=
 =?us-ascii?Q?B5Ss0OfdncH+nytsU/+S2C+y4WR9AYA0vC4u+1QCjJN0ueDnyRsCEbOj0156?=
 =?us-ascii?Q?AblzufGeSMderOFdywvBgeTlZuYM0nFObbsJdogjXM41KD6pvycBm0za7Mvx?=
 =?us-ascii?Q?tLqdugktmrGKBRlysP8UBx5CI/rAPSpfRwYfR89Y6g49uX7NZYoY+wHFYuik?=
 =?us-ascii?Q?cA40vSwXwzzDgc2DxeJfFyAOM6inUkC9TKZUeYILFNb5RZY1RDJS3B4qv8jL?=
 =?us-ascii?Q?jzwckIYpqNfV8U0a7LcS57v5TZ9iIMl0Hubk4V+msR/RKWmRh1kGSlI+zs1l?=
 =?us-ascii?Q?K5cxKMdshxS6XMdfotRNJ+wRGcSaJ8znU7dac02cvhEP+haWhhJdk1p8YQHE?=
 =?us-ascii?Q?V6J125z+YIwcX5pTn/RadyoRVWdRqGT+mFxmUmmCnSErhFkAiCMFc00HVOaL?=
 =?us-ascii?Q?WFbDRsXEEZARee/WvV9PbRZErFh6USFKPMjoepVVUJxjsRtHDyDhCAw1EXnA?=
 =?us-ascii?Q?wtdZhT2/L8ozObmi73SRVZDZWcPlw105SIjuyb4HETGp7C9Jrj9fgCPrO9Yn?=
 =?us-ascii?Q?jyWMp6mfH4cjE02gT0EIMWAyBVStn66KO6YC+Xg6R3fcSW5ElQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7779.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8iXdFjk8iY5dkiGohHushQa8kh02n5+TPKrU9x/bAwDjOkG0nfKfcGor2bXU?=
 =?us-ascii?Q?YNLkWMTL9FBSzSPv8olzfYedOV9fcV+2+DjUjfQK1/kILCW1/sAWqtGI1HEb?=
 =?us-ascii?Q?1zQhNWfeY8aUu/8XmvIhRLDfANq/7fxce+SugfUVMb16T1/uIH4Bbpag4IHI?=
 =?us-ascii?Q?nUW4xSqxLZINq8tPppZq5xLW4t3XscHRUdY9YIoZh7UvJAhzPOB8NDluElXa?=
 =?us-ascii?Q?A8z+mn0PyDbRKiPekitwDVw4wfTdbCDMv6rMS5D0iTZ+wxdaFeOsIHxqNgSm?=
 =?us-ascii?Q?B7Ux95vN5vzE6b5oNz/KjU41FSlHvKZXNYWCVUCKHSE0GXr9ug1K7O7zMJ9S?=
 =?us-ascii?Q?z0iPZZCtxy8f7Zdizmd//RqzUKRhX6XoDJZUkduzG2DQiWE00jzvWycxGuXm?=
 =?us-ascii?Q?9jnyxElg+nkWaEK/5JaRUOyGQeEB0KpDGAqCvE6jSpbXKPjkBJ7ZrxEpTvbc?=
 =?us-ascii?Q?eK4kIsBswh7syelfNNEaXk5hkVbLKjVOoBEqeJ52Gk1YW6BzujBnZ4TqpfNv?=
 =?us-ascii?Q?1b1OVtgAT1B1U9hb693N8tdQO7WtxQQeCSt2tSzAnz0645XPWm6S1hW2kHvx?=
 =?us-ascii?Q?PsFBVQJCnVFbWsnmWir8FMTcke+IZhxQ12ao4x+c4EdWXwEs00fEqEs/ptwf?=
 =?us-ascii?Q?Ds4FB8enZ7+hBNTjtdCpzD/j8MDncYhJCJN4oj8tTOznkeOSWOFro+nYFwej?=
 =?us-ascii?Q?b5h3JoKo5kj8EBCuYLPidC1GOLdFBoxTAeUemg75MbAFNO2hpTMxrAjUQUbm?=
 =?us-ascii?Q?i3EpLS1kKOGeWVNfH4VDOwU+YAKdDsp87M9tR2TPpqu9VamF5nL09VKKdZex?=
 =?us-ascii?Q?xJpGrZV12LhlYaHQvKiuA4KxnD5vuqN6RBBtXId1uwZfl/5sMo3JIYCSpyhf?=
 =?us-ascii?Q?vgzuGNj9CXJX7xXw3sxnbVoOSyzIJzD0PspKqkotoRsLE1kycsZnyhkayNJx?=
 =?us-ascii?Q?KzubRGMExW4EQHhGKTYXyEvhRWDC6cPcdLWRNuSDqW+y6MLGxbQNPFjsISWd?=
 =?us-ascii?Q?bk1HvPNxp1gmPWxvLth7yJ1sYULQOzEyxiVuUW4iM4IzvgX5KuDtc9umVi0I?=
 =?us-ascii?Q?Myw5Ll0mMxzmsezV1RRGNVIQNKBuH2FgK6/7F7EqzFO/pQvs9KDee7ZBXckz?=
 =?us-ascii?Q?oQRpZLfE7L1CnMD8hQvEB7E45Fo3txvXbRsf+6bOYGAviXOFmp+eU5KkbrVm?=
 =?us-ascii?Q?k7hTJck5VwSR2TmifjaAFdRnqsQHtQ81zrwN2WokZvL2rSaYu6AWdbRODm8L?=
 =?us-ascii?Q?BF7NJnq8QIYn4spKon3PlSCJskQW7l9XThDov8m585demXnKVtzS0Otd02me?=
 =?us-ascii?Q?RjR5DJbSIfaxGN6Ru4lBnZotCUhxcNQtghNPPm+isZZaTbC99qnIvxTWIX8Y?=
 =?us-ascii?Q?LEgP4p8/qKvkXdN7W44cqHiP2uuWpvz/fLBPerMBMZoHcD13XodnF9QM2Kmx?=
 =?us-ascii?Q?iMtBcNWgotyDWtsd+2xUiE+PKqfc4W1aW4SUSeJoXDvw94yOOA3w3ky5tUI7?=
 =?us-ascii?Q?3174jRsJQhH7CooDiqeJ/tR4wkmwxmC8Deego+H6uZ+z9ehAsgOrsuIPIuY+?=
 =?us-ascii?Q?WcWFp5h9dmh9GsEqcIzboBdHkOPjM4dzHC9VhfXDJm7mtUMT4FGbbBU1Y8/M?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 740ec3a0-565f-4839-2455-08dd8efc2506
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7779.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 13:19:36.2236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Il/u5r0xdILtEQTIAlOxELTiwZhn2wbTIhsQwFuIYOyxktI0MqtIm+emzTjIN8ZDvYjv6fKggaUAuGQrPveX7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7789

On Thu, May 08, 2025 at 11:33:06PM +0100, Vadim Fedorenko wrote:
> On 08/05/2025 20:48, Vladimir Oltean wrote:
> > priv->rx_ts_enabled is a boolean variable (0 or 1). Overlapped over enum
> > hwtstamp_rx_filters, it makes cfg.rx_filter take the value of either
> > HWTSTAMP_FILTER_NONE (when 0) or HWTSTAMP_FILTER_ALL (when 1).
> 
> Hmm.. I have to disagree here. rx_ts_enabled is int, not bool:
> 
> struct cpsw_priv {
>         struct net_device               *ndev;
>         struct device                   *dev;
>         u32                             msg_enable;
>         u8                              mac_addr[ETH_ALEN];
>         bool                            rx_pause;
>         bool                            tx_pause;
>         bool                            mqprio_hw;
>         int                             fifo_bw[CPSW_TC_NUM];
>         int                             shp_cfg_speed;
>         int                             tx_ts_enabled;
>         int                             rx_ts_enabled;
>         struct bpf_prog                 *xdp_prog;
> 	....
> 
> And it's assigned a value of HWTSTAMP_FILTER_PTP_V2_EVENT in
> cpsw_hwtstamp_set(). Not sure this change is actually needed.

You're right, thanks for pointing it out. I had searched for
"rx_ts_enabled" and mistook the first occurrence, in am65-cpsw-nuss.h,
as the definition for this driver. The patch is not needed in that case.

