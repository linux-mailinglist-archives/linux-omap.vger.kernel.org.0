Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9DFAE65C938
	for <lists+linux-omap@lfdr.de>; Tue,  3 Jan 2023 23:12:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233793AbjACWMA (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 3 Jan 2023 17:12:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238603AbjACWL4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 3 Jan 2023 17:11:56 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2106.outbound.protection.outlook.com [40.107.223.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A572F71;
        Tue,  3 Jan 2023 14:11:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJ5XzgAbuRmYrxHCJoi7XkW8nsgf0PsLD809RBj4y53w+Agr3YYzuwY90DzuascENOZNNVGQZe+dsBldhjQsDWbtMEY0MhQBv6utcZ4HsM78BM55/S7f9MJdcqmBfWZ5jitwSuy4P9SPqMF9asTvThUld1Ut62+c1AKNkvZxvLCO1xOrxnn0F2Q40+BPGNjhvLprr2ihKzsvE6oxU9Vz+8TmGsVlzPH0aTjZJDc12fVqiRfut84Vil5WTTuU1bgIBWRFQf7CKFhHiQ7wg/0iayPylw6JtfsipKfJ4/Um7kJHFjNWX5alH/1pCa560/F9IEATHSsuA2wUPGwzf8qToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTSlcn032+KW0jzmx4FyMrzieIYX7+52nOulPoeCQ6I=;
 b=XVwUKxIC7aP8yC7Kn7pTx/FgvICVYfOcO3+j6CRiCwfJxuVuYtgXTrcLmokNUFrmpdcKwuBOtEvaEuZ/5ixIXs+pT5N/Nlr0NnGNPGEkJtH5WsPA2RrYFUnS9f99BCAlBl/ERnb1Yj7WYdEA2nYF/MPRp+fN8dVvnDhLL6DLSX+/GNvETqjvtNNKdXjlO2wR73pUzWA1gpL5pqPwOH5CD+6HnmkfnFkG1Ffi9e4/nLBLiD2xnmGaySXhN6BZ4FlcRYAlJ32g13ybFM6hJLXJlDqPuDk71EGD35SyfUFhuh42Bob/nBaEslo3KS64ab8k0Ap3z3lbEhqFY9QSUrRFsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTSlcn032+KW0jzmx4FyMrzieIYX7+52nOulPoeCQ6I=;
 b=O7gnppMBh+P9G1EmheAmu/NdpwZ/7aYaZXagTE4RflNSZLB5p8nqPqF50nvXpGEzx+4mkYoB8xXp07dtJd0TLRxn2EE15wvwmFz96n1dnpBtCOAgh12rAqoUKmcGqkRMI76x6GDbuZ6YVJkWtAifGcIRAubPXODp5tz8O9NP+68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by DS0PR10MB7222.namprd10.prod.outlook.com
 (2603:10b6:8:f2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Tue, 3 Jan
 2023 22:11:51 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::45b5:a860:9cea:a74c]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::45b5:a860:9cea:a74c%4]) with mapi id 15.20.5944.019; Tue, 3 Jan 2023
 22:11:50 +0000
Date:   Tue, 3 Jan 2023 14:11:47 -0800
From:   Colin Foster <colin.foster@in-advantage.com>
To:     devicetree@vger.kernel.org, linux-omap@vger.kernel.org,
        "B. Niedermayr" <benedikt.niedermayr@siemens.com>
Cc:     krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
        rogerq@kernel.org, tony@atomide.com
