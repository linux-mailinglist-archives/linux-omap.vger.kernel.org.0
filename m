Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13BCD3E23C7
	for <lists+linux-omap@lfdr.de>; Fri,  6 Aug 2021 09:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243556AbhHFHMw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 6 Aug 2021 03:12:52 -0400
Received: from mail-eopbgr110113.outbound.protection.outlook.com ([40.107.11.113]:35776
        "EHLO GBR01-CWL-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243551AbhHFHMu (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 6 Aug 2021 03:12:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NCCe1EtBvyEhpGydoRtnJsDZS0mqnl4xYyX7F7RnmVjxGB/BDuFcZyAiLcHwX/CWUblw/io+M9ldEFF+XYTCjKo6SCLOtVkZBIl678+NQIn+nCLehcVS++bup1LVDTx6IxVqHcTiXdOzDN3nBBBZM1uCZgaaqUh7/T0/moglGgBAVMsHBA5iFYxEybOeWmB1GHKIFFFqKFY038VbTcdy5GDCNYNqf4EeFwtXIzzDBXOonsCKsPNoDOpztXMdNN3iPNyK02fsDZGnHvulCUCju+0pUJp39zHaBOvhrMix2SHP2PWacoo1OOeltfT9Cqj3FDNGD215twhqBhphekg3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMFQki5iVew8S2H1mTCp3HOFolyAwDbFZ9CMotodmGg=;
 b=hcY+4Uu+jheXUdnyJ0poRioZ8LAdTrjO+hRQEdY+QKycjTs6HMS61zXp7Hq+pTa+IcT8OMXaJK3w4SkItZn2hqOcZ4Y66tCeuffPOYZTgm/UuF9iZ/AgjMbsPsmalse9A63WpBnBlPT4Ge7SIBXZBXFrDP5ADBRRXilxP/BbAMWY9BoFJRqxPHlPVYsDYsk6iiQEARY2nz2mwo0ohl4wa2LZ6iDM3JghnYviuSsJI7H3SJNibjfzDP6ZoWeFjjvX9NRW3uU0DsicKxZjUuIttNpWHRpnmBDw0gBkwoJzlwWJQSeyDYdpjFZkPPTM/40J8ZLECjTgsjUcjaVWJj+tvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMFQki5iVew8S2H1mTCp3HOFolyAwDbFZ9CMotodmGg=;
 b=OJ4sFvh67pXacJmNQ1PxcghkaBk5/YtDsyn+Hk+mHxD4eCsdr/vcOz8Gjmg/WBI3YpLfwz0sK02F90oZ1NnMAoy0ri6+4SbEf92myd6SMTAkTEbH/Om/mycr9xQDCfKATBDhqQXQEiF+tYrVZXrEmowae/xNWBRhISUvg6BHi68=
Authentication-Results: ti.com; dkim=none (message not signed)
 header.d=none;ti.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWXP123MB3144.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:38::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Fri, 6 Aug
 2021 07:12:32 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0%7]) with mapi id 15.20.4394.019; Fri, 6 Aug 2021
 07:12:32 +0000
