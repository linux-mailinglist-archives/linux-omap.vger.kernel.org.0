Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 610822687F3
	for <lists+linux-omap@lfdr.de>; Mon, 14 Sep 2020 11:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726184AbgINJGF (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Sep 2020 05:06:05 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:51298 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726123AbgINJGE (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Sep 2020 05:06:04 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08E95BZ4082332;
        Mon, 14 Sep 2020 04:05:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1600074311;
        bh=45CXssVozVwhmXELW2YCJrIEZQb3TtLXZl+9P6aTm6s=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ET5CnVI/n8H0X3va1EDV/i1fq/RuOHbmrDJCKQr3SpYoFYu2tj1lPBmV+pj4WV5Wm
         gN3SSBpfGLdmgPYeDletfQ2Egos/pBCCURtkwrB+i+5ly/0tmG0kiKt8HNvD1EgWpI
         6mv67qzaj0WCN+B0/SljGgoAXTPukF97ju+qbU3M=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08E95A7Q129588;
        Mon, 14 Sep 2020 04:05:10 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 14
 Sep 2020 04:05:10 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Sep 2020 04:05:10 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08E951i9030437;
        Mon, 14 Sep 2020 04:05:01 -0500
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Krzysztof Kozlowski <krzk@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?UTF-8?Q?Beno=c3=aet_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Guenter Roeck <linux@roeck-us.net>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
 <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
 <c162b6ad-57f1-a75a-11e3-9c80c60bd845@ti.com>
 <CACRpkdbrrzkYVW13V89PJ5_WRGhxSL0rOxAHA_7hYSyw28Shvg@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <1d295310-880a-0ca7-273b-ad07f1a0498b@ti.com>
Date:   Mon, 14 Sep 2020 12:04:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CACRpkdbrrzkYVW13V89PJ5_WRGhxSL0rOxAHA_7hYSyw28Shvg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 12/09/2020 13:07, Linus Walleij wrote:
> On Fri, Sep 11, 2020 at 11:54 AM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> 
>> More over, there is already generic schema for gpio hogs: gpio-hog.yaml
> 
> Where is this? I don't have it in my GPIO devel branch for sure, and
> it is not in linux-next either so not in Bartosz' tree.
> 
> I did suggest that I want a gpio-common.yaml file which includes the
> hogs.

There it is (am I missing smth?):
pip3 install git+https://github.com/devicetree-org/dt-schema.git@master

as per:
https://www.kernel.org/doc/html/latest/devicetree/writing-schema.html



-- 
Best regards,
grygorii
