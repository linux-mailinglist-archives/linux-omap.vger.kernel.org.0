Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5528265D0D
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 11:54:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725788AbgIKJys (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 11 Sep 2020 05:54:48 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54824 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725710AbgIKJyq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 11 Sep 2020 05:54:46 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 08B9rq9H118702;
        Fri, 11 Sep 2020 04:53:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599818032;
        bh=dxP/WY/4dZH72YPcSv12tcPV/XFUasdrBjjt461p+Vw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=yvbVhQNO427I3UMxxoaBckIDnOBYAZtnuKrvKA7Ps8tHAgg9811RsZRoZzEjIuxOa
         Yyxaml8IUgo1SjEXiZlaAi+FmWvQ1rslc9UkPlebDIdcaPyIfRXFTL+Uq+RnmCWgRU
         Ombas83IuTru1XXR6Zyhs879UIo5EJaKahah5VME=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 08B9rqGn086091
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 11 Sep 2020 04:53:52 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 11
 Sep 2020 04:53:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 11 Sep 2020 04:53:52 -0500
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 08B9riYZ038437;
        Fri, 11 Sep 2020 04:53:44 -0500
Subject: Re: [PATCH v2 01/15] dt-bindings: gpio: convert bindings for NXP
 PCA953x family to dtschema
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Joel Stanley <joel@jms.id.au>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
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
        <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-renesas-soc@vger.kernel.org>
References: <20200910175733.11046-1-krzk@kernel.org>
 <20200910175733.11046-2-krzk@kernel.org>
 <CACPK8XdocAX5mOXf3VP29cNXH+6unYunB9NiT3qFVKyzR6WXPg@mail.gmail.com>
 <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <c162b6ad-57f1-a75a-11e3-9c80c60bd845@ti.com>
Date:   Fri, 11 Sep 2020 12:53:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPe6Tf0B5W27XaD5zLk77OBzGCHpirhTdZjFH0oh8GvWgg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On 11/09/2020 09:52, Krzysztof Kozlowski wrote:
> On Fri, 11 Sep 2020 at 08:24, Joel Stanley <joel@jms.id.au> wrote:
>>
>> On Thu, 10 Sep 2020 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> Convert the NXP PCA953x family of GPIO expanders bindings to device tree
>>> schema.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
>>
>>> +patternProperties:
>>> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
>>> +    type: object
>>> +    properties:
>>> +      gpio-hog: true
>>> +      gpios: true
>>> +      input: true
>>> +      output-high: true
>>> +      output-low: true
>>> +      line-name: true
>>> +
>>> +    required:
>>> +      - gpio-hog
>>> +      - gpios
>>> +
>>
>>> +            usb3-sata-sel-hog {
>>> +                gpio-hog;
>>> +                gpios = <4 GPIO_ACTIVE_HIGH>;
>>> +                output-low;
>>> +                line-name = "usb3_sata_sel";
>>
>> I would prefer we didn't require the addition of hte -hog prefix. It's
>> mostly just a matter of taste, but I can think of a few more concrete
>> reasons:
>>
>> We don't require -high or -low prefixes, so the node name doesn't need
>> to describe the properties that will be found below.
> 
> Thanks for the comments.
> 
> It is not about properties (high or low) but the role of a device
> node. The node names should represent a generic class of device (ePAPR
> and device tree spec) and "hog" is such class.
> 
> The Documentation/devicetree/bindings/gpio/fsl-imx-gpio.yaml already
> uses such naming so the best would be to unify.

In my opinion, It's not right to define this on per gpio-controller and introduce such
per gpio-controller restrictions.

More over, there is already generic schema for gpio hogs: gpio-hog.yaml
Originally, gpio bindings were defined without restricting gpio hog node names and,
generic schema follows this.

I think, the generic "gpio-hogs" sub-node may be introduced to place gpio hogs child nodes,
if gpio hogs node names restriction need to be introduces (*which i'm not sure is reasonable*).

gpio@20 {
	gpio-hogs {
		yyy-hog {
                         gpio-hog;
                         gpios
		}
	}

But this require as gpio code as generic gpio schema update (with backward compatibility in mind).


> 
>>
>> Changing around node names for existing boards carries with it the
>> chance of userspace breakage (as sysfs paths change). I would prefer
>> we avoid that if possible.
> 
> The impact on userspace is indeed important, but are you sure that
> hogs are visible to user-space via sysfs and configurable? I guess you
> think of deprecated CONFIG_GPIO_SYSFS?
> 
> Rob,
> Any hints from you about hog-naming?
> 
> Best regards,
> Krzysztof
> 

-- 
Best regards,
grygorii
