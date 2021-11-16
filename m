Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94EFA453567
	for <lists+linux-omap@lfdr.de>; Tue, 16 Nov 2021 16:12:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238014AbhKPPOx (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Nov 2021 10:14:53 -0500
Received: from mail-eopbgr00074.outbound.protection.outlook.com ([40.107.0.74]:39301
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S238004AbhKPPOg (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 16 Nov 2021 10:14:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XCxw4/FQ+jqYjdWk6S5bjO4ANuzWExZdhJzeL90SrPnRAGmBx5B60mOUxkw2sVlfFBZw/nEQiwUF4Ble+PSP7OwWxqoGvDUe+yNG8tY3+OEau8TsMYC2xD0nKPLqGeECPUc4hrKBPFSYbMBCiHfYW5FaEgWjthpRlUGVnybWvgHe5jUDpq/G5SL7c4wXYWXGUt4+Ug6WoCLMzqaVEvgKQP4v9rfRDJg08R7bUPW9dIMX5eTJk4kFp8AYZd3/98Lusm8kssjNUqahuduU2W5MoqrHEGulGwsoqouqM/zdkBauccNsdFsEmYAel9OAzUPfFcWuJapfoFyflzBge1pj5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq7791NpKf481DHXXIDn4VCj+OpHzaSrtQ5uu+cjR/4=;
 b=VcxAjTCXIAUtjMPsglazjRAkUsXTIl1YKILCtZo/gx8mFsENxqEgwhpTY1skZTme4SaTq2Hpr1LZUpTH4KyvsG/CBJu+JpgOH+dBDtG/2bkQ73CfTTUJaeoXlcMqETqBT83qSGfiURaCFlqLUL22qJwTbXkJcQN6honPxbnQ9vT4KuWXkDwTuvAG6EMzqQnc+YCsH1gDhCTNIsDNqr48jxAYVJ9zQxLPNpImBP6wOEuOwjyH9cKYgKS7IszzqZ7rZIpOviPHOtQAoPZaUzEBLTzBF6uMUukN2qhcpq4CsjAL2Vvj7KdVtVHRrWIoNgotxV2Z2+IURanUHOoYh4r0fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq7791NpKf481DHXXIDn4VCj+OpHzaSrtQ5uu+cjR/4=;
 b=Jq/ZpKJPWwncoV0ZnCZBdNyOm90LmhB7YWuRBxRENo0cFpbJpO+Ygto33dyQvQ3bAvVI0o19mkBpSYfFOTNq/HYGHOVF8yHjKSxHot8d31uE8XJHtVS2Kq+dpqbXcLJFjo5sHTED5SA7eHBbmvtAx6NeJl8Wt05LhuwPc14l8b0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VE1PR04MB6640.eurprd04.prod.outlook.com (2603:10a6:803:122::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 15:11:36 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4%4]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 15:11:36 +0000
Date:   Tue, 16 Nov 2021 17:11:33 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Saravana Kannan <saravanak@google.com>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, kernel-team@android.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-oxnas@groups.io, linux-renesas-soc@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/2] drivers: bus: simple-pm-bus: Add support for
 probing simple bus only devices
Message-ID: <YZPKJWtd2VqvufFe@ryzen>
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-2-saravanak@google.com>
 <YYu4EglV7SBZU2Iy@ryzen>
 <CAGETcx_m3f5JgrKQXZ5DUxDkpGhAau9G8uYm8a0iQ8JbcD0Rtg@mail.gmail.com>
 <CAGETcx_a-d7qQNi3sUce3AzbPcvGJK5JSuiiHm4h4e_q-MT7Dg@mail.gmail.com>
 <YZO5L7BJuLi5YjWr@ryzen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZO5L7BJuLi5YjWr@ryzen>
X-ClientProxiedBy: VI1PR07CA0214.eurprd07.prod.outlook.com
 (2603:10a6:802:58::17) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
Received: from ryzen (5.12.226.136) by VI1PR07CA0214.eurprd07.prod.outlook.com (2603:10a6:802:58::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.17 via Frontend Transport; Tue, 16 Nov 2021 15:11:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39e91164-0610-4554-9d2c-08d9a91361cb
X-MS-TrafficTypeDiagnostic: VE1PR04MB6640:
X-Microsoft-Antispam-PRVS: <VE1PR04MB664095A60C5BB6EFC74A9EF0F6999@VE1PR04MB6640.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ry19zhwTvC9rgr5e8cGK+hGa/HiYsMLs97xETSuW4/9UsSz20EtPlL9j+Z7L3o1pc/UQzArNLkSN0p1GM1LRoSPgmZ3UUjGgGdY/o0MAmqnip5mN3tvd0Ms5zz0Bd1IsaX3DivkEYJiU9IbB801wfamuwiGmDHxZR6PwK3gBuWH/MJgW7B733gFYDERoNRak5byw5sXvdgcuHxWOopGvv/QqBZRPJ7HomG2nN3uK7CkgsUetu72msVH/EuHK74ReaFwYq5imNx8hbgeCPU09kuEHD9SZZZw2HtrYYnhp3gI6uw9X262jaZgdg6R97ALMVc3cv30voqHRHYSNppZuXR3/ekvuXV1ZMMzErrHqpJmxVOMlqyJ3Ii7bJinyn7bcPETcbpXChW3jy03B3k7ULgKa5TSMY05DalO1q/hQsV9lUnB5gG/79Z3iNjfKSJN9NsfJ3roRga8wDSCRecHeLglYp1VmoR1ARlwfpd7Hrrda0kcZ1Cj+R6HTfTWsfwy0bNOyFARGemAxfitwyPV36C5HyNiIa0KMUs6mUTdBJ/gaiT4CQV5RgRLSaGHKlBhCq2Lrtk+/jj7tx26ehCNlwNnq00c8GOrF3mcYto/yeN2RdbRflA9vq1VeF4ZbbQ79WIjb9TScx+/nMpzS4iJk/LliJtQ3EVESxoJSxL+G56yg8DMXsX4EHfgnpXApPLuc6fAYFtQtVNvnWZh15pgi5IUDpzIlmsBpFqeAQxFcnyjevy+lYw7ho6ixAfAqtAWRMjs/tjr73NcTp8V+L4dF23BTU/L06tleQCm27G+Tfg1cCTZbyaOo8L3yp2JQcIj58oqn0mJCFOfEnD0lBydz6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(26005)(38100700002)(55016002)(86362001)(45080400002)(9686003)(38350700002)(8676002)(8936002)(186003)(7416002)(956004)(508600001)(53546011)(2906002)(4326008)(83380400001)(5660300002)(66476007)(66946007)(54906003)(66556008)(33716001)(52116002)(44832011)(316002)(6916009)(9576002)(6496006)(966005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TgvtXc7ifeF9qpxFowyDqzWOWG49Px3hmo9fzZZNDJ6AB7REelFIqGQoJDbT?=
 =?us-ascii?Q?EoXIs/t/YY9wBJjmT7vL/FCiJdm2pkms3xTYGnSiV3t6h/vSoGJKIHH6c7/g?=
 =?us-ascii?Q?IYsZIfuh/eWQEgGvFsFJmJ4G2jg+m/gMLE75CWRsvI1AnxCTsSR9YpL81hSr?=
 =?us-ascii?Q?0VPSJ+46T/LlW97sC0XYiKvpXWD7x5dRgpIFFRgviomkoaTNQlspVfkj12RN?=
 =?us-ascii?Q?IWIHH6W5idCfRtVrhdM8+zOhOAudvBQ0TreikdF39z6+f8pezv06RvYTASys?=
 =?us-ascii?Q?MznjvYCzLEvwRrEMaSVueBp6+wo+7zLkhL50cRW9360XUSaF5ztDjDicAURE?=
 =?us-ascii?Q?1zuPhA7IG60i7WO/U3BSlUkUuoEYX/zL9WlGxKBdHHSkdkcVFBAVK4rxwruJ?=
 =?us-ascii?Q?WzmDJjb6HxiPhTEoXwUjmTdx9PhtaMRr+Xg1+KGkS8AcCgaenSCLjTxz1zIG?=
 =?us-ascii?Q?pbI9xob1WElZluwSe9FOZ+2VuSz93UKh6HA2/Fw13bs2aJd+W2OEIz8vbCUt?=
 =?us-ascii?Q?Y674ObPb3PTLvCbl5E1pA5BCSdEX5daV4VFgMp11hKvG4y0mwuXi1FwwT1Et?=
 =?us-ascii?Q?HmwEIcZJe1uWay4ostGqqH35kK1L/LPgR1M/6kKWr5aU7cfnm8+OYrUWKNBS?=
 =?us-ascii?Q?B3IeMeixNDaiu9Ye5n2AUWOWY762m/2Y3pW9rHDHQtQeDNYgIw3zkmfSLVoH?=
 =?us-ascii?Q?SSCbhM5prWzGsh1nLZTlTVtL2cIuIcaRlEHxFScwNQmz0vVUshBDCOtiQY1P?=
 =?us-ascii?Q?RwVLXxnJNzGrk8+2ivKkWJVX0xAm1zo1A08/KDL9UUoyaszZCueBvXt0p6f/?=
 =?us-ascii?Q?rRMjFI2L92tKcGY5i9tNLXyeuDUF+MJeUqYIPzZO/vYuebThiqingqB2iPFc?=
 =?us-ascii?Q?/QEjKp+c03keYM/Jun6GM8f9crcOQIYYD1dOHQzYBg0ayUZiT0HOdGxg8m0u?=
 =?us-ascii?Q?QtnTDC5ttbbKYW7aiFeTqnOh/MSG9hAJS4lPB4Po+0Ubs/u4nS1kNPqqkVvA?=
 =?us-ascii?Q?DBBRY6NrakFMnqW34CWncPPFh5qDymh6d3nA29yZyJSfsvL70x528cxN09pY?=
 =?us-ascii?Q?cWKwV2qdBY3F9Y1tCfEduJuU7rljLdxfZwy82d3vMefSIvjOy8XDu5lAO8r8?=
 =?us-ascii?Q?6jwCi7DyDj8kDNNa/op7Yn9MTGQwkXN+kdcBFp3+SwX7NIb6Y7dVVktz0lm0?=
 =?us-ascii?Q?ET3FpmcwFJbB118xZhHc/z3lLG8ILif02A+4pSyCy6m/QKio8PBu9mSpD8Cw?=
 =?us-ascii?Q?CeDd0Qm4H1C9KAL+7V+AJu/iJndjTEarASgGL3EWtYGhfSwYjdNVRRWfIAmT?=
 =?us-ascii?Q?xZA9ZeFsfHoak2B+GOAPwKMFQBKwHfgsBLk9OM0/DM0UuatqZoGHbNWHFm+3?=
 =?us-ascii?Q?zq/IqwXodQfgV2zH00l7KpNUbFb0ESKeUcFs6x1/49L4L5OZgTLntMDDaIfI?=
 =?us-ascii?Q?uW4fTT+BByu3KCO+brfTmDbdqn4oM09qfc96mSD89yq2vDLnN6/xXx+J/xKz?=
 =?us-ascii?Q?cFtOOHYyY7uPbUe/kFod19gI9vwUtlMSJp8viqCkRn7tCRz7jtdaetGXjiVi?=
 =?us-ascii?Q?1GRMmFn1XmfA75GZw8M0MoZck9LdypgQychaCnEjl2GHldtj7YMoJgSPWCxF?=
 =?us-ascii?Q?OGeXKP9jpf+X6Pd/me8BacQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 39e91164-0610-4554-9d2c-08d9a91361cb
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:11:36.2291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lw9sxWsXoNwqUJ++8hhR/vK/xjTkY+/EACsJNKn61cRPs4Zid6PpjqbXhRgmJ/PhcS++jlXUhyaDNnAqw1vp0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6640
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21-11-16 15:59:11, Abel Vesa wrote:
> On 21-11-15 12:17:46, Saravana Kannan wrote:
> > On Wed, Nov 10, 2021 at 12:24 PM Saravana Kannan <saravanak@google.com> wrote:
> > >
> > > On Wed, Nov 10, 2021 at 4:16 AM Abel Vesa <abelvesa@kernel.org> wrote:
> > > >
> > > > On 21-09-28 17:07:33, Saravana Kannan wrote:
> > > > > fw_devlink could end up creating device links for bus only devices.
> > > > > However, bus only devices don't get probed and can block probe() or
> > > > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > > > devices using the simple-pm-bus driver.
> > > > >
> > > > > However, there are instances of devices that are not simple buses (they get
> > > > > probed by their specific drivers) that also list the "simple-bus" (or other
> > > > > bus only compatible strings) in their compatible property to automatically
> > > > > populate their child devices. We still want these devices to get probed by
> > > > > their specific drivers. So, we make sure this driver only probes devices
> > > > > that are only buses.
> > > > >
> > > > > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > > > > Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
> > > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > > Tested-by: Saravana Kannan <saravanak@google.com>
> > > > > Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > ---
> > > > >  drivers/bus/simple-pm-bus.c | 42 ++++++++++++++++++++++++++++++++++---
> > > > >  1 file changed, 39 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> > > > > index 01a3d0cd08ed..6b8d6257ed8a 100644
> > > > > --- a/drivers/bus/simple-pm-bus.c
> > > > > +++ b/drivers/bus/simple-pm-bus.c
> > > > > @@ -13,11 +13,36 @@
> > > > >  #include <linux/platform_device.h>
> > > > >  #include <linux/pm_runtime.h>
> > > > >
> > > > > -
> > > > >  static int simple_pm_bus_probe(struct platform_device *pdev)
> > > > >  {
> > > > > -     const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> > > > > -     struct device_node *np = pdev->dev.of_node;
> > > > > +     const struct device *dev = &pdev->dev;
> > > > > +     const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> > > > > +     struct device_node *np = dev->of_node;
> > > > > +     const struct of_device_id *match;
> > > > > +
> > > > > +     /*
> > > > > +      * Allow user to use driver_override to bind this driver to a
> > > > > +      * transparent bus device which has a different compatible string
> > > > > +      * that's not listed in simple_pm_bus_of_match. We don't want to do any
> > > > > +      * of the simple-pm-bus tasks for these devices, so return early.
> > > > > +      */
> > > > > +     if (pdev->driver_override)
> > > > > +             return 0;
> > > > > +
> > > > > +     match = of_match_device(dev->driver->of_match_table, dev);
> > > > > +     /*
> > > > > +      * These are transparent bus devices (not simple-pm-bus matches) that
> > > > > +      * have their child nodes populated automatically.  So, don't need to
> > > > > +      * do anything more. We only match with the device if this driver is
> > > > > +      * the most specific match because we don't want to incorrectly bind to
> > > > > +      * a device that has a more specific driver.
> > > > > +      */
> > > > > +     if (match && match->data) {
> > > > > +             if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > > > > +                     return 0;
> > > > > +             else
> > > > > +                     return -ENODEV;
> > > > > +     }
> > > >
> > > > This change is breaking the expected behavior for the already existent
> > > > simple-bus nodes. All the simple-bus compatibles should be replaced now
> > > > to simple-pm-bus. In my case, on some i.MX8 platforms, without the
> > > > devlink, the devices suspend sequence changes (and even breaks).
> > > >
> > > > To avoid breaking the already existent simple-bus nodes, maybe the logic
> > > > should've been reversed: keep the simple-bus as is and add another
> > > > compatible, IDK, something like simple-trasnparent-bus, or something.
> > >
> > > The intent of this change IS to affect existing simple-bus nodes (but
> > > not in the way it's affecting you). But if it's breaking stuff, we
> > > obviously need to fix it.
> > >
> > > I have a hunch on what's going on in your case, but can you point me
> > > to the specific simple-bus node that's getting affected? I'm expecting
> > > it to be a simple-bus node that gets added AFTER this driver is
> > > registered at device_initcall (module_init gets converted to
> > > device_initcall).
> > >
> 
> Well, for now, I can't pinpoint exactly one specific dts node.
> My usecase is a little bit more complicated since it's only happening
> in conjunction with a local change in the imx-mu-irq driver
> in our local tree. Basically, the local change is forcing a suspend abort by
> calling pm_system_wake if there is an irq from SCU triggered after the
> suspend noirq imx-mu-irq driver callback has been called.
> If we replace all the simple-bus with simple-pm-bus, everything works
> fine. 
> 
> > > Also, can you try this hack patch to see if it helps your case?
> > > https://lore.kernel.org/lkml/CAGETcx9U130Oq-umrvXME4JhEpO0Wadoki3kNxx=0-YvTR6PtQ@mail.gmail.com/
> > >
> 
> Nope, it doesn't work with this patch either.
> 
> And the funny thing is, even if I add the pm_runtime_enable to your patch
> like this:
> 
> diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> index 6b8d6257ed8a..a13324fd700b 100644
> --- a/drivers/bus/simple-pm-bus.c
> +++ b/drivers/bus/simple-pm-bus.c
> @@ -38,9 +38,11 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
>          * a device that has a more specific driver.
>          */
>         if (match && match->data) {
> -               if (of_property_match_string(np, "compatible", match->compatible) == 0)
> +               if (of_property_match_string(np, "compatible", match->compatible) == 0) {
> +                       pm_runtime_enable(&pdev->dev);
> +                       of_platform_populate(np, NULL, lookup, &pdev->dev);
>                         return 0;
> -               else
> +               } else
>                         return -ENODEV;
>         }
> 
> I get the following warning:
> 
> [    1.009392] ------------[ cut here ]------------
> [    1.013681] Enabling runtime PM for inactive device (bus@5d000000) with active children
> [    1.021721] WARNING: CPU: 3 PID: 1 at drivers/base/power/runtime.c:1439 pm_runtime_enable+0xc0/0x100
> [    1.030794] Modules linked in:                                              
> [    1.033837] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.15.0-04906-gc0a8c67532b6-dirty #226
> [    1.042175] Hardware name: Freescale i.MX8QXP MEK (DT)
> [    1.047302] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    1.054248] pc : pm_runtime_enable+0xc0/0x100
> [    1.058594] lr : pm_runtime_enable+0xc0/0x100
> [    1.062938] sp : ffff800011e4bb60                                           
> [    1.066237] x29: ffff800011e4bb60 x28: 0000000000000000 x27: ffff8000119204d0
> [    1.073361] x26: ffff8000119c1060 x25: ffff8000119c1078 x24: ffff80001190f0a0
> [    1.080484] x23: 0000000000000000 x22: 0000000000000000 x21: ffff0008006a00f4
> [    1.087608] x20: 0000000000000000 x19: ffff0008006a0010 x18: 0000000000000030
> [    1.094732] x17: 6974636120687469 x16: 7720293030303030 x15: 3064354073756228
> [    1.101856] x14: 2065636976656420 x13: ffff800011c21dc0 x12: 0000000000000246
> [    1.108981] x11: 00000000000000c2 x10: ffff800011c79dc0 x9 : 00000000fffff000
> [    1.116103] x8 : ffff800011c21dc0 x7 : ffff800011c79dc0 x6 : 0000000000000000
> [    1.123227] x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 00000000ffffefff
> [    1.130351] x2 : ffff800011c21d30 x1 : 6bf7c63081c63600 x0 : 0000000000000000
> [    1.137478] Call trace:                                                     
> [    1.139910]  pm_runtime_enable+0xc0/0x100
> [    1.143903]  simple_pm_bus_probe+0x80/0xf0
> [    1.147986]  platform_probe+0x6c/0xe0
> [    1.151637]  really_probe.part.0+0x9c/0x310
> [    1.155805]  __driver_probe_device+0x98/0x144
> [    1.160149]  driver_probe_device+0xc8/0x15c
> [    1.164319]  __driver_attach+0xfc/0x190
> [    1.168141]  bus_for_each_dev+0x70/0xc0
> [    1.171964]  driver_attach+0x28/0x3c                                        
> [    1.175526]  bus_add_driver+0x108/0x1f0
> [    1.179348]  driver_register+0x7c/0x130
> [    1.183173]  __platform_driver_register+0x2c/0x40
> [    1.187862]  simple_pm_bus_driver_init+0x20/0x2c
> [    1.192466]  do_one_initcall+0x54/0x1bc
> [    1.196289]  kernel_init_freeable+0x210/0x294
> [    1.200633]  kernel_init+0x28/0x130                                         
> [    1.204110]  ret_from_fork+0x10/0x20                                        
> [    1.207678] ---[ end trace 719a02e69bfeb03f ]---
> 
> though it should be behaving exactly like in the case of simple-pm-bus.
> 
> Maybe I'm missing something here.
> 
> I'll keep digging.
> 

One more thing.

So basically, your already upstream patch removes the devlinks for all the simple-bus
nodes.

By adding your hack patch, it also removes devlinks between subnodes of the simple-bus
node.

> > > I have some thoughts on how I could fix this, but I need to think
> > > about a few cases.
> > 
> > Hi Abel,
> > 
> > Friendly reminder.
> > 
> 
> Sorry for the late reply.
> 
> > -Saravana
