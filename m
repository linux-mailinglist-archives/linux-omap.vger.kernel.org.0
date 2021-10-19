Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92C71433B93
	for <lists+linux-omap@lfdr.de>; Tue, 19 Oct 2021 18:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231508AbhJSQGe (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 19 Oct 2021 12:06:34 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:53144 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230168AbhJSQGd (ORCPT
        <rfc822;linux-omap@vger.kernel.org>);
        Tue, 19 Oct 2021 12:06:33 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19JE1L0R004966;
        Tue, 19 Oct 2021 18:04:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=fdqa3FWQjGrFeZEe9ls1cJx0wp/BD6sM4yLn8Lo2/UM=;
 b=MQ9RMn/gavH7KWZKGlRD6W0G2SSSkl5rnWfomMnQraGoBLCCHVk7jvRfO3aOZbIRWyNK
 rTEUjBGacbreKzkcYuCBGK8UiX/Ut9TxE807dUDJCBr5jcV3Vcf3545KxTw35ANnCi79
 ntGjUtShm65X9ljUriPAf/Qnl3Ikeq8raNJJBn2P+eH5AtWhltGkoFo5MjpgCDDirkpX
 LKA6IMeKuLKHVln5APy8+shqAHtWyYFWeBr8Z3nBH/MpMJnRFx72LkX4P7aMsYNpgRXf
 lebYdKxDqnm/vEwwKrjLzLxo9DDHqMLeUMcs+GHoGb8XvJ0iyRECLeXXCIo141/KFMqs NA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bstrwauuq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 19 Oct 2021 18:04:12 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C1EA3100034;
        Tue, 19 Oct 2021 18:04:09 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 61C78231518;
        Tue, 19 Oct 2021 18:04:09 +0200 (CEST)
Received: from [10.48.0.126] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 19 Oct
 2021 18:04:06 +0200
Subject: Re: Re: [PATCH v16 0/7] usb: misc: Add onboard_usb_hub driver
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Frank Rowand <frowand.list@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        "Felipe Balbi" <balbi@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Peter Chen <peter.chen@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Bastien Nocera <hadess@hadess.net>,
        "Ravi Chandra Sadineni" <ravisadineni@chromium.org>,
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
        "Aswath Govindraju" <a-govindraju@ti.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        "Enric Balletbo i Serra" <enric.balletbo@collabora.com>,
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
        "Marek Szyprowski" <m.szyprowski@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        =?UTF-8?Q?Martin_J=c3=bccker?= <martin.juecker@gmail.com>,
        Nishanth Menon <nm@ti.com>,
        Olivier MOYSAN <olivier.moysan@st.com>,
        Pawel Laszczak <pawell@cadence.com>,
        Robert Richter <rric@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "Thomas Gleixner" <tglx@linutronix.de>,
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
From:   Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <03f28680-35eb-25f4-5041-f3a56144da24@foss.st.com>
Date:   Tue, 19 Oct 2021 18:04:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <YWkiGGBKOVokBye9@kroah.com>
Content-Type: text/plain; charset="iso-8859-2"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-19_02,2021-10-19_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On 10/15/21 8:39 AM, Greg Kroah-Hartman wrote:
> On Thu, Oct 14, 2021 at 02:38:55PM -0700, Doug Anderson wrote:
>> Hi,
>>
>> On Tue, Sep 21, 2021 at 10:09 AM Matthias Kaehlcke <mka@chromium.org> wrote:
>>>
>>> Hi Greg,
>>>
>>> are there any actions pending or can this land in usb-testing?
>>>
>>> I confirmed that this series can be rebased on top of v5.15-rc2
>>> without conflicts.
>>
>> I'm quite interested to know what the next action items are, too. This
>> is one of the very few patches we have for trogdor (excluding MIPI
>> camera, which is a long story) that we're carrying downstream, so I'm
>> keenly interested in making sure it's unblocked (if, indeed, it's
>> blocked on anything).
>>
>> If folks feel that this needs more review eyes before landing again
>> then I'll try to find some time in the next week or two. If it's just
>> waiting for the merge window to open/close so it can have maximal bake
>> time, that's cool too. Please yell if there's something that I can do
>> to help, though! :-)
> 
> I would love more review-eyes on this please.
> 

Hi,

I noticed this series some time ago, and wanted to take a closer look.

The same issue this series address is seen on stm32 board for instance.
(arch/arm/boot/dts/stm32mp15xx-dkx.dtsi). On board HUB (not described in
the DT) is supplied by an always-on regulator.
So it could could be interesting/useful to address the same case ,
on stm32 boards, where USB2 (ehci-platform driver) is used currently.

I noticed a few things, especially on the dt-bindings. I've some
questions here.

In this series, RTS5411 is used. The dt-bindings documents it as a child
node of the USB controller. E.g.

&usb {
	usb_hub_2_0: hub@1 {
		...
	};

	usb_hub_3_0: hub@2 {
	};
}

I had a quick look at RTS5411 datasheet. It looks like there's an i2c
interface too.
- I guess the I2C interface isn't used in your case ?
  (I haven't checked what it could be used for...)

In the stm32 boards (stm32mp15xx-dkx), there's an usb2514b chip
- that also could be wired on I2C interface (0R mount option)
- unused on stm32 boards by default

usb2514b chip already has a dt-bindings (with compatible), and a driver:
- drivers/usb/misc/usb251xb.c
- Documentation/devicetree/bindings/usb/usb251xb.txt

It is defined more as an i2c chip, so I'd expect it as an i2c child,
e.g. like:

&i2c {
	usb2514b@2c {
		compatible = "microchip,usb2514b";
		...
	};
};


This way, I don't see how it could be used together with onboard_usb_hub
driver ? (But I may have missed it)
Is it possible to use a phandle, instead of a child node ?

However, in the stm32mp15xx-dkx case, i2c interface isn't wired/used by
default. So obviously the i2c driver isn't used. In this case, could the
"microchip,usb2514b" be listed in onboard_usb_hub driver ?
(wouldn't it be redundant ?)

In this case it would be a child node of the usb DT node... Maybe that's
more a question for Rob: would it be "legal" regarding existing
dt-bindings ?


Thanks in advance
Best Regards,
Fabrice


> It's in my queue to review, I just need to spend the time on it, sorry
> for the delay.
> 
> greg k-h
> 