Date:   Fri, 6 Aug 2021 08:12:30 +0100
From:   Paul Barker <paul.barker@sancloud.com>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>, <linux-omap@vger.kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-kernel@vger.kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH v2] ARM: dts: am335x-bone: switch to new cpsw switch drv
Message-ID: <20210806081230.3afd6e26.paul.barker@sancloud.com>
In-Reply-To: <20210805230956.7379-1-grygorii.strashko@ti.com>
References: <20210805230956.7379-1-grygorii.strashko@ti.com>
Organization: SanCloud Ltd
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Content-Type: multipart/signed; boundary="Sig_/C2B=4KX=CpjwjuixW24p18F";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-ClientProxiedBy: LO2P265CA0394.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:f::22) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LO2P265CA0394.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f::22) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend Transport; Fri, 6 Aug 2021 07:12:32 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46b6ec70-c10c-4aaa-b2ad-08d958a98f35
X-MS-TrafficTypeDiagnostic: CWXP123MB3144:
X-Microsoft-Antispam-PRVS: <CWXP123MB31440477F67D53876037AB9F93F39@CWXP123MB3144.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mDYOlRW+rcJOMCGol7CVD/IfQqYBS4f80ZQw1WEajW+pBC54UX0bhP3JKGVLrhNsfyslWrNbkZs4GRhVipxBXwr81RPNF4RY70ChqSEu5GTW/mD3wlfpkbh/2Js78zpFBHTAAYvnW+oR5MmJgOJjSDp1Zg4AMCIaCGlV8R2sA2+XptslliuiqQvcR9Wtw8A9MXZjAg9GperP1SDleCeySLsCGVgZlnPK8qkeH6AvuUrik8B77GqEigrlrPAf90SZL0+SMSwi5q75MS2pRarSBJzMXNh49dq5fuLVOiPzUmtLl4K+2PaY7FBDszi43ARD5TxbRPeZOGoH6V4s1HZvfG3mQWCDztU1THmZlrdcCkIHMTNfVVrsOgUZg9goh1/LI1T/Rb7+qvEw4ZaKJPtCpKgz3ZHl2i3n4v2JLb0XGVWoe+7+JvfUbuiJJ4jCYbQvnmKeyku9+k2cflu1X1W15qsKUVSYQKeN7VTjCpGdQWWLzOY90I0YmQPRbew+hS/J//wTN0D/HNk2AtjeUFcfs+/5bPU3QPK86Qe0gEPgo1A0ppqsDfTeE3SfyhU3w9IEOM0cZo7vk0lye38MSnk+rUCtrw9r6hM51S2SkoJPqFVkzI0S04iAjYubYLG8WrOmUEEFoiTPUoOeI/AX1tTrKOEG6yx6+yzqJlcgtHdTDUUe22U933+ZgDngT/sfFjCRod8nxDpqvVZHqwgtj6qDlQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(346002)(39830400003)(376002)(136003)(396003)(366004)(6916009)(54906003)(478600001)(2906002)(6512007)(316002)(36916002)(8676002)(38350700002)(1076003)(83380400001)(66946007)(38100700002)(5660300002)(86362001)(66476007)(66556008)(6486002)(186003)(8936002)(26005)(44832011)(2616005)(956004)(4326008)(52116002)(36756003)(103116003)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HVYGts5XaL05qsUuAQrv67dn/WIM+NyVPZa/OFSVs1sK+b9r+vPdMaZWjwkF?=
 =?us-ascii?Q?OXHJIYFmYzEitY4pTegVa2FCBCEpfzk4T9r+jZPrFmRhwpScYtB5VaureALS?=
 =?us-ascii?Q?7hfSXzEiXRA6nFdQeqBMlkU7+rw82H6PCKTJJuizRNLbE2jKrk0+cDy1D5Fk?=
 =?us-ascii?Q?VW9nM9S69q9TTBFeu8zIqa1POFfH6zuNheabLv+0mgbK5wk7YNNG/vM1fw2Y?=
 =?us-ascii?Q?8KLUTC9PJ3kY164FRDAwq+4/l/z8EgXC3s8i9j3ghVBSUWSLyal3w7gxfvk+?=
 =?us-ascii?Q?WQeSaAKYDJbTl4aAikli6rW8LfuOI3F+IhdFMA2uemt8i2XEfvi/GTPx8r4I?=
 =?us-ascii?Q?J8rPsBMGS2SqnWM3lXaRjInWt/8jWr0l6vvueMuBCZQqzxVyTDv3ZWgshbxf?=
 =?us-ascii?Q?Vf993guoYIpBU4/lF+tNXcUn7G11WybX1kApoqmV7yBLtCuRrTUlQzZaVDmR?=
 =?us-ascii?Q?10f9lJizResQ8j1GzvCwqIVn8cU7iGc5cYXs8AJ16A4s+l3Lp94nG3Vi5A2I?=
 =?us-ascii?Q?N1fyROJJbWZNUOJRONp0nrkwOAVYWtpU4XnPTCMN/x0IQLsSyZ3Ep9dVLGEN?=
 =?us-ascii?Q?4YGon81AsULZAbAiVMy0jv6pjRUF0VLy1AK7W8UpIDFclxst8njRFUA4eP8j?=
 =?us-ascii?Q?a8bS0td3LuCoRFzEFbouCcjeWXRQRl1SbH8Te+gH/zUikVJ54X5MdsYGdcp2?=
 =?us-ascii?Q?hRjzFlUFCm6/N2h0uA/tVcWRqFappLC5DLkrc0gH+HVrPu5CfGbBzdISANXd?=
 =?us-ascii?Q?QK2jmPTeA5vsrzQBndYvPrxwHsbWV4ZdfVh6Nr2khOo2xrOCM1SrxEYxxHBL?=
 =?us-ascii?Q?W1p4ZuShHOjYKSuyw0w6xgd3U4wh/x/GgyHK1IBQxulbESMcAqT2wdNvlUhW?=
 =?us-ascii?Q?fx+q+xdP6cvT5ZWFry7C4Vo1Gg6AqPEsEPFkZVzSG2TNHclNU5Of/dsxikCX?=
 =?us-ascii?Q?QCmdczW+PcnXDr59SzPP+Nb92ptr7grB7rDmJjIMkrw+Y62L51zK5hwquKz9?=
 =?us-ascii?Q?r3f+q3iuCKh075BNQPOSyGf7C1Tl0YwE988u7y/IgSx84Jd8sD9T/O/YDtw6?=
 =?us-ascii?Q?1MP1KrqkXRz8bn+PAhT79Hj0If+YCs/buTLCwlecS4BMpI4SKIrslEdlLn/1?=
 =?us-ascii?Q?scZR4nCtdsUU1dWOKZjAnhNJpEAlpGH76zKS3XeY5spNT8Etci783b3YnNnv?=
 =?us-ascii?Q?NUa4GbBmeduSpfYVj+90nGlXhKOXdX8JKtBMH9JICYSApJcIl+0EAQygabTS?=
 =?us-ascii?Q?Zph1dHmMHgfbiduw6YMK6GQ5xsNFFWiykNEa/kmoCMJGD6H2p2jkwpmo5WeL?=
 =?us-ascii?Q?c8a4PJm0+zPumwN2okKUoz2w?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46b6ec70-c10c-4aaa-b2ad-08d958a98f35
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 07:12:32.5973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gvPtbDs46Nrd6u+s6dR4PfvqpdzRDlYqu7VM48QEvdUahlRsXAogj3x95MMCJb+nZoStJTjuR3b3jKoe6UcdzXFgov50CvZ2j0fERhZcYKA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP123MB3144
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--Sig_/C2B=4KX=CpjwjuixW24p18F
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 6 Aug 2021 02:09:56 +0300
Grygorii Strashko <grygorii.strashko@ti.com> wrote:

