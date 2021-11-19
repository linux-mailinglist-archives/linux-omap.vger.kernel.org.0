Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CE684572A4
	for <lists+linux-omap@lfdr.de>; Fri, 19 Nov 2021 17:17:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236374AbhKSQUF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 19 Nov 2021 11:20:05 -0500
Received: from mail-eopbgr50071.outbound.protection.outlook.com ([40.107.5.71]:42855
        "EHLO EUR03-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S236332AbhKSQUF (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 19 Nov 2021 11:20:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ApE0OjK6G2ip+ISAnHKGB/RXcgi3sUBQO5hyVDSUKEw4FJGHZ87SsydUH1RQ//lzcIv5djjyNK/yV4+ZhJDyIG0tZc5xZd7HKvu3iZZOIyKl60I3T+96PeRFVf/r3WI187rm+LFj9P+/6HOX7ETSZ+9A4VAUTS31BMaq5Zp8YtfnPwHlC8JAR64Yhh9IcanXs/uDURV81NM573YBOl9VHc/lNn857wp7KC4JKULojPKj7X1xEqhB9C0CyMJS5lCgIcJ++ixJHGAv8kEwTweT0thg3TMA9wZGgqBKNADNbOW96z1E+pvA0dBLL2LwyMmJ4yAO7DHAdBtfcEIF26hDaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eZ2Cd5NtzU36TBRso+XW1+yK4DfjfJVxyYF0ySSrRPk=;
 b=MUSUbg04B+4ZF7zQlkd2p18nVBojoJn/Jy8T4u9TxS0hh+OD+HPNSjiPYXr1H7dKc0xfBDDnpAfhRdDZvPDaUvQdFVHHNE29B8zWjtkaxVNGFuPZXleQnaA/Kt9nlM3v+44nqBwYxk/BaB+MUWBjFe2o48Rz1xayKJk1jafmu0hXIgFsJQ4MI2oscOv9lavjehdMW9IMTEk+j58i0ZQOLwUG+Dc1/tEfd6wCCnpLNoxNY7AG84OeFSGPqHkm833DmGh10GeFBjuXEVUmbuYYL/ShF5rotNrQG7nB5/GVT0NBVBF0lP74xanxTkswdlnS48qqckkFVH2XB5B2q8A4Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eZ2Cd5NtzU36TBRso+XW1+yK4DfjfJVxyYF0ySSrRPk=;
 b=geQCtg4nPbFx/NpanFGk1+CB0DUtYdh0oMaOOVYSWSvO0GXTA3BBNsq7QP/dD8LAWO38vlUeLzCPreKrUIGw+ckJ2CwOvTOVaUCiL0HWanZxwbr/eaCO9aQQmhNhSTvTLW9AtMbCvdzk3E2aLraK7m2mu+mF0muJXacOLGlnd5s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com (2603:10a6:803:6a::30)
 by VE1PR04MB7216.eurprd04.prod.outlook.com (2603:10a6:800:1b0::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 16:17:00 +0000
Received: from VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4]) by VI1PR04MB4688.eurprd04.prod.outlook.com
 ([fe80::d0eb:49aa:2a9:9fc4%4]) with mapi id 15.20.4713.022; Fri, 19 Nov 2021
 16:17:00 +0000
Date:   Fri, 19 Nov 2021 18:16:58 +0200
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
Message-ID: <YZfN+oMqD/6howTK@ryzen>
References: <20210929000735.585237-1-saravanak@google.com>
 <20210929000735.585237-2-saravanak@google.com>
 <YYu4EglV7SBZU2Iy@ryzen>
 <CAGETcx_m3f5JgrKQXZ5DUxDkpGhAau9G8uYm8a0iQ8JbcD0Rtg@mail.gmail.com>
 <CAGETcx_a-d7qQNi3sUce3AzbPcvGJK5JSuiiHm4h4e_q-MT7Dg@mail.gmail.com>
 <YZO5L7BJuLi5YjWr@ryzen>
 <YZPKJWtd2VqvufFe@ryzen>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YZPKJWtd2VqvufFe@ryzen>
X-ClientProxiedBy: VI1PR0102CA0069.eurprd01.prod.exchangelabs.com
 (2603:10a6:803::46) To VI1PR04MB4688.eurprd04.prod.outlook.com
 (2603:10a6:803:6a::30)
