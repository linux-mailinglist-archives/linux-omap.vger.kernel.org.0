Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83AC6434512
	for <lists+linux-omap@lfdr.de>; Wed, 20 Oct 2021 08:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhJTGXz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 20 Oct 2021 02:23:55 -0400
Received: from mail-bn1nam07on2061.outbound.protection.outlook.com ([40.107.212.61]:39103
        "EHLO NAM02-BN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229691AbhJTGXy (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 20 Oct 2021 02:23:54 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m9TakCvWYlSSyT80I7m82tOuXBv3o9EtVlr4LLfplqmrPdAb6cicwzPv0t7WJ3drbnkLMILWCRmBYkK07HCTe9nYaX08QW9+1SYrhK8YCwrqSOS3ST7ciYSPL5nQVjDjxKx0PqpMdWtGl//QiMNOvBTkKZiDS/ekfw9mSZAV2UjKcK/bjU9Nihh81Yw0z+EinXeSuFJgulgyE3ZnBDnYm30FsDQZYR8vOSOGXmpJlmPGCu8YpAmfiV7PNjSuDb+n4YtpqFJAeuZQ425ZrLEKrRPIiLN+gVCHtw5c0ouJygg/2+M2dPJ1CFxr7g5usXTGr4MTHJnjWtMvhvXlOJ2DUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giHEi8StHDpFAIKZ2fjbrOrRzROdUjeBGR7s6YiPPk8=;
 b=dmS4rRrK/g3O33ldx8as3eJekD7ORXwiGET1tB1HB/7u+pN7OidYdb6Wc2Xxx5JV1Pk5MCMajIoEXip9DY3V24+ysizzXBV7WhUplMmV4BIh5c30ZCN689KyBvAj2GEOMgM9yBqOZ3t68fImj8wyUNZwvqCUkwRcfY37fJtNkldRKI+pfth2CjZPBokxl8lBT08l7wy6qSoAW/1DiqaQSUvm2suMD5NBD4lKDR68vv0hmfJ348XGh4kDS2wCVXmSeynMNBsFYeNslozNWf4GSaweAMEoRJqw9e+bHiD9E0NDw6Xq0RjcKRXH3qYre6mRn4W7hwZVUhr4Th+3hGq4Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=foss.st.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giHEi8StHDpFAIKZ2fjbrOrRzROdUjeBGR7s6YiPPk8=;
 b=GK+hmKXrGWW5qR8g5NU00hPJaTOxWrRF6u1pFuZPIsrjlu1rLJdKLfONq3f5Bq6FGy5vgzD9nZrIWRz8jMO0OndubmN+6A3DJlSJ39gZOk80CKi3WFDXeoir9FVhqJUijlx4C34MGWiyBFf85rT7dGGPUy9YPuo+EzhoI0T7yWk=
Received: from SA9PR11CA0017.namprd11.prod.outlook.com (2603:10b6:806:6e::22)
 by BN7PR02MB4993.namprd02.prod.outlook.com (2603:10b6:408:25::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.18; Wed, 20 Oct
 2021 06:21:36 +0000
Received: from SN1NAM02FT0020.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::70) by SA9PR11CA0017.outlook.office365.com
 (2603:10b6:806:6e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.15 via Frontend
 Transport; Wed, 20 Oct 2021 06:21:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; foss.st.com; dkim=none (message not signed)
 header.d=none;foss.st.com; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0020.mail.protection.outlook.com (10.97.5.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4608.15 via Frontend Transport; Wed, 20 Oct 2021 06:21:35 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 19 Oct 2021 23:21:35 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 19 Oct 2021 23:21:35 -0700
Envelope-to: fabrice.gasnier@foss.st.com,
 gregkh@linuxfoundation.org,
 dianders@chromium.org,
 mka@chromium.org,
 robh+dt@kernel.org,
 stern@rowland.harvard.edu,
 frowand.list@gmail.com,
 mathias.nyman@intel.com,
 balbi@kernel.org,
 devicetree@vger.kernel.org,
 peter.chen@kernel.org,
 linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org,
 hadess@hadess.net,
 ravisadineni@chromium.org,
 rogerq@kernel.org,
 krzk@kernel.org,
 swboyd@chromium.org,
 alcooperx@gmail.com,
 viro@zeniv.linux.org.uk,
 alexandre.belloni@bootlin.com,
 alexandre.torgue@foss.st.com,
 andrew@lunn.ch,
 andrey.zhizhikin@leica-geosystems.com,
 agross@kernel.org,
 arnd@arndb.de,
 a-govindraju@ti.com,
 bjorn.andersson@linaro.org,
 catalin.marinas@arm.com,
 dmitry.baryshkov@linaro.org,
 digetx@gmail.com,
 aisheng.dong@nxp.com,
 enric.balletbo@collabora.com,
 festevam@gmail.com,
 f.fainelli@gmail.com,
 gregory.clement@bootlin.com,
 grygorii.strashko@ti.com,
 agx@sigxcpu.org,
 jagan@amarulasolutions.com,
 axboe@kernel.dk,
 johan@kernel.org,
 krzysztof.kozlowski@canonical.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com,
 lionel.debieve@st.com,
 mani@kernel.org,
 m.szyprowski@samsung.com,
 broonie@kernel.org,
 martin.juecker@gmail.com,
 nm@ti.com,
 olivier.moysan@st.com,
 pawell@cadence.com,
 rric@kernel.org,
 linux@armlinux.org.uk,
 sebastian.hesselbarth@gmail.com,
 shawnguo@kernel.org,
 tglx@linutronix.de,
 tony@atomide.com,
 vkoul@kernel.org,
 viresh.kumar@linaro.org,
 will@kernel.org,
 wcohen@redhat.com,
 linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,
 linux-omap@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 l.stelmach@samsung.com
Received: from [10.254.241.49] (port=58266)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1md4yk-0000Uh-VX; Tue, 19 Oct 2021 23:21:35 -0700
Message-ID: <0739e563-c8e7-2a19-e440-4f32e7de3917@xilinx.com>
Date:   Wed, 20 Oct 2021 08:21:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v16 0/7] usb: misc: Add onboard_usb_hub driver
Content-Language: en-US
To:     Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Peter Chen <peter.chen@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        Ravi Chandra Sadineni <ravisadineni@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Roger Quadros <rogerq@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Al Cooper <alcooperx@gmail.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Alexandre TORGUE - foss <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>,
        Andy Gross <agross@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Fabio Estevam <festevam@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        =?UTF-8?Q?Guido_G=c3=bcnther?= <agx@sigxcpu.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Jens Axboe <axboe@kernel.dk>, Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Lionel DEBIEVE <lionel.debieve@st.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Olivier MOYSAN <olivier.moysan@st.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tony Lindgren <tony@atomide.com>,
        Vinod Koul <vkoul@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Will Deacon <will@kernel.org>,
        William Cohen <wcohen@redhat.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        =?UTF-8?Q?=c5=81ukasz_Stelmach?= <l.stelmach@samsung.com>
References: <20210813195228.2003500-1-mka@chromium.org>
 <YUoRq1RrOIoiBJ5+@google.com>
 <CAD=FV=WrddUhWT0wUVZD0gN_+8Zy1VGY77LYLYBvhaPQQ_SqZw@mail.gmail.com>
 <YWkiGGBKOVokBye9@kroah.com>
 <03f28680-35eb-25f4-5041-f3a56144da24@foss.st.com>
From:   Michal Simek <michal.simek@xilinx.com>
In-Reply-To: <03f28680-35eb-25f4-5041-f3a56144da24@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 169799c7-e285-46bd-f041-08d99391de50
X-MS-TrafficTypeDiagnostic: BN7PR02MB4993:
X-Microsoft-Antispam-PRVS: <BN7PR02MB499358B36AB14EFB6257D5EEC6BE9@BN7PR02MB4993.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4aTsYdVKpydSui2KMony/3+fxpka/pnXS5lrt95t/8bJYtSY6Wr5G+2oq51wH/Rg3/xduAIfgyXf2RvzFS6R01i5amcSmaDBh0lEJfg1Vf/zGHDOIE0kHxB0aA9dACu82Rr5zhtKGJwW6E7vEfu/ciiP2LlvkC2Al+GZ5wQGeOrm2oyYewfEZw64ONGvWyxqC5uOI4SG5q/Pb7K9AAuC7w5708FrrxqWggN4dXnjTOpfH2GGqX/Lu9gzaeAu86smcXeyeAabVuTKOVEQAMMllEg+iKEp0CkninuFIK+uI5xyuNlSG6M8CmzjvOhhhOtCvzs/jRi429MtK7GygOhcOkfKgwG1dbPlNzZ9t9zlTUGa9w984CmsOIhlQFMJuzfNykS7LgreyjwDYCzX3RBtQGiQGG12YMROeDb3q/3rssEx0SJIiFMibB+rrTtqe8T0az/eVl8N2gZ6Q373HJPLd/IhrMuuC+qQdjqPSmFa5gL9pyCrsDsQgZz9DQ4GLq4v2sSLB1AuqF9ocz0k1cbA8ulXFulXC2SHxXnD7BIBZFDN5/2g7ECe9teCBegzQRLaJXUWRlN1BMnXkPZ2Kt7OfBkAU1IyejdTNVvUlZ6xnH+ut71uYQbNr1RUngjo6I6BP/TOFTqBaaZb4QCLE5UxmUXuVgWnMEtJx6RTSUSZ8p5H1kmwseMw1Yqrg00YytjzCThQhPIapgnpHIrcw2JE2u2ZO4QcM9oItMfrCpOtBmlcBjjkpQYgKZHUGyTTSuMwRHsdzaaoT3uPJNKUnLcvSDep4bG4aATYC2Lk8nzPo62q43siNfTrymhKbLHv63Y6g45K4++We+kNBxOJ54on53ONCcrZI83inA2UCpPuoKw=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(70206006)(7406005)(7366002)(7416002)(36860700001)(36906005)(508600001)(110136005)(426003)(70586007)(9786002)(7636003)(6666004)(2616005)(36756003)(5660300002)(186003)(82310400003)(26005)(8676002)(356005)(8936002)(54906003)(31696002)(2906002)(83380400001)(31686004)(44832011)(53546011)(316002)(966005)(4326008)(47076005)(336012)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 06:21:35.8123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 169799c7-e285-46bd-f041-08d99391de50
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0020.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4993
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 10/19/21 18:04, Fabrice Gasnier wrote:
> On 10/15/21 8:39 AM, Greg Kroah-Hartman wrote:
>> On Thu, Oct 14, 2021 at 02:38:55PM -0700, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Tue, Sep 21, 2021 at 10:09 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>>>>
>>>> Hi Greg,
>>>>
>>>> are there any actions pending or can this land in usb-testing?
>>>>
>>>> I confirmed that this series can be rebased on top of v5.15-rc2
>>>> without conflicts.
>>>
>>> I'm quite interested to know what the next action items are, too. This
>>> is one of the very few patches we have for trogdor (excluding MIPI
>>> camera, which is a long story) that we're carrying downstream, so I'm
>>> keenly interested in making sure it's unblocked (if, indeed, it's
>>> blocked on anything).
>>>
>>> If folks feel that this needs more review eyes before landing again
>>> then I'll try to find some time in the next week or two. If it's just
>>> waiting for the merge window to open/close so it can have maximal bake
>>> time, that's cool too. Please yell if there's something that I can do
>>> to help, though! :-)
>>
>> I would love more review-eyes on this please.
>>
> 
> Hi,
> 
> I noticed this series some time ago, and wanted to take a closer look.
> 
> The same issue this series address is seen on stm32 board for instance.
> (arch/arm/boot/dts/stm32mp15xx-dkx.dtsi). On board HUB (not described in
> the DT) is supplied by an always-on regulator.
> So it could could be interesting/useful to address the same case ,
> on stm32 boards, where USB2 (ehci-platform driver) is used currently.
> 
> I noticed a few things, especially on the dt-bindings. I've some
> questions here.
> 
> In this series, RTS5411 is used. The dt-bindings documents it as a child
> node of the USB controller. E.g.
> 
> &usb {
> 	usb_hub_2_0: hub@1 {
> 		...
> 	};
> 
> 	usb_hub_3_0: hub@2 {
> 	};
> }
> 
> I had a quick look at RTS5411 datasheet. It looks like there's an i2c
> interface too.
> - I guess the I2C interface isn't used in your case ?
>    (I haven't checked what it could be used for...)
> 
> In the stm32 boards (stm32mp15xx-dkx), there's an usb2514b chip
> - that also could be wired on I2C interface (0R mount option)
> - unused on stm32 boards by default
> 
> usb2514b chip already has a dt-bindings (with compatible), and a driver:
> - drivers/usb/misc/usb251xb.c
> - Documentation/devicetree/bindings/usb/usb251xb.txt
> 
> It is defined more as an i2c chip, so I'd expect it as an i2c child,
> e.g. like:
> 
> &i2c {
> 	usb2514b@2c {
> 		compatible = "microchip,usb2514b";
> 		...
> 	};
> };
> 
> 
> This way, I don't see how it could be used together with onboard_usb_hub
> driver ? (But I may have missed it)
> Is it possible to use a phandle, instead of a child node ?
> 
> However, in the stm32mp15xx-dkx case, i2c interface isn't wired/used by
> default. So obviously the i2c driver isn't used. In this case, could the
> "microchip,usb2514b" be listed in onboard_usb_hub driver ?
> (wouldn't it be redundant ?)
> 
> In this case it would be a child node of the usb DT node... Maybe that's
> more a question for Rob: would it be "legal" regarding existing
> dt-bindings ?

We wanted to upstream driver for microchip usb5744 and based on this 
thread with Rob

https://lore.kernel.org/all/CAL_JsqJZBbu+UXqUNdZwg-uv0PAsNg55026PTwhKr5wQtxCjVQ@mail.gmail.com/

the recommendation was to use i2c-bus link. And in our usb5744 case 
where usb hub has only one i2c address we just hardcoded it in the 
driver. I should be pushing this driver to xilinx soc tree soon if you 
want to take a look.

Thanks,
Michal