> The dual_mac mode has been preserved the same way between legacy and new
> driver, and one port devices works the same as 1 dual_mac port - it's safe
> to switch drivers.
>=20
> So, Switch BeagleBone boards to use new cpsw switch driver. Those boards
> have or 2 Ext. port wired and configured in dual_mac mode by default, or
> only 1 Ext. port.
>=20
> For am335x-sancloud-bbe-common.dtsi also removed duplicated davinci_mdio =
DT
> nodes which already defined in am335x-bone-common.dtsi.
>=20
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> ---
>=20
> changes in v2:
>  - commit message updated to indicate duplicated nodes removal in am335x-=
sancloud-bbe-common.dtsi
>  - dropped phy-handle for cpsw port in am335x-sancloud-bbe-common.dtsi

Thanks for the quick response to my feedback.

Reviewed-by: Paul Barker <paul.barker@sancloud.com>

--=20
Paul Barker
Principal Software Engineer
SanCloud Ltd

--Sig_/C2B=4KX=CpjwjuixW24p18F
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCYQzg3gAKCRDYN3IfEvob
6ofAAP9DxYflFjmvnFOybSG5oXHfqlTIcKQhVQ6oSLpfRONi7QD/ZVmlVrkiNtzf
QOQh1jcELSD6eYStAiBky6UCb8XLkAg=
=frWi
-----END PGP SIGNATURE-----

--Sig_/C2B=4KX=CpjwjuixW24p18F--