MIME-Version: 1.0
Received: from ryzen (5.12.226.136) by VI1PR0102CA0069.eurprd01.prod.exchangelabs.com (2603:10a6:803::46) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 16:16:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b7d3a7e-2e26-4d79-8a97-08d9ab7803df
X-MS-TrafficTypeDiagnostic: VE1PR04MB7216:
X-Microsoft-Antispam-PRVS: <VE1PR04MB7216F6C2AA34CF8FD9CF5AE0F69C9@VE1PR04MB7216.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ds2GMhyJDHTacIQPtVd+ypau2QYDzV4CU5Nb9t82eFmLW5psJn5P96T1M8RpeHFd6XADcpcKY4s1JEjnb23qKyQP8iPvik2rqZJrGygflC5FFxs1M3szWh+BsO2ora3VfzG58RvMY62e3t9TKzaHkafUEL/QuwRpI0g/DQr1wMPEVUvjlqNp3NRAzpvMb5wBAGD6pjiVao30DusWR2K/gWVdJ1zoKawpULKDvIgDaELsjlHGW4AewpGm/1Z7v6TYZvAQJ7GPsQJt2Js8aIROZRjHuyP3vG0TAH5IoigsZDmNj4B29z1HB0wrAdS+4bwWTluIN7OzSXVRhzOgZ0/Tl5QSkXC97QKBPXdp6SnRSUxxwcIvHeiw6JKuLwcn4mQjFf1b4kw3jF4+d6qtbq3dyTgso+jSxUrozupH3j/sLiGhNOzoULqWUJkSQCTo95rt1NGFK6EMnzAByCBfOvsz30917pPA6uTEZIFvyKTH7+P8xibRNINQQLOeul+rUFj7ShlMQaRi9mdUah0XmUif8jpicDwmitpsVweMoXm2oqIHPJ/2agjRTXFAnt54tIjHSDjVaC5Z/Ua3PGwuV1AB+5A6q5ncZhJ3nSO4xjAPSD+Nxa3hmaNJOYZEPGYJIeJ9SS8dXiEYmvv3L8M9rpHubllrM7uDKuNTPiEClxWpwoH3y7rBzQ23SAoqcObjyp/UsWrCtwQx4eDnYy0tpBeBqnYXtVASnVHJFc7C8VBqqcmY3/DjtbKW3RsT17VhnGKue2dXqzQysyizpaddTCqXMxeOIxfKK8b1JBlHO4U4hX5qaoGwXgaKsBwd4R6drD3Xx753XQZS66yiBx9BHrq+5Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4688.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(4326008)(7416002)(6496006)(2906002)(38350700002)(38100700002)(66556008)(6916009)(54906003)(52116002)(83380400001)(8676002)(30864003)(66946007)(33716001)(186003)(44832011)(9686003)(316002)(9576002)(966005)(45080400002)(86362001)(66476007)(956004)(26005)(508600001)(53546011)(5660300002)(55016002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jkdKLDz6WqeyUJ3NB8N5IaftCXT6bWn8Y69RmyjThN2jXgy9T54r5lHhO6lL?=
 =?us-ascii?Q?U6d9452NszbPWUFd/UPoJHsYLls1bOLC7HiqodwrYnr9QkRTl9WhJnQrdqKN?=
 =?us-ascii?Q?qEUv6aqX/Xx3ImiYJ/2Gj1FpToke/hXWOj3XhkUvLuigO8Iill1o26VDoTYn?=
 =?us-ascii?Q?XHdd78AZYo/JabgsniCC97YRM4JJ4dHu/uUE/jPk06RB6FfozQrqXIR7HMSe?=
 =?us-ascii?Q?VaRaBs4WqTAz7NVFRA4V1Onxstfjw1dbb+2Nz35VSYby0gSqytQVlMsaeuck?=
 =?us-ascii?Q?MrHAAuYS/2YEY3C9OkKIKGo0t3P75/Fv12d8afIQscjiwaaA/wr9Qs/fm+Dh?=
 =?us-ascii?Q?fPra+Y+Z747AJzeLkpdihmD3f6uk1SBnebOpqRuYXCYqjmW6tVTn81mrhPkB?=
 =?us-ascii?Q?gPJmKTBJ6Xt8FLDAzKCStL3y6MN8gdypfyAs329R961vGNeMGMNWdGu/c0RE?=
 =?us-ascii?Q?B9DpI7KOHcLxNZpGAtf0ijSWVzFYIVXWaQcCtpC+fv/PEom3//tjOZZjL50J?=
 =?us-ascii?Q?sm72yvLEMnP4S4CnSbuZS+l0IHg0nTnFOPfn4FUHtDmHL7qwQS+1pH3Pzz5P?=
 =?us-ascii?Q?00itkh5sklTYdKPzDezA3WUnLjchbkGnaZy0lO4c/+LLCDXwjaHjliOKDfIn?=
 =?us-ascii?Q?fZtoUGyUBSJ31j2NVze3rT2+Za9FzmIJxFmkP7gUzqG50wCti/O5v7R7E+N9?=
 =?us-ascii?Q?rCwdzWokCXblvIpyuV+iZ3m6SmztDBCMtig/gcN3VbmDZ2J9WT0kXIpHjePL?=
 =?us-ascii?Q?nDPLZLUsbhMfGMmlgoAvkyYCZUKohKhVJLcHCoR6bKHWTX3kebxq+JW2cdrZ?=
 =?us-ascii?Q?ZP/KV0/V2zVdv3u0H38bOmr/ez/5io48c0pwCT4wPzzl27UbmU/9Nc9Sxklj?=
 =?us-ascii?Q?2mKc21TgnvY0QDqzBPioEjxtP80CQknFRsEy47aLY3vgO2GTFoNZ49bCeFzy?=
 =?us-ascii?Q?lqFwJqoShVR+34oe5bLOpdAy2PAYI58famC52cPNb8O20J7SMSHONrAOECPq?=
 =?us-ascii?Q?SWKmfooN9KI0ed2XW4swxGx0eRuNTrrTuQkPw9YDPXugQvoBBl20FSkx8Unl?=
 =?us-ascii?Q?7bA9jDLwlLQ+q1rSZOpnmMPe6wbHGnpZbGPJkmuwIWesy5mYSA//gAVFcBEk?=
 =?us-ascii?Q?1FvSUPk6o9axVIRnFcAUeOLsgnPJHR4KFlM3QyWzB46Q5cx3mL3t1Q28JNar?=
 =?us-ascii?Q?8qSYiNoMK9SASPLj1Pe4WmWPXwK0JRaZ6Daz0kmDStFQXEIZlQuolSfFwZ95?=
 =?us-ascii?Q?j7WcIoYT6yXBFWITqx//rNhqsGPtk+C5YIRJJt3pwIReNCsciYxdB//R6Xny?=
 =?us-ascii?Q?YZAMPxRB6srJEhWC/WuavJkDANX9r4isDvwfroG2o5F5vA//GgaGWu4AsQma?=
 =?us-ascii?Q?Dk67WrBteDI/FwWDxRSL8EFbezpJac2DyFFeTv5kqcqBMiZCHr2HhJdK7kSg?=
 =?us-ascii?Q?wPvuQdxdev7Mu+e0zvZ888vFu7a8/apppqqH2n+B4zJ7FXOIVwW115KhIqrX?=
 =?us-ascii?Q?7gNujBJVdGhcufE8YxoISUIU2qIMzd+XyymNUJ40hjPYGJGLs25vzG9skUuS?=
 =?us-ascii?Q?AYrjTanGMWA6uxoM48iPpvcRznjPZJwAScRNCBPkNhI2VVungfMbfYzngQGa?=
 =?us-ascii?Q?5NtTqvmJ92mx1lIy9gIfn9U=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7d3a7e-2e26-4d79-8a97-08d9ab7803df
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4688.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 16:17:00.3180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u2ho8bziGeOeX7mBAxD46B4UMlXZv3WuOdCmsZbi4bAIPQY3HI/gi02RfGhvtMFlll5SSPtXvpY+5+KHPO45iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7216
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 21-11-16 17:11:33, Abel Vesa wrote:
> On 21-11-16 15:59:11, Abel Vesa wrote:
> > On 21-11-15 12:17:46, Saravana Kannan wrote:
> > > On Wed, Nov 10, 2021 at 12:24 PM Saravana Kannan <saravanak@google.com> wrote:
> > > >
> > > > On Wed, Nov 10, 2021 at 4:16 AM Abel Vesa <abelvesa@kernel.org> wrote:
> > > > >
> > > > > On 21-09-28 17:07:33, Saravana Kannan wrote:
> > > > > > fw_devlink could end up creating device links for bus only devices.
> > > > > > However, bus only devices don't get probed and can block probe() or
> > > > > > sync_state() [1] call backs of other devices. To avoid this, probe these
> > > > > > devices using the simple-pm-bus driver.
> > > > > >
> > > > > > However, there are instances of devices that are not simple buses (they get
> > > > > > probed by their specific drivers) that also list the "simple-bus" (or other
> > > > > > bus only compatible strings) in their compatible property to automatically
> > > > > > populate their child devices. We still want these devices to get probed by
> > > > > > their specific drivers. So, we make sure this driver only probes devices
> > > > > > that are only buses.
> > > > > >
> > > > > > [1] - https://lore.kernel.org/lkml/CAPDyKFo9Bxremkb1dDrr4OcXSpE0keVze94Cm=zrkOVxHHxBmQ@mail.gmail.com/
> > > > > > Fixes: c442a0d18744 ("driver core: Set fw_devlink to "permissive" behavior by default")
> > > > > > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > > > > > Tested-by: Saravana Kannan <saravanak@google.com>
> > > > > > Tested-by: Ulf Hansson <ulf.hansson@linaro.org>
> > > > > > ---
> > > > > >  drivers/bus/simple-pm-bus.c | 42 ++++++++++++++++++++++++++++++++++---
> > > > > >  1 file changed, 39 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> > > > > > index 01a3d0cd08ed..6b8d6257ed8a 100644
> > > > > > --- a/drivers/bus/simple-pm-bus.c
> > > > > > +++ b/drivers/bus/simple-pm-bus.c
> > > > > > @@ -13,11 +13,36 @@
> > > > > >  #include <linux/platform_device.h>
> > > > > >  #include <linux/pm_runtime.h>
> > > > > >
> > > > > > -
> > > > > >  static int simple_pm_bus_probe(struct platform_device *pdev)
> > > > > >  {
> > > > > > -     const struct of_dev_auxdata *lookup = dev_get_platdata(&pdev->dev);
> > > > > > -     struct device_node *np = pdev->dev.of_node;
> > > > > > +     const struct device *dev = &pdev->dev;
> > > > > > +     const struct of_dev_auxdata *lookup = dev_get_platdata(dev);
> > > > > > +     struct device_node *np = dev->of_node;
> > > > > > +     const struct of_device_id *match;
> > > > > > +
> > > > > > +     /*
> > > > > > +      * Allow user to use driver_override to bind this driver to a
> > > > > > +      * transparent bus device which has a different compatible string
> > > > > > +      * that's not listed in simple_pm_bus_of_match. We don't want to do any
> > > > > > +      * of the simple-pm-bus tasks for these devices, so return early.
> > > > > > +      */
> > > > > > +     if (pdev->driver_override)
> > > > > > +             return 0;
> > > > > > +
> > > > > > +     match = of_match_device(dev->driver->of_match_table, dev);
> > > > > > +     /*
> > > > > > +      * These are transparent bus devices (not simple-pm-bus matches) that
> > > > > > +      * have their child nodes populated automatically.  So, don't need to
> > > > > > +      * do anything more. We only match with the device if this driver is
> > > > > > +      * the most specific match because we don't want to incorrectly bind to
> > > > > > +      * a device that has a more specific driver.
> > > > > > +      */
> > > > > > +     if (match && match->data) {
> > > > > > +             if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > > > > > +                     return 0;
> > > > > > +             else
> > > > > > +                     return -ENODEV;
> > > > > > +     }
> > > > >
> > > > > This change is breaking the expected behavior for the already existent
> > > > > simple-bus nodes. All the simple-bus compatibles should be replaced now
> > > > > to simple-pm-bus. In my case, on some i.MX8 platforms, without the
> > > > > devlink, the devices suspend sequence changes (and even breaks).
> > > > >
> > > > > To avoid breaking the already existent simple-bus nodes, maybe the logic
> > > > > should've been reversed: keep the simple-bus as is and add another
> > > > > compatible, IDK, something like simple-trasnparent-bus, or something.
> > > >
> > > > The intent of this change IS to affect existing simple-bus nodes (but
> > > > not in the way it's affecting you). But if it's breaking stuff, we
> > > > obviously need to fix it.
> > > >
> > > > I have a hunch on what's going on in your case, but can you point me
> > > > to the specific simple-bus node that's getting affected? I'm expecting
> > > > it to be a simple-bus node that gets added AFTER this driver is
> > > > registered at device_initcall (module_init gets converted to
> > > > device_initcall).
> > > >
> > 
> > Well, for now, I can't pinpoint exactly one specific dts node.
> > My usecase is a little bit more complicated since it's only happening
> > in conjunction with a local change in the imx-mu-irq driver
> > in our local tree. Basically, the local change is forcing a suspend abort by
> > calling pm_system_wake if there is an irq from SCU triggered after the
> > suspend noirq imx-mu-irq driver callback has been called.
> > If we replace all the simple-bus with simple-pm-bus, everything works
> > fine. 
> > 
> > > > Also, can you try this hack patch to see if it helps your case?
> > > > https://lore.kernel.org/lkml/CAGETcx9U130Oq-umrvXME4JhEpO0Wadoki3kNxx=0-YvTR6PtQ@mail.gmail.com/
> > > >
> > 
> > Nope, it doesn't work with this patch either.
> > 
> > And the funny thing is, even if I add the pm_runtime_enable to your patch
> > like this:
> > 
> > diff --git a/drivers/bus/simple-pm-bus.c b/drivers/bus/simple-pm-bus.c
> > index 6b8d6257ed8a..a13324fd700b 100644
> > --- a/drivers/bus/simple-pm-bus.c
> > +++ b/drivers/bus/simple-pm-bus.c
> > @@ -38,9 +38,11 @@ static int simple_pm_bus_probe(struct platform_device *pdev)
> >          * a device that has a more specific driver.
> >          */
> >         if (match && match->data) {
> > -               if (of_property_match_string(np, "compatible", match->compatible) == 0)
> > +               if (of_property_match_string(np, "compatible", match->compatible) == 0) {
> > +                       pm_runtime_enable(&pdev->dev);
> > +                       of_platform_populate(np, NULL, lookup, &pdev->dev);
> >                         return 0;
> > -               else
> > +               } else
> >                         return -ENODEV;
> >         }
> > 
> > I get the following warning:
> > 
> > [    1.009392] ------------[ cut here ]------------
> > [    1.013681] Enabling runtime PM for inactive device (bus@5d000000) with active children
> > [    1.021721] WARNING: CPU: 3 PID: 1 at drivers/base/power/runtime.c:1439 pm_runtime_enable+0xc0/0x100
> > [    1.030794] Modules linked in:                                              
> > [    1.033837] CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.15.0-04906-gc0a8c67532b6-dirty #226
> > [    1.042175] Hardware name: Freescale i.MX8QXP MEK (DT)
> > [    1.047302] pstate: 600000c5 (nZCv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > [    1.054248] pc : pm_runtime_enable+0xc0/0x100
> > [    1.058594] lr : pm_runtime_enable+0xc0/0x100
> > [    1.062938] sp : ffff800011e4bb60                                           
> > [    1.066237] x29: ffff800011e4bb60 x28: 0000000000000000 x27: ffff8000119204d0
> > [    1.073361] x26: ffff8000119c1060 x25: ffff8000119c1078 x24: ffff80001190f0a0
> > [    1.080484] x23: 0000000000000000 x22: 0000000000000000 x21: ffff0008006a00f4
> > [    1.087608] x20: 0000000000000000 x19: ffff0008006a0010 x18: 0000000000000030
> > [    1.094732] x17: 6974636120687469 x16: 7720293030303030 x15: 3064354073756228
> > [    1.101856] x14: 2065636976656420 x13: ffff800011c21dc0 x12: 0000000000000246
> > [    1.108981] x11: 00000000000000c2 x10: ffff800011c79dc0 x9 : 00000000fffff000
> > [    1.116103] x8 : ffff800011c21dc0 x7 : ffff800011c79dc0 x6 : 0000000000000000
> > [    1.123227] x5 : 000000000000bff4 x4 : 0000000000000000 x3 : 00000000ffffefff
> > [    1.130351] x2 : ffff800011c21d30 x1 : 6bf7c63081c63600 x0 : 0000000000000000
> > [    1.137478] Call trace:                                                     
> > [    1.139910]  pm_runtime_enable+0xc0/0x100
> > [    1.143903]  simple_pm_bus_probe+0x80/0xf0
> > [    1.147986]  platform_probe+0x6c/0xe0
> > [    1.151637]  really_probe.part.0+0x9c/0x310
> > [    1.155805]  __driver_probe_device+0x98/0x144
> > [    1.160149]  driver_probe_device+0xc8/0x15c
> > [    1.164319]  __driver_attach+0xfc/0x190
> > [    1.168141]  bus_for_each_dev+0x70/0xc0
> > [    1.171964]  driver_attach+0x28/0x3c                                        
> > [    1.175526]  bus_add_driver+0x108/0x1f0
> > [    1.179348]  driver_register+0x7c/0x130
> > [    1.183173]  __platform_driver_register+0x2c/0x40
> > [    1.187862]  simple_pm_bus_driver_init+0x20/0x2c
> > [    1.192466]  do_one_initcall+0x54/0x1bc
> > [    1.196289]  kernel_init_freeable+0x210/0x294
> > [    1.200633]  kernel_init+0x28/0x130                                         
> > [    1.204110]  ret_from_fork+0x10/0x20                                        
> > [    1.207678] ---[ end trace 719a02e69bfeb03f ]---
> > 
> > though it should be behaving exactly like in the case of simple-pm-bus.
> > 
> > Maybe I'm missing something here.
> > 
> > I'll keep digging.
> > 

Looking at this, it seems the devlinks are actually dropped after being
created:

[   36.993371] Hardware name: Freescale i.MX8QXP MEK (DT)                                   
[   36.998498] Call trace:                                                                  
[   37.000928]  dump_backtrace+0x0/0x19c                                                    
[   37.004578]  show_stack+0x1c/0x70                                                        
[   37.007878]  dump_stack_lvl+0x68/0x84                                                    
[   37.011527]  dump_stack+0x1c/0x38                                                        
[   37.014826]  __device_link_del+0x40/0xbc                                                 
[   37.018738]  device_link_drop_managed+0x74/0x90                                          
[   37.023253]  device_links_driver_bound+0x1b4/0x280                                       
[   37.028031]  driver_bound+0x68/0xd0                                                      
[   37.031509]  really_probe.part.0+0x258/0x310                                             
[   37.035763]  __driver_probe_device+0x98/0x144                                            
[   37.040107]  driver_probe_device+0xc8/0x15c                                              
[   37.044279]  __driver_attach+0xfc/0x190                                                  
[   37.048100]  bus_for_each_dev+0x70/0xc0                                                  
[   37.051924]  driver_attach+0x28/0x3c                                                     
[   37.055484]  bus_add_driver+0x108/0x1f0                                                  
[   37.059306]  driver_register+0x7c/0x130                                                  
[   37.063131]  __platform_driver_register+0x2c/0x40                                        
[   37.067820]  simple_pm_bus_driver_init+0x20/0x2c                                         
[   37.072424]  do_one_initcall+0x54/0x1bc                                                  
[   37.076249]  kernel_init_freeable+0x210/0x294                                            
[   37.080591]  kernel_init+0x28/0x130                                                      
[   37.084068]  ret_from_fork+0x10/0x20                                                     
[   37.087688] simple-pm-bus bus@56220000: Dropping the link to 5d090000.gpio               
[   37.094501] device: 'platform:5d090000.gpio--platform:bus@56220000': device_unregister   

So, before your patch, the devlinks were not dropped because there was
no driver to probe for the "simple-bus" compatible.

And I think this tells us why your hack patch didn't solve the problem
either.

> 
> One more thing.
> 
> So basically, your already upstream patch removes the devlinks for all the simple-bus
> nodes.
> 
> By adding your hack patch, it also removes devlinks between subnodes of the simple-bus
> node.
> 
> > > > I have some thoughts on how I could fix this, but I need to think
> > > > about a few cases.
> > > 
> > > Hi Abel,
> > > 
> > > Friendly reminder.
> > > 
> > 
> > Sorry for the late reply.
> > 
> > > -Saravana