Subject: gpmc wait pin regression from 89aed3cd5cb9
Message-ID: <Y7SoIxhkOiCS+BFj@colin-ia-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: MW4PR04CA0156.namprd04.prod.outlook.com
 (2603:10b6:303:85::11) To MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2351:EE_|DS0PR10MB7222:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e75f80-31b9-43ab-efff-08daedd78386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DV7J6ex2b7h4QM22V6cMZJePXwUuO72m2RrjZh2LzHwbQacKmrPPfuKW5v2ePE6z3wTyVfB5GZS8sZAEEzgikTpMJASKcP99gUJpb5ivg2l8f7o6Q0VGxVe3x/B3RkrzqjvhDExWd97jtwgi0MjLlwAuqVdRITkS4itQ37I+zWy7szqbkcE4lLINAxdPvPYVcj5EkhAwmwtkzq91qbZgSDm7FVXlg3n9SJeFzkJdt/HDJG4pIRyzNvaxjQpQOL3kAHF4Ja/AjzQAuj9raSXPapNfpZE18fpt+8UehO8RUOryjB4Amhb8lLtu2fuMg68q3CufdWApTtSI8xm57dpOr0qRK38YLXrh6tleNt+RlsyhdbDbUJMURuOkfv1//jj11oxl7E/kM2XxfDVoKL6xZGkyoA6pGiggZWHglpbjmOjZmN8xJQj06Cn26hnUx1Ae9ebz5RWkgwbCP6PdJzR9PGozi135ZsJoJTss0Jcd8GGlBe7pGpoGcjOQXKFwlMvwJ9qJVFxR9/vduHMdU2r5xxJSRzcLJPxzHjLXoKoFcK/fT/Ah9sDUvF8pLSwfjJqb9Eq/OhoSE0mYTQ5Re26LZKBerGzJ5jpQ6tfTNlx9+LY+SalbD+Ud7dx5YMsRKftz+y+ijWlLz6rGVsyrc3sUBrSkRVSp2j2gyZPCVAQpHrmNl+36NBfDv2QJItmfVu00il26dcGHL1mzz0u4elSB8ErSJB6Kmn302uC9VaCsFxkEmIqDl/FyRxTherRMRjbG
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(396003)(346002)(136003)(366004)(39840400004)(376002)(451199015)(6512007)(186003)(9686003)(26005)(33716001)(6666004)(6506007)(86362001)(38100700002)(41300700001)(8676002)(4326008)(2906002)(5660300002)(4744005)(44832011)(8936002)(6486002)(966005)(316002)(66556008)(478600001)(66946007)(66476007)(6916009)(22166009)(98903001)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6VV943ObWxJQWegUpYc5mh6prQoNqNLXN5YcTduXjnJZZp6eFrRjqmZX+gK4?=
 =?us-ascii?Q?8tq/VZmiEP00N5vFt6D6BLazqp71XGSi696rHh61tg5obbMyBHtD59HlFils?=
 =?us-ascii?Q?f0o/8l05HdEtuSzHWx8cQdJmDmAIFYOWeZM2b96lOmjxhowdpE6ts67L5KD/?=
 =?us-ascii?Q?07cwe8xisOO2Ap+S94u79oY6akxZ7vL1y0A7erZ9tDqvQCqufZ507G/hzIrO?=
 =?us-ascii?Q?DjCX40jxI96g5LdHH1Al+QCdwyZTZuQw/2ziyuxn4ZRx/0VwG6Y/0rx5xeMJ?=
 =?us-ascii?Q?j2eVdXUIEFAzkIA+acXBw3ktBn0ZqEKwQM+KrlFFQHdfD5EsLnvZxeRijnzJ?=
 =?us-ascii?Q?Bu0Kc9PIhzAeHcX+FBFSXLTImtfgAGglUrnbpALsGk+aTK5zmXTqVbz8qsTs?=
 =?us-ascii?Q?yQCaS6n4Dhh/QPGILbtzJkOBU9tS7VOAjiPQ0us3h/T/rSw/qLV8jmwgW3GR?=
 =?us-ascii?Q?tDW8BwSE+cV+h45YzwgAlNeLXlAbxygYCcQMgkdwjQ4cB3ZcolN/Y9h/4U1/?=
 =?us-ascii?Q?MbwJG0yshNU7VL0DMx4+XWvVgD300VCJkMHdFnCjsHDOT9FWqZOov6cDhBBc?=
 =?us-ascii?Q?ExqjFcJqofhCB+A/Ap3t2dQgtGuqzKjqcHtK0oK15qo0Ag5fPTZ6aUc+Utjm?=
 =?us-ascii?Q?AFZPpglW+5FcBmqweT0wsBVwnGIYFAX/sTglhHBdBAxBROHWF1RzGhO7RcKB?=
 =?us-ascii?Q?jehH68FIEAZlU7VZhjPybYtZL6H+GHLEr7NXlI4c+CCAcS5eo75Mho4jTOq2?=
 =?us-ascii?Q?sqLglyioL6LYCd9C0w3/VqstBTPLJht6VmzmyWnDXyDZKI1S3W5hS7VRuz85?=
 =?us-ascii?Q?99YRpssdtwHE8sqwPOibfxh4eFsj/OtA8KceUxhjUqxZlMW+aR+Ksfzl+MCU?=
 =?us-ascii?Q?l9Gh7PBOLjPMzjopB6EkTNUV4266H84OV4TglxWEiYan3BVe3acjiOs0dgW8?=
 =?us-ascii?Q?N48XPxN3jUA6GL8xBFaPWZ8/tjf8eRqQrX7eFA+JK4pw1SlIC8DCCQJsn7N5?=
 =?us-ascii?Q?s45hB51nB21Bt922PWPP2ifbgVPSpTqLtS7RGLsvtKQB3STE4BQ29ZUY5kTy?=
 =?us-ascii?Q?LclWPvH8p2ma6gUmzVTyUczm1D6eRHj12hxL3G6Kl2IcEebaB1hJFo/P93wr?=
 =?us-ascii?Q?uSghY0VsJeQfVO0yq5EW2MbMsKXwezvouLfR1J9JIb6FaLVAf8bw4jzbYZK8?=
 =?us-ascii?Q?Um+x9d9KKjIlshPjQhJTafNVBVi4SdD4hBCGXQEnkxqAp0TyY3gpkrtb5Nmo?=
 =?us-ascii?Q?9DAwtOZkNd4yBXGgS2YqhkBmR3Gt3ZJWttZpBfwS2skuAXEiEynYpAHN4HhO?=
 =?us-ascii?Q?xWpCor6ugoCmsFYpqxWgQ3loSSFqVX6XGiBOS+pIqvTZ9czYYCZs3iaCkKim?=
 =?us-ascii?Q?HDUlIm9cvbO4gvBQ7EHav+fCWWyMK3Z6Fi84bXHx+6jF+E31ebe7dT7yTAGa?=
 =?us-ascii?Q?EelplEt/9henojNKGTC6psYmDblnesVz/MnermEK5GxZWBm0UFa6wH6AhZzp?=
 =?us-ascii?Q?1Zvqb3BXavEBw4YjKaRuzFnl1QALSJo/DmVU51DVjNcT2cQtLZ1Rq2IMmlen?=
 =?us-ascii?Q?rgzAt6EwR7C9yrXwf/EQB2t0rFeVC9mjIdmqzFtskV26chg26oBGnBvFgfeb?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e75f80-31b9-43ab-efff-08daedd78386
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 22:11:50.8475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sSVrM8RODQTu6UWFsrrVnansT1+KYjQ3Qba7tdbcVm3sOkl4o0/luUewe0/iuvB3hYNwK7i55av0psw00TfyxgfwaDjAk6J+aQXJStOgok8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7222
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

I'm working to get suport on a Phytec OMAP 4460 SOM that has an SMSC
9221 attached to the GPMC bus.

While my DT isn't mainline yet, I used existing OMAP device trees as my
basis.

After commit 89aed3cd5cb9 ("memory: omap-gpmc: wait pin additions") the
SMSC stops working because existing device trees don't have a default
"gpmc,wait-pin" defined.

I fixed the issue for myself by adding this to my .dtsi, but I imagine
any existing device trees that use the OMAP / SMSC combination will be
similarly broken in 6.2-rc2.

My latest DT submission shows the use of the omap-gpmc-smsc9221.dtsi
without the addition of gpmc,wait-pin which worked in 6.1:
https://lore.kernel.org/lkml/20221123233209.1854806-1-colin.foster@in-advantage.com/

Thanks, and let me know if there's something you want me to test.

