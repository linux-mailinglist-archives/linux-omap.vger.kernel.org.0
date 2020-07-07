Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9762A21788B
	for <lists+linux-omap@lfdr.de>; Tue,  7 Jul 2020 22:04:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728318AbgGGUE3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 7 Jul 2020 16:04:29 -0400
Received: from mail-eopbgr770043.outbound.protection.outlook.com ([40.107.77.43]:12455
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727895AbgGGUE3 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 7 Jul 2020 16:04:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3J1E3gxEDrBoVdt3rs0YqDl0m7JrbipgUQ38EFkLOurh5HzHsRxbuIqHtJrCgBNJJk886LBxl5u1k/9FThjMs4sUAjYF9GRx6Zf1QKyuJrLDTktiMhhminUSBSYXwko1UAxQo7NCLkpzS1Rrb6Jvd2cQhaLn+oND4sdOzge+Lo+Ebja72JoCPy6RHGNOgt6yz4TDDLNmOD3r+jCP24h5zRprwXvW/3964Q955xpoZrIzkK8qGjkKQufiBPeFmoUbkWCJJMiLaxQpEpbiI5OKSwSzBqGwaBNdos/6hRoZ9oH7eorIR/LuduU9hDJVbTllMjxVOgFL1+KImNNO3Qyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQWNGQ2dJvXojFQN6qUP29zvrHH/0lVt3ygOEfkEEUI=;
 b=M6vy+BU4YQaUPgJo3Has8tz8XWmdfEdXGVsbEthavnaygNkkaCc120tPJcnUNcduEp1qzdf/QchnOtvG73PN++ilWMRNFSetNncao2s3CFhgk0dycowTOUfHd/FZFqNmUU1lr/eCqVtsz9ASfOAJuuzsliT3GOdaQ8EXRC9VyNnjGP2DeRBEqWIvyC+yy2ooRdQnTyci9boxVpaM50VIckZSziLxF/wr8w3Qx/Z567AyX3zD20vBRrDU8zonZEtPHE7s83UDpYVBL2dkRiOb5YXz66FUv9DkueYqsLDcaUr0TNW+PLilv8/wY6KM/lQw8zxobH4MjJVmgnwXElhC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQWNGQ2dJvXojFQN6qUP29zvrHH/0lVt3ygOEfkEEUI=;
 b=M0RiF84r9WoS0HaFb7IsUOm10qWfCA5d2PrAGxQPk0IwYGm6Dwj07VelDMsmWxr9ueRcdA/+CajW6Ryn+2Nut7KeyI905sJR7jsZixDMQDmLaXbtBVH6c6qgbegtgHFiDzaaKQoqR0oP4dhkOTdXf98IIVKPKionSVBJp5vsY2k=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from SN1PR12MB2590.namprd12.prod.outlook.com (2603:10b6:802:2e::17)
 by SA0PR12MB4496.namprd12.prod.outlook.com (2603:10b6:806:9b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23; Tue, 7 Jul
 2020 20:04:26 +0000
Received: from SN1PR12MB2590.namprd12.prod.outlook.com
 ([fe80::c179:ec27:4476:8e05]) by SN1PR12MB2590.namprd12.prod.outlook.com
 ([fe80::c179:ec27:4476:8e05%7]) with mapi id 15.20.3153.029; Tue, 7 Jul 2020
 20:04:26 +0000
Date:   Tue, 7 Jul 2020 15:04:18 -0500
From:   John Allen <john.allen@amd.com>
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-crypto@vger.kernel.org,
        Corentin Labbe <clabbe.montjoie@gmail.com>,
        Corentin Labbe <clabbe@baylibre.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Ayush Sawal <ayush.sawal@chelsio.com>,
        Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
        Rohit Maheshwari <rohitm@chelsio.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Jamie Iles <jamie@jamieiles.com>,
        Eric Biggers <ebiggers@google.com>,
        Tero Kristo <t-kristo@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 07/13] crypto: ccp - permit asynchronous skcipher as
 fallback
Message-ID: <20200707200348.GA127522@mojo.amd.com>
References: <20200707063203.5018-1-ardb@kernel.org>
 <20200707063203.5018-8-ardb@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200707063203.5018-8-ardb@kernel.org>
X-ClientProxiedBy: SN2PR01CA0051.prod.exchangelabs.com (2603:10b6:800::19) To
 SN1PR12MB2590.namprd12.prod.outlook.com (2603:10b6:802:2e::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mojo.amd.com (165.204.77.1) by SN2PR01CA0051.prod.exchangelabs.com (2603:10b6:800::19) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.23 via Frontend Transport; Tue, 7 Jul 2020 20:04:25 +0000
X-Originating-IP: [165.204.77.1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b393c32a-c880-47e9-8314-08d822b0f300
X-MS-TrafficTypeDiagnostic: SA0PR12MB4496:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4496C2646662A9928D444C619A660@SA0PR12MB4496.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0457F11EAF
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dTwtxGCgVESod0ofTo3TKbYK9RkbqXd+92ipVnWyU6aDNm/wv4Ejq6qRBMjo1DQWKZ5Z+NxUILgqmerv6oqqL6HkY8EKFPqqx/CJi5r2xHSC81SmzBouWIvC3sT/ryaU1GbuAzdSnlehlFPd3ZAWvTLvvFlmyDplz1d3ECopqaTF3qGmCGmndzJQ+P5xSCC4o/RiEMkuN5AQsquS6jRdA28wr1vthNzJjhmcjg2VHVVbw4nwHFwbRoIeomrU9XFX2e/XvmId91gh7isbWFziFM07c1X4g4q5xyfFR58vn6Iu4AgDfExQgYgoij1Zh1uY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN1PR12MB2590.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(44832011)(83380400001)(6666004)(316002)(956004)(54906003)(66946007)(66556008)(66476007)(7416002)(4326008)(6916009)(478600001)(55016002)(8676002)(2906002)(52116002)(7696005)(5660300002)(33656002)(1076003)(8936002)(26005)(186003)(16526019)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: YeGb2stMMcMRTzsP7vfzpcpVwMdaSBN/IHzlOoGT089aC/PJIeIpMLWcymQeEY5cAcn/aKNBCodZQt/OslIGZbWQlOxMYZHlBqlYsotojHvj8qS10ItkfvebGx0Mt/tNJURku69/VqM0eth89LVmhgGvpPt8k2/bNuvGwYGKq4DFnASjTaKgNws3IldTbDXX+wjKUUDSP9zUHNMBET/z6eVqKnqhljyI0D4FxbALq1Zjv2CuagdtNi66i1mqm63anadT4kpPt/qm7tli3sbb3IBxV0T7WbknmP8PBSUMWJq36wCw5yb2DPQOqOYTVn5knM2+rBWYXyEi8IKStLfrLdcKcgH48NBoCjICzBN6JTqNw5F+ZZa70Bdh/NmizfFgGWoQg7Gt9SSamudyfEnUMkZ8f4PwjMD+1LJh/xlv9IdFsNMKKUs1+UD7R2yiYLE8U5eCvUVkmoRFoa34qfD2b/kN5gFRmQexoFhaCoklokw=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b393c32a-c880-47e9-8314-08d822b0f300
X-MS-Exchange-CrossTenant-AuthSource: SN1PR12MB2590.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2020 20:04:26.3218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IW32qZl7sQGZLPjTFnIkn89LCajYPQBiho9LKjrkka+RWllG4/o/V9a7bdu1S/2Q3wmlMulhYMs+ROcBfCc2yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4496
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jul 07, 2020 at 09:31:57AM +0300, Ard Biesheuvel wrote:
> Even though the ccp driver implements an asynchronous version of xts(aes),
> the fallback it allocates is required to be synchronous. Given that SIMD
> based software implementations are usually asynchronous as well, even
> though they rarely complete asynchronously (this typically only happens
> in cases where the request was made from softirq context, while SIMD was
> already in use in the task context that it interrupted), these
> implementations are disregarded, and either the generic C version or
> another table based version implemented in assembler is selected instead.
> 
> Since falling back to synchronous AES is not only a performance issue, but
> potentially a security issue as well (due to the fact that table based AES
> is not time invariant), let's fix this, by allocating an ordinary skcipher
> as the fallback, and invoke it with the completion routine that was given
> to the outer request.
> 
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Acked-by: John Allen <john.allen@amd.com>
