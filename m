Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10FBD46A4A9
	for <lists+linux-omap@lfdr.de>; Mon,  6 Dec 2021 19:32:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235469AbhLFSgH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 6 Dec 2021 13:36:07 -0500
Received: from mail-bn7nam10hn2216.outbound.protection.outlook.com ([52.100.155.216]:38400
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233544AbhLFSgG (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 6 Dec 2021 13:36:06 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPNW/522AVmuCY5UCmlvaySu7+aU1w1cqtwX6SzyAT9HBOGdOCdArEdSfPshnSNYc9URfx8MIG5hEaRkk/pfeLz3VsJP9sWew4wij6+wYKZVTu2XUlHoCU0xQH05lKh7KWQOsaFq9mhvHkEh/yPoGPYvmmyCaeBPw+eow3IRqApsazkqZ5Vb4QBkJqnhabSoUto4nPpDHVICipSzDlSEjZADBg3hZ4CuGMOtCKAxQCK+gD1CuUgzUKyI0x9ZdcS/U+vHJ/GQNTqqWhJCiqlcAxOudbmbw1iyjwxiff1TJtXQXiqx6OsCHaoPla1rduNzRsUNMBXt6jamCQjlikq74w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=mnmS1c7NUxGRNjXTasQdxvzZBER8Hgv4qvbi0Lnj4zJ950OHlgO8fIC4q+nYl+W1vhqfDKMKk4fq/hfjQm2ZheJnAZY0/8NPwKNhstcgmlrYh4re62U/h5up4lcC2wARSXJTVbisbtVvVtmj5oFT9PItE5xTzk8W9Z0UvLw/NUf+Yyu0+Fw9h0YU7JwssGnHVL2Qb4B5F/RjHLhewllC52HQ4THRudOQKbAsboOhR4BBhbXpey1DuijpQNTb0HK2OpBjG6u5gQFyh6auLwzRRMaM2E3edD06lKTZVkkbmoB7MNwSEh776ULJIx/TV4rQ7f+Z+UMEIRH5jIwkevK/WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 146.201.107.145) smtp.rcpttodomain=selfhelpandwellness.com
 smtp.mailfrom=msn.com; dmarc=fail (p=none sp=quarantine pct=100) action=none
 header.from=msn.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fsu.onmicrosoft.com;
 s=selector2-fsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NTkULZ5UHExQp4+lt+mjKcEqTWLs4cv4821EJcQtSYE=;
 b=ICnxIkbv/anlqO3fxGI7v0w1uvHlvPJHi0247up1D1gPcf5UADMSRWTxoXj/PjgkURrqM1YAK03itfrHLp0lFrl+0z7MI/BsHZjitkYfWru3xToWua3kwnXzb3WkEJXbSqywWkFH2rf5FLipYEmDsfCfdgwVAUbeurBPugPxasM=
Received: from BN9PR03CA0127.namprd03.prod.outlook.com (2603:10b6:408:fe::12)
 by DM8P220MB0550.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:24::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.19; Mon, 6 Dec 2021 18:32:26 +0000
Received: from BN8NAM04FT015.eop-NAM04.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::db) by BN9PR03CA0127.outlook.office365.com
 (2603:10b6:408:fe::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Mon, 6 Dec 2021 18:32:26 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 146.201.107.145) smtp.mailfrom=msn.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=msn.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 msn.com discourages use of 146.201.107.145 as permitted sender)
