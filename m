Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23EB3DFFA5
	for <lists+linux-omap@lfdr.de>; Wed,  4 Aug 2021 12:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237597AbhHDKws (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 4 Aug 2021 06:52:48 -0400
Received: from mail-eopbgr100138.outbound.protection.outlook.com ([40.107.10.138]:24270
        "EHLO GBR01-LO2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237593AbhHDKws (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 4 Aug 2021 06:52:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XB7prQRO5YKi+HSryDAHohc5uc4T+48JKg9cakFnDSdzzJN26gTX3TTpQgKWcSyYh0loJIU8vaiFA9ea1t2kI7FtHeJSoiqzx7f/8rLFZ+B1o5v/7nzpcsZC1zDceGqlnMcik7WacT2j10maYvcSBzFcqCzCbs+IGvSOs6MRAA+0WjjH5eZ3QJcMThPBP9ejmsxQCJFsvD12IsZTe/greFYXjscHCcH0rZ/Si3O3ACftT8axollqqEHNhYRwniwWYwftXJlPB/BEwn1T8/CP/K8Z5mlqd0F1CkjConHjzYkpMY6xzD82JzFyEpHiVJCPeRHYbXJPNJtNloqAp09zrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bA6cJ4oU849VwlKsl7dZEmm8uf7nMoXbMBq52m5LygE=;
 b=cHm065U9ddY8yfFgEYCjQp+a9gcQQFcQBHlysUCV+5FSR40pE0Xo3F6aIVFp5O6jw3r08x9tach15sELleSlf03L7HOeTMEFNADyCO5cu3Zf4MwaCp5mX2IZDCwB3PAl/5mOI1AAkn1yGhdZAyN7OS3aMUY06OVZofWxrZj0orFfeaCL37IfVKbfOwn9bhVjNjqRN6Vx+jaKiiy2pJhuib6v+kQFAytbpYbOXh5l4371vJue8JnciI3lqndxUJKkL5i5CssnuztZ8kph3dAdjuk2ER7FmBeyd40dyDmRRAjnbtiz0kmDUV5QJJKMoIniyaNKLN+/KHR5VY+S+f/uCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sancloud.com; dmarc=pass action=none header.from=sancloud.com;
 dkim=pass header.d=sancloud.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sancloud.onmicrosoft.com; s=selector2-sancloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bA6cJ4oU849VwlKsl7dZEmm8uf7nMoXbMBq52m5LygE=;
 b=Ks7xhwEk4iYSD8nQjrOj53M2I+RSNPBEYxG09HwISvp2kJ8WTlB2DbIE1FVWpa9wVMHQ3Tb9KXIk8wVgAR/P+Ok2K+7fsrOIJMO8BKi/cdgE4SA/1E5H48eVsZOjci85Wnnen+NgNaghnM6NnhAnpHe87txgCrVYJenVQ3NlDEo=
Authentication-Results: atomide.com; dkim=none (message not signed)
 header.d=none;atomide.com; dmarc=none action=none header.from=sancloud.com;
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM (2603:10a6:401:61::19)
 by CWLP123MB4610.GBRP123.PROD.OUTLOOK.COM (2603:10a6:400:111::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Wed, 4 Aug
 2021 10:52:34 +0000
Received: from CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0]) by CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 ([fe80::dc2:e929:76be:a8b0%7]) with mapi id 15.20.4373.027; Wed, 4 Aug 2021
 10:52:34 +0000
Date:   Wed, 4 Aug 2021 11:52:21 +0100
From:   Paul Barker <paul.barker@sancloud.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Robert Nelson <robertcnelson@gmail.com>,
        =?UTF-8?B?QmVub8OudA==?= Cousson <bcousson@baylibre.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Add support for the SanCloud BBE Lite
Message-ID: <20210804115221.5650e440.paul.barker@sancloud.com>
In-Reply-To: <YP/J+YC6GFeH+I5j@atomide.com>
References: <20210720083928.10404-1-paul.barker@sancloud.com>
        <YP/J+YC6GFeH+I5j@atomide.com>
Organization: SanCloud Ltd
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Content-Type: multipart/signed; boundary="Sig_/_xTPGkthMKGd4.hzTlTmL/m";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-ClientProxiedBy: LNXP123CA0012.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::24) To CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:401:61::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from owl.home.b5net.uk (80.7.160.81) by LNXP123CA0012.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::24) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.16 via Frontend Transport; Wed, 4 Aug 2021 10:52:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b859d366-3c82-4cca-8acf-08d95735f6fd
X-MS-TrafficTypeDiagnostic: CWLP123MB4610:
X-Microsoft-Antispam-PRVS: <CWLP123MB461058441CC7DEB365BFC0B393F19@CWLP123MB4610.GBRP123.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jD5xWEdrFeOQunHIWKfWRr/q96mENA5Nm67cQwjYcU3ljzwRJN4vM62mCjzhLkeLDP8wj5odkNIMCXSLAC1UY4AI8JLroXsHNGm/K0b8Vh5tiVJ+B/1bMv7BPUphVFqOeOSK5m88GJcEL9fZpP0oVWnKSFNbdmRBoQFhP7vEqiW5Y8vt9YlDf5N2en/RmJBkrJMgHIhqfNyCnrxAyyvoap/Vv+wGKOPnFlCbxPoM0h3dgyKurmHg3+mCJJtGzLL7jmI7wEZhYIWGBT8PK8YZxU1Lde7o9GRUe4hZyDBc93HqUEWdanImK0n9xCRAZYR7pqhWxmQ+m5HoMV8Cnf1YIWv6oc6SQ++H0AMgbINvPiJdleTfvOqmFUseZynQO8K4caHzNNLhfsM4+Sf81aayTCQPA3bS5GFHtZMWnFy007/r77sBCkD2za9zdfphnytgSOi6+8Q2nXE7DmWRXwfn3guLnUUMRCcp4upYLFlYRr0utc3g9ABmB9788r/07Uyp6wcuHFWq5bpWn3/BrWubezpe3fYL9sYAfE0fMeKaQOgJhrw/z4u7FSWdwcLiezTvADShbwAySmnJtFDF5Bs3yC86QHcp3Z2mmAgGVmty8f3zOOTYjsMpOfLTtdQPiak3qAF5dAA3nWDtDamV8+qU4q8YejtbGzL2s02LRpWJ8hmHj0Y/p0HAyMAATaYHV1vv+gX+HygxdyeOZTmHfKYNIrj+K7TCOUPf7MBqrNThT4tfJ97AYq5rGS8ssg/yckjz5HEXvwwxikYyBgy1OtuR/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(376002)(366004)(136003)(346002)(396003)(39830400003)(52116002)(1076003)(83380400001)(86362001)(6486002)(5660300002)(6666004)(2906002)(478600001)(36916002)(966005)(6916009)(44832011)(8676002)(38350700002)(26005)(66556008)(186003)(54906003)(4326008)(6512007)(36756003)(38100700002)(66476007)(103116003)(2616005)(66946007)(956004)(316002)(8936002)(6506007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cHlUqXN/HkNGqq891BYej3yGdua7XxQ0r3rpiLGXCQR3ulUnZnJncWMIdAXK?=
 =?us-ascii?Q?Z3Mzy3xFeRvu7YXup11RtI5cy/1/J/AhCz4XzHPk2U1wRtM7yk4XtG7HdB+S?=
 =?us-ascii?Q?UAeQXcVhW11epfbGk9i3PCjDrx8xxWvpvUbU+sVHCxpBSPp237iG3tHu8Mm9?=
 =?us-ascii?Q?ujIWqY77ssmR8Leo+Qj2F5ESkD+U3aVZOYpRiO1qiFerNZTgybCKHtUwO0Ob?=
 =?us-ascii?Q?prWS1Ltk4FQZIvnXRobWaPlpAfRbhx5+0Z3ELQWGLNpGBAJp0Q09KAUnMoYC?=
 =?us-ascii?Q?nfTOHwxOH1sI1HbuWFLCKxEQUlIY8j8JvDFLz+Qxyar3y9NiqR1D6dGhDpeY?=
 =?us-ascii?Q?Y3INvCui/05mgZdaaU/lWbQBouiHlyoMoSxo0mDwWagNQ8GF+ZCU3iVxUFyH?=
 =?us-ascii?Q?H8mWhn1mOLcAKpx94B/JW9c+r2S3fEwn02aZ0p+IYozVPSs/35djXhPhRVbM?=
 =?us-ascii?Q?21aQqJBkUMAuBy92IZ7Osoo8uU9n5nkh+S5pYtYf45cQ0RbRl7WjENGixKux?=
 =?us-ascii?Q?rh+pmI2ctAjnvbv1O60qOnCNqBhNiimf7fQSnhPmS/MoG7LNlQ3N+QSeCGoV?=
 =?us-ascii?Q?4H2WSIQLxi3lcVeWqgGUDRLKMq1SgZkB+UvOEvL+/RzKe3KWeVVpJUfC8k+f?=
 =?us-ascii?Q?egoDjnE3h75NJCO0O2xLodAdiNC9hFY6dq8livz5C8tBS9+6GBX3S/CqNMkP?=
 =?us-ascii?Q?63JQ+5kcsnePxSLYtLGaakgdY9xHrjgUoceYyvyBnSAAmC9PQwRvpRC8Qlfj?=
 =?us-ascii?Q?8F7plHZa1vlXz6bjJm/oSL8I3qij0pPIFS6vwPKpEDfL0d0QPNTD3xmnovb1?=
 =?us-ascii?Q?XM5pgNSNereKCOPj+zfCCmAp2ajpnDN6N0v58aMrwR+69vWt+dEJOJMOKzCk?=
 =?us-ascii?Q?VErJWLxDtWLFDLrWiJexo/4GyRmwzb1C4oYflk6PuLID0MWzKVJd4jomVL02?=
 =?us-ascii?Q?jZfEuP40t/MD8xvfhMNcVSWN33w+GYD8HY7nuNPUJoxJJJ9hrmjTkvBdeavI?=
 =?us-ascii?Q?P78Z5vVMggo0r/rv0/ndACWzysO+R+L/s4bEdqZ4D1qPrEVcKpKoJlGzAnIK?=
 =?us-ascii?Q?v2tLUQ6O4a/CbWCRXqqax426JJm42wwq4XBX+io+SZrPZ0HHCnmxFX2hPmol?=
 =?us-ascii?Q?ozdlMg+plyjLR/xrJXSNS4t48T8C2pNq7qM+J0OlYPqfMYCkSPZ/eKbCd88d?=
 =?us-ascii?Q?tECh2xfMvh2wllme8kYpa0PrjJmLV0qMSvEVANQTvwt+a4SW6xCaC+VaXcxN?=
 =?us-ascii?Q?OHM0xZ2sQWuK61nRbbL+rvPxNo6+JcFy5+EZAiQGoqvdvrPLViwxUdCYLPwc?=
 =?us-ascii?Q?AWnpDNeBPo40BGtJPKRME/UP?=
X-OriginatorOrg: sancloud.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b859d366-3c82-4cca-8acf-08d95735f6fd
X-MS-Exchange-CrossTenant-AuthSource: CWLP123MB2241.GBRP123.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2021 10:52:33.9229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 840be37c-244a-450e-9bcc-2064862de1f4
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pNyiujTJxzzsKX3rkOcr8V3EN3ZNzgnJ+JLjxW146xKX9f4xFZkM5ev7luVZk4JlVARTCevQna0wFNmkbWndsmFI986JxG6WPBqzpcl0AXQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP123MB4610
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

--Sig_/_xTPGkthMKGd4.hzTlTmL/m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 27 Jul 2021 11:55:21 +0300
Tony Lindgren <tony@atomide.com> wrote:

> * Paul Barker <paul.barker@sancloud.com> [210720 11:40]:
> > The Lite variant of the SanCloud BeagleBone Enhanced (BBE) removes the
> > HDMI encoder, barometer and accelerometer chips and adds a Micron
> > Authenta SPI flash chip. =20
>=20
> Thanks applying all for v5.15 merge window.

I tested the for-next branch of linux-omap to confirm that things
worked with these patches applied. There was a NULL pointer
dereference in ptp_clock_register() during boot. The fix appears to be
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D55eac20617ca84129273ab248f4d7bfe456967de
which went into 5.14-rc2.

Merging for-next with 5.14-rc4 resulted in things working as expected.

--=20
Paul Barker
Principal Software Engineer
SanCloud Ltd

--Sig_/_xTPGkthMKGd4.hzTlTmL/m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iHUEARYIAB0WIQS7m7rT1+CktY3YG1PYN3IfEvob6gUCYQpxZQAKCRDYN3IfEvob
6nBVAQC/+P3MSffSpoxELLnNCB9473jM7T60O1JgOp2wnee8jwD/YLhEusXg+YS8
S7Kr+7LM/CyfChVXH42vFZIjGuqV2wM=
=xKoq
-----END PGP SIGNATURE-----

--Sig_/_xTPGkthMKGd4.hzTlTmL/m--
