Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D49687471D
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jul 2019 08:23:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbfGYGXs (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 25 Jul 2019 02:23:48 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:24799 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727089AbfGYGXs (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 25 Jul 2019 02:23:48 -0400
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBp5hRw/qOxWRk4dCzwp5iD+2s6bqei8mNpEiGupa/KJG1vh7ft13w="
X-RZG-CLASS-ID: mo00
Received: from [IPv6:2001:16b8:26ed:3500:85cc:8b56:536:d1f1]
        by smtp.strato.de (RZmta 44.24 AUTH)
        with ESMTPSA id j00b6dv6P6NhX0K
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve secp521r1 with 521 ECDH bits, eq. 15360 bits RSA))
        (Client did not present a certificate);
        Thu, 25 Jul 2019 08:23:43 +0200 (CEST)
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Subject: Re: [PATCH 2/2] DTS: ARM: gta04: introduce legacy spi-cs-high to make display work again
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <20190724194259.GA25847@bogus>
Date:   Thu, 25 Jul 2019 08:23:49 +0200
Cc:     Mark Brown <broonie@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        =?utf-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Message-Id: <2EA06398-E45B-481B-9A26-4DD2E043BF9C@goldelico.com>
References: <cover.1562597164.git.hns@goldelico.com> <8ae7cf816b22ef9cecee0d789fcf9e8a06495c39.1562597164.git.hns@goldelico.com> <20190724194259.GA25847@bogus>
To:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3124)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Rob,

> Am 24.07.2019 um 21:42 schrieb Rob Herring <robh@kernel.org>:
> 
> On Mon, Jul 08, 2019 at 04:46:05PM +0200, H. Nikolaus Schaller wrote:
>> commit 6953c57ab172 "gpio: of: Handle SPI chipselect legacy bindings"
>> 
>> did introduce logic to centrally handle the legacy spi-cs-high property
>> in combination with cs-gpios. This assumes that the polarity
>> of the CS has to be inverted if spi-cs-high is missing, even
>> and especially if non-legacy GPIO_ACTIVE_HIGH is specified.
>> 
>> The DTS for the GTA04 was orginally introduced under the assumption
>> that there is no need for spi-cs-high if the gpio is defined with
>> proper polarity GPIO_ACTIVE_HIGH.
> 
> Given that spi-cs-high is called legacy, that would imply that DT's 
> should not have to use spi-cs-high.

Yes.

> 
>> This was not a problem until gpiolib changed the interpretation of
>> GPIO_ACTIVE_HIGH and missing spi-cs-high.
> 
> Then we should fix gpiolib...

I tried to convince Linus that this is the right way but he convinced
me that a fix that handles all cases does not exist.

There seem to be embedded devices with older DTB (potentially in ROM)
which provide a plain 0 value for a gpios definition. And either with
or without spi-cs-high.

Since "0" is the same as "GPIO_ACTIVE_HIGH", the absence of
spi-cs-high was and must be interpreted as active low for these
devices. This leads to the inversion logic in code.

AFAIR it boils down to the question if gpiolib and the bindings
should still support such legacy devices with out-of tree DTB,
but force in-tree DTS to add the legacy spi-cs-high property.

Or if we should fix the 2 or 3 cases of in-tree legacy cases
and potentially break out-of tree DTBs.

IMHO it is more general to keep the out-of-tree DTBs working
and "fix" what we can control (in-tree DTS).

> 
>> The effect is that the missing spi-cs-high is now interpreted as CS being
>> low (despite GPIO_ACTIVE_HIGH) which turns off the SPI interface when the
>> panel is to be programmed by the panel driver.
>> 
>> Therefore, we have to add the redundant and legacy spi-cs-high property
>> to properly pass through the legacy handler.
>> 
>> Since this is nowhere documented in the bindings, we add some words of
>> WARNING.
>> 
>> Cc: stable@vger.kernel.org
>> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
>> ---
>> Documentation/devicetree/bindings/spi/spi-bus.txt | 6 ++++++
>> arch/arm/boot/dts/omap3-gta04.dtsi                | 1 +
>> 2 files changed, 7 insertions(+)

BR,
Nikolaus


