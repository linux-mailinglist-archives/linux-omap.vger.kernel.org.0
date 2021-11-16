Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 315AA45336C
	for <lists+linux-omap@lfdr.de>; Tue, 16 Nov 2021 14:59:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236991AbhKPOCP (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 16 Nov 2021 09:02:15 -0500
Received: from mail-eopbgr20076.outbound.protection.outlook.com ([40.107.2.76]:38015
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236905AbhKPOCO (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Tue, 16 Nov 2021 09:02:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ifDMrSr77wTewA8ixhWBPnOML3oLcpkiKBweQe60gGhj5IfD0EKsiojvd/6B9Rp82fJJVVfacrrhUNY1Cciv9wcPjj19fiP0JQB/RX7WUurbFM82eRvaf1tIXOyL6cPPBRRVJpohyGbfv4yGR2OuzOGlFBNp20221ySWUc+hYUtIbxyhtIkzHbBjwWM3zyhA5r3c/U1N+c4hnwuRe0lfK7XdidFfx/7mfemniRfWfjeoshFRX7opt6N9LDcrfZSz4NlesiegF70P/n9mckZlb8HrUd9vWcMKbLk4+VoOmgtK4pqoWenH6ZsTrKpr/wweBm5uKnN66FfQF+iblQJN1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORgKeB9jxxYcXgBPa1ig2zC/n30QpGYQLiCov66cFzY=;
 b=gVkSLyxGa49fjZHPJwDhceSjw1Lp3CM6HTWzL8gQzIQYsb6zDWhQcjtit3XooVXHBtpSVOVjC63fE7/zPuqXD1HtK5GRWWHUL4m/DRUdr3puBJbM0ZDtbQqs52Ah0jLakaVM8N0LPHMnCNIYf4jlb8YiXXA3BdWCZFmBPsIDmKofaQnittjkE5WacpoQwAGljFP5tVuLmi9MS5e+jTTuBIpnPCwT1/I+KuxEXgmfjyhQ2lc40apBNI37+Cr7og3p0g/zcT4TPb4PeRpAuVqzKc0oTLcMxcnOjlEJ0wdbgYaHxSLXgKt2opBqu8bMfiv9VV7HB/ixe2wgO+RIJkX8BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORgKeB9jxxYcXgBPa1ig2zC/n30QpGYQLiCov66cFzY=;
 b=H28iE6fqRMFJOXuZwbdsJ2Vm/+4NbYOTDHRrK9iElzYXm+PeQkAduXrOmpDayAfwds3FmzTMGQNsapNB/JTJkMTjE/rGL8AiO8X1T4wGH0dJET+sOYR3JTRPU9PMjVOznGCGysYOT16sp8J2SGbtdXnyQfYP+vR+boQUcAq5Rlw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VI1PR0402MB3406.eurprd04.prod.outlook.com (2603:10a6:803:c::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 13:59:13 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4%4]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 13:59:13 +0000
Date:   Tue, 16 Nov 2021 15:59:11 +0200
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
Message-ID: <YZO5L7BJuLi5YjWr@ryzen>
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-2-saravanak@google.com>
 <YYu4EglV7SBZU2Iy@ryzen>
 <CAGETcx_m3f5JgrKQXZ5DUxDkpGhAau9G8uYm8a0iQ8JbcD0Rtg@mail.gmail.com>
 <CAGETcx_a-d7qQNi3sUce3AzbPcvGJK5JSuiiHm4h4e_q-MT7Dg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGETcx_a-d7qQNi3sUce3AzbPcvGJK5JSuiiHm4h4e_q-MT7Dg@mail.gmail.com>
X-ClientProxiedBy: VI1PR06CA0109.eurprd06.prod.outlook.com
 (2603:10a6:803:8c::38) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
Received: from ryzen (5.12.226.136) by VI1PR06CA0109.eurprd06.prod.outlook.com (2603:10a6:803:8c::38) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.25 via Frontend Transport; Tue, 16 Nov 2021 13:59:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 155106ab-f2fb-42cb-239c-08d9a9094571
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3406:
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3406EAD9DE33AFE00D4B0A38F6999@VI1PR0402MB3406.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hsZ2O603XjfHjtKIF/7mGDcRmuEd3Br6fxx2WYK1z9KYlQkZv/029lcYBnkodcQP/a541utTVvmzWomwsUbEM/PJPd8Yi/bqJoJdLq9NDnypuwq1ArERQlfHJmMlxTGACWvu8V9zpUUtPFHDMd366sZMdd/J5LR62t0n6OUX6rTgxnfBR2XdwNfTbcWTBOBNgnOWmOC995Hnfwp9EH+BDl4DnRFCqqy1pkx5vyJHsL9/P9sAGYLVQv5iPDJepUkTrKTOxcdNRcAVdpoxjZzp9FQ3uWV3ZPrddZ+BbkFTmJA3p75B9K0Nt/l24kMaGXI968CH98DnfinH9yrrDzLx5GoVQTdoeUYaKeGgP0mtM5fWaWg0nUJYIMG/RkSoy6RiZIL/flzSBa2i+EgPd8EEInfJ7Ji1p8iXr4bOUHip8Nahp7Z/at2HB1mThkg37kJzHtRJkQqX8xwIgU2MtC5dHeGsvdLrF505aVITrV0Y5BFdb5z1bDDi1KT0oL7qYkakvgOzy/NiliNMk2StZ2wSO5+N/YeBNBJVPOuNJ4ROnDny/vq+BRug8GkZqC7iOPs/irm4c1F4Fsf1EvJ3J0zyKDAAYCta6R29fxk+Y7eOyAN8fbtcFU9/0OJ7MPu3dYzqQimFjujug7pQuoLnXueFLjfGkItYLY+6msTO+zDEm7+XHg3abGc6id9hDKWGEsgA6cUMrKubCF0ou0qwax0r1qZsqY3dR25V00qydUYt+VFGRoU3zU+i+FRKyeM1033P3e1UT2UJ12G770yH7psHyLGgqDOTYfSwXEjk6cCKIx8GU3GsJsH5F4bzLqg1oZEnjU+WRccHdoYVgtM3axNrmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(66476007)(2906002)(54906003)(316002)(38100700002)(6916009)(5660300002)(966005)(55016002)(38350700002)(9686003)(956004)(44832011)(45080400002)(508600001)(33716001)(83380400001)(66946007)(26005)(7416002)(4326008)(53546011)(186003)(6496006)(52116002)(9576002)(8676002)(86362001)(8936002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mNsLc/e01cQCg9rPtxflb+22N1fUT05YP4t/LaW2v14QzJ7LPeSvLDiTGs2W?=
 =?us-ascii?Q?DMeyTP2TrWWlRDxCh+/ku141GpWtSjEpKjkqE6pm84v9ZqRe0Uq+4pItm89R?=
 =?us-ascii?Q?huzfA0eryOI70K8gHDZFkwVlbFKVMmxwdKwjaf9NIjVXfLiDCgfDs8Lz2BFz?=
 =?us-ascii?Q?avVjfbux70jpLYWeYnD+DaZcV1+2PdiYqVBBBKvkP8hGPNpvcSZAWNnUncq9?=
 =?us-ascii?Q?nNBeTGQm5sO+xRIJo27su/QgppY2TNsp0IZKm9PAS9uyiNCoWW2uNQU9xDkE?=
 =?us-ascii?Q?TAPr6PS5a3F8MoP3ASJ7aCvJI8okN4ChYJnZ4OV1R9i77eq/JdcuCXK3+KfX?=
 =?us-ascii?Q?0V616/WMuA1zo3Mj4MdXwnSsO83BpsnGjDi+8P5wsUj/EFG8lQEeR0o9N0+s?=
 =?us-ascii?Q?5lBnlc4AhiY2yBhaboDq40nflOTG4fU86plxlIC4dU/UdvCFL4GITSmBS2fm?=
 =?us-ascii?Q?4csUNLAu0GLLRNCp8E0L4pLAG6VKPfsdBaYnycd83W1Ve2gHYPPS5UJ66K/P?=
 =?us-ascii?Q?Paq/RNZ81bW2jLDDEPZai198NYJGlEmIFF6aWI1yzHAkontuzg+EXkcyKEGG?=
 =?us-ascii?Q?63bjTfREmLpA6MJbNljfrg55MVrHHTRCRbFE7JPAKKwToQaFq++rEi5z68E5?=
 =?us-ascii?Q?qNyvVNisCa0ZYutlPtb7SDe/PLSBP57kDA907fDBcHs7iEIJXxsxYkKDHctq?=
 =?us-ascii?Q?bMerEmVlwFakMkiodPPJDL89nn6mk3JFxWdDnF2e/Vc6auBMwgdQlQhLZUTd?=
 =?us-ascii?Q?+YB3VuysrHRIh9jt+d1kx5gEp9HVs2QusJ4CGy1l/PaTGQ/EnsWEu3UUoPDJ?=
 =?us-ascii?Q?FeY9P+x0m6w92Tg8GBWbyz8sx+TaS1dOCQKkPirKlSJrXtT9APsMDJ4nwT0x?=
 =?us-ascii?Q?ADY9bI5uv9Oc9e2i/xsrLAcpxE3MrZHFWjByeaD6shNcenT+J1hOuXTBSuqq?=
 =?us-ascii?Q?vpy2hehcMiPqBZ2JELApoH5B0iY/lKyxeIVr6el8QIYNZnS+nsqCxfSoo/CU?=
 =?us-ascii?Q?Kjoj69aWh1icKRoK27VaMl5FcIhZ9bT9ad5iPswA1tTnhX6CpkSvkgIf499g?=
 =?us-ascii?Q?2LF+ZjOFqg0lZK45Mo/YUgrwPIsiuvbT4AEih+uZQ9hL3rE8Jnx8/E5koK0c?=
 =?us-ascii?Q?SLZiB0/nRwTNfFx7xb6uOlVNBQN49Sn44kfYyCtdFzx/5NZQO/scoA4bAs+f?=
 =?us-ascii?Q?Y+dI0Hg6iT3SFFXBa3TYRL57Weqau8fQxHnfmzf4z9xAbUK0Pkavaz8xXznp?=
 =?us-ascii?Q?lhcH0kU7CV3sOcqnBVwivTTaxJjMlZEc91HvOH57W83fS7ZgO6e7Np2Ag8au?=
 =?us-ascii?Q?YcoER/thfqBSrlv2JjB7xNFCBOeheAR44WL4XHZP5kOrvhSQf9Ar1Lx7FuzW?=
 =?us-ascii?Q?rHH8RQWbfDa0gbVIPPn03X/dGGZVOT/qbPk/kccq6zAPiLyJ4DFO0eZUlCD1?=
 =?us-ascii?Q?3W/U0J6fhgXG8ZzosEzA+4bSf118yuR3E6fzqhsY2Srut/ZWNv6LGoIgVbgj?=
 =?us-ascii?Q?t5Qhpv78+2jxvLoEUpEvbbY0s0Zl/gV4bZHeJlWlrglIx4Gshn9w5rOkm8oL?=
 =?us-ascii?Q?Fb7DZY9jqotjt2ToErFZ8u2ihj4t+LOWoIzU0NE9k0lKxWYO6bCaHKFycaX5?=
 =?us-ascii?Q?9d8ZS6+onMb8aDkvkEwQv6g=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 155106ab-f2fb-42cb-239c-08d9a9094571
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 13:59:13.7036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gG8pPavJxYyx8ZNeB5QHGm4pSE/EThJGSuWnvamMyP5QNLeovTL0r8U6qWm40xvZE6uz4BwoD7Rh8rKg212uOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3406
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21-11-15 12:17:46, Saravana Kannan wrote:
> On Wed, Nov 10, 2021 at 12:24 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Wed, Nov 10, 2021 at 4:16 AM Abel Vesa <abelvesa@kernel.org> wrote:
> > >
> > > On 21-09-28 17:07:33, Saravana Kannan wrote:
> > > > fw_devlink could end up creating device links for bus only devices.
> > > > However, bus only devices don't get probed and can block probe() or
> > > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > > devices using the simple-pm-bus driver.
> > > >
> > > > However, there are instances of devices that are not simple buses (they get
> > > > probed by their specific drivers) that also list the "simple-bus" (or other
> > > > bus only compatible strings) in their compatible property to automatically
> > > > populate their child devices. We still want these devices to get probed by
> > > > their specific drivers. So, we make sure this driver only probes devices
> > > > that are only buses.
> > > >
> > > > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > > > Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
> > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > Tested-by: Saravana Kannan <saravanak@google.com>
> > > > Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > ---
> > > >  drivers/bus/simple-pm-bus.c | 42 ++++++++++++++++++++++++++++++++++---
> > > >  1 file changed, 39 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> > > > index 01a3d0cd08ed..6b8d6257ed8a 100644
> > > > --- a/drivers/bus/simple-pm-bus.c
> > > > +++ b/drivers/bus/simple-pm-bus.c
> > > > @@ -13,11 +13,36 @@
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/pm_runtime.h>
> > > >
> > > > -
> > > >  static int simple_pm_bus_probe(struct platform_device *pdev)
> > > >  {
> > > > -     const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> > > > -     struct device_node *np = pdev->dev.of_node;
> > > > +     const struct device *dev = &pdev->dev;
> > > > +     const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> > > > +     struct device_node *np = dev->of_node;
> > > > +     const struct of_device_id *match;
> > > > +
> > > > +     /*
> > > > +      * Allow user to use driver_override to bind this driver to a
> > > > +      * transparent bus device which has a different compatible string
> > > > +      * that's not listed in simple_pm_bus_of_match. We don't want to do any
> > > > +      * of the simple-pm-bus tasks for these devices, so return early.
> > > > +      */
> > > > +     if (pdev->driver_override)
> > > > +             return 0;
> > > > +
> > > > +     match = of_match_device(dev->driver->of_match_table, dev);
> > > > +     /*
> > > > +      * These are transparent bus devices (not simple-pm-bus matches) that
> > > > +      * have their child nodes populated automatically.  So, don't need to
> > > > +      * do anything more. We only match with the device if this driver is
> > > > +      * the most specific match because we don't want to incorrectly bind to
> > > > +      * a device that has a more specific driver.
> > > > +      */
> > > > +     if (match && match->data) {
> > > > +             if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > > > +                     return 0;
> > > > +             else
> > > > +                     return -ENODEV;
> > > > +     }
> > >
> > > This change is breaking the expected behavior for the already existent
> > > simple-bus nodes. All the simple-bus compatibles should be replaced now
> > > to simple-pm-bus. In my case, on some i.MX8 platforms, without the
> > > devlink, the devices suspend sequence changes (and even breaks).
> > >
> > > To avoid breaking the already existent simple-bus nodes, maybe the logic
> > > should've been reversed: keep the simple-bus as is and add another
> > > compatible, IDK, something like simple-trasnparent-bus, or something.
> >
> > The intent of this change IS to affect existing simple-bus nodes (but
> > not in the way it's affecting you). But if it's breaking stuff, we
> > obviously need to fix it.
> >
> > I have a hunch on what's going on in your case, but can you point me
> > to the specific simple-bus node that's getting affected? I'm expecting
> > it to be a simple-bus node that gets added AFTER this driver is
> > registered at device_initcall (module_init gets converted to
> > device_initcall).
> >

Well, for now, I can't pinpoint exactly one specific dts node.
My usecase is a little bit more complicated since it's only happening
in conjunction with a local change in the imx-mu-irq driver
in our local tree. Basically, the local change is forcing a suspend abort by
calling pm_system_wake if there is an irq from SCU triggered after the
suspend noirq imx-mu-irq driver callback has been called.
If we replace all the simple-bus with simple-pm-bus, everything works
fine. 

> > Also, can you try this hack patch to see if it helps your case?
> > https://lore.kernel.org/lkml/CAGETcx9U130Oq-umrvXME4JhEpO0Wadoki3kNxx=0-YvTR6PtQ@mail.gmail.com/
> >

Nope, it doesn't work with this patch either.

And the funny thing is, even if I add the pm_runtime_enable to your patch
like this:

diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
index 6b8d6257ed8a..a13324fd700b 100644
--- a/drivers/bus/simple-pm-bus.c
+++ b/drivers/bus/simple-pm-bus.c
@@ -38,9 +38,11 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
         * a device that has a more specific driver.
         */
        if (match && match->data) {
-               if (of_property_match_string(np, "compatible", match->compatible) == 0)
+               if (of_property_match_string(np, "compatible", match->compatible) == 0) {
+                       pm_runtime_enable(&pdev->dev);
+                       of_platform_populate(np, NULL, lookup, &pdev->dev);
                        return 0;
-               else
+               } else
                        return -ENODEV;
        }

I get the following warning:

[    1.009392] ------------[ cut here ]------------
[    1.013681] Enabling runtime PM for inactive device (bus@5d000000) with active children
[    1.021721] WARNING: CPU: 3 PID: 1 at drivers/base/power/runtime.c:1439 pm_runtime_enable+0xc0/0x100
[    1.030794] Modules linked in:                                              
[    1.033837] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.15.0-04906-gc0a8c67532b6-dirty #226
[    1.042175] Hardware name: Freescale i.MX8QXP MEK (DT)
[    1.047302] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    1.054248] pc : pm_runtime_enable+0xc0/0x100
[    1.058594] lr : pm_runtime_enable+0xc0/0x100
[    1.062938] sp : ffff800011e4bb60                                           
[    1.066237] x29: ffff800011e4bb60 x28: 0000000000000000 x27: ffff8000119204d0
[    1.073361] x26: ffff8000119c1060 x25: ffff8000119c1078 x24: ffff80001190f0a0
[    1.080484] x23: 0000000000000000 x22: 0000000000000000 x21: ffff0008006a00f4
[    1.087608] x20: 0000000000000000 x19: ffff0008006a0010 x18: 0000000000000030
[    1.094732] x17: 6974636120687469 x16: 7720293030303030 x15: 3064354073756228
[    1.101856] x14: 2065636976656420 x13: ffff800011c21dc0 x12: 0000000000000246
[    1.108981] x11: 00000000000000c2 x10: ffff800011c79dc0 x9 : 00000000fffff000
[    1.116103] x8 : ffff800011c21dc0 x7 : ffff800011c79dc0 x6 : 0000000000000000
[    1.123227] x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 00000000ffffefff
[    1.130351] x2 : ffff800011c21d30 x1 : 6bf7c63081c63600 x0 : 0000000000000000
[    1.137478] Call trace:                                                     
[    1.139910]  pm_runtime_enable+0xc0/0x100
[    1.143903]  simple_pm_bus_probe+0x80/0xf0
[    1.147986]  platform_probe+0x6c/0xe0
[    1.151637]  really_probe.part.0+0x9c/0x310
[    1.155805]  __driver_probe_device+0x98/0x144
[    1.160149]  driver_probe_device+0xc8/0x15c
[    1.164319]  __driver_attach+0xfc/0x190
[    1.168141]  bus_for_each_dev+0x70/0xc0
[    1.171964]  driver_attach+0x28/0x3c                                        
[    1.175526]  bus_add_driver+0x108/0x1f0
[    1.179348]  driver_register+0x7c/0x130
[    1.183173]  __platform_driver_register+0x2c/0x40
[    1.187862]  simple_pm_bus_driver_init+0x20/0x2c
[    1.192466]  do_one_initcall+0x54/0x1bc
[    1.196289]  kernel_init_freeable+0x210/0x294
[    1.200633]  kernel_init+0x28/0x130                                         
[    1.204110]  ret_from_fork+0x10/0x20                                        
[    1.207678] ---[ end trace 719a02e69bfeb03f ]---

though it should be behaving exactly like in the case of simple-pm-bus.

Maybe I'm missing something here.

I'll keep digging.

> > I have some thoughts on how I could fix this, but I need to think
> > about a few cases.
> 
> Hi Abel,
> 
> Friendly reminder.
> 

Sorry for the late reply.

> -Saravana
