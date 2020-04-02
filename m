Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C23D19C07C
	for <lists+linux-omap@lfdr.de>; Thu,  2 Apr 2020 13:50:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388083AbgDBLuT (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Apr 2020 07:50:19 -0400
Received: from mail-eopbgr90082.outbound.protection.outlook.com ([40.107.9.82]:39476
        "EHLO FRA01-MR2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388159AbgDBLuT (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Apr 2020 07:50:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3SHjzv6VksVqXOwVc86rWwPnhsLVe8wD+7ZocLt60E=;
 b=RQvk5Da/qTz3j7+VTRM1DfAWDhik9Z7yONMIxmqXcMbRnIH82tZjlnpEzQw9Fn5o4zEAT0CAxE/zXV7BvI+nZvCeQJyd9HxdIUmqr4RYzKUuOxc9kLHmzsqt1fZVgpWTAMmnZD8vR8q79/3u41/V4CkIOVp2Q3tqAn+QkreGYNM=
Received: from AM5PR06CA0007.eurprd06.prod.outlook.com (2603:10a6:206:2::20)
 by PR2PR08MB4651.eurprd08.prod.outlook.com (2603:10a6:101:1c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2856.19; Thu, 2 Apr
 2020 11:50:14 +0000
Received: from AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::34) by AM5PR06CA0007.outlook.office365.com
 (2603:10a6:206:2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16 via Frontend
 Transport; Thu, 2 Apr 2020 11:50:14 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT030.mail.protection.outlook.com (10.152.16.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 11:50:14 +0000
Received: ("Tessian outbound 4b84da486446:v50"); Thu, 02 Apr 2020 11:50:14 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 6d5784621320604d
X-CR-MTA-TID: 64aa7808
Received: from ba279f4a7043.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9D05B320-9572-44A6-9603-450B6F14C06A.1;
        Thu, 02 Apr 2020 11:50:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ba279f4a7043.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 11:50:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMGXJoKHuVuIldI/gvDRnowENj55uq1/yJWnoIoPvcVW7+zum8DF7jzB7dQLeOsq0qu5lOOKJ8IU6DhbxCEeRlxJCZax4sHucPnDALjUlp558joOqjwdYHjnzMN9EJWXd5j3iBnlN/H+gqaE1P/QXgUedTnweY6vnSMOzVfU64s2H1gboX+Mb2x157IMv5NcBlY53Anjl9rse4ydCwXosQHaDccMSGf8D4N+Z35RwXuBTBn9LvDtegtCrbbYOE5AphUlAFlPGys3/ZQrIAhojUYCNm+MSRybpapNFDtCtahxW8/i5YpumQ3syUSsyHVhns30Og+84sbzuKhdWVoR2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3SHjzv6VksVqXOwVc86rWwPnhsLVe8wD+7ZocLt60E=;
 b=R8bClHl7pAg8ZmsVGS0lG4zMOPAXA+2+qSJCtwffv4SuWXK/uu6YaE0x3NjFWn5ckl/znjppPcnLc2vwOTS0Xg8YIftpzTTuARqpMJ3B3yF2/WBwIBcMae1Xr427or8rbWH2f3v4l8orF2CvgD7ceK2G4zIinEtKUxkOdZEu6Yi1/noh6kDHEad/9CNrjK7VaoWF9WX16ioyuAHXb1x/Vx/aKTSDYnivkrMMvHL6GWXFDQAbIhCYiCK6tA1xWXZw4j5NaVIUQHVOagtJxZ8ZRDUldzg4Mzs61y7MyBObOAUGs6UusiQGBpRmsqy5a+sZLfAtvoOwFZWz2FB5ASKNDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3SHjzv6VksVqXOwVc86rWwPnhsLVe8wD+7ZocLt60E=;
 b=RQvk5Da/qTz3j7+VTRM1DfAWDhik9Z7yONMIxmqXcMbRnIH82tZjlnpEzQw9Fn5o4zEAT0CAxE/zXV7BvI+nZvCeQJyd9HxdIUmqr4RYzKUuOxc9kLHmzsqt1fZVgpWTAMmnZD8vR8q79/3u41/V4CkIOVp2Q3tqAn+QkreGYNM=
Received: from DBBPR08MB4823.eurprd08.prod.outlook.com (10.255.78.22) by
 DBBPR08MB4235.eurprd08.prod.outlook.com (20.179.40.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.15; Thu, 2 Apr 2020 11:50:06 +0000
Received: from DBBPR08MB4823.eurprd08.prod.outlook.com
 ([fe80::f46d:4b0d:d07d:949d]) by DBBPR08MB4823.eurprd08.prod.outlook.com
 ([fe80::f46d:4b0d:d07d:949d%6]) with mapi id 15.20.2856.019; Thu, 2 Apr 2020
 11:50:06 +0000
From:   Peter Smith <Peter.Smith@arm.com>
To:     Ard Biesheuvel <ardb@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
CC:     Stefan Agner <stefan@agner.ch>, Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        nd <nd@arm.com>
Subject: Re: [PATCH] ARM: OMAP2+: drop unnecessary adrl
Thread-Topic: [PATCH] ARM: OMAP2+: drop unnecessary adrl
Thread-Index: AQHWCNPf3/UDtOa4QU2PsSz3b6wtIqhlszgI
Date:   Thu, 2 Apr 2020 11:50:06 +0000
Message-ID: <DBBPR08MB4823129E272220712B470716F8C60@DBBPR08MB4823.eurprd08.prod.outlook.com>
References: <5a6807f19fd69f2de6622c794639cc5d70b9563a.1585513949.git.stefan@agner.ch>
 <CAKwvOdkyOW6RXTOCt1xMp2H+uH28ofByQOjyx776t8RDxTED2w@mail.gmail.com>,<CAMj1kXGYiMobkue642iDRdOjEHQK=KXpp=Urrgik9UU-eWWibQ@mail.gmail.com>
In-Reply-To: <CAMj1kXGYiMobkue642iDRdOjEHQK=KXpp=Urrgik9UU-eWWibQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Peter.Smith@arm.com; 
x-originating-ip: [217.140.106.52]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1aebe411-bcce-41c3-1175-08d7d6fc01d4
x-ms-traffictypediagnostic: DBBPR08MB4235:|PR2PR08MB4651:
X-Microsoft-Antispam-PRVS: <PR2PR08MB465169023BAD77E5ECBA9AAAF8C60@PR2PR08MB4651.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4823.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(366004)(396003)(39860400002)(136003)(346002)(55016002)(9686003)(7696005)(66946007)(186003)(76116006)(86362001)(66446008)(66556008)(26005)(4326008)(66476007)(2906002)(64756008)(91956017)(5660300002)(71200400001)(52536014)(6506007)(8936002)(8676002)(81166006)(54906003)(316002)(110136005)(81156014)(33656002)(478600001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: fAVJyEuS8uPo9WMBLRCpOU1H3irqxGXB76u2wfS6uwoeXIHybtz++ONOi3rQ3NXXbbz4g38PzGVJblxnGSySy2kKx7KAti0yfL5XQXpI/SSm08QxrkJltSM0n6RnWjgX+hVjoWp8sLhr5o6DKxNoe8DiGlsop5if5N2OTDdJUtWjb5ghM6wu9dFV5fSw1/5Czm3RIJzcHdaaK5YfG5Z+wX7WnIk+shKgVJQZCTFvP4DBFcQeRVesAL1T1ME/TKsmu9nfsXXQyuNhAhJEFKIPXrU/5d8ji62PkUD3SEpV9nvOKEi+hlDEO8QtX6dpd2Ry7cHaUWKL74mpVA2mebMvH01JH+pPbL5QhsT23D0m8C03JHAh39KUczYCdoagKx2XjHaiMj9SNEi1d+J8vf1a1s7nb71gxC7s6lO1r2LT4Gj7oCOIdNDbBbo7JCfPTdUb
x-ms-exchange-antispam-messagedata: LF0IVdtaZ71m8SOUI+4+OL/4WdJTMK/Pz2+zTuG0PaVYD1xF0YZ1eyVyrDYeiTEOXZ5UAxG6FUp8/GyECBwByYeauowjJ1ugAutHghp9zIL53HPitLfbiajkkofF3fcMQ72MuPOxRRSpWyFYlOVDgQ==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4235
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Peter.Smith@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966005)(5660300002)(478600001)(86362001)(47076004)(110136005)(55016002)(33656002)(26005)(81156014)(82740400003)(70206006)(2906002)(54906003)(52536014)(26826003)(9686003)(186003)(6506007)(356004)(316002)(36906005)(336012)(7696005)(450100002)(8676002)(8936002)(4326008)(70586007)(81166006);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: 218812dc-5b3b-4cc6-4cf2-08d7d6fbfcf7
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U0MxjAWKlYgHzuO7cleBwXcpbTomsNL1rmbuh3cyvh6lnM3KlrQ+L2Hz0gDVzbpvjFqpn1D1Ikm23vjPl/sBldfuAvUNRTitouRUxnuv8+cBk/VJTyHJdvv6ADvauVcWMb9OqXvOYJ1xrVyStULPb8IIM0lo9DPc7oGFGZ0Y4Q/aSJaYkegEXmyywVgIpNdpBTbxA9jB51GbDAfUCL0kdpWLZEtJTT/QYuW+RqeaMSzu6MPX+NlgXWrjdMosIpHK7BiecLRAFKFCya5feDa2HEgzZAfPEBz3getOPrHAiGoKSFjG5lWPPEoLJYqqqzZCqiB98wFDMc8VwMf5vla8enKdkoA3KDLYqPfMgG0eT+R1H9HN6vZU1MozpdJQDbE2JIwYaz9ZeORn8qeIbe5p2lQLT2xM4Nau2ACtcvAXHgtzByflYy0AUtMSbDTg1FGW916FFAYxBY60Pu5hMV1HAeo3cWei+C277a28xSbgy17S/tGuzNFWZqhpkM6f5GviLOMxLTSI4ZuVRo9tNNjXDw==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 11:50:14.6151
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aebe411-bcce-41c3-1175-08d7d6fc01d4
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4651
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

> I take it this implies that the LLVM linker does not support the=0A=
> R_ARM_ALU_PC_Gn relocations? Since otherwise, adrl could simply be=0A=
> expanded to a pair of adds with the appropriate relocations, letting=0A=
> the linker fix up the immediates (and the ADD vs SUB bits)=0A=
=0A=
Not at the moment. I have a patch in review to add the G0 variants for thes=
e in Arm state at reviews.llvm.org/D75349 . As far as I know LLVM MC does n=
ot have support for generating the relocations either. This could be added =
though. I agree that using the G* relocations with a pair of add/sub instru=
ctions would be the ideal solution. The adrl psuedo is essentially that but=
 implemented at assembly time. I think it would be possible to implement in=
 LLVM but at the time (4+ years ago) I wasn't confident in finding someone =
that would think that adrl support was worth the disruption, for example th=
e current Arm assembly backend can only produce 1 instruction as output and=
 adrl requires two.=0A=
=0A=
I'd be happy to look at group relocation support in LLD, I haven't got a lo=
t of spare time so progress is likely to be slow though.=0A=
=0A=
Peter =
