Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442F92AB646
	for <lists+linux-omap@lfdr.de>; Mon,  9 Nov 2020 12:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729491AbgKILNN (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 9 Nov 2020 06:13:13 -0500
Received: from mail-co1nam11on2071.outbound.protection.outlook.com ([40.107.220.71]:65025
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729119AbgKILNM (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Mon, 9 Nov 2020 06:13:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fItWsM+L6dWA8L1+1s3kljsXTk/f8kJySeePwlMVaCeeB/7b7nC3L0UNBFkWeWHzjfzn0fzs37RF7OmA+Oem6WWDx506HFZkzfcBl2wQ/qTO3HBenAfIYCdH6GtCz4qVIdGQ3taKeWyOjnIEH19I0/674QYph7aZmTINW/Jabco09NaBERmdw3hZInOYQNLgOrzIoLYgUr6P5U6dwwiNDN+AGyG5+v9nd5Y+rjjwTldl/9itvX0yfWv6M4wvvgVaCZOcEhTKSZW2tFjDKTR0Qfb5OdmjhupwnWj5WP6cTme3CyBFYDpOTCbj3bE8U5b8dLYkvhlaknSy2YsrtIe6bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y14Fnt2E3Gf1b3vRjYy6Z1Iss4h4LbRzLwwNACLnkv4=;
 b=kJ/5F+wUR/rAxQEHFykmSolIWA/Mr24edTR/ITlnAOCZNPq5kNHdlH6zJoTEnPuy0m0vcSd4I/xxzoW3DqSPYjg0CIFTZadwO0i9h15DVlSNbFk0UslBL4mrolkq0Ati9sSBSRXHK04IqWWlVLyDa2XOb6rWRVG5cVDHBJqgdK/Y3+fmwxpvyyN3zKuHerudCGO19W+uIH8FodNHiTIRcgQIVMLuzorCBbI2h714gLGNqjCJnYlrgkzSbNP30rIzM9CaNEF94FpHbiVn6c8KztmS9WkML+jju8hScZYJ4aJs9vOMYZv+U7swWy2yFnm224bJ8qQXpFS/UP+2yG+K5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y14Fnt2E3Gf1b3vRjYy6Z1Iss4h4LbRzLwwNACLnkv4=;
 b=Jv+sh3cjljrFPllsHnlGQmi2bk1qO1JnKEBB0zElay/TeloJ/NxqbH9JN9w/O7Ao7Cx4PKyeqDuGAy3sRgZ/ibQHjSo7TZ7MzZjMoihe1xoOkyn4JyWRhvQ5/oyuKuG0uTkvtPcB9uql4QqjrbyNK3+ORfoBj6xpmOMljZKf2ow=
Authentication-Results: armlinux.org.uk; dkim=none (message not signed)
 header.d=none;armlinux.org.uk; dmarc=none action=none
 header.from=synaptics.com;
Received: from SN2PR03MB2383.namprd03.prod.outlook.com (2603:10b6:804:d::23)
 by SA0PR03MB5497.namprd03.prod.outlook.com (2603:10b6:806:b5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 9 Nov
 2020 11:13:09 +0000
Received: from SN2PR03MB2383.namprd03.prod.outlook.com
 ([fe80::49be:5ea3:8961:a22]) by SN2PR03MB2383.namprd03.prod.outlook.com
 ([fe80::49be:5ea3:8961:a22%6]) with mapi id 15.20.3541.024; Mon, 9 Nov 2020
 11:13:09 +0000
Date:   Mon, 9 Nov 2020 19:12:57 +0800
From:   Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Patrice Chotard <patrice.chotard@st.com>,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH usb-next] usb: dwc3: Use devm_of_platform_populate
Message-ID: <20201109191257.1074ad74@xhacker.debian>
In-Reply-To: <20201109103414.GF1559@shell.armlinux.org.uk>
References: <20201109095953.7f810239@xhacker.debian>
        <20201109103414.GF1559@shell.armlinux.org.uk>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: BYAPR01CA0002.prod.exchangelabs.com (2603:10b6:a02:80::15)
 To SN2PR03MB2383.namprd03.prod.outlook.com (2603:10b6:804:d::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by BYAPR01CA0002.prod.exchangelabs.com (2603:10b6:a02:80::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25 via Frontend Transport; Mon, 9 Nov 2020 11:13:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2f915fa2-8619-4547-d3b0-08d884a07072
X-MS-TrafficTypeDiagnostic: SA0PR03MB5497:
X-Microsoft-Antispam-PRVS: <SA0PR03MB54975E43FBDCF26F691D613EEDEA0@SA0PR03MB5497.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A70KJyDQs0iMkggiauyxvRSv0FWlMeEw6NN3Nt+aUDKB5DXvU+18MQZ9elhPI80VsZdboalPWakIimGkGzWRFwpAYq6hQbMz5FsLil2On1YyGd71Npc0fdSEjD/w+ObNh6tfCFWCm9PcjMgIBjdncX2SII3258ImirdjLU7gwXprIupbBuowxuH6TX6Hlxyon9khakN7bzZnWKL5bCVar61mrbWd99AqjN+QMPF76WA1u8Is/dLpTrERa3loGKvFAE+RyhJEKhfDKWwW9vLLc2a/jzTSCwlB+c7x88JADhfcoG+6l3V7j2glFOkHNPW9IIzm+UM4EZgMzEVWBX+TFQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN2PR03MB2383.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(39860400002)(376002)(396003)(86362001)(186003)(478600001)(1076003)(316002)(956004)(16526019)(6666004)(6506007)(83380400001)(5660300002)(7696005)(8936002)(66556008)(55016002)(9686003)(66946007)(54906003)(6916009)(8676002)(52116002)(7416002)(26005)(2906002)(4326008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: iHurbci9xh/1uLgRVhmw2kzWXjWAqVXozSsC2Il5C0pj0+9tIsxW+3Ray01GCIT/Ox0hAMsl/gxxoBVXW3oYA6gbCO19LLcquvB+KhqZo9seflM2/B61w+0KNlB8bMIGebdavIxqN09GdmPHreh9j/i31i2WD/NF1gJVcGu4k6ywFtjTwmMDZvkz355Us8ToEwNdrGUG0cYeoQMclseG9M9W6awbEEN3CL+lVI1PC6l+ygH/fSjS82FkyB22iSI6cZSv9Io3IQTk2q5yfJEJQdnPxi509pazdlWj/kj/f81eNLupitTW9PRQWCxiNLpqEAORwtVb/TNCBGMllHd+HuN39i74WwQLZteIy45DRnUyfPE6xjEiJS7frFLNUorETb7+CpwxLSruU/JvwU/63eYKd4dSOPhtA06FzjRddlKku13ww8KNnsqAZLKIjUW6r99Le94IQbfEJweslWHOyH67cI8BIoRkscjSYLWwLLTkr9v2YpwD5igykkx3+p9OnxEUBIiw7RgMzd4HvMBnHfBz9Eh8GjztF2go/RcwefiiWKFIq3XaXZ8CV8V9U1xi4Aho1k2zAjAvutfSaZmESy9k8lkVciBr+7hQsr4zNMcumX/SEoBqdA0MZCogcNbeUEm5xfczYmT2o64X0vlqkA==
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f915fa2-8619-4547-d3b0-08d884a07072
X-MS-Exchange-CrossTenant-AuthSource: SN2PR03MB2383.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 11:13:09.1231
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qOGMTeoOtl0ctDI3KiZWfizJjt9UvhZaBanUy228uPqPz18cw3SuOe4zHP+0dKIolmS8qMivC/jpV5qbRi2EWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR03MB5497
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, 9 Nov 2020 10:34:14 +0000 Russell King - ARM Linux admin  wrote:

> 
> 
> On Mon, Nov 09, 2020 at 09:59:53AM +0800, Jisheng Zhang wrote:
> > diff --git a/drivers/usb/dwc3/dwc3-meson-g12a.c b/drivers/usb/dwc3/dwc3-meson-g12a.c
> > index 417e05381b5d..83015bb7b926 100644
> > --- a/drivers/usb/dwc3/dwc3-meson-g12a.c
> > +++ b/drivers/usb/dwc3/dwc3-meson-g12a.c
> > @@ -702,7 +702,6 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
> >  {
> >       struct dwc3_meson_g12a  *priv;
> >       struct device           *dev = &pdev->dev;
> > -     struct device_node      *np = dev->of_node;
> >       void __iomem *base;
> >       int ret, i;
> >
> > @@ -794,7 +793,7 @@ static int dwc3_meson_g12a_probe(struct platform_device *pdev)
> >                       goto err_phys_power;
> >       }
> >
> > -     ret = of_platform_populate(np, NULL, NULL, dev);
> > +     ret = devm_of_platform_populate(dev);
> >       if (ret)
> >               goto err_phys_power;
> >
> > @@ -832,8 +831,6 @@ static int dwc3_meson_g12a_remove(struct platform_device *pdev)
> >       if (priv->drvdata->otg_switch_supported)
> >               usb_role_switch_unregister(priv->role_switch);
> >
> > -     of_platform_depopulate(dev);
> > -
> >       for (i = 0 ; i < PHY_COUNT ; ++i) {
> >               phy_power_off(priv->phys[i]);
> >               phy_exit(priv->phys[i]);  
> 
> Does it matter that the order that things happen in
> dwc3_meson_g12a_remove() is changed as a result of your patch? Was
> the code relying on the platform devices being depopulated before
> powering off the PHYs?

...

> 
> Same here... and for anywhere else in this patch that you're deleting
> a of_platform_depopulate().

oops, good question! I believe it's not safe to move the depopulate after
the phy_* APIs.

So please ignore this patch.

> 
> You effectively are moving the call to of_platform_depopulate() *after*
> the driver's .remove function has been called.
> 
> --
>
