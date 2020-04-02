Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0EBE19C84F
	for <lists+linux-omap@lfdr.de>; Thu,  2 Apr 2020 19:50:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731579AbgDBRuS (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 2 Apr 2020 13:50:18 -0400
Received: from mail-eopbgr00046.outbound.protection.outlook.com ([40.107.0.46]:48448
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727439AbgDBRuS (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Thu, 2 Apr 2020 13:50:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVMHUfOQgALOiKL8InNQ7Yp4ndl4SN/+rjy/kAAA/iI=;
 b=b4n4Ly0Xm8PLd5P5hMlB2DnkFjzA35DTWgb1l2BybEUhLXbhjzvm4jKHVw4McWieQ6NCEY2piY3cDFsV7P8YSUV91qIdp2LivGSvZ665e4ITX/zdBoVMwXdcugIFOW683vLJ1OrkZ9Foe//1ouALOHccTjsJ4Doq+xn7+zE4MNE=
Received: from AM7PR02CA0006.eurprd02.prod.outlook.com (2603:10a6:20b:100::16)
 by DB6PR0801MB1719.eurprd08.prod.outlook.com (2603:10a6:4:3a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.15; Thu, 2 Apr
 2020 17:50:11 +0000
Received: from AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::61) by AM7PR02CA0006.outlook.office365.com
 (2603:10a6:20b:100::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2878.16 via Frontend
 Transport; Thu, 2 Apr 2020 17:50:11 +0000
Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; vger.kernel.org; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;vger.kernel.org; dmarc=bestguesspass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT007.mail.protection.outlook.com (10.152.16.145) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2856.17 via Frontend Transport; Thu, 2 Apr 2020 17:50:11 +0000
Received: ("Tessian outbound 9e48e1321951:v50"); Thu, 02 Apr 2020 17:50:10 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e3dc6baae79d8492
X-CR-MTA-TID: 64aa7808
Received: from ddd8da16107b.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id 43C295ED-E368-40FE-87FC-0E7833B70E44.1;
        Thu, 02 Apr 2020 17:50:05 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ddd8da16107b.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 02 Apr 2020 17:50:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6v1MQDq1Gue+AnzFe0SlVlwbu/HjLtxuNgK7lvXOscjiAAo9O/ViOfJnG5w4FrMRVx2Mux0N3xG12EFiGh2FC8EOHprsmzawt/4OwlYaSR5/3MU9dmBG+26vIS7haOjP+URLDdfdc5zVGSufP0VIhu2AH4K8lNUIzrW2RUq0K6o+HzKGGLzoAOONmEJN9XUXrcAo5zvY2DDp42xRP84NXm+nxecZKyDEOr/pGYZlo9qCj5ehwLBUWd9bWUu7q+l00A1s6Ip5VqgROapNQHgEzpBlsVf3gfrBx8aq1Kgci/vZRqEB4mfac83sD7VovWMUVp27s3Q7T6wNJw+OpKKAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVMHUfOQgALOiKL8InNQ7Yp4ndl4SN/+rjy/kAAA/iI=;
 b=HUs6QddtEZhi2W7XjMG7/FbERhn1YBvQuRf1z/60W3ue3/7b7FKr56Vq5oajPC53FyEPfvzmuR4JxoB+Sx5MJLCO4/BrPl0xf9n2iKZzltXqmPk/k4tc/d/JWbhSHsAFLGMKlXsTZ5lFt0kttO8mJWLM5QBjp0dphCFmlNzYh69C0JJIRiufV3QEibuwq9WePRHC4aZ770GjAnddz5YZgjAvAJx74B4r16GF0Rq1l02p6tzemfU7XPIPickCtl/sIAe0k1plsrx6896pMH9xaL+ca3AzqsCndQERY5WqaZfQ0897ct9ULKdRaCjU0cieWYKZwCPogSKQBGjYI5uSnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVMHUfOQgALOiKL8InNQ7Yp4ndl4SN/+rjy/kAAA/iI=;
 b=b4n4Ly0Xm8PLd5P5hMlB2DnkFjzA35DTWgb1l2BybEUhLXbhjzvm4jKHVw4McWieQ6NCEY2piY3cDFsV7P8YSUV91qIdp2LivGSvZ665e4ITX/zdBoVMwXdcugIFOW683vLJ1OrkZ9Foe//1ouALOHccTjsJ4Doq+xn7+zE4MNE=
Received: from DBBPR08MB4823.eurprd08.prod.outlook.com (10.255.78.22) by
 DBBPR08MB4839.eurprd08.prod.outlook.com (20.179.46.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.16; Thu, 2 Apr 2020 17:50:04 +0000
Received: from DBBPR08MB4823.eurprd08.prod.outlook.com
 ([fe80::f46d:4b0d:d07d:949d]) by DBBPR08MB4823.eurprd08.prod.outlook.com
 ([fe80::f46d:4b0d:d07d:949d%6]) with mapi id 15.20.2856.019; Thu, 2 Apr 2020
 17:50:04 +0000
From:   Peter Smith <Peter.Smith@arm.com>
To:     Ard Biesheuvel <ardb@kernel.org>
CC:     Nick Desaulniers <ndesaulniers@google.com>, nd <nd@arm.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Stefan Agner <stefan@agner.ch>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] ARM: OMAP2+: drop unnecessary adrl
Thread-Topic: [PATCH] ARM: OMAP2+: drop unnecessary adrl
Thread-Index: AQHWCNPf3/UDtOa4QU2PsSz3b6wtIqhlszgIgAAJCgCAAF834g==
Date:   Thu, 2 Apr 2020 17:50:04 +0000
Message-ID: <DBBPR08MB4823463F759E2FFFE92BF9C8F8C60@DBBPR08MB4823.eurprd08.prod.outlook.com>
References: <5a6807f19fd69f2de6622c794639cc5d70b9563a.1585513949.git.stefan@agner.ch>
 <CAKwvOdkyOW6RXTOCt1xMp2H+uH28ofByQOjyx776t8RDxTED2w@mail.gmail.com>
 <CAMj1kXGYiMobkue642iDRdOjEHQK=KXpp=Urrgik9UU-eWWibQ@mail.gmail.com>
 <DBBPR08MB4823129E272220712B470716F8C60@DBBPR08MB4823.eurprd08.prod.outlook.com>,<CAMj1kXEQ4v9e6386ogPdy+s+++9H02DMPnDpTq0WSY2e78ts+Q@mail.gmail.com>
In-Reply-To: <CAMj1kXEQ4v9e6386ogPdy+s+++9H02DMPnDpTq0WSY2e78ts+Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: spf=none (sender IP is )
 smtp.mailfrom=Peter.Smith@arm.com; 
x-originating-ip: [217.140.106.52]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8c659e06-3a25-4c46-32b1-08d7d72e4a5a
x-ms-traffictypediagnostic: DBBPR08MB4839:|DB6PR0801MB1719:
X-Microsoft-Antispam-PRVS: <DB6PR0801MB1719F3419FB6D3D0C91FB82CF8C60@DB6PR0801MB1719.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0361212EA8
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR08MB4823.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(366004)(396003)(136003)(346002)(39860400002)(376002)(66556008)(33656002)(54906003)(2906002)(4326008)(186003)(5660300002)(316002)(26005)(966005)(71200400001)(52536014)(478600001)(6916009)(6506007)(9686003)(66946007)(55016002)(91956017)(76116006)(86362001)(64756008)(66476007)(66446008)(7696005)(8936002)(8676002)(81166006)(81156014);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: arm.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Bvk0bPnT7Ke0d0aqT+hbRjgi0yVdvzyvH7dgBYfZwb0K05Ky1e7biVBTYTEwpfPLqZ4FLc5DqZusf1jeVd6vKe8engmCJuQYA3ELg1iwmUvCNyJJciV+viDwDZtcfufvQECHIBSczDYZFkmPIWSQ95NtxLOAFpdGQCSmu2RPoZTRtBaYpm9AakerWCvpKPC69RmdXzRtMKr0Kxy+Ej7l/RY38RMUEhYG+LTeo9+g9ilQJ8v8IGxZiZaIumgR/WnCd62ltu2gWwl/bYfZezW0XRsplAwZbZC2Kh4yLeS977eiI3TpY5mEXCxDvdhjHACTgDRFshsyjk1BH5DiZDOd4mJQ1eIWaapC33uOz0K9X3r6oma1V4ndxR/bYce7vPeduSzLQwijFuL0JZv+lL+3CYN1jh/ORXVqD0t3YR4CRxEZ+BteKCDfZNE41W2cnKCGdllgZIjXta0yDgHlvuUmg4fgwE3kxP/6e1PbMKEx8lJyU3FpDbnq6hq2YlXOjQPYmyiUHp/4L8gKjnzrfx4E3Q==
x-ms-exchange-antispam-messagedata: vmg3ckpM42yEPLgGyDdIIpSo5pFDQPj7HjFYP0sgP+pyvey3n2q0YGQTDiu3ru6TI1XGv6hgiAqVvpu3mJZ++I0MGhFuNh1YbsKr7tQMojh9x+P3kBUptjeLgZmADNNscixLbtt8IBU1uAGlz2FVoA==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4839
Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Peter.Smith@arm.com; 
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(39860400002)(376002)(396003)(136003)(346002)(46966005)(26826003)(47076004)(478600001)(86362001)(966005)(70206006)(54906003)(107886003)(6506007)(82740400003)(186003)(70586007)(356004)(33656002)(8936002)(336012)(7696005)(450100002)(4326008)(2906002)(55016002)(52536014)(8676002)(6862004)(26005)(5660300002)(36906005)(9686003)(81166006)(81156014)(316002);DIR:OUT;SFP:1101;
X-MS-Office365-Filtering-Correlation-Id-Prvs: eae70085-fa11-402a-e384-08d7d72e4652
X-Forefront-PRVS: 0361212EA8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WVDUAkASdKzh6PJC2FV4hADAzPVUBurVIRGlilqO0srlWvHOpsVEcIQaViPikxU14CYkMhrx/IcyJAbfsh6K5F5qzjnwoJBS0gPQmMnGN+9i+1tsgcRYYG5fGE23yU02RWzSOfIPvlevihaIB+j1P2J2M7PmLAtIc4mZrK1S1fuZ07Net9XwRP61P1dzMz5cSq+4vAQYkjD93NFPCxhIAA/ydVMJtCEpk0qdK0h40PWYnQGj8+4sAvqtxB0Otw7MwWGscEX7eQ19q3Dw3e2Po86PRJwQ6pPCVg8xC75HPU6+5x+jJYE30I/KtefaIgnIa6hu4rbkrcVxXn/gx/Zpb9R3wXt3EiDoO4dEwIF9yxCqZUF4eppfnW0Ikh5aCRCDebHz4BehC1GDAzwDQMacZmJVvFPx8x7DvSDzHVW+XCPVDyEgz81ppr2UL2ZyDA/fMg6VZdnUaRSIUR7jLDcBynO9AY3RGsryf+FIg/oV8CtmGGupsp0fSyTL1BDNCQA03Bzq03yatjtlOu85H/zrZBaO0SUq9JK8UDQLqBZwKShR9lwwN2Eb2L+Bi6w2CY8bwIPKin/uAKwl7WFKIi/IFQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2020 17:50:11.1316
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c659e06-3a25-4c46-32b1-08d7d72e4a5a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1719
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

=0A=
=0A=
=0A=
=0A=
> On Thu, 2 Apr 2020 at 13:50, Peter Smith <Peter.Smith@arm.com> wrote:=0A=
> >=0A=
> > > I take it this implies that the LLVM linker does not support the=0A=
> > > R_ARM_ALU_PC_Gn relocations? Since otherwise, adrl could simply be=0A=
> > > expanded to a pair of adds with the appropriate relocations, letting=
=0A=
> > > the linker fix up the immediates (and the ADD vs SUB bits)=0A=
> >=0A=
> > Not at the moment. I have a patch in review to add the G0 variants for =
these in Arm state at reviews.llvm.org/D75349 . As far as I know LLVM MC do=
es not have support for generating the relocations either. This could be ad=
ded though. I agree that using the G* relocations with a pair of add/sub in=
structions would be the ideal solution. The adrl psuedo is essentially that=
 but implemented at assembly time. I think it would be possible to implemen=
t in LLVM but at the time (4+ years ago) I wasn't confident in finding some=
one that would think that adrl support was worth the disruption, for exampl=
e the current Arm assembly backend can only produce 1 instruction as output=
 and adrl requires two.=0A=
> >=0A=
> > I'd be happy to look at group relocation support in LLD, I haven't got =
a lot of spare time so progress is likely to be slow though.=0A=
> >=0A=
=0A=
> For Linux, I have proposed another approach in the past, which is to=0A=
> define a (Linux-local) adr_l macro with unlimited range [0], which=0A=
> basically comes down to place relative movw/movt pairs for v7+, and=0A=
> something along the lines of=0A=
=0A=
>         ldr <reg>, 222f=0A=
> 111:    add <reg>, <reg>, pc=0A=
>         .subsection 1=0A=
> 222:    .long <sym> - (111b + 8)=0A=
>         .previous=0A=
>=0A=
> for v6 and earlier. Could you comment on whether Clang's integrated=0A=
> assembler could support anything like this?=0A=
=0A=
Apologies for the delay in responding.=0A=
=0A=
That looks like it should work. Empirically the following works in both Cla=
ng and GNU as. One potential problem here is that if the section is large a=
nd the subsections are dumped at the end the ldr is at risk of going out of=
 range.=0A=
=0A=
 .arm=0A=
 .macro mylongadrl reg, sym=0A=
 ldr \reg, 222f=0A=
111:    add \reg, \reg, pc=0A=
        .subsection 1=0A=
222:    .long \sym - (111b + 8)=0A=
 .previous=0A=
 .endm       =0A=
=0A=
 .text=0A=
foo:     bx lr=0A=
bar:     bx lr=0A=
 mylongadrl r0 foo=0A=
 mylongadrl r0 bar=0A=
=0A=
> Thanks,=0A=
> Ard.=0A=
>=0A=
>=0A=
>=0A=
> [0] https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit=
/?h=3Darm-kaslr-latest&id=3Dfd440f1131553a5201ce3b94905419bd067b93b3=0A=