Received: from mailrelay03.its.fsu.edu (146.201.107.145) by
 BN8NAM04FT015.mail.protection.outlook.com (10.13.160.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.13 via Frontend Transport; Mon, 6 Dec 2021 18:32:25 +0000
Received: from [10.0.0.200] (ani.stat.fsu.edu [128.186.4.119])
        by mailrelay03.its.fsu.edu (Postfix) with ESMTP id 2E5EF9519A;
        Mon,  6 Dec 2021 13:31:50 -0500 (EST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: Re: From Fred!
To:     Recipients <fred128@msn.com>
From:   "Fred Gamba." <fred128@msn.com>
Date:   Mon, 06 Dec 2021 19:31:08 +0100
Reply-To: fred_gamba@yahoo.co.jp
Message-ID: <0d6165d0-61e3-4fcc-b2e1-54aebde19176@BN8NAM04FT015.eop-NAM04.prod.protection.outlook.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 505b3e9f-a448-4a73-6a48-08d9b8e6c06d
X-MS-TrafficTypeDiagnostic: DM8P220MB0550:EE_
X-Microsoft-Antispam-PRVS: <DM8P220MB0550FD45D03657474DD7294AEB6D9@DM8P220MB0550.NAMP220.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:146.201.107.145;CTRY:US;LANG:en;SCL:5;SRV:;IPV:CAL;SFV:SPM;H:mailrelay03.its.fsu.edu;PTR:mailrelay03.its.fsu.edu;CAT:OSPM;SFS:(4636009)(84050400002)(46966006)(40470700001)(5660300002)(82310400004)(356005)(6666004)(83380400001)(82202003)(6200100001)(316002)(31696002)(786003)(956004)(6266002)(6862004)(35950700001)(7596003)(7366002)(7406005)(7416002)(40460700001)(86362001)(8936002)(8676002)(31686004)(26005)(70206006)(70586007)(2860700004)(2906002)(7116003)(9686003)(47076005)(508600001)(336012)(3480700007)(480584002);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S2UyeWdMUlVyQ3BMazdLMFNCU1NwR2h0UUhKaHBqcFFBbXVmdisydzBSOHNv?=
 =?utf-8?B?UHZac3pPS2g4eEI5Tm5PcEpwbXNQZnBYdURlNW44YnEweXNlRWkxYkNtNGIw?=
 =?utf-8?B?R1E4Y2NmMHZMdDFSMk9DNnJxV1owYVFGaURRY1FiSlEwSElDL2Vrd2NtbERK?=
 =?utf-8?B?QlJLVTFFYjkxSDhBbzNPeTB3UEN2ak12VDN4M0ZvYjZoWHlDcWJ3blVQTVIw?=
 =?utf-8?B?bHBjdEJtSW5JS0xVSmphYVdIZkxsQmNpWHJWd01mUEZIVFFuZUdENGxiY1BI?=
 =?utf-8?B?NWo2NlFyYTFHcjJsRFlIQ09wODdFLzZhaExtUi8zSkNhdXR6UHl4MWxyd2FZ?=
 =?utf-8?B?YUswRUZGckpVbHhDTm9Kb2FseCtlY1VJUDF0K1BidEtlTFdTTlNNcmZKL2pI?=
 =?utf-8?B?YzhBcmx3Nm0rQ054Z0IwcHFHcG5IRkV5VTBLSFpxS1lqTWExeXYxZUJJbEpF?=
 =?utf-8?B?L3dCU0kyaENSVXNxTjhVQlFJRFhMbEtPWkNmVEZTTXNKTnpkUVhvNG4xZnZa?=
 =?utf-8?B?b2FrQlJkSC9MTXZmdStRZXhZYmEzYlh0Q0FsRlpKbkJTZnd0S3kzMXcvSVpS?=
 =?utf-8?B?WitVc3IvYmJYZldtc2FpcGJ6U1lSc2hLZHJLNVp3RE1jU0k2UVdXWjA0dzZW?=
 =?utf-8?B?K1lOaFdFWGZ6cERRKytrVUUyQytGcndDY2pST0M0S0d3RFE1bnBXUVBYU1A2?=
 =?utf-8?B?RTBma1pzditXTGpTKzh4NmFNRDFoVm9VWXRwREo2MHRyNjVlbHBPZkh3azli?=
 =?utf-8?B?NE00OG16ckNOQ3V5ck9sQktjQkM0bVN3QkgzRlh2Um1MM2xKQmUzSkJGVDZJ?=
 =?utf-8?B?NzNVaVJuT2VtQmZ1NUJ6M1RWb3YwWmdVVkdvYXliRkhmbkhYa01zdG1pQ3lm?=
 =?utf-8?B?UDlUQmhiSkk0QXIxU1VRdEtkakZ5bXpqVHVOL2lVZnZka3NxeUgwT1N6ZTRK?=
 =?utf-8?B?RE5iSTZGQjJRdFpqWkc3dUNLTjZhTHA2emgzZmJ1TTRDYlRJdWVMYmIvM3p1?=
 =?utf-8?B?SU1qSjJzK2djSHdRLzFzaXEyTzBnZWpiUlIvVktXTXo0MlpMdG1rLytxOCsw?=
 =?utf-8?B?SEhRWlM2cG02bS9FZ09aUFMxQ3lRejJNd2RNc2ptajczek5TMGtUQ29WWlhs?=
 =?utf-8?B?M1QxcWNlbnl6dzMwYmRxRGNBOWhucXZoQ1dkRmxRbHlWS2RkL1A2R0k0MTJr?=
 =?utf-8?B?SlJvUnBpY29CUmV1cTFYSjMwZVZZVHUvVysvYlc4OVZVTSs4RUhFL0I3Qmhm?=
 =?utf-8?B?RzE0V0Vsa3JLL2dMeFNSS0ZLK2pWMHVnZE1SWnNSYnJHWENlTUdsRVM1VWNR?=
 =?utf-8?B?K2hhSGo5UkY5MEcvaU9ZaWRDSEQ4VGFId1QzTlYvOXFpTjUwN3lXaWtQWHR0?=
 =?utf-8?B?MXQyYU1scXdvQVA0Y3RTR09ZeGJzZXhQODB0WEo5RTR0SFp1eVltVkNaZXAw?=
 =?utf-8?Q?XC7jLLCg?=
X-OriginatorOrg: fsu.edu
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 18:32:25.9077
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 505b3e9f-a448-4a73-6a48-08d9b8e6c06d
X-MS-Exchange-CrossTenant-Id: a36450eb-db06-42a7-8d1b-026719f701e3
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a36450eb-db06-42a7-8d1b-026719f701e3;Ip=[146.201.107.145];Helo=[mailrelay03.its.fsu.edu]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM04FT015.eop-NAM04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8P220MB0550
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hello,

I decided to write you this proposal in good faith, believing that you will=
 not betray me. I have been in search of someone with the same last name of=
 our late customer and close friend of mine (Mr. Richard), heence I contact=
ed you Because both of you bear the same surname and coincidentally from th=
e same country, and I was pushed to contact you and see how best we can ass=
ist each other. Meanwhile I am Mr. Fred Gamba, a reputable banker here in A=
ccra Ghana.

On the 15 January 2009, the young millionaire (Mr. Richard) a citizen of yo=
ur country and Crude Oil dealer made a fixed deposit with my bank for 60 ca=
lendar months, valued at US $ 6,500,000.00 (Six Million, Five Hundred Thous=
and US Dollars) and The mature date for this deposit contract was on 15th o=
f January, 2015. But sadly he was among the death victims in the 03 March 2=
011, Earthquake disaster in Japan that killed over 20,000 people including =
him. Because he was in Japan on a business trip and that was how he met his=
 end.

My bank management is yet to know about his death, but I knew about it beca=
use he was my friend and I am his Account Relationship Officer, and he did =
not mention any Next of Kin / Heir when the account was opened, because he =
was not married and no children. Last week my Bank Management reminded me a=
gain requested that Mr. Richard should give instructions on what to do abou=
t his funds, if to renew the contract or not.

I know this will happen and that is why I have been looking for a means to =
handle the situation, because if my Bank Directors happens to know that he =
is dead and do not have any Heir, they will take the funds for their person=
al use, That is why I am seeking your co-operation to present you as the Ne=
xt of Kin / Heir to the account, since you bear same last name with the dec=
eased customer.

There is no risk involved; the transaction will be executed under a legitim=
ate arrangement that will protect you from any breach of law okay. So It's =
better that we claim the money, than allowing the Bank Directors to take it=
, they are rich already. I am not a greedy person, so I am suggesting we sh=
are the funds in this ratio, 50% 50, ie equal.

Let me know your mind on this and please do treat this information highly c=
onfidential.

I will review further information to you as soon as I receive your
positive response.

Have a nice day and I anticipating your communication.

With Regards,
Fred Gamba.
